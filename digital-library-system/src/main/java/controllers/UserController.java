package controllers;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.ShelfLocation;
import model.Users;
import util.DatabaseConnection;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import dao.UsersDAO;
import dao.UsersDAOImpl;

/**
 * Servlet implementation class UserController
 */
@MultipartConfig
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public UsersDAO userDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			userDAO = new UsersDAOImpl(DatabaseConnection.getConnection());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");

		switch (action) {
		case "logout":
			logoutUser(request, response);
			break;
		case "activateUser":
			activateUser(request, response);
			break;
		case "banUser":
			banUser(request, response);
			break;
		}
	}

	private void banUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String user_id = request.getParameter("user_id");

		Users user = new Users();
		try {
			userDAO.banUserById(user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("WebPageController?action=all_users");
	}

	private void activateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String user_id = request.getParameter("user_id");

		Users user = new Users();
		try {
			userDAO.activateUserById(user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("WebPageController?action=pending_users");
	}

	private void logoutUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}

		response.sendRedirect("login.jsp");
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "addUser":
			addUser(request, response);
			break;
		case "editUser":
			editUser(request, response);
			break;
		case "login":
			loginUser(request, response);
			break;
		}
	}

	private void editUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String user_id = request.getParameter("user_id");
	    String username = request.getParameter("username");
	    String email = request.getParameter("email");
	    String phoneNumber = request.getParameter("phone_number");
	    String address = request.getParameter("address");
	    Part part = request.getPart("profile");
		String profile = part.getSubmittedFileName();
		Users existingUser = null;
		try {
			existingUser = userDAO.GetUsersById(user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (profile == null || profile.isEmpty()) {
			profile = existingUser.getProfile();
		}
	   
		Users user = new Users(user_id, username, email, phoneNumber, profile, address);
		try {
			boolean result = userDAO.EditUsersDetail(user);
			if (result) { 
				if (!profile.equals(existingUser.getProfile())) {
					String uploadPath = request.getServletContext().getRealPath("") + File.separator + "user_profile_images";
					File uploadDir = new File(uploadPath);
					if (!uploadDir.exists()) {
						uploadDir.mkdir();
					}
					String filePath = uploadPath + File.separator + profile;
					part.write(filePath);
				}
				response.sendRedirect("WebPageController?action=profile");
			} else {
				response.sendRedirect("WebPageController?action=profile");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	private void addUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Date date = Calendar.getInstance().getTime();
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		formatter = new SimpleDateFormat("dd/MM/yy");

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password_key = null;
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phone_number");
		String address = request.getParameter("address");
		Part part = request.getPart("profile");
		String profile = part.getSubmittedFileName();
		String role = "Member";
		String status = "Pending";
		String registration_date = formatter.format(date);

		Users user = new Users(username, password, password_key, email, phoneNumber, profile, address, role, status,
				registration_date);

		try {
			boolean result = userDAO.UserRegistration(user);
			HttpSession session = request.getSession();

			if (result) {

				String uploadPath = request.getServletContext().getRealPath("") + File.separator + "user_profile_images";

				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}

				String filePath = uploadPath + File.separator + profile;
			    part.write(filePath);

				session.setAttribute("succMsg", "User Registration Success...");
				response.sendRedirect("index.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong on the server...");
				response.sendRedirect("registration.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void loginUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
			request.setAttribute("error", "Invalid email or password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		Users user;
		try {
			user = userDAO.UserLogin(email, password);

			if (user != null) {
				request.getSession().setAttribute("user", user);
				response.sendRedirect("index.jsp");
			} else {
				request.setAttribute("error", "Invalid email or password");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
