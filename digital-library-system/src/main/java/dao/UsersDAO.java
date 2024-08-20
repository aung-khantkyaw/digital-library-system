package dao;

import java.sql.SQLException;
import java.util.List;

import model.Users;

public interface UsersDAO {
	//User
	public List<Users> GetAllUsers() throws SQLException;
	
	public List<Users> GetAllPendingUsers() throws SQLException;

	public Users GetUsersById(String user_id) throws SQLException;

	public Users UserLogin(String email, String password) throws SQLException, Exception;

	public boolean UserRegistration(Users user) throws Exception;
	
	public boolean UserPending(Users user) throws Exception;

	public boolean EditUsersDetail(Users user) throws SQLException;

	public boolean DeleteUsers(String user_id) throws SQLException;
	
	public boolean activateUserById(String user_id) throws SQLException;
	
	public boolean banUserById(String user_id) throws SQLException;
}
