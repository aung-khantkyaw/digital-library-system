package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Users;
import util.DatabaseConnection;
import util.Helper;

public class UsersDAOImpl implements UsersDAO{

	private Connection conn;
	public PreparedStatement pstmt;
	public String registration_query = "INSERT INTO user(username, password, password_key, email, phone_number, profile, address, role, status) VALUES (?,?,?,?,?,?,?,?,?)";
	public String login_query = "SELECT * FROM user WHERE email = ?";
	
	public UsersDAOImpl(Connection connection) throws SQLException {
		super();
		conn = DatabaseConnection.getConnection();
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
	    Users user = null;
	    try (PreparedStatement pstmt = conn.prepareStatement(login_query)) {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String encryptedPassword = "UTP8vH1PNCr0qlLWIMZk9Q==";
                String key = "H/jTUfWTLrNtd9UXdZ6g3g=="; // Replace with a secure key
                String decryptedPassword = Helper.decrypt(encryptedPassword, key);

                if (decryptedPassword.equals(password)) {
                    user = new Users();
                    user.setUsername(rs.getString(2));
                    user.setEmail(rs.getString(3));
                    user.setPhone_number(rs.getString(4));
                    user.setAddress(rs.getString(7));
                    user.setProfile(rs.getString(8));
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
	public boolean DeleteUsers(int user_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean UserRegistration(Users user) throws Exception {
		boolean result = false;
		String key = Helper.generateKey();
		String encryptedPassword = Helper.encrypt(user.getPassword(), key);
		try {
			pstmt = conn.prepareStatement(registration_query);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, encryptedPassword);
			pstmt.setString(3, key);
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone_number());
			pstmt.setString(6, user.getProfile());
			pstmt.setString(7, user.getAddress());
			pstmt.setString(8, user.getRole());
			pstmt.setString(9, user.getStatus());
			int count = pstmt.executeUpdate();
			if(count == 1)
				result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
