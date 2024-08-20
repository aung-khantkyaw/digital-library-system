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
import model.PhysicalBooks;

public class BooksDAOImpl implements BooksDAO {

	private Connection connection;
	public PreparedStatement pstmt;

	public BooksDAOImpl(Connection connection) {
		this.connection = connection;
	}

	@Override
	public List<PhysicalBookBorrow> getAllPhysicalBorrows() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PhysicalBookBorrow getPhysicalBorrowById(String borrow_id) {
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
	public boolean deletePhysicalBorrow(String borrow_id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<EBookBorrow> getAllEBookBorrows() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EBookBorrow getEBookBorrowById(String borrow_id) {
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
	public boolean deleteEBookBorrow(String borrow_id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	/* Physical Books */

	public String getphysicalbooks_query = "SELECT * FROM physical_book";
	public String getphysicalbooksbyId_query = "SELECT * FROM physical_book WHERE book_id = ?";
	public String getphysicalbooksbyauthor_query = "SELECT * FROM physical_book WHERE author_id = ?";
	public String getphysicalbooksbypublisher_query = "SELECT * FROM physical_book WHERE publisher_id = ?";
	public String addphysicalbooks_query = "INSERT INTO physical_book(ISBN, title, cover, genre_id, author_id, publisher_id, publish_date, shelf_id, quantity, status, registration_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	public String updatephysicalbooks_query = "UPDATE physical_book SET ISBN = ?, title = ?, cover = ?, genre_id = ?, author_id = ?, publisher_id = ?, publish_date = ?, shelf_id = ?, quantity = ?, status = ?, registration_date = ? WHERE book_id = ?";
	public String deletephysicalbooks_query = "DELETE FROM physical_book WHERE book_id = ?";

	@Override
	public List<PhysicalBooks> GetAllPhysicalBooks() throws SQLException {
		List<PhysicalBooks> physicalBooks = new ArrayList<>();
		pstmt = connection.prepareStatement(getphysicalbooks_query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			PhysicalBooks physicalBook = new PhysicalBooks();
			physicalBook.setBook_id(rs.getString("book_id"));
			physicalBook.setISBN(rs.getString("ISBN"));
			physicalBook.setTitle(rs.getString("title"));
			physicalBook.setCover(rs.getString("cover"));
			physicalBook.setGenre_id(rs.getString("genre_id"));
			physicalBook.setAuthor_id(rs.getString("author_id"));
			physicalBook.setPublisher_id(rs.getString("publisher_id"));
			physicalBook.setPublish_date(rs.getString("publish_date"));
			physicalBook.setShelf_id(rs.getString("shelf_id"));
			physicalBook.setQuantity(rs.getString("quantity"));
			physicalBook.setStatus(rs.getString("status"));
			physicalBook.setRegistration_date(rs.getString("registration_date"));
			physicalBooks.add(physicalBook);
		}
		return physicalBooks;
	}

	@Override
	public PhysicalBooks GetPhysicalBookById(String book_id) throws SQLException {
		PhysicalBooks physicalBook = null;
		pstmt = connection.prepareStatement(getphysicalbooksbyId_query);
		pstmt.setString(1, book_id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			return new PhysicalBooks(rs.getString("book_id"), rs.getString("ISBN"), rs.getString("title"),
					rs.getString("cover"), rs.getString("genre_id"), rs.getString("author_id"),
					rs.getString("publisher_id"), rs.getString("publish_date"), rs.getString("shelf_id"),
					rs.getString("quantity"), rs.getString("status"), rs.getString("registration_date"));
		}
		return physicalBook;
	}

	@Override
	public PhysicalBooks GetPhysicalBookByAuthor(String author_id) throws SQLException {
		PhysicalBooks physicalBook = null;
		pstmt = connection.prepareStatement(getphysicalbooksbyauthor_query);
		pstmt.setString(1, author_id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			return new PhysicalBooks(rs.getString("book_id"), rs.getString("ISBN"), rs.getString("title"),
					rs.getString("cover"), rs.getString("genre_id"), rs.getString("author_id"),
					rs.getString("publisher_id"), rs.getString("publish_date"), rs.getString("shelf_id"),
					rs.getString("quantity"), rs.getString("status"), rs.getString("registration_date"));
		}
		return physicalBook;
	}

	@Override
	public PhysicalBooks GetPhysicalBookByPublisher(String publisher_id) throws SQLException {
		PhysicalBooks physicalBook = null;
		pstmt = connection.prepareStatement(getphysicalbooksbypublisher_query);
		pstmt.setString(1, publisher_id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			return new PhysicalBooks(rs.getString("book_id"), rs.getString("ISBN"), rs.getString("title"),
					rs.getString("cover"), rs.getString("genre_id"), rs.getString("author_id"),
					rs.getString("publisher_id"), rs.getString("publish_date"), rs.getString("shelf_id"),
					rs.getString("quantity"), rs.getString("status"), rs.getString("registration_date"));
		}
		return physicalBook;
	}

	@Override
	public boolean AddPhysicalBooks(PhysicalBooks physical_books) throws SQLException {
		pstmt = connection.prepareStatement(addphysicalbooks_query);
		pstmt.setString(1, physical_books.getISBN());
		pstmt.setString(2, physical_books.getTitle());
		pstmt.setString(3, physical_books.getCover());
		pstmt.setString(4, physical_books.getGenre_id());
		pstmt.setString(5, physical_books.getAuthor_id());
		pstmt.setString(6, physical_books.getPublisher_id());
		pstmt.setString(7, physical_books.getPublish_date());
		pstmt.setString(8, physical_books.getShelf_id());
		pstmt.setString(9, physical_books.getQuantity());
		pstmt.setString(10, physical_books.getStatus());
		pstmt.setString(11, physical_books.getRegistration_date());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean EditPhysicalBooksDetail(PhysicalBooks physical_book) throws SQLException {
		pstmt = connection.prepareStatement(updatephysicalbooks_query);
		pstmt.setString(1, physical_book.getISBN());
		pstmt.setString(2, physical_book.getTitle());
		pstmt.setString(3, physical_book.getCover());
		pstmt.setString(4, physical_book.getGenre_id());
		pstmt.setString(5, physical_book.getAuthor_id());
		pstmt.setString(6, physical_book.getPublisher_id());
		pstmt.setString(7, physical_book.getPublish_date());
		pstmt.setString(8, physical_book.getShelf_id());
		pstmt.setString(9, physical_book.getQuantity());
		pstmt.setString(10, physical_book.getStatus());
		pstmt.setString(11, physical_book.getRegistration_date());
		pstmt.setString(12, physical_book.getBook_id());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean DeletePhysicalBooks(String book_id) throws SQLException {
		pstmt = connection.prepareStatement(deletephysicalbooks_query);
		pstmt.setString(1, book_id);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	/* E Books */

	public String getebooks_query = "SELECT * FROM ebook";
	public String getebooksbyId_query = "SELECT * FROM ebook WHERE book_id = ?";
	public String getebooksbyauthor_query = "SELECT * FROM ebook WHERE author_id = ?";
	public String getebooksbypublisher_query = "SELECT * FROM ebook WHERE publisher_id = ?";
	public String addebooks_query = "INSERT INTO ebook(ISBN, title, cover, genre_id, author_id, publisher_id, publish_date, url, registration_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	public String updateebooks_query = "UPDATE ebook SET ISBN = ?, title = ?, cover = ?, genre_id = ?, author_id = ?, publisher_id = ?, publish_date = ?, url = ?, registration_date = ? WHERE book_id = ?";
	public String deleteebooks_query = "DELETE FROM ebook WHERE book_id = ?";

	@Override
	public List<EBooks> GetAllEBooks() throws SQLException {
		List<EBooks> eBooks = new ArrayList<>();
		pstmt = connection.prepareStatement(getebooks_query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			EBooks eBook = new EBooks();
			eBook.setBook_id(rs.getString("book_id"));
			eBook.setISBN(rs.getString("ISBN"));
			eBook.setTitle(rs.getString("title"));
			eBook.setCover(rs.getString("cover"));
			eBook.setGenre_id(rs.getString("genre_id"));
			eBook.setAuthor_id(rs.getString("author_id"));
			eBook.setPublisher_id(rs.getString("publisher_id"));
			eBook.setPublish_date(rs.getString("publish_date"));
			eBook.setUrl(rs.getString("url"));
			eBook.setRegistration_date(rs.getString("registration_date"));
			eBooks.add(eBook);
		}
		return eBooks;
	}

	@Override
	public EBooks GetEBookById(String book_id) throws SQLException {
		EBooks eBook = null;
		pstmt = connection.prepareStatement(getebooksbyId_query);
		pstmt.setString(1, book_id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			return new EBooks(rs.getString("book_id"), rs.getString("ISBN"), rs.getString("title"),
					rs.getString("cover"), rs.getString("genre_id"), rs.getString("author_id"),
					rs.getString("publisher_id"), rs.getString("publish_date"), rs.getString("url"),
					rs.getString("registration_date"));
		}
		return eBook;
	}

	@Override
	public EBooks GetEBookByAuthor(String author_id) throws SQLException {
		EBooks eBook = null;
		pstmt = connection.prepareStatement(getebooksbyauthor_query);
		pstmt.setString(1, author_id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			return new EBooks(rs.getString("book_id"), rs.getString("ISBN"), rs.getString("title"),
					rs.getString("cover"), rs.getString("genre_id"), rs.getString("author_id"),
					rs.getString("publisher_id"), rs.getString("publish_date"), rs.getString("url"),
					rs.getString("registration_date"));
		}
		return eBook;
	}

	@Override
	public EBooks GetEBookByPublisher(String publisher_id) throws SQLException {
		EBooks eBook = null;
		pstmt = connection.prepareStatement(getebooksbypublisher_query);
		pstmt.setString(1, publisher_id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			return new EBooks(rs.getString("book_id"), rs.getString("ISBN"), rs.getString("title"),
					rs.getString("cover"), rs.getString("genre_id"), rs.getString("author_id"),
					rs.getString("publisher_id"), rs.getString("publish_date"), rs.getString("url"),
					rs.getString("registration_date"));
		}
		return eBook;
	}

	@Override
	public boolean AddEBooks(EBooks e_books) throws SQLException {
		pstmt = connection.prepareStatement(addebooks_query);
		pstmt.setString(1, e_books.getISBN());
		pstmt.setString(2, e_books.getTitle());
		pstmt.setString(3, e_books.getCover());
		pstmt.setString(4, e_books.getGenre_id());
		pstmt.setString(5, e_books.getAuthor_id());
		pstmt.setString(6, e_books.getPublisher_id());
		pstmt.setString(7, e_books.getPublish_date());
		pstmt.setString(8, e_books.getUrl());
		pstmt.setString(9, e_books.getRegistration_date());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean EditEBooksDetail(EBooks e_book) throws SQLException {
		pstmt = connection.prepareStatement(updateebooks_query);
		pstmt.setString(1, e_book.getISBN());
		pstmt.setString(2, e_book.getTitle());
		pstmt.setString(3, e_book.getCover());
		pstmt.setString(4, e_book.getGenre_id());
		pstmt.setString(5, e_book.getAuthor_id());
		pstmt.setString(6, e_book.getPublisher_id());
		pstmt.setString(7, e_book.getPublish_date());
		pstmt.setString(8, e_book.getUrl());
		pstmt.setString(9, e_book.getRegistration_date());
		pstmt.setString(10, e_book.getBook_id());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean DeleteEBooks(String book_id) throws SQLException {
		pstmt = connection.prepareStatement(deleteebooks_query);
		pstmt.setString(1, book_id);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

}
