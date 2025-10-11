
-- ======================
-- Clear existing data
-- ======================
DELETE FROM book;
ALTER TABLE book AUTO_INCREMENT = 1001;

DELETE FROM category;
ALTER TABLE category AUTO_INCREMENT = 1001;

-- ======================
-- Insert Categories
-- ======================
INSERT INTO category (category_id, name) VALUES
                                             (1001, 'Thriller'),
                                             (1002, 'Science Fiction'),
                                             (1003, 'Best Seller'),
                                             (1004, 'Romance'),
                                             (1005, 'Historical Fiction');

-- =====================================================
-- Insert Books (8 per category)
-- =====================================================

-- ========== THRILLER ==========
INSERT INTO book (book_id, title, author, description, price, rating, rating_count,
                  is_public, is_featured, category_id) VALUES
                                                           (3001, 'The Da Vinci Code', 'Dan Brown', 'Cryptic secret unraveling.', 1500, 4.2, '500', FALSE, FALSE, 1001),
                                                           (3002, 'Angels & Demons', 'Dan Brown', 'Suspenseful truth quest.', 1600, 4.1, '450', TRUE, FALSE, 1001),
                                                           (3003, 'The Silence of the Lambs', 'Thomas Harris', 'Chilling hunt mystery.', 1800, 4.7, '600', FALSE, FALSE, 1001),
                                                           (3004, 'Shutter Island', 'Dennis Lehane', 'Mind-bending mystery unfolds.', 1700, 4.3, '550', TRUE, FALSE, 1001),
                                                           (3005, 'The Girl on the Train', 'Paula Hawkins', 'Gripping danger journey.', 1650, 4.0, '400', FALSE, FALSE, 1001),
                                                           (3006, 'Before I Go to Sleep', 'S.J. Watson', 'Thrilling reality escape.', 1550, 4.0, '350', TRUE, FALSE, 1001),
                                                           (3007, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Hacker meets journalist mystery.', 1750, 4.6, '520', TRUE, FALSE, 1001),
                                                           (3008, 'Gone Girl', 'Gillian Flynn', 'A psychological thriller about a missing wife.', 1600, 4.3, '480', FALSE, TRUE, 1001);

-- ========== SCIENCE FICTION ==========
INSERT INTO book (book_id, title, author, description, price, rating, rating_count,
                  is_public, is_featured, category_id) VALUES
                                                           (4001, 'Dune', 'Frank Herbert', 'Epic distant saga.', 2000, 4.8, '800', TRUE, FALSE, 1002),
                                                           (4002, 'Neuromancer', 'William Gibson', 'Cyberpunk future adventure.', 1800, 4.5, '600', FALSE, FALSE, 1002),
                                                           (4003, 'Foundation', 'Isaac Asimov', 'Visionary space travel.', 1900, 4.7, '700', TRUE, FALSE, 1002),
                                                           (4004, 'Ender''s Game', 'Orson Scott Card', 'Survival star battle.', 1750, 4.6, '650', FALSE, FALSE, 1002),
                                                           (4005, 'Snow Crash', 'Neal Stephenson', 'Galactic journey adventure.', 1850, 4.4, '550', TRUE, FALSE, 1002),
                                                           (4006, 'The Left Hand of Darkness', 'Ursula K. Le Guin', 'Futuristic odyssey spirit.', 1700, 4.3, '500', FALSE, FALSE, 1002),
                                                           (4007, 'Hyperion', 'Dan Simmons', 'A cosmic pilgrimage.', 1900, 4.6, '720', FALSE, FALSE, 1002),
                                                           (4008, 'The War of the Worlds', 'H.G. Wells', 'Alien invasion saga.', 1700, 4.5, '650', FALSE, FALSE, 1002);

-- ========== BEST SELLER ==========
INSERT INTO book (book_id, title, author, description, price, rating, rating_count,
                  is_public, is_featured, category_id) VALUES
                                                           (1001, 'Everything Is Tuberculosis', 'John Green', 'Profound illness exploration.', 2800, 5.0, '243', FALSE, FALSE, 1003),
                                                           (1002, 'The 5 Types of Wealth', 'Sahil Bloom', 'Transformative success guide.', 2699, 4.2, '604', TRUE, FALSE, 1003),
                                                           (1003, 'On Tyranny', 'Timothy Snyder', 'Timeless power critique.', 3909, 4.6, '555', TRUE, FALSE, 1003),
                                                           (1004, 'The Midnight Library', 'Matt Haig', 'Infinite library possibilities.', 2600, 4.5, '520', FALSE, FALSE, 1003),
                                                           (1005, 'Where the Crawdads Sing', 'Delia Owens', 'Captivating narrative journey.', 2700, 4.7, '610', TRUE, FALSE, 1003),
                                                           (1006, 'The Vanishing Half', 'Brit Bennett', 'Challenging conventional novel.', 2800, 4.6, '580', FALSE, FALSE, 1003),
                                                           (1007, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'A young wizard discovers his magical heritage.', 3000, 4.9, '800', TRUE, TRUE, 1003),
                                                           (1008, 'Atomic Habits', 'James Clear', 'Build better habits.', 2700, 4.8, '1.2k', TRUE, FALSE, 1003);

-- ========== ROMANCE ==========
INSERT INTO book (book_id, title, author, description, price, rating, rating_count,
                  is_public, is_featured, category_id) VALUES
                                                           (2001, 'It Ends with Us: A Novel', 'Colleen Hoover', 'Tender romance tale.', 1199, 4.3, '2.5k', FALSE, FALSE, 1004),
                                                           (2002, 'Enchanted to Meet You', 'Meg Cabot', 'Whimsical love journey.', 1766, 4.9, '1.2k', TRUE, FALSE, 1004),
                                                           (2003, 'The Christmas Countdown', 'Holly Cassidy', 'Magical Christmas countdown.', 1767, 4.7, '433', TRUE, TRUE, 1004),
                                                           (2004, 'Book Lovers', 'Emily Henry', 'Enchanting love story.', 1581, 5.0, '243', FALSE, FALSE, 1004),
                                                           (2005, 'Kiss Me at Christmas', 'Jenny Bayliss', 'Christmas love tale.', 1399, 4.8, '999', TRUE, TRUE, 1004),
                                                           (2006, 'Is She Really Going Out with Him', 'Sophie Cousens', 'Humorous romantic misadventure.', 3909, 4.4, '784', FALSE, FALSE, 1004),
                                                           (2007, 'Pride and Prejudice', 'Jane Austen', 'A classic love story set in early 19th-century England.', 1650, 4.5, '1k', TRUE, FALSE, 1004),
                                                           (2008, 'The Notebook', 'Nicholas Sparks', 'A sweeping love story chronicling devotion across decades.', 1800, 4.8, '900', FALSE, TRUE, 1004);

-- ========== HISTORICAL FICTION ==========
INSERT INTO book (book_id, title, author, description, price, rating, rating_count,
                  is_public, is_featured, category_id) VALUES
                                                           (5001, 'The Book Thief', 'Markus Zusak', 'Wartime hope story.', 1900, 4.7, '780', FALSE, FALSE, 1005),
                                                           (5002, 'All the Light We Cannot See', 'Anthony Doerr', 'Gripping past lives.', 2000, 4.6, '750', TRUE, FALSE, 1005),
                                                           (5003, 'The Pillars of the Earth', 'Ken Follett', 'Epic ancient chronicle.', 2100, 4.8, '820', FALSE, FALSE, 1005),
                                                           (5004, 'Wolf Hall', 'Hilary Mantel', 'Royal intrigue account.', 2200, 4.5, '690', TRUE, FALSE, 1005),
                                                           (5005, 'A Gentleman in Moscow', 'Amor Towles', 'Bygone era depiction.', 2050, 4.7, '720', FALSE, FALSE, 1005),
                                                           (5006, 'The Other Boleyn Girl', 'Philippa Gregory', 'Historical change narrative.', 1950, 4.4, '680', TRUE, FALSE, 1005),
                                                           (5007, 'The Nightingale', 'Kristin Hannah', 'Sisters in war.', 2100, 4.8, '800', TRUE, FALSE, 1005),
                                                           (5008, 'The Underground Railroad', 'Colson Whitehead', 'An escape odyssey.', 2200, 4.7, '780', FALSE, FALSE, 1005);


