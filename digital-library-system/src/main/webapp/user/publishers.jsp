<%@ page import="java.util.List"%>
<%@ page import="model.Publishers"%>
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
						<h5 class="card-title">Publisher List</h5>


					</div>

					<!-- Table with stripped rows -->
					<table class="table datatable">
						<thead>
							<tr>
								<th>Publisher Logo</th>
								<th>Publisher Name</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							// Retrieve the shelfLocations list from the session
							List<Publishers> publishers = (List<Publishers>) session.getAttribute("publishers");

							// Check if the list is not null and not empty
							if (publishers != null && !publishers.isEmpty()) {
								// Iterate through the list and display the shelf locations
								for (Publishers publisher : publishers) {
							%>
							<tr>
								<td><img
									src="../book_info_images/<%=publisher.getPublisher_profile()%>"
									alt="<%=publisher.getPublisher_name()%>" class="rounded"
									width="50" /></td>
								<td><%=publisher.getPublisher_name()%></td>
								<td><button type="button" data-bs-toggle="modal"
										data-bs-target="#publisherDetail<%=publisher.getPublisher_id()%>"
										class="btn btn-primary">
										<i class="bi bi-arrow-up-left-square"></i> Detail
									</button>
									<div class="modal fade"
										id="publisherDetail<%=publisher.getPublisher_id()%>"
										tabindex="-1">
										<div class="modal-dialog modal-dialog-centered modal-xl">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title"><%=publisher.getPublisher_name()%></h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<div class="card mb-3">
														<div class="row g-0">
															<div class="col-md-4">
																<img
																	src="../book_info_images/<%=publisher.getPublisher_profile()%>"
																	class="img-fluid rounded-start" alt="...">
															</div>
															<div class="col-md-8">
																<div class="card-body">
																	<h5 class="card-title"><%=publisher.getPublisher_name()%></h5>

																	<ul class="list-group">
																		<li class="list-group-item"><i
																			class="bi bi-map me-1 text-success"></i> <%=publisher.getPublisher_address()%></li>
																		<li class="list-group-item"><i
																			class="bi bi-mailbox me-1 text-primary"></i> <%=publisher.getPublisher_email()%></li>
																		<li class="list-group-item"><i
																			class="bi bi-telephone me-1 text-danger"></i> <%=publisher.getPublisher_phone_number()%></li>

																	</ul>
																</div>
															</div>
														</div>
													</div>

													<h5>Physical Books</h5>
													<ul>
														<%
														for (PhysicalBooks book : booksList) {
															if (publisher.getPublisher_id().equals(book.getPublisher_id())) {
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
															if (publisher.getPublisher_id().equals(book.getPublisher_id())) {
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