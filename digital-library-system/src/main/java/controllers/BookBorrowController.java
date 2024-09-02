package controllers;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.EBookBorrow;
import model.PhysicalBookBorrow;
import util.DatabaseConnection;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

import dao.BookBorrowDAO;
import dao.BookBorrowDAOImpl;
import dao.BooksDAOImpl;
import util.Helper;

/**
 * Servlet implementation class BookBorrowController
 */
public class BookBorrowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public BookBorrowDAO bookBorrowDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookBorrowController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			bookBorrowDAO = new BookBorrowDAOImpl(DatabaseConnection.getConnection());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		String action = request.getParameter("action");
		if (action == null) {
			action = "pageNotFound";
		}
		switch (action) {
		case "borrowEBook":
			borrowEBook(request, response);
			break;
		case "borrowPhysicalBook":
			borrowPhysicalBook(request, response);
			break;
		case "returnPhysicalBook":
			returnPhysicalBook(request, response);
			break;
		}
	}

	private void returnPhysicalBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Calendar calendar = Calendar.getInstance();
		Date today = calendar.getTime();
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String borrow_id = request.getParameter("borrow_id");
		String return_date = formatter.format(today);
		String status = "Returned";
		try {
			PhysicalBookBorrow physicalbook = new PhysicalBookBorrow(borrow_id, return_date, status);
			bookBorrowDAO.updatePhysicalBorrow(physicalbook);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("WebPageController?action=borrow_list");
	}

	private void borrowPhysicalBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String user_id = request.getParameter("user_id");
		String book_id = request.getParameter("book_id");
		String borrow_date = request.getParameter("borrow_date");
		String due_date = request.getParameter("due_date");
		String status = "Borrowed";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		LocalDate borrowDate = LocalDate.parse(borrow_date, formatter);
		LocalDate dueDate = LocalDate.parse(due_date, formatter);

		long daysBetween = ChronoUnit.DAYS.between(borrowDate, dueDate);
		String pay_amount = String.valueOf(daysBetween * 150);

		PhysicalBookBorrow physicalbook = new PhysicalBookBorrow(user_id, book_id, borrow_date, due_date, status,
				pay_amount);
		try {
			HttpSession session = request.getSession();
			String Message = "";
			bookBorrowDAO.addPhysicalBorrow(physicalbook);
			Message = "Book Borrow Successful.";

			session.setAttribute("ebookBorrowMsg", Message);
			response.sendRedirect("WebPageController?action=books&user=true&type=physical");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void borrowEBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		Calendar calendar = Calendar.getInstance();
		Date today = calendar.getTime();

		calendar.add(Calendar.DAY_OF_YEAR, 7);
		Date nextSeventhDay = calendar.getTime();

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String borrow_date = formatter.format(today);
		String due_date = formatter.format(nextSeventhDay);

		String book_id = request.getParameter("book_id");
		String user_id = request.getParameter("user_id");

		String status = "Borrowed";

		EBookBorrow Ebook = new EBookBorrow(user_id, book_id, borrow_date, due_date, status);
		try {
			HttpSession session = request.getSession();
			String Message = "";
			if (Helper.canBorrowEbook(user_id)) {
				bookBorrowDAO.addEBookBorrow(Ebook);
				Message = "Ebook Borrow Successful.";
			} else {
				Message = "To borrow an ebook, you need to have borrowed at least two physical books within the last 30 days..";
			}

			session.setAttribute("ebookBorrowMsg", Message);
			response.sendRedirect("WebPageController?action=books&user=true&type=ebook");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
