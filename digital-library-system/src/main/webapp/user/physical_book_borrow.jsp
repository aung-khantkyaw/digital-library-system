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
	List<Users> all_users = (List<Users>) session.getAttribute("all_users");
	List<PhysicalBookBorrow> all_physical_Borrow = (List<PhysicalBookBorrow>) session.getAttribute("physicalBorrows");
	List<PhysicalBooks> booksList = (List<PhysicalBooks>) session.getAttribute("physicalBooksList");
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
					<table class="table datatable">
						<thead>
							<tr>
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
								if (physicalBorrow.getUser_id().equals(user.getUser_id())) {
							%>
							<tr>
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
									%> <span class="badge bg-danger">Borrowed</span> <%
 } else {
 %> <span class="badge bg-primary">Returned</span> <%
 }
 %>
								</td>
							</tr>
							<%
							}
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