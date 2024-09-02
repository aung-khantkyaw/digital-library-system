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
<%@ page import="model.EBookBorrow"%>
<%@ page import="dao.BookInfoDAOImpl"%>
<%
List<EBooks> ebookList = (List<EBooks>) session.getAttribute("ebookList");
List<Authors> authors = (List<Authors>) session.getAttribute("authors");
List<Publishers> publishers = (List<Publishers>) session.getAttribute("publishers");
List<Genre> genres = (List<Genre>) session.getAttribute("genres");
List<EBookBorrow> ebookBorrows = (List<EBookBorrow>) session.getAttribute("ebookBorrows");
%>

<section class="section">
	<%
	String ebookBorrowMsg = (String) session.getAttribute("ebookBorrowMsg");
	if (ebookBorrowMsg != null) {
	%>
	<div
		class="alert alert-light bg-light border-0 alert-dismissible fade show"
		role="alert">
		<%=ebookBorrowMsg%>
		<button type="button" class="btn-close btn-close-white"
			data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	<%
	session.removeAttribute("ebookBorrowMsg"); 
	}
	%>

	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="d-flex align-items-center justify-content-between">
						<h5 class="card-title">E Books List</h5>
					</div>

					<table class="table datatable">
						<thead>
							<tr>
								<th>Cover</th>
								<th>Title</th>
								<th>Author</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (ebookList != null && !ebookList.isEmpty()) {
								for (EBooks ebook : ebookList) {
							%>
							<tr>
								<td><img src="../book_info_images/<%=ebook.getCover()%>"
									alt="<%=ebook.getTitle()%>" class="rounded" width="50" /></td>
								<td><%=ebook.getTitle()%></td>
								<%
								for (Authors author : authors) {
									if (author.getAuthor_id().equals(ebook.getAuthor_id())) {
								%>
								<td><%=author.getAuthor_name()%></td>
								<%
								}
								}
								%>
								<td><button type="button" data-bs-toggle="modal"
										data-bs-target="#detailBook<%=ebook.getBook_id()%>"
										class="btn btn-primary">
										<i class="bi bi-arrow-up-left-square"></i> Detail
									</button>
									<div class="modal fade" id="detailBook<%=ebook.getBook_id()%>"
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
																<img src="../book_info_images/<%=ebook.getCover()%>"
																	alt="<%=ebook.getTitle()%>"
																	class="img-fluid rounded-start" width="" />

															</div>
															<div class="col-md-8">
																<div class="card-body">


																	<table class="table table-borderless">
																		<tbody>
																			<tr>
																				<th scope="row">Title</th>
																				<td><%=ebook.getTitle()%></td>
																			</tr>
																			<tr>
																				<th scope="row">Author</th>
																				<%
																				for (Authors author : authors) {
																					if (author.getAuthor_id().equals(ebook.getAuthor_id())) {
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
																					if (publisher.getPublisher_id().equals(ebook.getPublisher_id())) {
																				%>

																				<td><%=publisher.getPublisher_name()%></td>
																				<%
																				}
																				}
																				%>
																			</tr>
																			<tr>
																				<th scope="row">Publish Date</th>
																				<td><%=ebook.getPublish_date()%></td>
																			</tr>
																			<%
																			for (EBookBorrow ebookBorrow : ebookBorrows) {
																				if (ebook.getBook_id().equals(ebookBorrow.getBook_id()) && user.getUser_id().equals(ebookBorrow.getUser_id())
																				&& ebookBorrow.getStatus().equals("Borrowed")) {
																			%>
																			<tr>
																				<th scope="row">Borrow Date</th>
																				<td><%=ebookBorrow.getBorrow_date()%></td>
																			</tr>
																			<tr>
																				<th scope="row">Due Date</th>
																				<td><%=ebookBorrow.getDue_date()%></td>
																			</tr>
																			<tr>
																				<th scope="row">Read at</th>
																				<td><a
																					href="../WebPageController?action=ebook&ebook=<%=ebook.getUrl()%>"><%=ebook.getTitle()%></a></td>
																			</tr>
																			<%
																			}
																			}
																			%>
																			<tr>
																				<th scope="row"><a
																					href="../BookBorrowController?action=borrowEBook&book_id=<%=ebook.getBook_id()%>&user_id=<%=user.getUser_id()%>"
																					class="btn btn-primary text-white font-bold">Borrow</a></th>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>
													</div>
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