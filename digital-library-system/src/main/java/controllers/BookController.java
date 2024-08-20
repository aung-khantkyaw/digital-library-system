package controllers;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.EBooks;
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
		case "deleteEBook":
			deleteEBook(request, response);
			break;
		}
	}

	private void deleteEBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String book_id = request.getParameter("book_id");

		try {
			bookDAO.DeleteEBooks(book_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("WebPageController?action=books");
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
		case "addEBook":
			addEBook(request,response);
			break;
		case "editEBook" :
			editEBook(request,response);
			break;
		}
//		doGet(request, response);
	}

	private void editEBook(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	    // Get the current date and format it
	    Date date = Calendar.getInstance().getTime();
	    DateFormat formatter = new SimpleDateFormat("dd/MM/yy");
	    String registration_date = formatter.format(date);

	    // Retrieve form data
	    String ebook_id = request.getParameter("ebook_id");
	    String ebook_isbn = request.getParameter("ebook_isbn");
	    String ebook_title = request.getParameter("ebook_title");
	    Part coverPart = request.getPart("ebook_cover");
	    String ebook_cover = coverPart != null ? coverPart.getSubmittedFileName() : null;
	    String ebook_genre = request.getParameter("ebook_genre");
	    String ebook_author = request.getParameter("ebook_author");
	    String ebook_publisher = request.getParameter("ebook_publisher");
	    String ebook_publish_date = request.getParameter("ebook_publsh_date");
	    Part urlPart = request.getPart("ebook_url");
	    String ebook_url_file = urlPart != null ? urlPart.getSubmittedFileName() : null;

	    // Fetch existing ebook details to retain existing files if no new files are uploaded
	    EBooks existingEBook = null;
	    try {
	        existingEBook = bookDAO.GetEBookById(ebook_id); // Assuming you have this method
	    } catch (SQLException e) {
	        e.printStackTrace();
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching eBook details.");
	        return;
	    }

	    // Retain existing cover and URL file if no new files are uploaded
	    if (ebook_cover == null || ebook_cover.isEmpty()) {
	        ebook_cover = existingEBook.getCover();
	    }
	    if (ebook_url_file == null || ebook_url_file.isEmpty()) {
	        ebook_url_file = existingEBook.getUrl(); // Assuming the URL is stored in the `EBooks` object
	    }

	    // Create the updated EBooks object
	    EBooks ebooks = new EBooks(
	        ebook_id, ebook_isbn, ebook_title, ebook_cover, ebook_genre, ebook_author, 
	        ebook_publisher, ebook_publish_date, ebook_url_file, registration_date
	    );

	    try {
	        // Update the eBook details
	        boolean result = bookDAO.EditEBooksDetail(ebooks);
	        if (result) {
	            // If a new cover or URL file was uploaded, save the files
	            String uploadPath = request.getServletContext().getRealPath("") + File.separator + "book_info_images";
	            String urlUploadPath = request.getServletContext().getRealPath("") + File.separator +  "\book_info_files";

	            // Ensure the directories exist
	            File uploadDir = new File(uploadPath);
	            if (!uploadDir.exists()) {
	                uploadDir.mkdir();
	            }
	            File urlUploadDir = new File(urlUploadPath);
	            if (!urlUploadDir.exists()) {
	                urlUploadDir.mkdir();
	            }

	            // Save the new cover file if a new one was uploaded
	            if (coverPart != null && !ebook_cover.equals(existingEBook.getCover())) {
	                String coverFilePath = uploadPath + File.separator + ebook_cover;
	                coverPart.write(coverFilePath);
	            }

	            // Save the new ebook file (e.g., PDF) if a new one was uploaded
	            if (urlPart != null && !ebook_url_file.equals(existingEBook.getUrl())) {
	                String urlFilePath = urlUploadPath + File.separator + ebook_url_file;
	                urlPart.write(urlFilePath);
	            }

	            // Redirect to the books page on success
	            response.sendRedirect("WebPageController?action=books");
	        } else {
	            // Redirect to the books page on failure
	            response.sendRedirect("WebPageController?action=books&error=updateFailed");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating eBook details.");
	    }
	}


	private void addEBook(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	    // Get the current date and format it
		Date date = Calendar.getInstance().getTime();
		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		formatter = new SimpleDateFormat("dd/MM/yy");
	    
	    // Retrieve form data
	    String ebook_isbn = request.getParameter("ebook_isbn");
	    String ebook_title = request.getParameter("ebook_title");

	    // Handling ebook cover file
	    Part coverPart = request.getPart("ebook_cover");
	    String ebook_cover = coverPart.getSubmittedFileName();

	    String ebook_genre = request.getParameter("ebook_genre");
	    String ebook_author = request.getParameter("ebook_author");
	    String ebook_publisher = request.getParameter("ebook_publisher");
	    String ebook_publish_date = request.getParameter("ebook_publsh_date");

	    // Handling ebook URL (assuming this is also a file upload like a PDF)
	    Part urlPart = request.getPart("ebook_url");
	    String ebook_url_file = urlPart.getSubmittedFileName();

		String registration_date = formatter.format(date);
		System.out.print(registration_date);
	    // Create the EBooks object with the necessary data
	    EBooks ebooks = new EBooks(ebook_isbn, ebook_title, ebook_cover, ebook_genre, ebook_author, ebook_publisher, ebook_publish_date, ebook_url_file, registration_date);
	    System.out.print(ebooks.getRegistration_date());
	    try {
	        // Insert the EBook record into the database
	        boolean result = bookDAO.AddEBooks(ebooks);

	        if (result) {
	            // Define the upload paths for both the cover and the URL (PDF)
	            String uploadPath = request.getServletContext().getRealPath("") + File.separator + "book_info_images";
	            String urlUploadPath = request.getServletContext().getRealPath("") + File.separator + "book_info_files";

	            // Ensure both directories exist
	            File uploadDir = new File(uploadPath);
	            if (!uploadDir.exists()) {
	                uploadDir.mkdir();
	            }

	            File urlUploadDir = new File(urlUploadPath);
	            if (!urlUploadDir.exists()) {
	                urlUploadDir.mkdir();
	            }

	            // Save the cover image file
	            String coverFilePath = uploadPath + File.separator + ebook_cover;
	            coverPart.write(coverFilePath);

	            // Save the ebook URL file (e.g., a PDF)
	            String urlFilePath = urlUploadPath + File.separator + ebook_url_file;
	            urlPart.write(urlFilePath);

	            // Redirect to the books page on success
	            response.sendRedirect("WebPageController?action=books");
	        } else {
	            // Redirect to the books page even on failure
	            response.sendRedirect("WebPageController?action=books");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
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
					String uploadPath = request.getServletContext().getRealPath("") + File.separator + "book_info_images";
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

				String uploadPath = request.getServletContext().getRealPath("") + File.separator +  "book_info_images";
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
