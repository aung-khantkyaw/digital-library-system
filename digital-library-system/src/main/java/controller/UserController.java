package controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;
import util.DatabaseConnection;

import java.io.IOException;
import java.sql.SQLException;

import dao.UsersDAO;
import dao.UsersDAOImpl;

/**
 * Servlet implementation class UserController
 */
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
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			userDAO = new UsersDAOImpl(DatabaseConnection.getConnection());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

        switch (action) {
            
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
            action = "add";
        }
        switch (action) {
            case "add":
                addUser(request, response);
                break;
            case "login":
                loginUser(request, response);
                break;
        }
	}
	
	private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      String username = request.getParameter("username");
//      String password = request.getParameter("password");
//      String email = request.getParameter("email");
//      String phoneNumber = request.getParameter("phone_number");
//      String address = request.getParameter("address");
      String profile = "";
      String username = "Admin";
      String password = "Admin";
      String email = "admin@gmail.com";
      String phoneNumber = "0922556648";
      String address = "Myanmar";
      String role = "Admin";
      String status = "Active";
      Users user = new Users(username, password, email, phoneNumber, profile, address, role, status );
      try {
//      	UsersDAOImpl userDAO = new UsersDAOImpl(DatabaseConnection.getConnection());
      	userDAO.UserRegistration(user);
      	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

      response.sendRedirect("index.jsp");
  }
	
	private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
