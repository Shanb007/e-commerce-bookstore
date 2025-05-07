-- 1. Remove incorrect records
DELETE FROM `book`
WHERE book_id IN (
                  1007,
                  1008,
                  2007,
                  2008,
                  3007,
                  3008,
                  4007,
                  4008,
                  5007,
                  5008
    );

-- 2. Insert corrected records

-- ====================
-- Romance (category_id = 1004)
-- ====================
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
) VALUES
      (2007, 'Pride and Prejudice', 'Jane Austen',
       'A classic love story set in early 19th-century England.',
       1650, 4.5, '1k', TRUE, FALSE, 1004),
      (2008, 'The Notebook', 'Nicholas Sparks',
       'A sweeping love story chronicling devotion across decades.',
       1800, 4.8, '900', FALSE, TRUE, 1004);

-- ====================
-- Best Seller (category_id = 1003)
-- ====================
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
) VALUES
      (1007, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling',
       'A young wizard discovers his magical heritage.',
       3000, 4.9, '800', TRUE, TRUE, 1003),
      (1008, 'The Da Vinci Code', 'Dan Brown',
       'A gripping thriller of mystery, symbology, and conspiracies.',
       3100, 4.7, '850', FALSE, FALSE, 1003);

-- ====================
-- Thriller (category_id = 1001)
-- ====================
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
) VALUES
      (3007, 'The Girl with the Dragon Tattoo', 'Stieg Larsson',
       'Hacker meets journalist mystery.',
       1750, 4.6, '520', TRUE, FALSE, 1001),
      (3008, 'Gone Girl', 'Gillian Flynn',
       'A psychological thriller about a missing wife and a suspicious husband.',
       1600, 4.3, '480', FALSE, TRUE, 1001);

-- ====================
-- Science Fiction (category_id = 1002)
-- ====================
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
) VALUES
      (4007, 'Dune', 'Frank Herbert',
       'An interstellar epic of political intrigue on a desert planet.',
       2100, 4.8, '750', TRUE, TRUE, 1002),
      (4008, 'Foundation', 'Isaac Asimov',
       'A sweeping saga of the Galactic Empire’s rise and fall.',
       1950, 4.5, '680', FALSE, FALSE, 1002);

-- ====================
-- Historical Fiction (category_id = 1005)
-- ====================
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
) VALUES
      (5007, 'The Book Thief', 'Markus Zusak',
       'A young girl in Nazi Germany finds solace in stolen books.',
       2200, 4.6, '700', TRUE, FALSE, 1005),
      (5008, 'All the Light We Cannot See', 'Anthony Doerr',
       'A blind French girl and a German boy connect in occupied France.',
       2300, 4.7, '720', FALSE, TRUE, 1005);
