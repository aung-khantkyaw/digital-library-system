package dao;

import java.sql.SQLException;
import java.util.List;

import model.Authors;
import model.Genre;
import model.Publishers;
import model.ShelfLocation;


public interface BookInfoDAO {
	//Author
	public List<Authors> GetAllAuthors();
	
	public Authors GetAuthorById(int author_id);
	
	public boolean AddAuthor(Authors author);
	
	public boolean EditAuthorsDetail(Authors author) throws SQLException;
	
	public boolean DeleteAuthors(int author_id);
	
	//Publisher
	public List<Publishers> GetAllPublisher();
	
	public Publishers GetPublisherById(int publisher_id);
	
	public boolean AddPublisher(Publishers publisher);
	
	public boolean EditPublishersDetail(Publishers publisher) throws SQLException;
	
	public boolean DeletePublishers(int publisher_id);
	
	//Genre
	public List<Genre> GetAllGenres();
	
	public Genre GetGenreById(int genre_id);
	
	public boolean AddGenre(Genre genre);
	
	public boolean EditGenresDetail(Genre genre) throws SQLException;
	
	public boolean DeleteGenre(int genre_id);
	
	//ShelfLocation
	public List<ShelfLocation> GetAllShelfLocation();
	
	public ShelfLocation GetShelfLocationById(int shelf_id);
	
	public boolean AddShelfLocation(ShelfLocation shelf_location);
	
	public boolean EditShelfLocationDetail(ShelfLocation shelf_location) throws SQLException;
	
	public boolean DeleteShelfLocation(int shelf_id);
}
