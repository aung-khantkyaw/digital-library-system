<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.Helper"%>
<%@ page import="model.Users"%>
<%
boolean isLoggedIn = Helper.isLoggedIn(session);
Users user = (Users) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Digital Library System</title>
<meta content="" name="description" />
<meta content="" name="keywords" />

<link href="assets/img/online-library.png" rel="icon" />
<link href="assets/img/online-library.png" rel="apple-touch-icon" />

<script src="https://cdn.tailwindcss.com"></script>
<style>
.glass-morphic {
	background: rgba(255, 255, 255, 0);
	backdrop-filter: blur(20px);
	border-radius: 10px;
	padding: 20px;
	margin: 20px;
}
</style>
</head>

<body
	style="background-image: url('assets/img/background.jpeg'); background-size: cover; background-position: center; background-attachment: fixed;">
	<header class="absolute inset-x-0 top-0 z-50 bg-white">
		<nav class="flex items-center justify-between p-6 lg:px-8"
			aria-label="Global">
			<div class="flex flex-1 items-center">
				<a href="#" class="-m-1.5 p-1.5 "> <img
					class="h-10 w-auto bg-dark-light rounded-md shadow-xl hover:shadow-md p-1 border-2 border-indigo-500"
					src="assets/img/online-library.png" alt="" />
				</a> <span
					class="hidden lg:block text-xl ml-5 font-bold text-indigo-500">Digital
					Library System</span>
			</div>

			<div class="flex flex-1 justify-end">
				<%
				if (isLoggedIn) {
				%>
				<div class="ml-4 flex items-center md:ml-6">
					<div class="relative ml-3">
						<div>
							<div
								class="relative flex max-w-xs items-center rounded-xl bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800"
								id="user-menu-button" aria-expanded="false" aria-haspopup="true">
								<span class="px-6 text-white font-bold"> <%=user.getUsername()%>
								</span> <img class="h-10 w-10 rounded-xl border-2 border-indigo-500"
									src="user_profile_images/<%=user.getProfile()%>" alt="">
							</div>
						</div>
					</div>
				</div>
				<%
				} else {
				%>
				<a href="login.jsp"
					class="text-lg font-bold leading-6 text-gray-900">Log in <span
					aria-hidden="true">&rarr;</span>
				</a>
				<%
				}
				%>
			</div>
		</nav>
	</header>

	<div class="relative isolate px-6 pt-14 lg:px-8">

		<div class="mx-auto max-w-4xl py-16 sm:py-48 lg:py-64">

			<div class="text-center glass-morphic">
				<div class="hidden sm:mb-8 sm:flex sm:justify-center">
					<div
						class="relative rounded-full px-3 py-1 text-md font-bold leading-6 text-indigo-100 ring-1 ring-gray-100/10 hover:ring-gray-100/20">
						a revolution in accessing knowledge at your fingertips</div>
				</div>
				<p class="hidden lg:block mt-6 text-lg leading-8 text-gray-100 font-bold">
					Discover a world of knowledge at your fingertips with our Digital
					Library System.<br /> Seamlessly access a vast collection of
					books, articles resources anytime, anywhere.<br /> Experience the
					ultimate in convenience and efficiency with advanced search
					features and a user-friendly interface designed to enhance your
					research and reading experience.
				</p>
				<p class="lg:hidden mt-6 text-lg leading-8 text-gray-100 font-bold">
					Discover a world of knowledge at your fingertips with our Digital
					Library System. Seamlessly access a vast collection of
					books, articles resources anytime, anywhere. Experience the
					ultimate in convenience and efficiency with advanced search
					features and a user-friendly interface designed to enhance your
					research and reading experience.
				</p>
				<div class="mt-10 flex items-center justify-center gap-x-6">


					<%
					if (isLoggedIn) {
						if (user.getRole().equals("Admin")) {
					%>
					<a href="admin/dashboard.jsp"
						class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-md font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Go
						to dashboard</a>
					<%
					} else if (user.getStatus().equals("Active")) {
					%>
					<a href="WebPageController?action=profile"
						class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-md font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Go
						to dashboard</a>
					<%
					} else {
					%>
					<span
						class="rounded-md bg-red-600 px-3.5 py-2.5 text-md font-semibold text-white shadow-sm hover:bg-red-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600">Your
						account is currently inactive. Please try again in 30 minutes. If
						the issue persists, contact support for further assistance.</span>

					<%
					}
					} else {
					%>
					<a href="registration.jsp"
						class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-md font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Create
						a new account</a>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>