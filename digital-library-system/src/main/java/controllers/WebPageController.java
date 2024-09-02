package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Authors;
import model.EBookBorrow;
import model.EBooks;
import model.Genre;
import model.PhysicalBookBorrow;
import model.PhysicalBooks;
import model.Publishers;
import model.ShelfLocation;
import model.Users;
import util.DatabaseConnection;
import dao.BookInfoDAO;
import dao.BookInfoDAOImpl;
import dao.BooksDAO;
import dao.BooksDAOImpl;
import dao.BookBorrowDAO;
import dao.BookBorrowDAOImpl;
import dao.UsersDAO;
import dao.UsersDAOImpl;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class WebPageController
 */
public class WebPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WebPageController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		switch (action) {
		case "books":
			books(request, response);
			break;
		case "authors":
			authors(request, response);
			break;
		case "genre":
			genre(request, response);
			break;
		case "publishers":
			publishers(request, response);
			break;
		case "shelf_location":
			shelf_location(request, response);
			break;
		case "pending_users":
			pending_users(request, response);
			break;
		case "all_users":
			all_users(request, response);
			break;
		case "ebook":
			ebook(request, response);
			break;
		case "borrow_list":
			borrow_list(request, response);
			break;
		case "profile":
			profile(request,response);
			break;
		case "physicalBorrow":
			physicalBorrow(request,response);
			break;
		case "ebookBorrow":
			ebookBorrow(request,response);
			break;
		}
	}

	private void ebookBorrow(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		try {
			booksData(request);
			response.sendRedirect(request.getContextPath() + "/user/ebook_borrow.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void physicalBorrow(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		try {
			booksData(request);
			response.sendRedirect(request.getContextPath() + "/user/physical_book_borrow.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void profile(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		try {
			usersData(request);
			response.sendRedirect(request.getContextPath() + "/user/profile.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void borrow_list(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			booksData(request);
			Connection connection = DatabaseConnection.getConnection();
			UsersDAO usersDAO = new UsersDAOImpl(connection);
			List<Users> all_users = usersDAO.GetAllUsers();
			HttpSession session = request.getSession();
			session.setAttribute("all_users", all_users);
			response.sendRedirect(request.getContextPath() + "/admin/borrow_list.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void ebook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ebook = request.getParameter("ebook");

		String encodedEbook = URLEncoder.encode(ebook, "UTF-8");
		response.sendRedirect(request.getContextPath() + "/user/ebook.jsp?ebook=" + encodedEbook);
	}

	public void usersData(HttpServletRequest request) throws SQLException {
		Connection connection = DatabaseConnection.getConnection();
		UsersDAO usersDAO = new UsersDAOImpl(connection);
		List<Users> all_users = usersDAO.GetAllUsers();
		HttpSession session = request.getSession();
		session.setAttribute("all_users", all_users);
	}
	
	public void booksData(HttpServletRequest request) throws SQLException {
		Connection connection = DatabaseConnection.getConnection();

		BookInfoDAO bookInfoDAO = new BookInfoDAOImpl(connection);
		BooksDAO booksDAO = new BooksDAOImpl(connection);
		BookBorrowDAO bookBorrowDAO = new BookBorrowDAOImpl(connection);

		List<PhysicalBooks> physicalBooksList = null;
		List<EBooks> ebookList = null;
		List<Authors> authors = null;
		List<Genre> genres = null;
		List<Publishers> publishers = null;
		List<ShelfLocation> shelfLocations = null;
		List<EBookBorrow> ebookBorrows = null;
		List<PhysicalBookBorrow> physicalBorrows = null;

		physicalBooksList = booksDAO.GetAllPhysicalBooks();
		ebookList = booksDAO.GetAllEBooks();
		authors = bookInfoDAO.GetAllAuthors();
		genres = bookInfoDAO.GetAllGenres();
		publishers = bookInfoDAO.GetAllPublisher();
		shelfLocations = bookInfoDAO.GetAllShelfLocation();
		ebookBorrows = bookBorrowDAO.getAllEBookBorrows();
		physicalBorrows = bookBorrowDAO.getAllPhysicalBorrows();

		HttpSession session = request.getSession();
		session.setAttribute("physicalBooksList", physicalBooksList);
		session.setAttribute("ebookList", ebookList);
		session.setAttribute("authors", authors);
		session.setAttribute("genres", genres);
		session.setAttribute("publishers", publishers);
		session.setAttribute("shelfLocations", shelfLocations);
		session.setAttribute("ebookBorrows", ebookBorrows);
		session.setAttribute("physicalBorrows", physicalBorrows);
	}

	public void authorsData(HttpServletRequest request) throws SQLException {
		Connection connection = DatabaseConnection.getConnection();

		BookInfoDAO authorsDAO = new BookInfoDAOImpl(connection);

		List<Authors> authors = authorsDAO.GetAllAuthors();

		HttpSession session = request.getSession();
		session.setAttribute("authors", authors);
	}

	public void publishersData(HttpServletRequest request) throws SQLException {
		Connection connection = DatabaseConnection.getConnection();

		BookInfoDAO publisherDAO = new BookInfoDAOImpl(connection);

		List<Publishers> publishers = publisherDAO.GetAllPublisher();

		HttpSession session = request.getSession();
		session.setAttribute("publishers", publishers);
	}

	private void all_users(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		try {
			usersData(request);
			response.sendRedirect(request.getContextPath() + "/admin/all_users.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void pending_users(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		try {
			Connection connection = DatabaseConnection.getConnection();
			UsersDAO usersDAO = new UsersDAOImpl(connection);
			List<Users> pending_users = usersDAO.GetAllPendingUsers();
			HttpSession session = request.getSession();
			session.setAttribute("pending_users", pending_users);
			response.sendRedirect(request.getContextPath() + "/admin/pending_users.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void books(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			booksData(request);
			String user = request.getParameter("user");
			String type = request.getParameter("type");
			if (user.equals("true") && type.equals("physical")) {
				response.sendRedirect(request.getContextPath() + "/user/physical_books.jsp");
			} else if (user.equals("true") && type.equals("ebook")) {
				response.sendRedirect(request.getContextPath() + "/user/ebooks.jsp");
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/books.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void authors(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			authorsData(request);
			booksData(request);
			String user = request.getParameter("user");
			if (user.equals("true")) {
				response.sendRedirect(request.getContextPath() + "/user/authors.jsp");

			} else {
				response.sendRedirect(request.getContextPath() + "/admin/authors.jsp");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Error retrieving shelf locations", e);
		}

	}

	private void genre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection connection = DatabaseConnection.getConnection();

			BookInfoDAO genreDAO = new BookInfoDAOImpl(connection);

			List<Genre> genres = genreDAO.GetAllGenres();

			HttpSession session = request.getSession();
			session.setAttribute("genres", genres);

			response.sendRedirect(request.getContextPath() + "/admin/genre.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Error retrieving shelf locations", e);
		}

	}

	private void publishers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			publishersData(request);
			booksData(request);
			String user = request.getParameter("user");
			if (user.equals("true")) {
				response.sendRedirect(request.getContextPath() + "/user/publishers.jsp");

			} else {
				response.sendRedirect(request.getContextPath() + "/admin/publishers.jsp");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Error retrieving shelf locations", e);
		}
	}

	private void shelf_location(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Connection connection = DatabaseConnection.getConnection();

			BookInfoDAO shelfLocationDAO = new BookInfoDAOImpl(connection);

			List<ShelfLocation> shelfLocations = shelfLocationDAO.GetAllShelfLocation();

			HttpSession session = request.getSession();
			session.setAttribute("shelfLocations", shelfLocations);

			response.sendRedirect(request.getContextPath() + "/admin/shelf_location.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Error retrieving shelf locations", e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
