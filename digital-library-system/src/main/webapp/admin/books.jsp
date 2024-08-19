
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
<%@ page import="dao.BookInfoDAOImpl"%>
<%
List<PhysicalBooks> physicalBooks = (List<PhysicalBooks>) session.getAttribute("physicalBooksList");
List<Authors> authors = (List<Authors>) session.getAttribute("authors");
List<Publishers> publishers = (List<Publishers>) session.getAttribute("publishers");
List<Genre> genres = (List<Genre>) session.getAttribute("genres");
List<ShelfLocation> shelfLocations = (List<ShelfLocation>) session.getAttribute("shelfLocations");
/* for (PhysicalBooks physicalBook : physicalBooks) {
	System.out.print(physicalBook.getBook_id());
} */
%>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="d-flex align-items-center justify-content-between">


						<h5 class="card-title">Physical Books List</h5>

						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#verticalycentered">
							<i class="ri-add-line"></i> Add Physical Book
						</button>
						<div class="modal fade" id="verticalycentered" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Add New Physical Book</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<form action="../BookController" method="post"
										enctype="multipart/form-data">
										<input type="hidden" name="action" value="addPhysicalBook">
										<div class="modal-body">
											<div class="input-group mb-3">
												<input class="form-control" type="file" id="formFile"
													name="physicalbook_cover" />
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1"><i
													class="bi bi-sort-numeric-down"></i></span> <input type="text"
													class="form-control" placeholder="ISBN" aria-label="ISBN"
													name="physicalbook_isbn" aria-describedby="basic-addon1" />
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1"><i
													class="bi bi-hash"></i></span> <input type="text"
													class="form-control" placeholder="Title" aria-label="Title"
													name="physicalbook_title" aria-describedby="basic-addon1" />
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1">@</span> <select
													class="form-select" aria-label="Default select example"
													name="physicalbook_author" placeholder="Author"
													aria-label="Author" size="3">
													<%
													if (authors != null && !authors.isEmpty()) {
														for (Authors author : authors) {
													%>
													<option value="<%=author.getAuthor_id()%>"><%=author.getAuthor_name()%></option>
													<%
													}
													}
													%>
												</select>
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1"><i
													class="bi bi-receipt-cutoff"></i></span> <select
													class="form-select" aria-label="Default select example"
													name="physicalbook_genre" placeholder="Genre"
													aria-label="Genre" size="3">
													<%
													if (genres != null && !genres.isEmpty()) {
														for (Genre genre : genres) {
													%>
													<option value="<%=genre.getGenre_id()%>"><%=genre.getGenre_name()%></option>
													<%
													}
													}
													%>
												</select>
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1"><i
													class="bi bi-pin-angle"></i></span> <select class="form-select"
													aria-label="Default select example" placeholder="Publisher"
													name="physicalbook_publisher" aria-label="Publisher"
													size="3">
													<%
													if (publishers != null && !publishers.isEmpty()) {
														for (Publishers publisher : publishers) {
													%>
													<option value="<%=publisher.getPublisher_id()%>"><%=publisher.getPublisher_name()%></option>
													<%
													}
													}
													%>
												</select>
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1"><i
													class="bi bi-calendar-check"></i></span> <input type="date"
													class="form-control" placeholder="Publish date"
													name="physicalbook_publsh_date" aria-label="Publish date"
													aria-describedby="basic-addon1" />
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1"><i
													class="bi bi-bookshelf"></i></span> <select class="form-select"
													aria-label="Default select example"
													placeholder="Shelf Location" aria-label="Shelf Location"
													name="physicalbook_location" size="3">
													<%
													if (shelfLocations != null && !shelfLocations.isEmpty()) {
														for (ShelfLocation shelfLocation : shelfLocations) {
													%>
													<option value="<%=shelfLocation.getShelf_id()%>"><%=shelfLocation.getShelf_location()%></option>
													<%
													}
													}
													%>
												</select>
											</div>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1"><i
													class="bi bi-bookmarks"></i></span> <input type="text"
													class="form-control" placeholder="Quantity"
													name="physicalbook_quantity" aria-label="Quantity"
													aria-describedby="basic-addon1" />
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
								<th>Cover</th>
								<th>Title</th>
								<th>Author</th>
								<th>Price per day</th>
								<th>Quantity</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							// Retrieve booksList from the session
							List<PhysicalBooks> booksList = (List<PhysicalBooks>) session.getAttribute("physicalBooksList");
							if (booksList != null && !booksList.isEmpty()) {
								for (PhysicalBooks book : booksList) {
							%>
							<tr>
								<td><img src="../book_info_images/<%=book.getCover()%>"
									alt="Book Cover" class="rounded" width="50" /></td>
								<td><%=book.getTitle()%></td>
								<td><%=book.getCover()%></td>
								<td>MMK - 150</td>
								<td><%=book.getQuantity()%></td>
								<td><button type="button" data-bs-toggle="modal"
										data-bs-target="#editAuthor<%=book.getBook_id()%>"
										class="btn btn-primary">
										<i class="ri-edit-line"></i>
									</button>
									<div class="modal fade" id="editAuthor<%=book.getBook_id()%>"
										tabindex="-1">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Edit Book</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form action="../BookController" method="post"
													enctype="multipart/form-data">
													<input type="hidden" name="action" value="editPhysicalBook">
													<input type="hidden" name="book_id"
														value="<%=book.getBook_id()%>">
													<div class="modal-body">
														<div class="input-group mb-3">
															<input class="form-control" type="file" id="formFile"
																name="physicalbook_cover" value="<%=book.getCover()%>" />
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1"><i
																class="bi bi-sort-numeric-down"></i></span> <input type="text"
																class="form-control" placeholder="ISBN"
																aria-label="ISBN" name="physicalbook_isbn"
																value="<%=book.getISBN()%>"
																aria-describedby="basic-addon1" />
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1"><i
																class="bi bi-hash"></i></span> <input type="text"
																class="form-control" placeholder="Title"
																aria-label="Title" name="physicalbook_title"
																value="<%=book.getTitle()%>"
																aria-describedby="basic-addon1" />
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1">@</span>
															<select class="form-select"
																aria-label="Default select example"
																name="physicalbook_author" placeholder="Author"
																aria-label="Author" size="3">
																<%
																if (authors != null && !authors.isEmpty()) {
																	for (Authors author : authors) {
																		if (author.getAuthor_id().equals(book.getAuthor_id())) {
																%>
																<option value="<%=author.getAuthor_id()%>" selected><%=author.getAuthor_name()%></option>
																<%
																} else {
																%>
																<option value="<%=author.getAuthor_id()%>"><%=author.getAuthor_name()%></option>
																<%
																}
																}
																}
																%>
															</select>
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1"><i
																class="bi bi-receipt-cutoff"></i></span> <select
																class="form-select" aria-label="Default select example"
																name="physicalbook_genre" placeholder="Genre"
																aria-label="Genre" size="3">
																<%
																if (genres != null && !genres.isEmpty()) {
																	for (Genre genre : genres) {
																		if (genre.getGenre_id().equals(book.getGenre_id())) {
																%>
																<option value="<%=genre.getGenre_id()%>" selected><%=genre.getGenre_name()%></option>
																<%
																} else {
																}
																%>
																<option value="<%=genre.getGenre_id()%>"><%=genre.getGenre_name()%></option>
																<%
																}
																}
																%>
															</select>
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1"><i
																class="bi bi-pin-angle"></i></span> <select class="form-select"
																aria-label="Default select example"
																placeholder="Publisher" name="physicalbook_publisher"
																aria-label="Publisher" size="3">
																<%
																if (publishers != null && !publishers.isEmpty()) {
																	for (Publishers publisher : publishers) {
																		if (publisher.getPublisher_id().equals(book.getPublisher_id())) {
																%>
																<option value="<%=publisher.getPublisher_id()%>"
																	selected><%=publisher.getPublisher_name()%></option>
																<%
																} else {
																}
																%>
																<option value="<%=publisher.getPublisher_id()%>"><%=publisher.getPublisher_name()%></option>
																<%
																}
																}
																%>
															</select>
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1"><i
																class="bi bi-calendar-check"></i></span> <input type="date"
																class="form-control" placeholder="Publish date"
																name="physicalbook_publsh_date" value="<%=book.getPublish_date()%>"
																aria-label="Publish date"
																aria-describedby="basic-addon1" />
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1"><i
																class="bi bi-bookshelf"></i></span> <select class="form-select"
																aria-label="Default select example"
																placeholder="Shelf Location" aria-label="Shelf Location"
																name="physicalbook_location" size="3">
																<%
																if (shelfLocations != null && !shelfLocations.isEmpty()) {
																	for (ShelfLocation shelfLocation : shelfLocations) {
																		if (shelfLocation.getShelf_id().equals(book.getShelf_id())) {
																%>
																<option value="<%=shelfLocation.getShelf_id()%>"
																	selected><%=shelfLocation.getShelf_location()%></option>
																<%
																} else {
																%>
																<option value="<%=shelfLocation.getShelf_id()%>"><%=shelfLocation.getShelf_location()%></option>
																<%
																}
																}
																}
																%>
															</select>
														</div>
														<div class="input-group mb-3">
															<span class="input-group-text" id="basic-addon1"><i
																class="bi bi-bookmarks"></i></span> <input type="text"
																class="form-control" placeholder="Quantity"
																name="physicalbook_quantity" aria-label="Quantity" value="<%=book.getQuantity()%>"
																aria-describedby="basic-addon1" />
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
										data-bs-target="#authorDetail<%=book.getBook_id()%>"
										class="btn btn-success">
										<i class="ri-eye-line"></i>
									</button>
									<div class="modal fade" id="authorDetail<%=book.getBook_id()%>"
										tabindex="-1">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title"><%=book.getBook_id()%></h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<div class="card mb-3">
														<div class="row g-0">
															<div class="col-md-4">
																<img src="../book_info_images/<%=book.getCover()%>"
																	class="img-fluid rounded-start" alt="...">
															</div>
															<div class="col-md-8">
																<div class="card-body">
																	<h5 class="card-title"><%=book.getTitle()%></h5>
																	<p class="card-text"><%=book.getAuthor_id()%></p>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Close</button>
													<button type="submit" class="btn btn-primary">Save
														changes</button>
												</div>
											</div>
										</div>
									</div> <a
									href="../BookController?action=deletePhysicalBook&book_id=<%=book.getBook_id()%>"
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

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="d-flex align-items-center justify-content-between">
						<h5 class="card-title">E Books List</h5>

						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#ebookadd">
							<i class="ri-add-line"></i> Add E Book
						</button>
						<div class="modal fade" id="ebookadd" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Add New E book</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>

								</div>
							</div>
						</div>
					</div>

					<!-- Table with stripped rows -->
					<table class="table datatable">
						<thead>
							<tr>
								<th>Cover</th>
								<th>Title</th>
								<th>Author</th>
								<th>Price per day</th>
								<th>Quantity</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							// Retrieve booksList from the session
							List<EBooks> ebookList = (List<EBooks>) session.getAttribute("ebookList");
							if (ebookList != null && !ebookList.isEmpty()) {
								for (EBooks ebook : ebookList) {
							%>
							<tr>
								<td><img src="../assets/img/news-1.jpg" alt="Book Cover"
									class="rounded" width="50" /></td>
								<td><%=ebook.getTitle()%></td>
								<td><%=ebook.getCover()%></td>
								<td>MMK - 150</td>
								<td><%=ebook.getUrl()%></td>
								<td><a href="#" class="btn btn-primary"><i
										class="ri-edit-line"></i></a> <a href="#" class="btn btn-success"><i
										class="ri-eye-line"></i></a> <a href="#" class="btn btn-danger"><i
										class="ri-delete-back-2-line"></i></a></td>
							</tr>

							<%
							}
							} else {
							%>
							<li>No books available.</li>
							<%
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