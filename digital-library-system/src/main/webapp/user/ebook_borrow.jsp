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
	List<EBookBorrow> all_e_Borrow = (List<EBookBorrow>) session.getAttribute("ebookBorrows");
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
					<table class="table datatable">
						<thead>
							<tr>
								<th>Book Title</th>
								<th>Borrow Date</th>
								<th>Due Date</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (EBookBorrow ebookBorrow : all_e_Borrow) {
								if (ebookBorrow.getUser_id().equals(user.getUser_id())) {
							%>
							<tr>
								<%
								for (EBooks book : ebookList) {
									if (book.getBook_id().equals(ebookBorrow.getBook_id())) {
								%>
								<td>
									<%
									if (ebookBorrow.getStatus().equals("Borrowed")) {
									%> <a
									href="../WebPageController?action=ebook&ebook=<%=book.getUrl()%>"><%=book.getTitle()%></a>
									<%
									} else {
									%> <%=book.getTitle()%>
								</td>
								<%
								}
								}
								}
								%>
								<td><%=ebookBorrow.getBorrow_date()%></td>
								<td><%=ebookBorrow.getDue_date()%></td>
								<td>
									<%
									if (ebookBorrow.getStatus().equals("Borrowed")) {
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