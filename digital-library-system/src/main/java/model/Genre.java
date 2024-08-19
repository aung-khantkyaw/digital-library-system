package model;

public class Genre {
	private String genre_id;
	private String genre_name;

	public Genre() {

	}

	public Genre(String genre_name) {
		super();
		this.genre_name = genre_name;
	}

	public Genre(String genre_id, String genre_name) {
		super();
		this.genre_id = genre_id;
		this.genre_name = genre_name;
	}

	public String getGenre_id() {
		return genre_id;
	}

	public void setGenre_id(String genre_id) {
		this.genre_id = genre_id;
	}

	public String getGenre_name() {
		return genre_name;
	}

	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}

}
