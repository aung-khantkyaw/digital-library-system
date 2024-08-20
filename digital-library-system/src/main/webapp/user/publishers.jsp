<%@ page import="java.util.List"%>
<%@ page import="model.Publishers"%>
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
						<h5 class="card-title">Publisher List</h5>

						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#verticalycentered">
							<i class="ri-add-line"></i> Add Publisher
						</button>
						<div class="modal fade" id="verticalycentered" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Add New Publisher</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<form action="../BookInfoController" method="post"
										enctype="multipart/form-data">
										<input type="hidden" name="action" value="addPublisher">
										<div class="modal-body">
											<div class="input-group mb-3">
												<input class="form-control" type="file" id="formFile"
													name="publisher_profile" />
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1">@</span> <input
													type="text" class="form-control" name="publisher_name"
													placeholder="Publisher Name" aria-label="Publisher Name"
													aria-describedby="basic-addon1">
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1"> <i
													class="bi bi-pin-map"></i>
												</span> <input type="text" class="form-control"
													name="publisher_address" placeholder="Publisher Address"
													aria-label="Publisher Address"
													aria-describedby="basic-addon1">
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1"> <i
													class="bi bi-mailbox"></i>
												</span> <input type="text" class="form-control"
													name="publisher_email" placeholder="Publisher Email"
													aria-label="Publisher Email"
													aria-describedby="basic-addon1">
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1"> <i
													class="bi bi-telephone"></i></span> <input type="text"
													class="form-control" name="publisher_phone"
													placeholder="Phone number" aria-label="Phone number"
													aria-describedby="basic-addon1">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Save</button>
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
									alt="<%=publisher.getPublisher_name()%>" class="rounded" width="50" /></td>
								<td><%=publisher.getPublisher_name()%></td>
								<td><button type="button" data-bs-toggle="modal"
										data-bs-target="#editAuthor<%=publisher.getPublisher_id()%>"
										class="btn btn-primary">
										<i class="ri-edit-line"></i>
									</button>
									<div class="modal fade"
										id="editAuthor<%=publisher.getPublisher_id()%>" tabindex="-1">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Edit Author</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form action="../BookInfoController" method="post"
													enctype="multipart/form-data">
													<input type="hidden" name="action" value="editPublisher">
													<input type="hidden" name="publisher_id"
														value="<%=publisher.getPublisher_id()%>">
													<div class="modal-body">
														<div class="input-group mb-3">
															<input class="form-control" type="file" id="formFile"
																name="publisher_profile" />
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1">@</span>
															<input type="text" class="form-control"
																name="publisher_name" placeholder="Publisher Name"
																aria-label="Publisher Name"
																aria-describedby="basic-addon1"
																value="<%=publisher.getPublisher_name()%>">
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1">
																<i class="bi bi-pin-map"></i>
															</span> <input type="text" class="form-control"
																name="publisher_address" placeholder="Publisher Address"
																aria-label="Publisher Address"
																aria-describedby="basic-addon1"
																value="<%=publisher.getPublisher_address()%>">
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1">
																<i class="bi bi-mailbox"></i>
															</span> <input type="text" class="form-control"
																name="publisher_email" placeholder="Publisher Email"
																aria-label="Publisher Email"
																aria-describedby="basic-addon1"
																value="<%=publisher.getPublisher_email()%>">
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1">
																<i class="bi bi-telephone"></i>
															</span> <input type="text" class="form-control"
																name="publisher_phone" placeholder="Phone number"
																aria-label="Phone number"
																aria-describedby="basic-addon1"
																value="<%=publisher.getPublisher_phone_number()%>">
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
										data-bs-target="#publisherDetailfor<%=publisher.getPublisher_id()%>"
										class="btn btn-success">
										<i class="ri-eye-line"></i>
									</button>
									<div class="modal fade"
										id="publisherDetailfor<%=publisher.getPublisher_id()%>"
										tabindex="-1">
										<div class="modal-dialog modal-dialog-centered modal-lg">
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
												</div>
												<div class="modal-footer">
												</div>
											</div>
										</div>
									</div> <a
									href="../BookInfoController?action=deletePublisher&publisher_id=<%=publisher.getPublisher_id()%>"
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