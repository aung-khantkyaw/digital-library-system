package dao;

import java.sql.SQLException;
import java.util.List;

import model.EBookBorrow;
import model.PhysicalBookBorrow;

public interface BooksDAO {
	 // Physical Book Borrowing Operations
    public List<PhysicalBookBorrow> getAllPhysicalBorrows();
    
    public PhysicalBookBorrow getPhysicalBorrowById(int borrow_id);
    
    public boolean addPhysicalBorrow(PhysicalBookBorrow physical_borrow) throws SQLException;
    
    public boolean updatePhysicalBorrow(PhysicalBookBorrow physical_borrow) throws SQLException;
    
    public boolean deletePhysicalBorrow(int borrow_id) throws SQLException;
    
    // E-Book Borrowing Operations
    public List<EBookBorrow> getAllEBookBorrows();
    
    public EBookBorrow getEBookBorrowById(int borrow_id);
    
    public boolean addEBookBorrow(EBookBorrow ebook_borrow) throws SQLException;
    
    public boolean updateEBookBorrow(EBookBorrow ebook_borrow) throws SQLException;
    
    public boolean deleteEBookBorrow(int borrow_id) throws SQLException;
	
//	//Physical Books
//	public List<PhysicalBooks> GetAllPhysicalBooks();
//	
//	public PhysicalBooks GetPhysicalBookById(int ISBN);
//	
//	public boolean AddPhysicalBooks(PhysicalBooks physical_books);
//	
//	public boolean EditPhysicalBooksDetail(PhysicalBooks physical_book) throws SQLException;
//	
//	public boolean DeletePhysicalBooks(int ISBN);
//	
//	//E Books
//	public List<EBooks> GetAllEBooks();
//	
//	public EBooks GetEBookById(int ISBN);
//	
//	public boolean AddEBooks(EBooks e_books);
//	
//	public boolean EditEBooksDetail(EBooks e_book) throws SQLException;
//	
//	public boolean DeleteEBooks(int ISBN);
}
