package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Users;
import util.DatabaseConnection;

public class UsersDAOImpl implements UsersDAO{

	private DatabaseConnection conn;
	
	public UsersDAOImpl(DatabaseConnection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<Users> GetAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Users GetUsersById(int user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Users UserLogin(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean EditUsersDetail(Users user) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean DeleteUsers(int user_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean UserRegistration(Users user) {
		// TODO Auto-generated method stub
		return false;
	}
}
