package model;

public class PhysicalBookBorrow {
	private String borrow_id;
	private String user_id;
	private String book_id;
	private String borrow_date;
	private String due_date;
	private String return_date;
	private String status;
	private String pay_amount;
	private String fine;

	

	public PhysicalBookBorrow(String borrow_id, String return_date, String status) {
		super();
		this.borrow_id = borrow_id;
		this.return_date = return_date;
		this.status = status;
	}

	public PhysicalBookBorrow() {
		super();
	}

	public PhysicalBookBorrow(String user_id, String book_id, String borrow_date, String due_date, String status,
			String pay_amount) {
		super();
		this.user_id = user_id;
		this.book_id = book_id;
		this.borrow_date = borrow_date;
		this.due_date = due_date;
		this.status = status;
		this.pay_amount = pay_amount;
	}

	public PhysicalBookBorrow(String borrow_id, String user_id, String book_id, String borrow_date, String due_date,
			String return_date, String status, String pay_amount, String fine) {
		super();
		this.borrow_id = borrow_id;
		this.user_id = user_id;
		this.book_id = book_id;
		this.borrow_date = borrow_date;
		this.due_date = due_date;
		this.return_date = return_date;
		this.status = status;
		this.pay_amount = pay_amount;
		this.fine = fine;
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


	public String getbook_id() {
		return book_id;
	}


	public void setbook_id(String book_id) {
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


	public String getReturn_date() {
		return return_date;
	}


	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getPay_amount() {
		return pay_amount;
	}


	public void setPay_amount(String pay_amount) {
		this.pay_amount = pay_amount;
	}


	public String getFine() {
		return fine;
	}


	public void setFine(String string) {
		this.fine = string;
	}
}
