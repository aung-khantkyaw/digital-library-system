package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Authors;
import model.EBookBorrow;
import model.EBooks;
import model.PhysicalBookBorrow;
import util.DatabaseConnection;

public class BookBorrowDAOImpl implements BookBorrowDAO {

	private Connection connection;
	public PreparedStatement pstmt;

	public BookBorrowDAOImpl(Connection connection) {
		this.connection = connection;
	}

	String getAllPhysicalBorrows_query = "SELECT * FROM physical_borrow";
	String addPhysicalBookBorrow_query = "INSERT INTO physical_borrow(user_id, book_id, borrow_date, due_date, status, pay_amount) VALUES (?, ?, ?, ?, ?, ?)";
	String updatePhysicalBorrow_query = "UPDATE physical_borrow SET return_date = ?, status = ? WHERE borrow_id = ? ";
	@Override
	public List<PhysicalBookBorrow> getAllPhysicalBorrows() throws SQLException {
		List<PhysicalBookBorrow> physicalborrows = new ArrayList<>();
		pstmt = connection.prepareStatement(getAllPhysicalBorrows_query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			PhysicalBookBorrow physicalborrow = new PhysicalBookBorrow();
			physicalborrow.setBorrow_id(rs.getString("borrow_id"));
			physicalborrow.setUser_id(rs.getString("user_id"));
			physicalborrow.setbook_id(rs.getString("book_id"));
			physicalborrow.setBorrow_date(rs.getString("borrow_date"));
			physicalborrow.setDue_date(rs.getString("due_date"));
			physicalborrow.setReturn_date(rs.getString("return_date")); 
			physicalborrow.setStatus(rs.getString("status"));
			physicalborrow.setPay_amount(rs.getString("pay_amount")); 
			physicalborrow.setFine(rs.getString("fine")); 
			physicalborrows.add(physicalborrow);
		}
		return physicalborrows;
	}

	@Override
	public PhysicalBookBorrow getPhysicalBorrowById(String borrow_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addPhysicalBorrow(PhysicalBookBorrow physical_borrow) throws SQLException {
		pstmt = connection.prepareStatement(addPhysicalBookBorrow_query);
		pstmt.setString(1, physical_borrow.getUser_id());
		pstmt.setString(2, physical_borrow.getbook_id());
		pstmt.setString(3, physical_borrow.getBorrow_date());
		pstmt.setString(4, physical_borrow.getDue_date());
		pstmt.setString(5, physical_borrow.getStatus());
		pstmt.setString(6, physical_borrow.getPay_amount());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean updatePhysicalBorrow(PhysicalBookBorrow physicalbook) throws SQLException {
		pstmt = connection.prepareStatement(updatePhysicalBorrow_query);
		pstmt.setString(1, physicalbook.getReturn_date());
		pstmt.setString(2, physicalbook.getStatus());
		pstmt.setString(3, physicalbook.getBorrow_id());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean deletePhysicalBorrow(String borrow_id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	// Ebook borrow
	String getAllEBookBorrows_query = "SELECT * FROM ebook_borrow";
	String addEBookBorrow_query = "INSERT INTO ebook_borrow(user_id, book_id, borrow_date, due_date, status) VALUES (?, ?, ?, ?, ?)";

	@Override
	public List<EBookBorrow> getAllEBookBorrows() throws SQLException {
		List<EBookBorrow> ebookborrows = new ArrayList<>();
		pstmt = connection.prepareStatement(getAllEBookBorrows_query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			EBookBorrow ebookborrow = new EBookBorrow();
			ebookborrow.setBorrow_id(rs.getString("borrow_id"));
			ebookborrow.setUser_id(rs.getString("user_id"));
			ebookborrow.setBook_id(rs.getString("book_id"));
			ebookborrow.setBorrow_date(rs.getString("borrow_date"));
			ebookborrow.setDue_date(rs.getString("due_date"));
			ebookborrow.setStatus(rs.getString("status"));
			ebookborrows.add(ebookborrow);
		}
		return ebookborrows;
	}

	@Override
	public EBookBorrow getEBookBorrowById(String borrow_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addEBookBorrow(EBookBorrow ebook_borrow) throws SQLException {
		pstmt = connection.prepareStatement(addEBookBorrow_query);
		pstmt.setString(1, ebook_borrow.getUser_id());
		pstmt.setString(2, ebook_borrow.getBook_id());
		pstmt.setString(3, ebook_borrow.getBorrow_date());
		pstmt.setString(4, ebook_borrow.getDue_date());
		pstmt.setString(5, ebook_borrow.getStatus());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean updateEBookBorrow(EBookBorrow ebook_borrow) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteEBookBorrow(String borrow_id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
