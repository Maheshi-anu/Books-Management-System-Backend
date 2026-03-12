using BooksAPI.Models;
using BooksAPI.Services;
using Microsoft.AspNetCore.Mvc;

namespace BooksAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BooksController : ControllerBase
    {
        private readonly IBookService _bookService;

        public BooksController(IBookService bookService)
        {
            _bookService = bookService;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Book>> GetAllBooks()
        {
            return Ok(_bookService.GetAllBooks());
        }

        [HttpGet("{id}")]
        public ActionResult<Book> GetBookById(int id)
        {
            var book = _bookService.GetBookById(id);
            if (book == null)
                return NotFound(new { message = $"Book with ID {id} not found" });

            return Ok(book);
        }

        [HttpPost]
        public ActionResult<Book> AddBook([FromBody] Book book)
        {
            if (string.IsNullOrWhiteSpace(book.Title) || string.IsNullOrWhiteSpace(book.Author))
                return BadRequest(new { message = "Title and Author are required" });

            var createdBook = _bookService.AddBook(book);
            return CreatedAtAction(nameof(GetBookById), new { id = createdBook.Id }, createdBook);
        }

        [HttpPut("{id}")]
        public ActionResult<Book> UpdateBook(int id, [FromBody] Book book)
        {
            if (string.IsNullOrWhiteSpace(book.Title) || string.IsNullOrWhiteSpace(book.Author))
                return BadRequest(new { message = "Title and Author are required" });

            var updatedBook = _bookService.UpdateBook(id, book);
            if (updatedBook == null)
                return NotFound(new { message = $"Book with ID {id} not found" });

            return Ok(updatedBook);
        }

        [HttpDelete("{id}")]
        public ActionResult DeleteBook(int id)
        {
            var success = _bookService.DeleteBook(id);
            if (!success)
                return NotFound(new { message = $"Book with ID {id} not found" });

            return NoContent();
        }
    }
}
