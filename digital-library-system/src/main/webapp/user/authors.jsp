<%@ page import="java.util.List"%>
<%@ page import="model.Authors"%>
<%@ page import="model.PhysicalBooks"%>
<%@ page import="model.EBooks"%>
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
<%
List<PhysicalBooks> booksList = (List<PhysicalBooks>) session.getAttribute("physicalBooksList");
List<EBooks> ebookList = (List<EBooks>) session.getAttribute("ebookList");
%>
<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="d-flex align-items-center justify-content-between">
						<h5 class="card-title">Author List</h5>


					</div>

					<!-- Table with stripped rows -->
					<table class="table datatable">
						<thead>
							<tr>
								<th>Profile</th>
								<th>Author Name</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							// Retrieve the shelfLocations list from the session
							List<Authors> authors = (List<Authors>) session.getAttribute("authors");

							// Check if the list is not null and not empty
							if (authors != null && !authors.isEmpty()) {
								// Iterate through the list and display the shelf locations
								for (Authors author : authors) {
							%>
							<tr>
								<td><img
									src="../book_info_images/<%=author.getAuthor_profile()%>"
									alt="<%=author.getAuthor_name()%>" class="rounded" width="50" /></td>
								<td><%=author.getAuthor_name()%></td>
								<td><button type="button" data-bs-toggle="modal"
										data-bs-target="#authorDetail<%=author.getAuthor_id()%>"
										class="btn btn-primary">
										<i class="bi bi-arrow-up-left-square"></i> Detail
									</button>
									<div class="modal fade"
										id="authorDetail<%=author.getAuthor_id()%>" tabindex="-1">
										<div class="modal-dialog modal-dialog-centered modal-xl">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title"><%=author.getAuthor_name()%></h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<div class="card mb-3">
														<div class="row g-0">
															<div class="col-md-4">
																<img
																	src="../book_info_images/<%=author.getAuthor_profile()%>"
																	class="d-block w-100 rounded-start" alt="...">
															</div>
															<div class="col-md-8">
																<div class="card-body">
																	<h5 class="card-title"><%=author.getAuthor_name()%></h5>
																	<p class="card-text"><%=author.getAuthor_Biography()%></p>
																</div>
															</div>
														</div>
													</div>

													<h5>Physical Books</h5>
													<ul>
														<%
														for (PhysicalBooks book : booksList) {
															if (author.getAuthor_id().equals(book.getAuthor_id())) {
														%>
														<li><%=book.getTitle()%></li>
														<%
														}
														}
														%>
													</ul>
													<h5>E Books</h5>
													<ul>
														<%
														for (EBooks book : ebookList) {
															if (author.getAuthor_id().equals(book.getAuthor_id())) {
														%>
														<li><%=book.getTitle()%></li>
														<%
														}
														}
														%>
													</ul>

												</div>
											</div>
										</div></td>
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