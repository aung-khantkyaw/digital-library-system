package model;

public class EBookBorrow {
	private String borrow_id;
	private String user_id;
	private String book_id;
	private String borrow_date;
	private String due_date;
	private String status;

	
	public EBookBorrow(String user_id, String book_id, String borrow_date, String due_date, String status) {
		super();
		this.user_id = user_id;
		this.book_id = book_id;
		this.borrow_date = borrow_date;
		this.due_date = due_date;
		this.status = status;
	}

	public EBookBorrow(String borrow_id, String user_id, String book_id, String borrow_date, String due_date, String status) {
		super();
		this.borrow_id = borrow_id;
		this.user_id = user_id;
		this.book_id = book_id;
		this.borrow_date = borrow_date;
		this.due_date = due_date;
		this.status = status;
	}

	public EBookBorrow() {
		// TODO Auto-generated constructor stub
	}

	public String getBorrow_id() {
		return borrow_id;
	}

	public void setBorrow_id(String borrow_id) {
		this.borrow_id = borrow_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

	public String getBorrow_date() {
		return borrow_date;
	}

	public void setBorrow_date(String borrow_date) {
		this.borrow_date = borrow_date;
	}

	public String getDue_date() {
		return due_date;
	}

	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
