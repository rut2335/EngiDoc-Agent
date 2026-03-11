# Digital Library Project - Technical Summary

## Database Schema

### PostgreSQL Database Structure

The project uses PostgreSQL with the following tables:

#### Authors Table
- **id**: SERIAL PRIMARY KEY
- **name**: VARCHAR(255) NOT NULL
- **bio**: TEXT
- **Relationship**: One-to-many with Books

#### Books Table
- **id**: SERIAL PRIMARY KEY
- **title**: VARCHAR(512) NOT NULL
- **description**: TEXT
- **author_id**: INTEGER FOREIGN KEY → authors.id (ON DELETE SET NULL)
- **isbn**: VARCHAR(32) UNIQUE
- **available**: BOOLEAN DEFAULT TRUE
- **Relationship**: Many-to-one with Authors, One-to-many with Loans

#### Loans Table
- **id**: SERIAL PRIMARY KEY
- **book_id**: INTEGER FOREIGN KEY → books.id (ON DELETE CASCADE)
- **user_id**: INTEGER NOT NULL
- **start_date**: DATE NOT NULL
- **due_date**: DATE NOT NULL
- **returned**: BOOLEAN DEFAULT FALSE
- **Relationship**: Many-to-one with Books

### Sample Data
- 2 authors: Jane Austen, George Orwell
- 3 books: Pride and Prejudice, 1984, Animal Farm
- 1 loan record for Animal Farm

## API Structure

### FastAPI Application
- **Framework**: FastAPI
- **Database ORM**: SQLAlchemy
- **Data Validation**: Pydantic schemas
- **Database Engine**: PostgreSQL

### API Endpoints

#### Books Management
- `GET /books` - List all books (with pagination: skip, limit)
- `GET /books/{book_id}` - Get specific book by ID
- `POST /books` - Create new book
- `PUT /books/{book_id}` - Update existing book
- `DELETE /books/{book_id}` - Delete book

#### Users Management (In-memory)
- `GET /users` - List all users
- `GET /users/{user_id}` - Get specific user by ID
- `POST /users` - Create new user

### Data Models (SQLAlchemy)

#### Author Model
- Maps to `authors` table
- Relationship: `books` (one-to-many)

#### Book Model
- Maps to `books` table
- Relationships: `author` (many-to-one)

#### Loan Model
- Maps to `loans` table
- No explicit relationships defined in model

### Pydantic Schemas

#### Book Schemas
- `BookBase`: Base book fields
- `BookCreate`: For book creation requests
- `Book`: For book responses (includes id)

#### User Schema
- `User`: Basic user structure (id, name, email)

#### Loan Schema
- `LoanBase`: Base loan fields

### CRUD Operations
- **Book CRUD**: Complete CRUD operations implemented
  - `get_book()`, `get_books()`, `create_book()`, `update_book()`, `delete_book()`
- **User Management**: Simple in-memory storage (not database-backed)

### Architecture Notes
- **Database Connection**: SQLAlchemy engine with session management
- **Error Handling**: HTTP 404 for not found resources
- **Pagination**: Implemented for book listing
- **Data Validation**: Pydantic schemas for request/response validation
- **Foreign Key Constraints**: Proper cascade and set null policies
- **Indexing**: Primary keys and ISBN field indexed

## Technical Stack
- **Backend**: FastAPI
- **Database**: PostgreSQL
- **ORM**: SQLAlchemy
- **Validation**: Pydantic
- **Python Version**: Compatible with Python 3.7+

## Current Limitations
- Users are stored in-memory (not database-backed)
- No authentication/authorization
- No loan management endpoints implemented
- Limited error handling and logging
- No API documentation customization
