## Key Highlights

- Built using **ASP.NET Core Web API**
- Implements **RESTful API architecture**
- Supports full **CRUD operations for books**
- Uses **in-memory data storage** for quick development and testing
- Structured using **Controllers, Services, and Models**
- Includes **CORS configuration** for frontend integration
- Provides **input validation and proper HTTP responses**
- Designed to integrate with the **Angular frontend application**

---

## Technology Stack

- **Framework:** ASP.NET Core  
- **Language:** C#  
- **Architecture:** RESTful API  
- **Data Storage:** In-memory collection  
- **Tools:** .NET CLI, Visual Studio, VS Code  

---

## Prerequisites

Before running the project, ensure you have:

- **.NET SDK 10.0 or higher**
- **Visual Studio or VS Code**
- **Postman / curl / REST Client** (optional for API testing)

---

## Running the Application

### 1. Navigate to the backend directory

```bash
cd /Users/maheshianuradha/Downloads/Backend/BooksAPI
````

### 2. Run the API

```bash
dotnet run
```

### 3. API Base URL

```
https://localhost:5001
```

---

## 📡 API Endpoints

### Get All Books

```
GET /api/books
```

Returns a list of all books.

---

### Get Book by ID

```
GET /api/books/{id}
```

Example:

```
GET /api/books/1
```

Returns the book that matches the provided ID.

---

### Create a New Book

```
POST /api/books
```

Example request body:

```json
{
  "title": "1984",
  "author": "George Orwell",
  "isbn": "978-0-452-26423-9",
  "publicationDate": "1949-06-08"
}
```

Returns the newly created book with an **auto-generated ID**.

---

### Update a Book

```
PUT /api/books/{id}
```

Example:

```
PUT /api/books/1
```

Example request body:

```json
{
  "title": "Updated Title",
  "author": "Updated Author",
  "isbn": "978-0-123-45678-9",
  "publicationDate": "2020-01-01"
}
```

Updates the selected book.

---

### Delete a Book

```
DELETE /api/books/{id}
```

Example:

```
DELETE /api/books/1
```

Returns:

```
204 No Content
```

When deletion is successful.

---

## Book Model

Each book object contains the following fields:

| Field           | Type     | Description                        |
| --------------- | -------- | ---------------------------------- |
| id              | int      | Unique identifier (auto-generated) |
| title           | string   | Book title                         |
| author          | string   | Author name                        |
| isbn            | string   | ISBN number                        |
| publicationDate | DateTime | Publication date                   |

---

## Testing the API

### Using curl

Get all books:

```bash
curl -k https://localhost:5001/api/books
```

Get book by ID:

```bash
curl -k https://localhost:5001/api/books/1
```

Create a new book:

```bash
curl -k -X POST https://localhost:5001/api/books \
-H "Content-Type: application/json" \
-d '{"title":"New Book","author":"Author Name","isbn":"123-456","publicationDate":"2024-01-01"}'
```

Update a book:

```bash
curl -k -X PUT https://localhost:5001/api/books/1 \
-H "Content-Type: application/json" \
-d '{"title":"Updated Title","author":"Updated Author","isbn":"123-456","publicationDate":"2024-01-01"}'
```

Delete a book:

```bash
curl -k -X DELETE https://localhost:5001/api/books/1
```

---

## Frontend Integration

This API is designed to connect with the **Angular Books Management Frontend**.

Frontend requests are sent to:

```
https://localhost:5001/api/books
```


