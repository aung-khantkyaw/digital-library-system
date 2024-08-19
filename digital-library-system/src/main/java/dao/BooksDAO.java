package dao;

import java.sql.SQLException;
import java.util.List;

import model.EBookBorrow;
import model.EBooks;
import model.PhysicalBookBorrow;
import model.PhysicalBooks;

public interface BooksDAO {
	 // Physical Book Borrowing Operations
    public List<PhysicalBookBorrow> getAllPhysicalBorrows();

    public PhysicalBookBorrow getPhysicalBorrowById(String borrow_id);

    public boolean addPhysicalBorrow(PhysicalBookBorrow physical_borrow) throws SQLException;

    public boolean updatePhysicalBorrow(PhysicalBookBorrow physical_borrow) throws SQLException;

    public boolean deletePhysicalBorrow(String borrow_id) throws SQLException;

    // E-Book Borrowing Operations
    public List<EBookBorrow> getAllEBookBorrows();

    public EBookBorrow getEBookBorrowById(String borrow_id);

    public boolean addEBookBorrow(EBookBorrow ebook_borrow) throws SQLException;

    public boolean updateEBookBorrow(EBookBorrow ebook_borrow) throws SQLException;

    public boolean deleteEBookBorrow(String borrow_id) throws SQLException;

	//Physical Books
	public List<PhysicalBooks> GetAllPhysicalBooks() throws SQLException;

	public PhysicalBooks GetPhysicalBookById(String book_id) throws SQLException;

	public boolean AddPhysicalBooks(PhysicalBooks physical_books) throws SQLException;

	public boolean EditPhysicalBooksDetail(PhysicalBooks physical_book) throws SQLException;

	public boolean DeletePhysicalBooks(String book_id) throws SQLException;

	//E Books
	public List<EBooks> GetAllEBooks() throws SQLException;

	public EBooks GetEBookById(String book_id) throws SQLException;

	public boolean AddEBooks(EBooks e_books) throws SQLException;

	public boolean EditEBooksDetail(EBooks e_book) throws SQLException;

	public boolean DeleteEBooks(String book_id) throws SQLException;
}