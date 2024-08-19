package model;

public class PhysicalBooks {
	private String book_id;
	private String ISBN;
	private String title;
	private String cover;
	private String genre_id;
	private String author_id;
	private String publisher_id;
	private String publish_date;
	private String shelf_id;
	private String quantity;
	private String status;
	private String registration_date;

	public PhysicalBooks() {
		super();
	}

	public PhysicalBooks(String book_id, String iSBN, String title, String cover, String genre_id, String author_id,
			String publisher_id, String publish_date, String shelf_id, String quantity, String status,
			String registration_date) {
		super();
		this.book_id = book_id;
		ISBN = iSBN;
		this.title = title;
		this.cover = cover;
		this.genre_id = genre_id;
		this.author_id = author_id;
		this.publisher_id = publisher_id;
		this.publish_date = publish_date;
		this.shelf_id = shelf_id;
		this.quantity = quantity;
		this.status = status;
		this.registration_date = registration_date;
	}
	
	public PhysicalBooks(String iSBN, String title, String cover, String genre_id, String author_id, String publisher_id,
			String publish_date, String shelf_id, String quantity, String status, String registration_date) {
		super();
		ISBN = iSBN;
		this.title = title;
		this.cover = cover;
		this.genre_id = genre_id;
		this.author_id = author_id;
		this.publisher_id = publisher_id;
		this.publish_date = publish_date;
		this.shelf_id = shelf_id;
		this.quantity = quantity;
		this.status = status;
		this.registration_date = registration_date;
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

	public String getGenre_id() {
		return genre_id;
	}

	public void setGenre_id(String genre_id) {
		this.genre_id = genre_id;
	}

	public String getAuthor_id() {
		return author_id;
	}

	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}

	public String getPublisher_id() {
		return publisher_id;
	}

	public void setPublisher_id(String publisher_id) {
		this.publisher_id = publisher_id;
	}

	public String getPublish_date() {
		return publish_date;
	}

	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}

	public String getShelf_id() {
		return shelf_id;
	}

	public void setShelf_id(String shelf_id) {
		this.shelf_id = shelf_id;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}
	
	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
}
