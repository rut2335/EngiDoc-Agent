-- PostgreSQL schema for Digital Library

-- Authors
CREATE TABLE IF NOT EXISTS authors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  bio TEXT
);

-- Books
CREATE TABLE IF NOT EXISTS books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(512) NOT NULL,
  description TEXT,
  author_id INTEGER REFERENCES authors(id) ON DELETE SET NULL,
  isbn VARCHAR(32) UNIQUE,
  available BOOLEAN DEFAULT TRUE
);

-- Loans
CREATE TABLE IF NOT EXISTS loans (
  id SERIAL PRIMARY KEY,
  book_id INTEGER REFERENCES books(id) ON DELETE CASCADE,
  user_id INTEGER NOT NULL,
  start_date DATE NOT NULL,
  due_date DATE NOT NULL,
  returned BOOLEAN DEFAULT FALSE
);

-- Dummy data
INSERT INTO authors (name, bio) VALUES
('Jane Austen', 'English novelist known for social realism.'),
('George Orwell', 'English novelist and essayist.');

INSERT INTO books (title, description, author_id, isbn, available) VALUES
('Pride and Prejudice', 'A classic novel about manners and matrimonial machinations.', 1, '1111111111', TRUE),
('1984', 'Dystopian novel about a totalitarian regime.', 2, '2222222222', TRUE),
('Animal Farm', 'Political satire in allegorical form.', 2, '3333333333', FALSE);

INSERT INTO loans (book_id, user_id, start_date, due_date, returned) VALUES
(3, 101, '2025-12-01', '2025-12-21', FALSE);
