CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE
);

CREATE TABLE publishers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    isbn TEXT UNIQUE NOT NULL,
    publication_year INT,
    author_id INT REFERENCES authors(id),
    publisher_id INT REFERENCES publishers(id)
);


INSERT INTO authors (name, email)
VALUES 
('Harper Lee', 'harper.lee@example.com'),
('Jane Austen', 'jane.austen@example.com'),
('J.D. Salinger', 'jd.salinger@example.com');


INSERT INTO publishers (name, address)
VALUES
('J. B. Lippincott & Co.', 'Philadelphia, PA'),
('T. Egerton', 'London, UK'),
('Little, Brown and Company', 'Boston, MA');


INSERT INTO books (title, isbn, publication_year, author_id, publisher_id)
VALUES
('To Kill a Mockingbird', '9780061120084', 1960, 1, 1),
('Pride and Prejudice', '9780141439518', 1813, 2, 2),
('The Catcher in the Rye', '9780316769488', 1951, 3, 3);

SELECT 
    b.title, b.isbn, b.publication_year,
    a.name AS author_name, a.email,
    p.name AS publisher_name, p.address
FROM books b
JOIN authors a ON b.author_id = a.id
JOIN publishers p ON b.publisher_id = p.id;