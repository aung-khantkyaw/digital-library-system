package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Authors;
import model.EBooks;
import model.Genre;
import model.PhysicalBooks;
import model.Publishers;
import model.ShelfLocation;
import util.DatabaseConnection;
import dao.BookInfoDAO;
import dao.BookInfoDAOImpl;

import java.io.IOException;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		switch(action) {
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
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void books(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		try {
			connection = DatabaseConnection.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		BookInfoDAO bookInfoDAO = new BookInfoDAOImpl(connection);
		List<Authors> authors = null;
		List<Genre> genres = null;
		List<Publishers> publishers = null;
		List<ShelfLocation> shelfLocations = null;

		try {
			authors = bookInfoDAO.GetAllAuthors();
			genres = bookInfoDAO.GetAllGenres();
			publishers = bookInfoDAO.GetAllPublisher();
			shelfLocations = bookInfoDAO.GetAllShelfLocation();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Create lists for physical books and ebooks
		List<PhysicalBooks> physicalBooksList = new ArrayList<>();
//	    List<Ebooks> ebookList = new ArrayList<>();
		List<EBooks> ebookList = new ArrayList<>();

		// Add sample physical books to the list

		// Add sample ebooks to the list
		ebookList.add(new EBooks("978-0321356680", "Effective Java", "cover4.jpg", 1, 1, 1, "01/05/2008",
				"http://example.com/effective-java"));
		ebookList.add(new EBooks("978-0596009205", "Head First Java", "cover5.jpg", 2, 2, 2, "01/11/2005",
				"http://example.com/head-first-java"));

		// Set the lists as session attributes
		HttpSession session = request.getSession();
		session.setAttribute("physicalBooksList", physicalBooksList);
		session.setAttribute("ebookList", ebookList);
		session.setAttribute("authors", authors);
		session.setAttribute("genres", genres);
		session.setAttribute("publishers", publishers);
		session.setAttribute("shelfLocations", shelfLocations);

		// Redirect to the JSP page
		response.sendRedirect(request.getContextPath() + "/admin/books.jsp");
	}

	private void authors(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Connection connection = DatabaseConnection.getConnection();

			BookInfoDAO authorsDAO = new BookInfoDAOImpl(connection);

			List<Authors> authors = authorsDAO.GetAllAuthors();

//	        for (Authors author : authors) {
//	            System.out.println("Shelf Location: " + author.getAuthor_id() + author.getAuthor_name());
//	        }

			HttpSession session = request.getSession();
			session.setAttribute("authors", authors);

			response.sendRedirect(request.getContextPath() + "/admin/authors.jsp");

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

//	        for (Genre genre : genres) {
//	            System.out.println("Shelf Location: " + genre.getGenre_id() + genre.getGenre_name());
//	        }

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
			Connection connection = DatabaseConnection.getConnection();

			BookInfoDAO publisherDAO = new BookInfoDAOImpl(connection);

			List<Publishers> publishers = publisherDAO.GetAllPublisher();

//		        for (Publishers publisher : publishers) {
//		            System.out.println("Shelf Location: " + publisher.getPublisher_name() + publisher.getPublisher_id());
//		        }

			HttpSession session = request.getSession();
			session.setAttribute("publishers", publishers);

			response.sendRedirect(request.getContextPath() + "/admin/publishers.jsp");

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

//	        for (ShelfLocation location : shelfLocations) {
//	            System.out.println("Shelf Location: " + location.getShelf_location() + location.getShelf_id());
//	        }

			HttpSession session = request.getSession();
			session.setAttribute("shelfLocations", shelfLocations);

			response.sendRedirect(request.getContextPath() + "/admin/shelf_location.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServletException("Error retrieving shelf locations", e);
		}
	}


}
