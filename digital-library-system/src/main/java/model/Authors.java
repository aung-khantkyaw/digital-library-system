package model;

public class Authors {
	private int author_id;
	private String author_name;
	private String author_profile;
	private String author_Biography;
	
	public Authors(int author_id, String author_name, String author_profile, String author_Biography) {
		super();
		this.author_id = author_id;
		this.author_name = author_name;
		this.author_profile = author_profile;
		this.author_Biography = author_Biography;
	}

	public int getAuthor_id() {
		return author_id;
	}

	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}

	public String getAuthor_name() {
		return author_name;
	}

	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}

	public String getAuthor_profile() {
		return author_profile;
	}

	public void setAuthor_profile(String author_profile) {
		this.author_profile = author_profile;
	}

	public String getAuthor_Biography() {
		return author_Biography;
	}

	public void setAuthor_Biography(String author_Biography) {
		this.author_Biography = author_Biography;
	}

}
