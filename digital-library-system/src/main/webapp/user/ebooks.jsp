
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
List<EBooks> ebookList = (List<EBooks>) session.getAttribute("ebookList");
List<Authors> authors = (List<Authors>) session.getAttribute("authors");
List<Publishers> publishers = (List<Publishers>) session.getAttribute("publishers");
List<Genre> genres = (List<Genre>) session.getAttribute("genres");
List<ShelfLocation> shelfLocations = (List<ShelfLocation>) session.getAttribute("shelfLocations");
%>

<section class="section">
	<div class="row">
		<%
		if (ebookList != null && !ebookList.isEmpty()) {
			for (EBooks book : ebookList) {
		%>
		<div class="col-xl-3 col-md-4 col-sm-6">
			<div class="card">
				<img src="../book_info_images/<%=book.getCover()%>"
					class="card-img-top w-50 mx-auto" alt="..." />
				<div class="card-body">
					<h5 class="card-title">
						<%=book.getTitle()%>
					</h5>
					<p class="card-text">
					<ul class="list-group">
						<%
						for (Authors author : authors) {
							if (author.getAuthor_id().equals(book.getAuthor_id())) {
						%>
						<li class="list-group-item">စာရေးသူ - <%=author.getAuthor_name()%></li>
						<%
						}
						}
						for (Genre genre : genres) {
						if (genre.getGenre_id().equals(book.getGenre_id())) {
						%>
						<li class="list-group-item">အမျိုးအစား - <%=genre.getGenre_name()%></li>
						<%
						}
						}
						for (Publishers publisher : publishers) {
						if (publisher.getPublisher_id().equals(book.getPublisher_id())) {
						%>
						<li class="list-group-item">စာအုပ်တိုက် - <%=publisher.getPublisher_name()%></li>
						<%
						}
						}
						%>
					</ul>
					</p>
				</div>
				<div class="card-footer d-flex justify-content-between">
					<a href="#" class="btn btn-primary">Borrow</a>
					<button class="badge bg-info text-dark" disabled>MMK - 150</button>
				</div>
			</div>
		</div>
		<%
		}
		}
		%>
	</div>
</section>

<%@ include file="../layout/footer.jsp"%>
<%
} else {
response.sendRedirect("../index.jsp");
}
%>