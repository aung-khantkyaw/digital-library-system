package controllers;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Authors;
import model.Genre;
import model.Publishers;
import model.ShelfLocation;
import util.DatabaseConnection;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import dao.BookInfoDAO;
import dao.BookInfoDAOImpl;

/**
 * Servlet implementation class BookInfoController
 */
@MultipartConfig
public class BookInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public BookInfoDAO bookInfoDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookInfoController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			bookInfoDAO = new BookInfoDAOImpl(DatabaseConnection.getConnection());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		if (action == null) {
			action = "pageNotFound";
		}
		switch (action) {
		case "deleteAuthor":
			deleteAuthor(request, response);
			break;
		case "addShelfLocation":
			addShelfLocation(request, response);
			break;
		case "deleteShelfLocation":
			deleteShelfLocation(request, response);
			break;
		case "addGenre":
			addGenre(request, response);
			break;
		case "deleteGenre":
			deleteGenre(request, response);
			break;
		case "deletePublisher":
			deletePublisher(request, response);
			break;
		}
	}

	private void deletePublisher(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String publisher_id = request.getParameter("publisher_id");

		try {
			bookInfoDAO.DeletePublishers(publisher_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("WebPageController?action=publishers");

	}

	private void deleteGenre(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String genre_id = request.getParameter("genre_id");

		try {
			bookInfoDAO.DeleteGenre(genre_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("WebPageController?action=genre");

	}

	private void addGenre(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String genre_name = request.getParameter("genre_name");

		Genre genre = new Genre(genre_name);
		try {
			bookInfoDAO.AddGenre(genre);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("WebPageController?action=genre");
	}

	private void deleteShelfLocation(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String shelf_location = request.getParameter("shelf_location");

		try {
			bookInfoDAO.DeleteShelfLocation(shelf_location);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("WebPageController?action=shelf_location");

	}

	private void addShelfLocation(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String location = request.getParameter("shelf_location");

		ShelfLocation shelf_location = new ShelfLocation(location);
		try {
			bookInfoDAO.AddShelfLocation(shelf_location);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("WebPageController?action=shelf_location");

	}

	private void deleteAuthor(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String author_id = request.getParameter("author_id");

		try {
			bookInfoDAO.DeleteAuthors(author_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("WebPageController?action=authors");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);

		String action = request.getParameter("action");
		if (action == null) {
			action = "pageNotFound";
		}
		switch (action) {
		case "addAuthor":
			addAuthor(request, response);
			break;
		case "editAuthor":
			editAuthor(request, response);
			break;
		case "addPublisher":
			addPublisher(request, response);
			break;
		case "editPublisher":
			editPublisher(request, response);
			break;
		}

	}

	private void editPublisher(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String publisher_id = request.getParameter("publisher_id");
		String publisher_name = request.getParameter("publisher_name");
		Part part = request.getPart("publisher_profile");
		String publisher_profile = part.getSubmittedFileName(); // New file name
		String publisher_address = request.getParameter("publisher_address");
		String publisher_email = request.getParameter("publisher_email");
		String publisher_phone = request.getParameter("publisher_phone");

		// Retrieve the existing author data to keep the old profile if no new file is
		// uploaded
		Publishers existingPublisher = null;
		try {
			existingPublisher = bookInfoDAO.GetPublisherById(publisher_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // Assuming you have this method

		if (publisher_profile == null || publisher_profile.isEmpty()) {
			// Keep the existing profile if no new file is uploaded
			publisher_profile = existingPublisher.getPublisher_profile();
		}

		Publishers publisher = new Publishers(publisher_id, publisher_name, publisher_profile, publisher_address,
				publisher_email, publisher_phone);

		try {
			boolean result = bookInfoDAO.EditPublishersDetail(publisher);

			if (result) {
				if (!publisher_profile.equals(existingPublisher.getPublisher_profile())) {
					// Save the new file if a new file is uploaded
					String uploadPath = request.getServletContext().getRealPath("") + File.separator + "book_info_images";
					File uploadDir = new File(uploadPath);
					if (!uploadDir.exists()) {
						uploadDir.mkdir();
					}

					String filePath = uploadPath + File.separator + publisher_profile;
					part.write(filePath);
				}

				response.sendRedirect("WebPageController?action=publishers");
			} else {
				response.sendRedirect("WebPageController?action=publishers");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void addPublisher(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String publisher_name = request.getParameter("publisher_name");
		Part part = request.getPart("publisher_profile");
		String publisher_profile = part.getSubmittedFileName();
		String publisher_address = request.getParameter("publisher_address");
		String publisher_email = request.getParameter("publisher_email");
		String publisher_phone_number = request.getParameter("publisher_phone");

		Publishers publisher = new Publishers(publisher_name, publisher_profile, publisher_address, publisher_email,
				publisher_phone_number);

		try {
			boolean result = bookInfoDAO.AddPublisher(publisher);

			if (result) { // Dynamic path retrieval
				// String uploadPath = request.getServletContext().getRealPath("") +
				// File.separator + "user_profile_images";

				String uploadPath = request.getServletContext().getRealPath("") + File.separator + "book_info_images";
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}

				String filePath = uploadPath + File.separator + publisher_profile;
				part.write(filePath);

				response.sendRedirect("WebPageController?action=publishers");
			} else {
				response.sendRedirect("WebPageController?action=publishers");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void editAuthor(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String author_id = request.getParameter("author_id");
		String author_name = request.getParameter("author_name");
		Part part = request.getPart("author_profile");
		String author_profile = part.getSubmittedFileName(); // New file name
		String author_bio = request.getParameter("author_bio");

		// Retrieve the existing author data to keep the old profile if no new file is
		// uploaded
		Authors existingAuthor = null;
		try {
			existingAuthor = bookInfoDAO.GetAuthorById(author_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // Assuming you have this method

		if (author_profile == null || author_profile.isEmpty()) {
			// Keep the existing profile if no new file is uploaded
			author_profile = existingAuthor.getAuthor_profile();
		}

		Authors author = new Authors(author_id, author_name, author_profile, author_bio);

		try {
			boolean result = bookInfoDAO.EditAuthorsDetail(author);

			if (result) {
				if (!author_profile.equals(existingAuthor.getAuthor_profile())) {
					// Save the new file if a new file is uploaded
					String uploadPath = request.getServletContext().getRealPath("") + File.separator + "book_info_images";
					File uploadDir = new File(uploadPath);
					if (!uploadDir.exists()) {
						uploadDir.mkdir();
					}

					String filePath = uploadPath + File.separator + author_profile;
					part.write(filePath);
				}

				response.sendRedirect("WebPageController?action=authors");
			} else {
				response.sendRedirect("WebPageController?action=authors");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void addAuthor(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String author_name = request.getParameter("author_name");
		Part part = request.getPart("author_profile");
		String author_profile = part.getSubmittedFileName();
		String author_bio = request.getParameter("author_bio");

		Authors author = new Authors(author_name, author_profile, author_bio);

		try {
			boolean result = bookInfoDAO.AddAuthor(author);

			if (result) { // Dynamic path retrieval
				// String uploadPath = request.getServletContext().getRealPath("") +
				// File.separator + "user_profile_images";

				String uploadPath = request.getServletContext().getRealPath("") + File.separator +  "book_info_images";
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}

				String filePath = uploadPath + File.separator + author_profile;
				part.write(filePath);

				response.sendRedirect("WebPageController?action=authors");
			} else {
				response.sendRedirect("WebPageController?action=authors");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
