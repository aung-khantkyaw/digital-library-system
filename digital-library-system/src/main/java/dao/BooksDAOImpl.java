package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import model.EBookBorrow;
import model.EBooks;
import model.PhysicalBookBorrow;
import model.PhysicalBooks;
import util.DatabaseConnection;

public class BooksDAOImpl implements BooksDAO{

	private Connection conn;

	public BooksDAOImpl(Connection connection) throws SQLException {
		super();
		conn = DatabaseConnection.getConnection();
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

	@Override
	public List<PhysicalBooks> GetAllPhysicalBooks() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PhysicalBooks GetPhysicalBookById(int ISBN) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean AddPhysicalBooks(PhysicalBooks physical_books) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean EditPhysicalBooksDetail(PhysicalBooks physical_book) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean DeletePhysicalBooks(int ISBN) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<EBooks> GetAllEBooks() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EBooks GetEBookById(int ISBN) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean AddEBooks(EBooks e_books) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean EditEBooksDetail(EBooks e_book) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean DeleteEBooks(int ISBN) {
		// TODO Auto-generated method stub
		return false;
	}

}
