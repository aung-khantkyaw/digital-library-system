<%@ page import="java.util.List"%>
<%@ page import="model.ShelfLocation"%>
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
						<h5 class="card-title">Shelf List</h5>
						<form action="../BookInfoController" method="get">
							<input type="hidden" name="action" value="addShelfLocation">
							<div class="input-group">
								<input type="text" class="form-control" name="shelf_location"
									placeholder="Shelf Location" aria-label="Shelf Location"
									aria-describedby="button-addon2" />
								<button class="btn btn-primary" type="submit" id="button-addon2">
									<i class="ri-add-line"></i> Add Shelf
								</button>
							</div>
						</form>
					</div>

					<!-- Table with stripped rows -->
					<table class="table datatable">
						<thead>
							<tr>
								<th>Shelf Id</th>
								<th>Shelf Location</th>
								<th>Book Quantity</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							// Retrieve the shelfLocations list from the session
							List<ShelfLocation> shelfLocations = (List<ShelfLocation>) session.getAttribute("shelfLocations");

							// Check if the list is not null and not empty
							if (shelfLocations != null && !shelfLocations.isEmpty()) {
								// Iterate through the list and display the shelf locations
								for (ShelfLocation location : shelfLocations) {
							%>
							<tr>
								<td><%=location.getShelf_id()%></td>
								<td><%=location.getShelf_location()%></td>
								<td></td>
								<td><a
									href="../BookInfoController?action=deleteShelfLocation&shelf_location=<%=location.getShelf_location()%>"
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