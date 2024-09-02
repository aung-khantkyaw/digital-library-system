<%@ page import="java.util.List"%>
<%@ page import="model.PhysicalBookBorrow"%>
<%@ page import="model.EBookBorrow"%>
<%@ page import="model.PhysicalBooks"%>
<%@ page import="model.EBooks"%>
<%@ page import="dao.BookInfoDAOImpl"%>
<%@ page import="util.DatabaseConnection"%>
<%
boolean isLoggedIn = Helper.isLoggedIn(session);
if (isLoggedIn) {
	List<PhysicalBookBorrow> all_physical_Borrow = (List<PhysicalBookBorrow>) session.getAttribute("physicalBorrows");
	List<EBookBorrow> all_e_Borrow = (List<EBookBorrow>) session.getAttribute("ebookBorrows");
	List<Users> all_users = (List<Users>) session.getAttribute("all_users");
	List<PhysicalBooks> booksList = (List<PhysicalBooks>) session.getAttribute("physicalBooksList");
	List<EBooks> ebookList = (List<EBooks>) session.getAttribute("ebookList");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="d-flex align-items-center justify-content-between">
						<h5 class="card-title">Physical Book Borrow</h5>
					</div>
					<table class="table datatable">
						<thead>
							<tr>
								<th>Borrow Id</th>
								<th>Username</th>
								<th>Book Title</th>
								<th>Borrow Date</th>
								<th>Due Date</th>
								<th>Return Date</th>
								<th>Pay Amount</th>
								<th>Fine</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (PhysicalBookBorrow physicalBorrow : all_physical_Borrow) {
							%>
							<tr>
								<td><%=physicalBorrow.getBorrow_id()%></td>
								<%
								for (Users each_user : all_users) {
									if (each_user.getUser_id().equals(physicalBorrow.getUser_id())) {
								%>
								<td><%=each_user.getUsername()%></td>
								<%
								}
								}
								%>
								<%
								for (PhysicalBooks book : booksList) {
									if (book.getBook_id().equals(physicalBorrow.getbook_id())) {
								%>
								<td><%=book.getTitle()%></td>
								<%
								}
								}
								%>
								<td><%=physicalBorrow.getBorrow_date()%></td>
								<td><%=physicalBorrow.getDue_date()%></td>
								<td><%=physicalBorrow.getReturn_date()%></td>
								<td><%=physicalBorrow.getPay_amount()%></td>
								<td><%=physicalBorrow.getFine()%></td>
								<td>
									<%
									if (physicalBorrow.getStatus().equals("Borrowed")) {
									%> <a
									href="../BookBorrowController?action=returnPhysicalBook&borrow_id=<%=physicalBorrow.getBorrow_id()%>"
									class="btn btn-warning">Return</a>
									<%
									} else {
										%> Returned <%									
									}
									%>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="d-flex align-items-center justify-content-between">
						<h5 class="card-title">E Book Borrow</h5>
					</div>
					<table class="table datatable">
						<thead>
							<tr>
								<th>Borrow Id</th>
								<th>Username</th>
								<th>Book Title</th>
								<th>Borrow Date</th>
								<th>Due Date</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (EBookBorrow ebookBorrow : all_e_Borrow) {
							%>
							<tr>
								<td><%=ebookBorrow.getBorrow_id()%></td>
								<%
								for (Users each_user : all_users) {
									if (each_user.getUser_id().equals(ebookBorrow.getUser_id())) {
								%>
								<td><%=each_user.getUsername()%></td>
								<%
								}
								}
								for (EBooks book : ebookList) {
									if (book.getBook_id().equals(ebookBorrow.getBook_id())) {
								%>
								<td><%=book.getTitle()%></td>
								<%
								}
								}
								%>
								<td><%=ebookBorrow.getBorrow_date()%></td>
								<td><%=ebookBorrow.getDue_date()%></td>
								<td>
									<%
									if (ebookBorrow.getStatus().equals("Borrowed")) {
									%> Borrowed
									<%
									} else {
										%> Returned <%									
									}
									%>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../layout/footer.jsp"%>
<%
} else {
response.sendRedirect("../index.jsp");
}
%>