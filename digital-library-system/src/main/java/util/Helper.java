package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import jakarta.servlet.http.HttpSession;

public class Helper {
	public static String getLastPartOfURL(String fullURL) {
		return fullURL.substring(fullURL.lastIndexOf("/") + 1);
	}

	public static String getLastPartWithoutExtension(String fullURL) {
		String lastPart = fullURL.substring(fullURL.lastIndexOf("/") + 1);

		if (lastPart.contains(".")) {
			lastPart = lastPart.substring(0, lastPart.lastIndexOf("."));
		}

		return lastPart;
	}

	public static String capitalizeFirstLetter(String input) {
		if (input == null || input.isEmpty()) {
			return input;
		}

		return input.substring(0, 1).toUpperCase() + input.substring(1).toLowerCase();
	}

	private static final String ALGORITHM = "AES";
	private static final String TRANSFORMATION = "AES";
	private static final String KEY_SPEC = "AES";

	public static String encrypt(String password, String key) throws Exception {
		byte[] keyValue = key.getBytes();
		SecretKeySpec skeySpec = new SecretKeySpec(keyValue, KEY_SPEC);
		Cipher cipher = Cipher.getInstance(TRANSFORMATION);
		cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
		byte[] encrypted = cipher.doFinal(password.getBytes());
		return Base64.getEncoder().encodeToString(encrypted);
	}

	public static String decrypt(String encryptedPassword, String key) throws Exception {
		byte[] keyValue = key.getBytes();
		SecretKeySpec skeySpec = new SecretKeySpec(keyValue, KEY_SPEC);
		Cipher cipher = Cipher.getInstance(TRANSFORMATION);
		cipher.init(Cipher.DECRYPT_MODE, skeySpec);
		byte[] decrypted = cipher.doFinal(Base64.getDecoder().decode(encryptedPassword));
		return new String(decrypted);
	}

	public static String generateKey() throws Exception {
		KeyGenerator kgen = KeyGenerator.getInstance(ALGORITHM);
		kgen.init(128);
		SecretKey skey = kgen.generateKey();
		return Base64.getEncoder().encodeToString(skey.getEncoded());
	}

	public static boolean isLoggedIn(HttpSession session) {
		return session.getAttribute("user") != null;
	}

	public static String getLoginStatusView(boolean isLoggedIn, String viewOne, String viewTwo) {
		// Return viewOne if isLoggedIn is true, otherwise return viewTwo
		return isLoggedIn ? viewOne : viewTwo;
	}

	public static int countRows(String tableName) {
		int rowCount = 0;
		String sql = "SELECT COUNT(*) FROM " + tableName;

		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			if (rs.next()) {
				rowCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace(); // Handle exception as appropriate
		}

		return rowCount;
	}

	public static int countRowsInWeek(String tableName, String date) {
		int rowCount = 0;
		String sql = "SELECT COUNT(*) FROM " + tableName + " WHERE registration_date = \'" + date + "\'";
		try (Connection connection = DatabaseConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			if (rs.next()) {
				rowCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace(); // Handle exception as appropriate
		}

		return rowCount;
	}

	public static int[] getLast7DaysData(String table) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yy");
	    Calendar calendar = Calendar.getInstance();
	    int[] counts = new int[7];

	    // Calculate the data for the last 7 days including today
	    for (int i = 0; i < 7; i++) {
	        // Get the date (start with today, then move back each iteration)
	        Date date = calendar.getTime();

	        // Get the row count for this date
	        int rowCount = countRowsInWeek(table, dateFormat.format(date));

	        // Store the count in the array
	        counts[i] = rowCount;

	        // Move the calendar back by one day
	        calendar.add(Calendar.DAY_OF_MONTH, -1);
	    }

	    return counts;
	}

}
