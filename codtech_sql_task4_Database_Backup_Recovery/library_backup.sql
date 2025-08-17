-- Create the database
CREATE DATABASE IF NOT EXISTS library;
-- Select the 'library' database to use for subsequent commands
USE library;
-- Create the 'books' table with columns and data types
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    year_published INT,
    genre VARCHAR(100)
);
-- Insert sample data into the 'books' table
INSERT INTO books (title, author, year_published, genre) VALUES
('1984', 'George Orwell', 1949, 'Dystopian'),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Classic'),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Classic'),
('The Catcher in the Rye', 'J.D. Salinger', 1951, 'Classic'),
('Brave New World', 'Aldous Huxley', 1932, 'Dystopian');
SELECT * FROM library.books;

