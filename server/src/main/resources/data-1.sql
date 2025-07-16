--
-- Clear existing data and reset auto-increment values
--
DELETE FROM book;
ALTER TABLE book AUTO_INCREMENT = 1001;

DELETE FROM category;
ALTER TABLE category AUTO_INCREMENT = 1001;

--
-- Insert categories with explicit IDs:
-- 1001: Thriller
-- 1002: Science Fiction
-- 1003: Best Seller
-- 1004: Romance
-- 1005: Historical Fiction
--
INSERT INTO `category` (`category_id`, `name`) VALUES
                                                   (1001, 'Thriller'),
                                                   (1002, 'Science Fiction'),
                                                   (1003, 'Best Seller'),
                                                   (1004, 'Romance'),
                                                   (1005, 'Historical Fiction');

--
-- Insert books for the Romance category using your provided book list (IDs 2001–2006)
--
INSERT INTO `book` (book_id, title, author, description, price, rating, rating_count, is_public, is_featured, category_id) VALUES
                                                                                                                               (2001, 'It Ends with us : A Novel', 'Colleen Hoover', 'A tender tale of romance.', 1199, 4.3, '2.5k', TRUE, FALSE, 1004),
                                                                                                                               (2002, 'Enchanted to Meet You', 'Meg Cabot', 'A whimsical journey to love.', 1766, 4.9, '1.2k', TRUE, FALSE, 1004),
                                                                                                                               (2003, 'The Christmas Countdown', 'Holly Cassidy', 'A magical countdown to Christmas.', 1767, 4.7, '433', TRUE, TRUE, 1004),
                                                                                                                               (2004, 'Book Lovers', 'Emily Henry', 'An enchanting story of book lovers.', 1581, 5.0, '243', TRUE, FALSE, 1004),
                                                                                                                               (2005, 'Kiss Me at Christmas', 'Jenny Bayliss', 'A heartwarming Christmas love tale.', 1399, 4.8, '999', TRUE, TRUE, 1004),
                                                                                                                               (2006, 'Is She Really Going Out with him', 'Sophie Cousens', 'A humorous romantic misadventure unfolds.', 3909, 4.4, '784', TRUE, FALSE, 1004);

--
-- Insert books for the Best Seller category.
-- Using your provided list (IDs 1001–1003) and adding three additional best sellers.
--
INSERT INTO `book` (book_id, title, author, description, price, rating, rating_count, is_public, is_featured, category_id) VALUES
                                                                                                                               (1001, 'Everything Is Tuberculosis', 'John Green', 'A profound exploration of illness.', 2800, 5.0, '243', TRUE, FALSE, 1003),
                                                                                                                               (1002, 'The 5 Types of Wealth', 'Sahil Bloom', 'A transformative guide to success.', 2699, 4.2, '604', TRUE, FALSE, 1003),
                                                                                                                               (1003, 'On Tyranny', 'Timothy Snyder', 'A timeless critique of power.', 3909, 4.6, '555', TRUE, FALSE, 1003),
                                                                                                                               (1004, 'The Midnight Library', 'Matt Haig', 'A library of infinite possibilities.', 2600, 4.5, '520', TRUE, FALSE, 1003),
                                                                                                                               (1005, 'Where the Crawdads Sing', 'Delia Owens', 'A journey through captivating narratives.', 2700, 4.7, '610', TRUE, FALSE, 1003),
                                                                                                                               (1006, 'The Vanishing Half', 'Brit Bennett', 'A novel that challenges conventions.', 2800, 4.6, '580', TRUE, FALSE, 1003);

--
-- Insert books for the Thriller category (IDs 3001–3006) with actual titles.
--
INSERT INTO `book` (book_id, title, author, description, price, rating, rating_count, is_public, is_featured, category_id) VALUES
                                                                                                                               (3001, 'The Da Vinci Code', 'Dan Brown', 'A cryptic code unveils secrets.', 1500, 4.2, '500', TRUE, FALSE, 1001),
                                                                                                                               (3002, 'Angels & Demons', 'Dan Brown', 'A suspenseful quest for truth.', 1600, 4.1, '450', TRUE, FALSE, 1001),
                                                                                                                               (3003, 'The Silence of the Lambs', 'Thomas Harris', 'A chilling hunt for answers.', 1800, 4.7, '600', TRUE, FALSE, 1001),
                                                                                                                               (3004, 'Shutter Island', 'Dennis Lehane', 'A mind-bending mystery gradually unfolds.', 1700, 4.3, '550', TRUE, FALSE, 1001),
                                                                                                                               (3005, 'The Girl on the Train', 'Paula Hawkins', 'A gripping journey through danger.', 1650, 4.0, '400', TRUE, FALSE, 1001),
                                                                                                                               (3006, 'Before I Go to Sleep', 'S.J. Watson', 'A thrilling escape from reality.', 1550, 4.0, '350', TRUE, FALSE, 1001);

--
-- Insert books for the Science Fiction category (IDs 4001–4006) with actual titles.
--
INSERT INTO `book` (book_id, title, author, description, price, rating, rating_count, is_public, is_featured, category_id) VALUES
                                                                                                                               (4001, 'Dune', 'Frank Herbert', 'An epic saga on distant worlds.', 2000, 4.8, '800', TRUE, FALSE, 1002),
                                                                                                                               (4002, 'Neuromancer', 'William Gibson', 'A cyberpunk adventure in the future.', 1800, 4.5, '600', TRUE, FALSE, 1002),
                                                                                                                               (4003, 'Foundation', 'Isaac Asimov', 'A visionary tale of space travel.', 1900, 4.7, '700', TRUE, FALSE, 1002),
                                                                                                                               (4004, 'Ender''s Game', 'Orson Scott Card', 'A battle for survival among stars.', 1750, 4.6, '650', TRUE, FALSE, 1002),
                                                                                                                               (4005, 'Snow Crash', 'Neal Stephenson', 'A mind-blowing journey through galaxies.', 1850, 4.4, '550', TRUE, FALSE, 1002),
                                                                                                                               (4006, 'The Left Hand of Darkness', 'Ursula K. Le Guin', 'A futuristic odyssey of human spirit.', 1700, 4.3, '500', TRUE, FALSE, 1002);

--
-- Insert books for the Historical Fiction category (IDs 5001–5006) with actual titles.
--
INSERT INTO `book` (book_id, title, author, description, price, rating, rating_count, is_public, is_featured, category_id) VALUES
                                                                                                                               (5001, 'The Book Thief', 'Markus Zusak', 'A haunting story of wartime hope.', 1900, 4.7, '780', TRUE, FALSE, 1005),
                                                                                                                               (5002, 'All the Light We Cannot See', 'Anthony Doerr', 'A gripping tale of past lives.', 2000, 4.6, '750', TRUE, FALSE, 1005),
                                                                                                                               (5003, 'The Pillars of the Earth', 'Ken Follett', 'An epic chronicle of ancient times.', 2100, 4.8, '820', TRUE, FALSE, 1005),
                                                                                                                               (5004, 'Wolf Hall', 'Hilary Mantel', 'A riveting account of royal intrigue.', 2200, 4.5, '690', TRUE, FALSE, 1005),
                                                                                                                               (5005, 'A Gentleman in Moscow', 'Amor Towles', 'A masterful depiction of bygone eras.', 2050, 4.7, '720', TRUE, FALSE, 1005),
                                                                                                                               (5006, 'The Other Boleyn Girl', 'Philippa Gregory', 'A stirring narrative of historical change.', 1950, 4.4, '680', TRUE, FALSE, 1005);
