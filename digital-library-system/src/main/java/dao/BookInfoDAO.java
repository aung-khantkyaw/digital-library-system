package dao;

import java.sql.SQLException;
import java.util.List;

import model.Authors;
import model.Genre;
import model.Publishers;
import model.ShelfLocation;


public interface BookInfoDAO {
	//Author
	public List<Authors> GetAllAuthors() throws SQLException;

	public Authors GetAuthorById(String author_id) throws SQLException;

	public boolean AddAuthor(Authors author) throws SQLException;

	public boolean EditAuthorsDetail(Authors author) throws SQLException;

	public boolean DeleteAuthors(String author_id) throws SQLException;

	//Publisher
	public List<Publishers> GetAllPublisher() throws SQLException;

	public Publishers GetPublisherById(String publisher_id) throws SQLException;

	public boolean AddPublisher(Publishers publisher) throws SQLException;

	public boolean EditPublishersDetail(Publishers publisher) throws SQLException;

	public boolean DeletePublishers(String publisher_id) throws SQLException;

	//Genre
	public List<Genre> GetAllGenres() throws SQLException;

	public Genre GetGenreById(String genre_id) throws SQLException;

	public boolean AddGenre(Genre genre) throws SQLException;

	public boolean DeleteGenre(String genre_id) throws SQLException;

	//ShelfLocation
	public List<ShelfLocation> GetAllShelfLocation() throws SQLException;

	public ShelfLocation GetShelfLocationById(String shelf_id) throws SQLException;

	public boolean AddShelfLocation(ShelfLocation shelf_location) throws SQLException;

	public boolean EditShelfLocationDetail(ShelfLocation shelf_location) throws SQLException;

	public boolean DeleteShelfLocation(String shelf_location) throws SQLException;
}
