<%@ page import="java.util.List"%>
<%@ page import="model.Genre"%>
<%@ page import="dao.BookInfoDAOImpl"%>
<%@ page import="util.DatabaseConnection"%>
<%
boolean isLoggedIn = Helper.isLoggedIn(session);
if (isLoggedIn) {
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
						<h5 class="card-title">Genre List</h5>
						<form action="../BookInfoController" method="get">
							<input type="hidden" name="action" value="addGenre">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Genre"
									aria-label="Genre" aria-describedby="button-addon2"
									name="genre_name" />
								<button class="btn btn-primary" type="submit" id="button-addon2">
									<i class="ri-add-line"></i> Add Genre
								</button>
							</div>
						</form>
					</div>

					<!-- Table with stripped rows -->
					<table class="table datatable">
						<thead>
							<tr>
								<th>Genre Id</th>
								<th>Genre Name</th>
								<th>Book Quantity</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							// Retrieve the shelfLocations list from the session
							List<Genre> genres = (List<Genre>) session.getAttribute("genres");

							// Check if the list is not null and not empty
							if (genres != null && !genres.isEmpty()) {
								// Iterate through the list and display the shelf locations
								for (Genre genre : genres) {
							%>
							<tr>
								<td><%=genre.getGenre_id()%></td>
								<td><%=genre.getGenre_name()%></td>
								<td></td>
								<td><a
									href="../BookInfoController?action=deleteGenre&genre_id=<%=genre.getGenre_id()%>"
									class="btn btn-danger"><i class="ri-delete-back-2-line"></i></a></td>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
					<!-- End Table with stripped rows -->
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