package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.EBooks;
import model.PhysicalBooks;
import model.Users;
import util.DatabaseConnection;
import util.Helper;

public class UsersDAOImpl implements UsersDAO {

	private Connection connection;
	public PreparedStatement pstmt;
	public String getAll_query = "SELECT * FROM user WHERE status = 'Active'";
	public String getAllPending_query = "SELECT * FROM user WHERE status = 'Pending'";
	public String getuserbyId_query = "SELECT * FROM user WHERE user_id = ?";
	public String registration_query = "INSERT INTO user(username, password, password_key, email, phone_number, profile, address, role, status, registration_date) VALUES (?,?,?,?,?,?,?,?,?,?)";
	public String login_query = "SELECT * FROM user WHERE email = ?";
	public String activateUser_query = "UPDATE user SET status = 'Active' WHERE user_id = ? AND status = 'Pending'";
	public String banUser_query = "UPDATE user SET status = 'Banned' WHERE user_id = ? AND status = 'Active'";
	public String delete_query = "DELETE FROM user WHERE user_id = ?";

	public UsersDAOImpl(Connection conn) throws SQLException {
		super();
		connection = DatabaseConnection.getConnection();
	}

	@Override
	public List<Users> GetAllUsers() throws SQLException {
		List<Users> users = new ArrayList<>();
		pstmt = connection.prepareStatement(getAll_query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Users user = new Users();
			user.setUser_id(rs.getString("user_id"));
			user.setUsername(rs.getString("username"));
			user.setEmail(rs.getString("email"));
			user.setPhone_number(rs.getString("phone_number"));
			user.setProfile(rs.getString("profile"));
			user.setAddress(rs.getString("address"));
			user.setStatus(rs.getString("status"));
			users.add(user);
		}
		return users;
	}

	public List<Users> GetAllPendingUsers() throws SQLException {
		List<Users> users = new ArrayList<>();
		pstmt = connection.prepareStatement(getAllPending_query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Users user = new Users();
			user.setUser_id(rs.getString("user_id"));
			user.setUsername(rs.getString("username"));
			user.setEmail(rs.getString("email"));
			user.setPhone_number(rs.getString("phone_number"));
			user.setProfile(rs.getString("profile"));
			user.setAddress(rs.getString("address"));
			user.setStatus(rs.getString("status"));
			users.add(user);
		}
		return users;
	}

	@Override
	public Users GetUsersById(String user_id) throws SQLException {
		Users user = null;
		pstmt = connection.prepareStatement(getuserbyId_query);
		pstmt.setString(1, user_id);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			return new Users(rs.getString("user_id"), rs.getString("username"), rs.getString("email"),
					rs.getString("phone_number"), rs.getString("profile"), rs.getString("address"), rs.getString("role"),
					rs.getString("status"));
		}
		return user;
	}

	@Override
	public Users UserLogin(String email, String password) {
		Users user = null;
		try (PreparedStatement pstmt = connection.prepareStatement(login_query)) {
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				String encryptedPassword = rs.getString("password");
				String key = rs.getString("password_key"); // Replace with a secure key
				String decryptedPassword = Helper.decrypt(encryptedPassword, key);

				if (decryptedPassword.equals(password)) {

					user = new Users();
					user.setUser_id(rs.getString(1));
					user.setUsername(rs.getString(2));
					user.setEmail(rs.getString(5));
					user.setPhone_number(rs.getString(6));
					user.setProfile(rs.getString(7));
					user.setAddress(rs.getString(8));
					user.setRole(rs.getString(9));
					user.setStatus(rs.getString(10));
				}
			}
		} catch (SQLException e) {
			System.err.println("Error logging in: " + e.getMessage());
		} catch (Exception e) {
			System.err.println("Error decrypting password: " + e.getMessage());
		}

		return user;
	}

	@Override
	public boolean EditUsersDetail(Users user) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean DeleteUsers(String user_id) throws SQLException {
		pstmt = connection.prepareStatement(delete_query);
		pstmt.setString(1, user_id);
		int rowsAffected = pstmt.executeUpdate();
		return rowsAffected > 0;
	}

	@Override
	public boolean UserRegistration(Users user) throws Exception {
		boolean result = false;
		String key = Helper.generateKey();
		String encryptedPassword = Helper.encrypt(user.getPassword(), key);

		try {
			pstmt = connection.prepareStatement(registration_query);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, encryptedPassword);
			pstmt.setString(3, key);
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone_number());
			pstmt.setString(6, user.getProfile());
			pstmt.setString(7, user.getAddress());
			pstmt.setString(8, user.getRole());
			pstmt.setString(9, user.getStatus());
			pstmt.setString(10, user.getRegistration_date());
			int count = pstmt.executeUpdate();
			if (count == 1) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean activateUserById(String user_id) throws SQLException {
		try (PreparedStatement pstmt = connection.prepareStatement(activateUser_query)) {
			pstmt.setString(1, user_id);
			int affectedRows = pstmt.executeUpdate();
			return affectedRows > 0;
		}
	}

	@Override
	public boolean UserPending(Users user) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean banUserById(String user_id) throws SQLException {
		try (PreparedStatement pstmt = connection.prepareStatement(banUser_query)) {
			pstmt.setString(1, user_id);
			int affectedRows = pstmt.executeUpdate();
			return affectedRows > 0;
		}
	}
}
