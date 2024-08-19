package model;

public class ShelfLocation {
	private String shelf_id;
	private String shelf_location;

	public ShelfLocation(String shelf_location) {
		super();
		this.shelf_location = shelf_location;
	}

	public ShelfLocation(String shelf_id, String shelf_location) {
		super();
		this.shelf_id = shelf_id;
		this.shelf_location = shelf_location;
	}

	public ShelfLocation() {
		// TODO Auto-generated constructor stub
	}

	public String getShelf_id() {
		return shelf_id;
	}
	public void setShelf_id(String shelf_id) {
		this.shelf_id = shelf_id;
	}
	public String getShelf_location() {
		return shelf_location;
	}
	public void setShelf_location(String shelf_location) {
		this.shelf_location = shelf_location;
	}
}
