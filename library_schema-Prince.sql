CREATE DATABASE library;


--\c library

-- Create the authors table
CREATE TABLE authors (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(100),
    email           VARCHAR(100)
);

-- Create the publishers table
CREATE TABLE publishers (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(100),
    address         VARCHAR(150)
);

-- Create the books table with foreign key references
CREATE TABLE books (
    id              SERIAL PRIMARY KEY,
    title           VARCHAR(200),
    isbn            VARCHAR(20),
    publication_year INTEGER,
    author_id       INTEGER REFERENCES authors(id),
    publisher_id    INTEGER REFERENCES publishers(id)
);

-- Insert data into the authors table
INSERT INTO authors (name, email)
VALUES 
    ('Harper Lee', 'harper.lee@example.com'),
    ('Jane Austen', 'jane.austen@example.com'),
    ('J.D. Salinger', 'jd.salinger@example.com');

-- Insert data into the publishers table
INSERT INTO publishers (name, address)
VALUES 
    ('J. B. Lippincott & Co.', 'Philadelphia, PA'),
    ('T. Egerton', 'London, UK'),
    ('Little, Brown and Company', 'Boston, MA');

-- Insert data into the books table, referencing author_id and publisher_id
INSERT INTO books (title, isbn, publication_year, author_id, publisher_id)
VALUES 
    ('To Kill a Mockingbird', '9780061120084', 1960, 1, 1),
    ('Pride and Prejudice', '9780141439518', 1813, 2, 2),
    ('The Catcher in the Rye', '9780316769488', 1951, 3, 3);

-- Verify with a JOIN Query
-- Select book details along with author and publisher names
SELECT 
    b.title, 
    b.isbn, 
    b.publication_year, 
    a.name AS author, 
    p.name AS publisher
FROM 
    books b
JOIN 
    authors a ON b.author_id = a.id
JOIN 
    publishers p ON b.publisher_id = p.id;