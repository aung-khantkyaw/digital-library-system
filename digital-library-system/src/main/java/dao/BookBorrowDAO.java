package dao;

import java.sql.SQLException;
import java.util.List;

import model.EBookBorrow;
import model.PhysicalBookBorrow;

public interface BookBorrowDAO {

	// Physical Book Borrowing Operations
    public List<PhysicalBookBorrow> getAllPhysicalBorrows() throws SQLException;

    public PhysicalBookBorrow getPhysicalBorrowById(String borrow_id);

    public boolean addPhysicalBorrow(PhysicalBookBorrow physical_borrow) throws SQLException;

    public boolean updatePhysicalBorrow(PhysicalBookBorrow physicalbook) throws SQLException;

    public boolean deletePhysicalBorrow(String borrow_id) throws SQLException;

    // E-Book Borrowing Operations
    public List<EBookBorrow> getAllEBookBorrows() throws SQLException;

    public EBookBorrow getEBookBorrowById(String borrow_id);

    public boolean addEBookBorrow(EBookBorrow ebook_borrow) throws SQLException;

    public boolean updateEBookBorrow(EBookBorrow ebook_borrow) throws SQLException;

    public boolean deleteEBookBorrow(String borrow_id) throws SQLException;
}
