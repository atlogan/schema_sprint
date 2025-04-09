# Schema Sprint

## Overview
This project implements a normalized database schema for a library system, transforming an unnormalized table into a well-structured relational database.

## Schema Design

### Problems in the Original Unnormalized Table
- Redundant author information (name and email repeated for each book)
- Redundant publisher information (name and address repeated for each book)
- No unique identifiers for authors or publishers
- Potential data inconsistency when updating author or publisher information

### Normalized Schema Design
The database is split into three main tables:

1. **Authors**
   - `id` (SERIAL PRIMARY KEY)
   - `name` (VARCHAR)
   - `email` (VARCHAR, UNIQUE)

2. **Publishers**
   - `id` (SERIAL PRIMARY KEY)
   - `name` (VARCHAR)
   - `address` (VARCHAR)

3. **Books**
   - `id` (SERIAL PRIMARY KEY)
   - `title` (VARCHAR)
   - `isbn` (VARCHAR, UNIQUE)
   - `publication_year` (INTEGER)
   - `author_id` (FOREIGN KEY)
   - `publisher_id` (FOREIGN KEY)

### Design Choices
- Used SERIAL for primary keys to ensure unique identification
- Added UNIQUE constraints on email and ISBN to prevent duplicates
- Implemented foreign key relationships to maintain referential integrity
- Used appropriate VARCHAR lengths for text fields
- Added NOT NULL constraints where appropriate

### Benefits of Normalization
1. **Data Integrity**: Prevents duplicate and inconsistent data
2. **Efficient Updates**: Changes to author or publisher information only need to be made in one place
3. **Reduced Storage**: Eliminates redundant data storage
4. **Better Query Performance**: Optimized for common queries
5. **Scalability**: Easy to add new books, authors, or publishers

## How to Use
1. Create a new PostgreSQL database
2. Run the `library_schema.sql` script to create the tables and insert sample data
3. Use the example JOIN query to verify the relationships between tables

### Summary of Issues in the Unnormalized Table
Data Redundancy

Author and publisher details (name, email, address) are repeated for every book they’re associated with.

Example: If an author has written multiple books, their name and email appear in every row for each book.

Update Anomalies

If an author or publisher’s info changes (e.g., email address or company name), you’d need to update every row where they appear.

Easy to miss a row, leading to inconsistent data.

Insert Anomalies

You can't insert a new author or publisher without associating them with a book.

There’s no standalone place to store author or publisher data.

Delete Anomalies

Deleting a book record might accidentally delete the only row that includes an author or publisher’s information.

This means losing valuable data unrelated to that specific book.

Lack of Structure

All the data is stored in one big table instead of being logically grouped (e.g., books, authors, publishers).

Makes it harder to scale, query, and manage.

Violates Normal Forms

The table violates 1NF (data is not fully atomic—publisher_address might contain city and state in one field).

It also violates 2NF and 3NF due to partial and transitive dependencies (non-key columns depend on other non-key columns).