package model;

public class ShelfLocation {
	private int shelf_id;
	private String shelf_location;

	public ShelfLocation(int shelf_id, String shelf_location) {
		super();
		this.shelf_id = shelf_id;
		this.shelf_location = shelf_location;
	}

	public int getShelf_id() {
		return shelf_id;
	}
	public void setShelf_id(int shelf_id) {
		this.shelf_id = shelf_id;
	}
	public String getShelf_location() {
		return shelf_location;
	}
	public void setShelf_location(String shelf_location) {
		this.shelf_location = shelf_location;
	}
}
