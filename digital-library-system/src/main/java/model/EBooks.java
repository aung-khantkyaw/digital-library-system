package model;

public class EBooks {
	private String ISBN;
	private String title;
	private String cover;
	private int genre_id;
	private int author_id;
	private int publisher_id;
	private String publish_date;
	private String url;
	
	public EBooks(String iSBN, String title, String cover, int genre_id, int author_id, int publisher_id,
			String publish_date, String url) {
		super();
		ISBN = iSBN;
		this.title = title;
		this.cover = cover;
		this.genre_id = genre_id;
		this.author_id = author_id;
		this.publisher_id = publisher_id;
		this.publish_date = publish_date;
		this.url = url;
	}
	
	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public int getGenre_id() {
		return genre_id;
	}

	public void setGenre_id(int genre_id) {
		this.genre_id = genre_id;
	}

	public int getAuthor_id() {
		return author_id;
	}

	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}

	public int getPublisher_id() {
		return publisher_id;
	}

	public void setPublisher_id(int publisher_id) {
		this.publisher_id = publisher_id;
	}

	public String getPublish_date() {
		return publish_date;
	}

	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
