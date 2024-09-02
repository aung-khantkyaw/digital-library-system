package dao;

import java.sql.SQLException;
import java.util.List;

import model.EBookBorrow;
import model.PhysicalBookBorrow;

public interface BookBorrowDAO {

	// Physical Book Borrowing Operations
    public List<PhysicalBookBorrow> getAllPhysicalBorrows() throws SQLException;

    public boolean addPhysicalBorrow(PhysicalBookBorrow physical_borrow) throws SQLException;

    public boolean updatePhysicalBorrow(PhysicalBookBorrow physicalbook) throws SQLException;

    // E-Book Borrowing Operations
    public List<EBookBorrow> getAllEBookBorrows() throws SQLException;

    public boolean addEBookBorrow(EBookBorrow ebook_borrow) throws SQLException;
}
