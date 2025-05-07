package business;

import business.book.BookDao;
import business.book.BookDaoJdbc;
import business.category.CategoryDao;
import business.category.CategoryDaoJdbc;
import business.customer.Customer;
import business.customer.CustomerDao;
import business.customer.CustomerDaoJdbc;
import business.order.*;

public class ApplicationContext {

    // TODO Add field and complete the getter for bookDao

    private CategoryDao categoryDao;
    private BookDao bookDao;
    private OrderService orderService;
    private OrderDao orderDao;
    private CustomerDao customerDao;
    private LineItemDao lineItemDao;

    public static ApplicationContext INSTANCE = new ApplicationContext();

    private ApplicationContext() {
        categoryDao = new CategoryDaoJdbc();
        bookDao = new BookDaoJdbc();
        DefaultOrderService defaultOrderService = new DefaultOrderService();
        defaultOrderService.setBookDao(bookDao);
        orderService = defaultOrderService;
        orderDao = new OrderDaoJdbc();
        customerDao = new CustomerDaoJdbc();
        lineItemDao = new LineItemDaoJdbc();
        defaultOrderService.setOrderDao(orderDao);
        defaultOrderService.setCustomerDao(customerDao);
        defaultOrderService.setLineItemDao(lineItemDao);
    }

    public CategoryDao getCategoryDao() {
        return categoryDao;
    }

    public BookDao getBookDao() { return bookDao; }

    public OrderService getOrderService() {
        return orderService;
    }

    public OrderDao getOrderDao() {
        return orderDao;
    }

    public CustomerDao getCustomerDao(){
        return customerDao;
    }

    public LineItemDao getLineItemDao(){
        return lineItemDao;
    }
}
