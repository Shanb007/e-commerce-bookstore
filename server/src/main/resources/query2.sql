-- 1. Remove the specified book IDs
DELETE FROM `book`
WHERE book_id IN (
                  1008,
                  4007,
                  4008,
                  5007,
                  5008
    );

-- 2. Insert new books with short descriptions

-- ======================================
-- book_id=1008 -> Best Seller (cat_id=1003)
-- ======================================
INSERT INTO `book` (
    book_id,
    title,
    author,
    description,
    price,
    rating,
    rating_count,
    is_public,
    is_featured,
    category_id
)
VALUES
    (
        1008,
        'Atomic Habits',
        'James Clear',
        'Build better habits.',
        2700,
        4.8,
        '1.2k',
        TRUE,
        FALSE,
        1003
    );

-- ======================================
-- book_id=4007, 4008 -> Sci-Fi (cat_id=1002)
-- ======================================
INSERT INTO `book` (
    book_id,
    title,
    author,
    description,
    price,
    rating,
    rating_count,
    is_public,
    is_featured,
    category_id
)
VALUES
    (
        4007,
        'Hyperion',
        'Dan Simmons',
        'A cosmic pilgrimage.',
        1900,
        4.6,
        '720',
        FALSE,
        FALSE,
        1002
    ),
    (
        4008,
        'The War of the Worlds',
        'H.G. Wells',
        'Alien invasion saga.',
        1700,
        4.5,
        '650',
        FALSE,
        FALSE,
        1002
    );

-- ==============================================
-- book_id=5007, 5008 -> Historical (cat_id=1005)
-- ==============================================
INSERT INTO `book` (
    book_id,
    title,
    author,
    description,
    price,
    rating,
    rating_count,
    is_public,
    is_featured,
    category_id
)
VALUES
    (
        5007,
        'The Nightingale',
        'Kristin Hannah',
        'Sisters in war.',
        2100,
        4.8,
        '800',
        TRUE,
        FALSE,
        1005
    ),
    (
        5008,
        'The Underground Railroad',
        'Colson Whitehead',
        'An escape odyssey.',
        2200,
        4.7,
        '780',
        FALSE,
        FALSE,
        1005
    );
