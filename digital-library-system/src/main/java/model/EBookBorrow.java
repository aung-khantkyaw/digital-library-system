package model;

public class EBookBorrow {
	private int borrow_id;
	private int user_id;
	private String ISBN;
	private String borrow_date;
	private String due_date;
	private String status;

	public EBookBorrow(int borrow_id, int user_id, String iSBN, String borrow_date, String due_date, String status) {
		super();
		this.borrow_id = borrow_id;
		this.user_id = user_id;
		ISBN = iSBN;
		this.borrow_date = borrow_date;
		this.due_date = due_date;
		this.status = status;
	}

	public int getBorrow_id() {
		return borrow_id;
	}

	public void setBorrow_id(int borrow_id) {
		this.borrow_id = borrow_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
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
