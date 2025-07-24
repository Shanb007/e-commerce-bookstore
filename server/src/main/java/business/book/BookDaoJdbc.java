package business.book;

import business.BookstoreDbException;
import business.JdbcUtils;
import business.category.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import business.BookstoreDbException.BookstoreQueryDbException;

public class BookDaoJdbc implements BookDao {

    private static final String FIND_BY_BOOK_ID_SQL =
            "SELECT book_id, title, author, description, price, rating, rating_count, is_public, is_featured, category_id " +
                    "FROM book " +
                    "WHERE book_id = ?";

    private static final String FIND_BY_CATEGORY_ID_SQL =
            "SELECT book_id, title, author, description, price, rating, rating_count, is_public, is_featured, category_id " +
            "FROM book " +
            "WHERE category_id = ?";;
    // TODO Implement this constant to be used in the findByCategoryId method

    private static final String FIND_RANDOM_BY_CATEGORY_ID_SQL =
            "SELECT book_id, title, author, description, price, rating, rating_count, is_public, is_featured, category_id " +
                    "FROM book " +
                    "WHERE category_id = ? " +
                    "ORDER BY RAND() " +
                    "LIMIT ?";

    private static final String FIND_ALL_SQL =
            "SELECT book_id, title, author, description, price, rating, rating_count, is_public, is_featured, category_id " +
                    "FROM book";

    @Override
    public Book findByBookId(long bookId) {
        Book book = null;
        try (Connection connection = JdbcUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(FIND_BY_BOOK_ID_SQL)) {
            statement.setLong(1, bookId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    book = readBook(resultSet);
                }
            }
        } catch (SQLException e) {
            throw new BookstoreQueryDbException("Encountered a problem finding book " + bookId, e);
        }
        return book;
    }

    @Override
    public List<Book> findByCategoryId(long categoryId) {
        List<Book> books = new ArrayList<>();
        try (Connection connection = JdbcUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(FIND_BY_CATEGORY_ID_SQL)) {
            statement.setLong(1, categoryId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    books.add(readBook(resultSet));
                }
            }
        } catch (SQLException e) {
            throw new BookstoreQueryDbException("Encountered a problem finding books for category " + categoryId, e);
        }
        return books;
    }

    @Override
    public List<Book> findRandomByCategoryId(long categoryId, int limit) {
        List<Book> books = new ArrayList<>();
        try (Connection connection = JdbcUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(FIND_RANDOM_BY_CATEGORY_ID_SQL)) {
            statement.setLong(1, categoryId);
            statement.setInt(2, limit);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    books.add(readBook(resultSet));
                }
            }
        } catch (SQLException e) {
            throw new BookstoreQueryDbException("Encountered a problem finding random books for category " + categoryId, e);
        }
        return books;
    }

    private Book readBook(ResultSet resultSet) throws SQLException {
        long bookId = resultSet.getLong("book_id");
        String title = resultSet.getString("title");
        String author = resultSet.getString("author");
        String description = resultSet.getString("description");
        int price = resultSet.getInt("price");
        double rating = resultSet.getDouble("rating");
        String ratingCount = resultSet.getString("rating_count");
        boolean isPublic = resultSet.getBoolean("is_public");
        boolean isFeatured = resultSet.getBoolean("is_featured");
        long categoryId = resultSet.getLong("category_id");
        return new Book(bookId, title, author, description, price, rating, ratingCount, isPublic, isFeatured, categoryId);
    }

    @Override
    public List<Book> findAll() {
        List<Book> books = new ArrayList<>();
        try (Connection conn = JdbcUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(FIND_ALL_SQL);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                books.add(readBook(rs));
            }
        } catch (SQLException e) {
            throw new BookstoreQueryDbException("Error finding all books", e);
        }
        return books;
    }

    @Override
    public List<Book> searchBooks(BookSearchRequest req) {
        List<Book> books = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT b.book_id, b.title, b.author, b.description, b.price, b.rating, " +
                        "       b.rating_count, b.is_public, b.is_featured, b.category_id " +
                        "  FROM book b " +
                        "  JOIN category c ON b.category_id = c.category_id " +
                        " WHERE 1=1"
        );
        if (req.value() != null && req.key() != null) {
            String column = req.key().equals("authorName") ? "b.author" : "b.title";
            sql.append(" AND (")
                    .append("LOWER(").append(column).append(") LIKE LOWER(?)")
                    .append(" OR SOUNDEX(").append(column).append(") = SOUNDEX(?)")
                    .append(")");
        }

        if (req.minPrice() != null) {
            sql.append(" AND b.price >= ?");
        }
        if (req.maxPrice() != null) {
            sql.append(" AND b.price <= ?");
        }

        if (req.rating() != null) {
            sql.append(" AND b.rating <= ?");
        }

        if (req.category() != null && !req.category().equalsIgnoreCase("All")) {
            sql.append(" AND c.name = ?");
        }

        String sortKey   = "price";
        String sortDir   = "ASC";
        if (req.sort() != null) {
            String k = req.sort().key();
            String v = req.sort().value();
            if ("rating".equalsIgnoreCase(k)) {
                sortKey = "rating";
            } else if ("price".equalsIgnoreCase(k)) {
                sortKey = "price";
            }
            if ("desc".equalsIgnoreCase(v)) {
                sortDir = "DESC";
            }
        }
        sql.append(" ORDER BY b.").append(sortKey).append(" ").append(sortDir);

        try (Connection conn = JdbcUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            int idx = 1;
            if (req.value() != null && req.key() != null) {
                stmt.setString(idx++, "%" + req.value() + "%");
                stmt.setString(idx++, req.value());
            }
            if (req.minPrice() != null) {
                stmt.setInt(idx++, req.minPrice() * 100);
            }
            if (req.maxPrice() != null) {
                stmt.setInt(idx++, req.maxPrice() * 100);
            }
            if (req.rating() != null) {
                stmt.setDouble(idx++, req.rating());
            }
            if (req.category() != null && !req.category().equalsIgnoreCase("All")) {
                stmt.setString(idx++, req.category());
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    books.add(readBook(rs));
                }
            }
        } catch (SQLException e) {
            throw new BookstoreQueryDbException("Error searching books", e);
        }
        return books;
    }
}
