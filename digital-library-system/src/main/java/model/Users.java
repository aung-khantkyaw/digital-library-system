package model;

public class Users {
	private String user_id;
	private String username;
	private String password;
	private String password_key;
	private String email;
	private String phone_number;
	private String profile;
	private String address;
	private String role;
	private String status;
	private String registration_date;

	public Users() {
		super();
	}

	
	
	public Users(String user_id, String username, String email, String phone_number, String profile, String address,
			String role, String status) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.email = email;
		this.phone_number = phone_number;
		this.profile = profile;
		this.address = address;
		this.role = role;
		this.status = status;
	}



	public Users(String username, String password, String password_key, String email, String phone_number, String profile, String address,
			String role, String status, String registration_date) {
		super();
		this.username = username;
		this.password = password;
		this.password_key = password_key;
		this.email = email;
		this.phone_number = phone_number;
		this.profile = profile;
		this.address = address;
		this.role = role;
		this.status = status;
		this.registration_date = registration_date;
	}
	
	public Users(String user_id, String username, String password, String password_key, String email,
			String phone_number, String profile, String address, String role, String status, String registration_date) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.password_key = password_key;
		this.email = email;
		this.phone_number = phone_number;
		this.profile = profile;
		this.address = address;
		this.role = role;
		this.status = status;
		this.registration_date = registration_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword_key() {
		return password_key;
	}

	public void setPassword_key(String password_key) {
		this.password_key = password_key;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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

}
