package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Authors;
import model.Genre;
import model.Publishers;
import model.ShelfLocation;

public class BookInfoDAOImpl implements BookInfoDAO {

	private Connection connection;
	public PreparedStatement pstmt;

	public BookInfoDAOImpl(Connection connection) {
		this.connection = connection;
	}

	@Override
	public List<Authors> GetAllAuthors() throws SQLException {
		List<Authors> authors = new ArrayList<>();
		String query = "SELECT * FROM author";
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Authors author = new Authors();
			author.setAuthor_id(rs.getString("author_id"));
			author.setAuthor_name(rs.getString("author_name"));
			author.setAuthor_profile(rs.getString("author_profile"));
			author.setAuthor_Biography(rs.getString("author_Biography"));
			authors.add(author);
		}
		return authors;
	}

	@Override
	public Authors GetAuthorById(String author_id) throws SQLException {
		Authors author = null;
		String query = "SELECT * FROM author WHERE author_id = ?";
	    PreparedStatement pstmt = connection.prepareStatement(query);
	    pstmt.setString(1, author_id);
	    ResultSet rs = pstmt.executeQuery();

	    if (rs.next()) {
	        return new Authors(
	            rs.getString("author_id"),
	            rs.getString("author_name"),
	            rs.getString("author_profile"),
	            rs.getString("author_Biography")
	        );
	    }
		return author;
	}

	@Override
	public boolean AddAuthor(Authors author) throws SQLException {
		String query = "INSERT INTO author(author_name, author_profile, author_Biography) VALUES (?,?,?)";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, author.getAuthor_name());
		pstmt.setString(2, author.getAuthor_profile());
		pstmt.setString(3, author.getAuthor_Biography());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean EditAuthorsDetail(Authors author) throws SQLException {
		String query = "UPDATE author SET author_name = ?, author_profile = ? , author_Biography = ? WHERE author_id = ? ";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, author.getAuthor_name());
		pstmt.setString(2, author.getAuthor_profile());
		pstmt.setString(3, author.getAuthor_Biography());
		pstmt.setString(4, author.getAuthor_id());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean DeleteAuthors(String author_id) throws SQLException {
		String query = "DELETE FROM author WHERE author_id = ?";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, author_id);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public List<Publishers> GetAllPublisher() throws SQLException {
		List<Publishers> publishers = new ArrayList<>();
		String query = "SELECT * FROM publisher";
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Publishers publisher = new Publishers();
			publisher.setPublisher_id(rs.getString("publisher_id"));
			publisher.setPublisher_name(rs.getString("publisher_name"));
			publisher.setPublisher_profile(rs.getString("publisher_profile"));
			publisher.setPublisher_address(rs.getString("publisher_address"));
			publisher.setPublisher_email(rs.getString("publisher_email"));
			publisher.setPublisher_phone_number(rs.getString("publisher_phone_number"));
			publishers.add(publisher);
		}
		return publishers;
	}

	@Override
	public Publishers GetPublisherById(String publisher_id) throws SQLException {
		Publishers publisher = null;
		String query = "SELECT * FROM publisher WHERE publisher_id = ?";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, publisher_id);
		ResultSet rs = pstmt.executeQuery();
		 if (rs.next()) {
		        return new Publishers(
		            rs.getString("publisher_id"),
		            rs.getString("publisher_name"),
		            rs.getString("publisher_profile"),
		            rs.getString("publisher_address"),
		            rs.getString("publisher_email"),
		            rs.getString("publisher_phone_number")
		        );
		    }
		return publisher;
	}

	@Override
	public boolean AddPublisher(Publishers publisher) throws SQLException {
		String query = "INSERT INTO publisher( publisher_name, publisher_profile, publisher_address, publisher_email, publisher_phone_number) VALUES (?,?,?,?,?)";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, publisher.getPublisher_name());
		pstmt.setString(2, publisher.getPublisher_profile());
		pstmt.setString(3, publisher.getPublisher_address());
		pstmt.setString(4, publisher.getPublisher_email());
		pstmt.setString(5, publisher.getPublisher_phone_number());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean EditPublishersDetail(Publishers publisher) throws SQLException {
		String query = "UPDATE publisher SET publisher_name = ? , publisher_profile = ? , publisher_address = ? , publisher_email = ? , publisher_phone_number = ? WHERE publisher_id = ? ";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, publisher.getPublisher_name());
		pstmt.setString(2, publisher.getPublisher_profile());
		pstmt.setString(3, publisher.getPublisher_address());
		pstmt.setString(4, publisher.getPublisher_email());
		pstmt.setString(5, publisher.getPublisher_phone_number());
		pstmt.setString(6, publisher.getPublisher_id());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean DeletePublishers(String publisher_id) throws SQLException {
		String query = "DELETE FROM publisher WHERE publisher_id = ?";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, publisher_id);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public List<Genre> GetAllGenres() throws SQLException {
		List<Genre> genres = new ArrayList<>();
		String query = "SELECT * FROM genre";
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Genre genre = new Genre();
			genre.setGenre_id(rs.getString("genre_id"));
			genre.setGenre_name(rs.getString("genre_name"));
			genres.add(genre);
		}
		return genres;
	}

	@Override
	public Genre GetGenreById(String genre_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean AddGenre(Genre genre) throws SQLException {
		String query = "INSERT INTO genre (genre_name) VALUES (?)";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, genre.getGenre_name());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean EditGenresDetail(Genre genre) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean DeleteGenre(String genre_id) throws SQLException {
		String query = "DELETE FROM genre WHERE genre_id = ?";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, genre_id);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public List<ShelfLocation> GetAllShelfLocation() throws SQLException {
		List<ShelfLocation> shelfLocations = new ArrayList<>();
		String query = "SELECT * FROM shelf_location";
		PreparedStatement pstmt = connection.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			ShelfLocation shelfLocation = new ShelfLocation();
			shelfLocation.setShelf_id(rs.getString("shelf_id"));
			shelfLocation.setShelf_location(rs.getString("shelf_location"));
			shelfLocations.add(shelfLocation);
		}
		return shelfLocations;
	}

	@Override
	public ShelfLocation GetShelfLocationById(String shelfId) throws SQLException {
		ShelfLocation shelfLocation = null;
        String query = "SELECT * FROM shelf_location WHERE shelf_id = ?";
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, shelfId);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            shelfLocation = new ShelfLocation();
            shelfLocation.setShelf_location(rs.getString("shelf_location"));
        }
		return shelfLocation;
	}

	@Override
	public boolean AddShelfLocation(ShelfLocation shelfLocation) throws SQLException {
		String query = "INSERT INTO shelf_location (shelf_location) VALUES (?)";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, shelfLocation.getShelf_location());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean EditShelfLocationDetail(ShelfLocation shelfLocation) throws SQLException {
		String query = "UPDATE shelf_location SET shelf_location = ? WHERE shelf_id = ?";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, shelfLocation.getShelf_location());
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean DeleteShelfLocation(String shelf_location) throws SQLException {
		String query = "DELETE FROM shelf_location WHERE shelf_location = ?";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setString(1, shelf_location);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}
}
