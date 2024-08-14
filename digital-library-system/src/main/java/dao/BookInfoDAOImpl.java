package dao;

import java.sql.SQLException;
import java.util.List;

import model.Authors;
import model.Genre;
import model.Publishers;
import model.ShelfLocation;

public class BookInfoDAOImpl implements BookInfoDAO {

	@Override
	public List<Authors> GetAllAuthors() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Authors GetAuthorById(int author_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean AddAuthor(Authors author) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean EditAuthorsDetail(Authors author) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean DeleteAuthors(int author_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Publishers> GetAllPublisher() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Publishers GetPublisherById(int publisher_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean AddPublisher(Publishers publisher) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean EditPublishersDetail(Publishers publisher) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean DeletePublishers(int publisher_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Genre> GetAllGenres() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Genre GetGenreById(int genre_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean AddGenre(Genre genre) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean EditGenresDetail(Genre genre) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean DeleteGenre(int genre_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ShelfLocation> GetAllShelfLocation() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ShelfLocation GetShelfLocationById(int shelf_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean AddShelfLocation(ShelfLocation shelf_location) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean EditShelfLocationDetail(ShelfLocation shelf_location) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean DeleteShelfLocation(int shelf_id) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
