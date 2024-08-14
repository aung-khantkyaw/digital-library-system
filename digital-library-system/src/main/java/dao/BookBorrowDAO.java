package dao;

import java.sql.SQLException;
import java.util.List;

import model.PhysicalBookBorrow;

public interface BookBorrowDAO {
	    
	 public List<PhysicalBookBorrow> GetAllPhysicalBookBorrow();
	    
	 public PhysicalBookBorrow GetPhysicalBookBorrowByBookISBN(int bookISBN);
	    
	 public boolean ReturnPhysicalBook(int bookISBN, int memberId) throws SQLException;
	  
	 public boolean ExtendPhysicalBookPeriod(int bookISBN, int memberId) throws SQLException;
	    
	 public boolean PhysicalBookBorrow(int bookISBN, int memberId);
	 
	 // Overdue Books
	 public List<PhysicalBookBorrow> GetOverduePhysicalBooks();
	    
	 // Borrow History
	 public List<PhysicalBookBorrow> GetPhysicalBookBorrowHistoryByMemberId(int memberId);
	    
	 public List<PhysicalBookBorrow> GetPhysicalBookBorrowHistoryByBookISBN(int bookISBN);
}
