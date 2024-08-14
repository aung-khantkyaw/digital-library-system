package model;

public class PhysicalBooks {
	private String ISBN;
	private String title;
	private String cover;
	private int genre_id;
	private int author_id;
	private int publisher_id;
	private String publish_date;
	private int shelf_id;
	private int quantity;
	private String status;
	
	public PhysicalBooks(String iSBN, String title, String cover, int genre_id, int author_id, int publisher_id,
			String publish_date, int shelf_id, int quantity, String status) {
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

	public int getShelf_id() {
		return shelf_id;
	}

	public void setShelf_id(int shelf_id) {
		this.shelf_id = shelf_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
