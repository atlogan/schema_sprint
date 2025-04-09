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
