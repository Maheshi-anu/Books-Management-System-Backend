using BooksAPI.Models;

namespace BooksAPI.Services
{
    public interface IBookService
    {
        List<Book> GetAllBooks();
        Book? GetBookById(int id);
        Book AddBook(Book book);
        Book? UpdateBook(int id, Book book);
        bool DeleteBook(int id);
    }

    public class BookService : IBookService
    {
        private static List<Book> _books = new List<Book>
        {
            new Book 
            { 
                Id = 1, 
                Title = "The Great Gatsby", 
                Author = "F. Scott Fitzgerald", 
                Isbn = "978-0-7432-7356-5", 
                PublicationDate = new DateTime(1925, 4, 10) 
            },
            new Book 
            { 
                Id = 2, 
                Title = "To Kill a Mockingbird", 
                Author = "Harper Lee", 
                Isbn = "978-0-06-112008-4", 
                PublicationDate = new DateTime(1960, 7, 11) 
            }
        };

        private static int _nextId = 3;

        public List<Book> GetAllBooks()
        {
            return _books;
        }

        public Book? GetBookById(int id)
        {
            return _books.FirstOrDefault(b => b.Id == id);
        }

        public Book AddBook(Book book)
        {
            book.Id = _nextId++;
            _books.Add(book);
            return book;
        }

        public Book? UpdateBook(int id, Book book)
        {
            var existingBook = _books.FirstOrDefault(b => b.Id == id);
            if (existingBook == null)
                return null;

            existingBook.Title = book.Title;
            existingBook.Author = book.Author;
            existingBook.Isbn = book.Isbn;
            existingBook.PublicationDate = book.PublicationDate;

            return existingBook;
        }

        public bool DeleteBook(int id)
        {
            var book = _books.FirstOrDefault(b => b.Id == id);
            if (book == null)
                return false;

            _books.Remove(book);
            return true;
        }
    }
}
