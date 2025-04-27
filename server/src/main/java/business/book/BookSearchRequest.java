package business.book;

public record BookSearchRequest(
        String key,
        String value,
        Integer minPrice,
        Integer maxPrice,
        Double rating,
        SortOption sort,
        String category
) {}