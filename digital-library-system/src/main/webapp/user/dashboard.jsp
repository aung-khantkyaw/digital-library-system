<%
boolean isLoggedIn = Helper.isLoggedIn(session);
if (isLoggedIn) {
	int[] userCount = Helper.getLast7DaysData("user");
	int[] physicalCount = Helper.getLast7DaysData("physical_book");
	int[] ebookCount = Helper.getLast7DaysData("ebook");
%>
<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>

<%@ include file="../layout/footer.jsp"%>

<%
} else {
response.sendRedirect("../index.jsp");
}
%>