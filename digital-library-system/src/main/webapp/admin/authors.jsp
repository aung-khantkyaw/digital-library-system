<%@ page import="java.util.List"%>
<%@ page import="model.Authors"%>
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
						<h5 class="card-title">Author List</h5>

						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#verticalycentered">
							<i class="ri-add-line"></i> Add Author
						</button>
						<div class="modal fade" id="verticalycentered" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Add New Author</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<form action="../BookInfoController" method="post"
										enctype="multipart/form-data">
										<input type="hidden" name="action" value="addAuthor">
										<div class="modal-body">
											<div class="input-group mb-3">
												<input class="form-control" type="file" id="formFile"
													name="author_profile" />
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1">@</span> <input
													type="text" class="form-control" name="author_name"
													placeholder="Author Name" aria-label="Author Name"
													aria-describedby="basic-addon1">
											</div>
											<div class="input-group">
												<span class="input-group-text">Author Biography</span>
												<textarea class="form-control" name="author_bio"
													aria-label="With textarea"></textarea>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Save
												changes</button>
										</div>
									</form>
								</div>
							</div>
						</div>
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
								<td>

									<button type="button" data-bs-toggle="modal"
										data-bs-target="#editAuthor<%=author.getAuthor_id()%>" class="btn btn-primary">
										<i class="ri-edit-line"></i>
									</button>
									<div class="modal fade" id="editAuthor<%=author.getAuthor_id()%>" tabindex="-1">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Edit Author</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form action="../BookInfoController" method="post"
													enctype="multipart/form-data">
													<input type="hidden" name="action" value="editAuthor">
													<input type="hidden" name="author_id"
														value="<%=author.getAuthor_id()%>">
													<div class="modal-body">
														<div class="input-group mb-3">
															<input class="form-control" type="file" id="formFile"
																name="author_profile"
																value="<%=author.getAuthor_profile()%>" />
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1">@</span>
															<input type="text" class="form-control"
																name="author_name" placeholder="Author Name"
																value="<%=author.getAuthor_name()%>"
																aria-label="Author Name" aria-describedby="basic-addon1">
														</div>
														<div class="input-group">
															<span class="input-group-text">Author Biography</span>
															<textarea class="form-control" name="author_bio"
																aria-label="With textarea"> <%=author.getAuthor_Biography()%></textarea>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary">Edit</button>
													</div>
												</form>
											</div>
										</div>
									</div>

									<button type="button" data-bs-toggle="modal"
										data-bs-target="#authorDetail<%=author.getAuthor_id()%>" class="btn btn-success">
										<i class="ri-eye-line"></i>
									</button>
									<div class="modal fade" id="authorDetail<%=author.getAuthor_id()%>" tabindex="-1">
										<div class="modal-dialog modal-dialog-centered modal-lg">
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
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div> <a
									href="../BookInfoController?action=deleteAuthor&author_id=<%=author.getAuthor_id()%>"
									class="btn btn-danger"><i class="ri-delete-back-2-line"></i></a>
								</td>
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