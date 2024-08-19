package controllers;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.PhysicalBooks;
import model.Publishers;
import util.DatabaseConnection;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import dao.BooksDAO;
import dao.BooksDAOImpl;
import dao.UsersDAOImpl;

/**
 * Servlet implementation class BookController
 */
@MultipartConfig
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BooksDAO bookDAO;	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
		try {
			bookDAO = new BooksDAOImpl(DatabaseConnection.getConnection());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("action");
		if (action == null) {
			action = "pageNotFound";
		}
		switch (action) {
		case "deletePhysicalBook":
			deletePhysicalBook(request, response);
			break;
		}
	}

	private void deletePhysicalBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String book_id = request.getParameter("book_id");

		try {
			bookDAO.DeletePhysicalBooks(book_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("WebPageController?action=books");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		switch(action) {
		case "addPhysicalBook" :
			addPhysicalBook(request,response);
			break;
		case "editPhysicalBook" :
			editPhysicalBook(request,response);
			break;
		}
//		doGet(request, response);
	}

	private void editPhysicalBook(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		Date date = Calendar.getInstance().getTime();
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		formatter = new SimpleDateFormat("dd/MM/yy");
		
		String book_id = request.getParameter("book_id");
		String physicalbook_isbn = request.getParameter("physicalbook_isbn");
		String physicalbook_title = request.getParameter("physicalbook_title");
		Part part = request.getPart("physicalbook_cover");
		String physicalbook_cover = part.getSubmittedFileName();
		String physicalbook_genre = request.getParameter("physicalbook_genre");
		String physicalbook_author = request.getParameter("physicalbook_author");
		String physicalbook_publisher = request.getParameter("physicalbook_publisher");
		String physicalbook_publsh_date = request.getParameter("physicalbook_publsh_date");
		String physicalbook_location = request.getParameter("physicalbook_location");
		String physicalbook_quantity = request.getParameter("physicalbook_quantity");
		String status = "Available";
		String registration_date = formatter.format(date);
		
		PhysicalBooks existingBook = null;
		try {
			existingBook = bookDAO.GetPhysicalBookById(book_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // Assuming you have this method

		if (physicalbook_cover == null || physicalbook_cover.isEmpty()) {
			// Keep the existing profile if no new file is uploaded
			physicalbook_cover = existingBook.getCover();
		}

		PhysicalBooks physicalbooks = new PhysicalBooks(book_id,physicalbook_isbn, physicalbook_title, physicalbook_cover, physicalbook_genre, physicalbook_author, physicalbook_publisher, physicalbook_publsh_date, physicalbook_location, physicalbook_quantity, status, registration_date);

		try {
			boolean result = bookDAO.EditPhysicalBooksDetail(physicalbooks);
			if (result) { // Dynamic path retrieval
				if (!physicalbook_cover.equals(existingBook.getCover())) {
					// Save the new file if a new file is uploaded
					String uploadPath = "D:\\Project\\DigitalLibrarySystem\\digital-library-system\\src\\main\\webapp\\book_info_images";
					File uploadDir = new File(uploadPath);
					if (!uploadDir.exists()) {
						uploadDir.mkdir();
					}

					String filePath = uploadPath + File.separator + physicalbook_cover;
					part.write(filePath);
				}
				
				response.sendRedirect("WebPageController?action=books");
			} else {
				response.sendRedirect("WebPageController?action=books");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void addPhysicalBook(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		Date date = Calendar.getInstance().getTime();
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		formatter = new SimpleDateFormat("dd/MM/yy");
		
		String physicalbook_isbn = request.getParameter("physicalbook_isbn");
		String physicalbook_title = request.getParameter("physicalbook_title");
		Part part = request.getPart("physicalbook_cover");
		String physicalbook_cover = part.getSubmittedFileName();
		String physicalbook_genre = request.getParameter("physicalbook_genre");
		String physicalbook_author = request.getParameter("physicalbook_author");
		String physicalbook_publisher = request.getParameter("physicalbook_publisher");
		String physicalbook_publsh_date = request.getParameter("physicalbook_publsh_date");
		String physicalbook_location = request.getParameter("physicalbook_location");
		String physicalbook_quantity = request.getParameter("physicalbook_quantity");
		String status = "Available";

		String registration_date = formatter.format(date);

		PhysicalBooks physicalbooks = new PhysicalBooks(physicalbook_isbn, physicalbook_title, physicalbook_cover, physicalbook_genre, physicalbook_author, physicalbook_publisher, physicalbook_publsh_date, physicalbook_location, physicalbook_quantity, status, registration_date);

		try {
			boolean result = bookDAO.AddPhysicalBooks(physicalbooks);

			if (result) { // Dynamic path retrieval
				// String uploadPath = request.getServletContext().getRealPath("") +
				// File.separator + "user_profile_images";

				String uploadPath = "D:\\Project\\DigitalLibrarySystem\\digital-library-system\\src\\main\\webapp\\book_info_images";
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}

				String filePath = uploadPath + File.separator + physicalbook_cover;
				part.write(filePath);

				response.sendRedirect("WebPageController?action=books");
			} else {
				response.sendRedirect("WebPageController?action=books");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
