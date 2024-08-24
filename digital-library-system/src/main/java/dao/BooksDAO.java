package dao;

import java.sql.SQLException;
import java.util.List;

import model.EBookBorrow;
import model.EBooks;
import model.PhysicalBookBorrow;
import model.PhysicalBooks;

public interface BooksDAO {
	//Physical Books
	public List<PhysicalBooks> GetAllPhysicalBooks() throws SQLException;

	public PhysicalBooks GetPhysicalBookById(String book_id) throws SQLException;
	
	public PhysicalBooks GetPhysicalBookByAuthor(String author_id) throws SQLException;
	
	public PhysicalBooks GetPhysicalBookByPublisher(String publisher_id) throws SQLException;

	public boolean AddPhysicalBooks(PhysicalBooks physical_books) throws SQLException;

	public boolean EditPhysicalBooksDetail(PhysicalBooks physical_book) throws SQLException;

	public boolean DeletePhysicalBooks(String book_id) throws SQLException;

	//E Books
	public List<EBooks> GetAllEBooks() throws SQLException;

	public EBooks GetEBookById(String book_id) throws SQLException;
	
	public EBooks GetEBookByAuthor(String author_id) throws SQLException;
	
	public EBooks GetEBookByPublisher(String publisher_id) throws SQLException;

	public boolean AddEBooks(EBooks e_books) throws SQLException;

	public boolean EditEBooksDetail(EBooks e_book) throws SQLException;

	public boolean DeleteEBooks(String book_id) throws SQLException;
}