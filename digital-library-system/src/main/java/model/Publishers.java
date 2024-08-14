package model;

public class Publishers {
	private int publisher_id;
	private String publisher_name;
	private String publisher_profile;
	private String publisher_address;
	private String publisher_email;
	private String publisher_phone_number;

	public Publishers(int publisher_id, String publisher_name, String publisher_profile, String publisher_address,
			String publisher_email, String publisher_phone_number) {
		super();
		this.publisher_id = publisher_id;
		this.publisher_name = publisher_name;
		this.publisher_profile = publisher_profile;
		this.publisher_address = publisher_address;
		this.publisher_email = publisher_email;
		this.publisher_phone_number = publisher_phone_number;
	}

	public int getPublisher_id() {
		return publisher_id;
	}
	public void setPublisher_id(int publisher_id) {
		this.publisher_id = publisher_id;
	}
	public String getPublisher_name() {
		return publisher_name;
	}
	public void setPublisher_name(String publisher_name) {
		this.publisher_name = publisher_name;
	}
	public String getPublisher_profile() {
		return publisher_profile;
	}
	public void setPublisher_profile(String publisher_profile) {
		this.publisher_profile = publisher_profile;
	}
	public String getPublisher_address() {
		return publisher_address;
	}
	public void setPublisher_address(String publisher_address) {
		this.publisher_address = publisher_address;
	}
	public String getPublisher_email() {
		return publisher_email;
	}
	public void setPublisher_email(String publisher_email) {
		this.publisher_email = publisher_email;
	}
	public String getPublisher_phone_number() {
		return publisher_phone_number;
	}
	public void setPublisher_phone_number(String publisher_phone_number) {
		this.publisher_phone_number = publisher_phone_number;
	}
}
