-- Create the Authors table
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Create the Publishers table
CREATE TABLE publishers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL
);

-- Create the Books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    publication_year INTEGER NOT NULL,
    author_id INTEGER REFERENCES Authors(id),
    publisher_id INTEGER REFERENCES Publishers(id)
);

-- Insert sample data into Authors table
INSERT INTO authors (name, email) VALUES
    ('Harper Lee', 'harper.lee@example.com'),
    ('Jane Austen', 'jane.austen@example.com'),
    ('J.D. Salinger', 'jd.salinger@example.com');

-- Insert sample data into Publishers table
INSERT INTO publishers (name, address) VALUES
    ('J. B. Lippincott & Co.', 'Philadelphia, PA'),
    ('T. Egerton', 'London, UK'),
    ('Little, Brown and Company', 'Boston, MA');

-- Insert sample data into Books table
INSERT INTO books (title, isbn, publication_year, author_id, publisher_id) VALUES
    ('To Kill a Mockingbird', '9780061120084', 1960, 1, 1),
    ('Pride and Prejudice', '9780141439518', 1813, 2, 2),
    ('The Catcher in the Rye', '9780316769488', 1951, 3, 3);

-- Example JOIN query to verify relationships
SELECT 
    b.title,
    b.isbn,
    b.publication_year,
    a.name as author_name,
    a.email as author_email,
    p.name as publisher_name,
    p.address as publisher_address
FROM books b
JOIN authors a ON b.author_id = a.id
JOIN publishers p ON b.publisher_id = p.id; 