package dao;

import java.sql.SQLException;
import java.util.List;

import model.EBookBorrow;
import model.PhysicalBookBorrow;
import util.DatabaseConnection;

public class BooksDAOImpl implements BooksDAO{
	
	private DatabaseConnection conn;
	
	public BooksDAOImpl(DatabaseConnection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<PhysicalBookBorrow> getAllPhysicalBorrows() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PhysicalBookBorrow getPhysicalBorrowById(int borrow_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addPhysicalBorrow(PhysicalBookBorrow physical_borrow) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatePhysicalBorrow(PhysicalBookBorrow physical_borrow) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deletePhysicalBorrow(int borrow_id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<EBookBorrow> getAllEBookBorrows() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EBookBorrow getEBookBorrowById(int borrow_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addEBookBorrow(EBookBorrow ebook_borrow) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateEBookBorrow(EBookBorrow ebook_borrow) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteEBookBorrow(int borrow_id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
