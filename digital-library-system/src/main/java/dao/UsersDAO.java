package dao;

import java.sql.SQLException;
import java.util.List;

import model.Users;

public interface UsersDAO {
	//User
	public List<Users> GetAllUsers();
	
	public Users GetUsersById(int user_id);
	
	public Users UserLogin(String email, String password) throws SQLException, Exception;
	
	public boolean UserRegistration(Users user) throws Exception;
	
	public boolean EditUsersDetail(Users user) throws SQLException;
	
	public boolean DeleteUsers(int user_id);
}
