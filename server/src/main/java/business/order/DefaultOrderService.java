package business.order;

import api.ApiException;
import business.BookstoreDbException;
import business.JdbcUtils;
import business.book.Book;
import business.book.BookDao;
import business.cart.ShoppingCart;
import business.cart.ShoppingCartItem;
import business.customer.Customer;
import business.customer.CustomerDao;
import business.customer.CustomerForm;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.temporal.TemporalAdjusters;
import java.sql.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import java.util.regex.Pattern;

public class DefaultOrderService implements OrderService {

	private BookDao bookDao;
	private OrderDao orderDao;
	private CustomerDao customerDao;
	private LineItemDao lineItemDao;

	private static final Pattern PHONE_PATTERN = Pattern.compile(
			"^((\\+1|1)?( |-)?)?(\\([2-9][0-9]{2}\\)|[2-9][0-9]{2})( |-)?([2-9][0-9]{2}( |-)?[0-9]{4})$"
	);

	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public void setOrderDao(OrderDao orderDao){
		this.orderDao = orderDao;
	}

	public void setLineItemDao(LineItemDao lineItemDao){
		this.lineItemDao = lineItemDao;
	}

	@Override
	public OrderDetails getOrderDetails(long orderId) {
		Order order = orderDao.findByOrderId(orderId);
		Customer customer = customerDao.findByCustomerId(order.customerId());
		List<LineItem> lineItems = lineItemDao.findByOrderId(orderId);
		List<Book> books = lineItems
				.stream()
				.map(lineItem -> bookDao.findByBookId(lineItem.bookId()))
				.toList();
		return new OrderDetails(order, customer, lineItems, books);
	}

	@Override
    public long placeOrder(CustomerForm customerForm, ShoppingCart cart) {

		validateCustomer(customerForm);
		validateCart(cart);

		// NOTE: MORE CODE PROVIDED NEXT PROJECT
		try (Connection connection = JdbcUtils.getConnection()) {
			Date ccExpDate = getCardExpirationDate(
					customerForm.getCcExpiryMonth(),
					customerForm.getCcExpiryYear());
			return performPlaceOrderTransaction(
					customerForm.getName(),
					customerForm.getAddress(),
					customerForm.getPhone(),
					customerForm.getEmail(),
					customerForm.getCcNumber(),
					ccExpDate, cart, connection);
		} catch (SQLException e) {
			throw new BookstoreDbException("Error during close connection for customer order", e);
		}
	}

	private long performPlaceOrderTransaction(
			String name, String address, String phone,
			String email, String ccNumber, Date date,
			ShoppingCart cart, Connection connection) {
		try {
			connection.setAutoCommit(false);
			long customerId = customerDao.create(connection, name, address, phone, email, ccNumber, date);
			int tax = Math.round((float) cart.getSurcharge() * cart.getComputedSubtotal());
			long customerOrderId = orderDao.create(connection, cart.getComputedSubtotal() + tax, generateConfirmationNumber(), customerId);
			for (ShoppingCartItem item : cart.getItems()) {
				lineItemDao.create(connection, customerOrderId, item.getBookId(), item.getQuantity());
			}
			connection.commit();
			return customerOrderId;
		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				throw new BookstoreDbException("Failed to roll back transaction", e1);
			}
			return 0;
		}
	}

	private int generateConfirmationNumber() {
		return ThreadLocalRandom.current().nextInt(999999999);
	}


	private Date getCardExpirationDate(String monthString, String yearString) {
		try {
			int month = Integer.parseInt(monthString);
			int year = Integer.parseInt(yearString);
			LocalDate local = LocalDate.of(year, month, 1).with(TemporalAdjusters.lastDayOfMonth());

			return Date.valueOf(local);
		} catch (Exception e) {
			throw new ApiException.ValidationFailure("ccExpiry", "Invalid expiration date");
		}
	}

	private void validateCustomer(CustomerForm customerForm) {

    	String name = customerForm.getName();
		if (name == null || name.trim().length() < 4 || name.trim().length() > 45) {
            throw new ApiException.ValidationFailure("name","Invalid Name field (must be 4–45 chars)");
		}

		// TODO: Validation checks for address, phone, email, ccNumber
		String address = customerForm.getAddress();
        if (address==null || address.trim().length()<4 || address.length()>45){
			throw new ApiException.ValidationFailure("address","Invalid Address field (must be 4–45 chars)");
		}

        String phoneNumber = customerForm.getPhone();
        if (phoneNumber == null || !PHONE_PATTERN.matcher(phoneNumber).matches()){
			throw new ApiException.ValidationFailure("phone","Invalid Phone field (must be 10 digits)");
		}

        String email = customerForm.getEmail() == null ? "" : customerForm.getEmail();
        if (email.contains(" ") || !email.contains("@") || email.endsWith(".")){
			throw new ApiException.ValidationFailure("email","Invalid email field");
		}

        String cc = customerForm.getCcNumber() == null ? "" : customerForm.getCcNumber().replaceAll("[\\s-]", "");
		if (cc.length() < 14 || cc.length() > 16) {
			throw new ApiException.ValidationFailure("ccNumber", "Invalid Credit Card field (Card # must be 14–16 digits)");
		}

		if (expiryDateIsInvalid(customerForm.getCcExpiryMonth(), customerForm.getCcExpiryYear())) {
            throw new ApiException.ValidationFailure("Please enter a valid expiration date.");
		}
	}

	private boolean expiryDateIsInvalid(String ccExpiryMonth, String ccExpiryYear) {

		// TODO: return true when the provided month/year is before the current month/yeaR
        try {
            YearMonth current = YearMonth.now();
            YearMonth exp = YearMonth.of(Integer.parseInt(ccExpiryYear), Integer.parseInt(ccExpiryMonth));
            return exp.isBefore(current);
        } catch (Exception e) {
            return true;
        }
	}

	private void validateCart(ShoppingCart cart) {

		if (cart.getItems().isEmpty()) {
            throw new ApiException.ValidationFailure("Cart must contain at least one item");
		}

		cart.getItems().forEach(item-> {
			if (item.getQuantity() < 1 || item.getQuantity() > 99) {
                throw new ApiException.ValidationFailure("quantity","Quantity 1–99");
			}
			Book databaseBook = bookDao.findByBookId(item.getBookId());
			// TODO: complete the required validations
            if (databaseBook==null){
				throw new ApiException.ValidationFailure("Book does not exist.");
			}
            if (item.getBookForm().getPrice() != databaseBook.price()){
				double expectedPrice = databaseBook.price() / 100.0;
				double actualPrice = item.getBookForm().getPrice() / 100.0;
				throw new ApiException.ValidationFailure("price", String.format("Price mismatch for '%s' {id: %d}: expected %.2f but got %.2f", databaseBook.title(), databaseBook.bookId(), expectedPrice, actualPrice));
			}
            if (item.getBookForm().getCategoryId() != databaseBook.categoryId()){
				throw new ApiException.ValidationFailure("categoryId",String.format("Category mismatch for '%s' {id: %d}: expected %d but got %d", databaseBook.title(), databaseBook.bookId(), databaseBook.categoryId(), item.getBookForm().getCategoryId()));
			}
		});
	}

}
