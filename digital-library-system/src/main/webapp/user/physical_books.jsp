
<%
boolean isLoggedIn = Helper.isLoggedIn(session);
if (isLoggedIn) {
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="model.PhysicalBooks"%>
<%@ page import="model.EBooks"%>
<%@ page import="model.Authors"%>
<%@ page import="model.Publishers"%>
<%@ page import="model.Genre"%>
<%@ page import="model.Publishers"%>
<%@ page import="model.ShelfLocation"%>
<%@ page import="model.PhysicalBookBorrow"%>
<%@ page import="dao.BookInfoDAOImpl"%>
<%
List<PhysicalBooks> booksList = (List<PhysicalBooks>) session.getAttribute("physicalBooksList");
List<Authors> authors = (List<Authors>) session.getAttribute("authors");
List<Publishers> publishers = (List<Publishers>) session.getAttribute("publishers");
List<Genre> genres = (List<Genre>) session.getAttribute("genres");
List<ShelfLocation> shelfLocations = (List<ShelfLocation>) session.getAttribute("shelfLocations");
List<PhysicalBookBorrow> physicalBorrows = (List<PhysicalBookBorrow>) session.getAttribute("physicalBorrows");
/* for (PhysicalBookBorrow physicalBorrow : physicalBorrows) {
	System.out.print(physicalBorrow.getbook_id());
} */
%>

<section class="section">
	<%
	String ebookBorrowMsg = (String) session.getAttribute("ebookBorrowMsg");
	if (ebookBorrowMsg != null) {
	%>
	<div
		class="alert alert-primary bg-primary text-light border-0 alert-dismissible fade show"
		role="alert">
		<%=ebookBorrowMsg%>
		<button type="button" class="btn-close btn-close-white"
			data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	<%
	session.removeAttribute("ebookBorrowMsg"); // Clear the message after retrieving it
	}
	%>
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="d-flex align-items-center justify-content-between">
						<h5 class="card-title">Physical Books List</h5>
					</div>

					<!-- Table with stripped rows -->
					<table class="table datatable">
						<thead>
							<tr>
								<th>Cover</th>
								<th>Title</th>
								<th>Author</th>
								<th>Detail</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (booksList != null && !booksList.isEmpty()) {
								for (PhysicalBooks book : booksList) {
							%>
							<tr>
								<td><img src="../book_info_images/<%=book.getCover()%>"
									alt="<%=book.getTitle()%>" class="rounded" width="50" /></td>
								<td><%=book.getTitle()%></td>

								<%
								for (Authors author : authors) {
									if (author.getAuthor_id().equals(book.getAuthor_id())) {
								%>
								<td><%=author.getAuthor_name()%></td>
								<%
								}
								}
								%>

								<td><button type="button" data-bs-toggle="modal"
										data-bs-target="#detailBook<%=book.getBook_id()%>"
										class="btn btn-primary">
										<i class="bi bi-arrow-up-left-square"></i> Detail
									</button>
									<div class="modal fade" id="detailBook<%=book.getBook_id()%>"
										tabindex="-1">
										<div class="modal-dialog modal-dialog-centered modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Borrow Book</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<div class="card mb-3">
														<div class="row g-0">
															<div class="col-md-4">
																<img src="../book_info_images/<%=book.getCover()%>"
																	alt="<%=book.getTitle()%>"
																	class="img-fluid rounded-start" width="" />

															</div>
															<div class="col-md-8">
																<div class="card-body">


																	<table class="table table-borderless">
																		<tbody>
																			<tr>
																				<th scope="row">Title</th>
																				<td><%=book.getTitle()%></td>
																			</tr>
																			<tr>
																				<th scope="row">Author</th>
																				<%
																				for (Authors author : authors) {
																					if (author.getAuthor_id().equals(book.getAuthor_id())) {
																				%>

																				<td><%=author.getAuthor_name()%></td>
																				<%
																				}
																				}
																				%>
																			</tr>
																			<tr>
																				<th scope="row">Publisher</th>
																				<%
																				for (Publishers publisher : publishers) {
																					if (publisher.getPublisher_id().equals(book.getPublisher_id())) {
																				%>

																				<td><%=publisher.getPublisher_name()%></td>
																				<%
																				}
																				}
																				%>
																			</tr>
																			<tr>
																				<th scope="row">Publish Date</th>
																				<td><%=book.getPublish_date()%></td>
																			</tr>
																			<%
																			for (PhysicalBookBorrow physicalBorrow : physicalBorrows) {
																				if (book.getBook_id().equals(physicalBorrow.getbook_id()) && user.getUser_id().equals(physicalBorrow.getUser_id())
																				&& physicalBorrow.getStatus().equals("Borrowed")) {
																			%>
																			<tr>
																				<th scope="row">Borrow Date</th>
																				<td><%=physicalBorrow.getBorrow_date()%></td>
																			</tr>
																			<tr>
																				<th scope="row">Due Date</th>
																				<td><%=physicalBorrow.getDue_date()%></td>
																			</tr>

																			<%
																			for (ShelfLocation shelfLocation : shelfLocations) {
																				if (shelfLocation.getShelf_id().equals(book.getShelf_id())) {
																			%>
																			<tr>
																				<th scope="row">Shelf Location</th>
																				<td><%=shelfLocation.getShelf_location()%></td>
																			</tr>
																			<%
																			}
																			}
																			%>
																			<tr>
																				<th scope="row">Status</th>
																				<td><%=physicalBorrow.getStatus()%></td>
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
													<%
													if (book.getQuantity().equals("0")) {
													%>
													<div
														class="alert alert-danger bg-danger text-light border-0 alert-dismissible fade show"
														role="alert">Not available now!</div>
													<%
													} else {
													%>
													<form class="row g-3" action="../BookBorrowController"
														method="get">
														<input type="hidden" name="action"
															value="borrowPhysicalBook"> <input type="hidden"
															name="user_id" value="<%=user.getUser_id()%>"> <input
															type="hidden" name="book_id"
															value="<%=book.getBook_id()%>">
														<div class="col-md-12">
															<input type="text" class="form-control"
																value="<%=user.getUsername()%>" disabled>
														</div>
														<div class="col-md-6">
															<input type="date" class="form-control"
																name="borrow_date">
														</div>
														<div class="col-md-6">
															<input type="date" class="form-control" name="due_date">
														</div>
														<div class="text-center">
															<button type="submit" class="btn btn-primary" >Submit</button>
															<button type="reset" class="btn btn-secondary">Reset</button>
														</div>
													</form>
													<%
													}
													%>

												</div>
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
} else

{
response.sendRedirect("../index.jsp");
}
%>