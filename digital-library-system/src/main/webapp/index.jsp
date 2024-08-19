<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.Helper"%>
<%@ page import="model.Users" %>
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

<!-- Favicons -->
<link href="assets/img/online-library.png" rel="icon" />
<link href="assets/img/online-library.png" rel="apple-touch-icon" />

<script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
	<div class="bg-white">
		<header class="absolute inset-x-0 top-0 z-50">
			<nav class="flex items-center justify-between p-6 lg:px-8"
				aria-label="Global">
				<div class="flex flex-1">
					<a href="#" class="-m-1.5 p-1.5"> <img
						class="h-12 w-auto bg-dark-light rounded-md shadow-xl hover:shadow-md p-1 border-2 border-indigo-500"
						src="assets/img/online-library.png" alt="" />
					</a>
				</div>
				<div class="flex flex-1 justify-end">
					<%
					if (isLoggedIn) {
					%>
					<div class="ml-4 flex items-center md:ml-6">
						<!-- Profile dropdown -->
						<div class="relative ml-3">
							<div>
								<div
									class="relative flex max-w-xs items-center rounded-xl bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800"
									id="user-menu-button" aria-expanded="false"
									aria-haspopup="true">
									<span class="px-6 text-white font-bold"> <%= user.getUsername() %> </span>
									<img class="h-14 w-14 rounded-xl border-2 border-indigo-500"
										src="user_profile_images/<%= user.getProfile() %>"
										alt="">
								</div>
							</div>
						</div>
					</div>
					<%
					} else {
					%>
					<a href="login.jsp"
						class="text-sm font-bold leading-6 text-gray-900">Log in
						<span aria-hidden="true">&rarr;</span>
					</a>
					<%
					}
					%>
				</div>
			</nav>
		</header>

		<div class="relative isolate px-6 pt-14 lg:px-8">
			<div
				class="absolute inset-x-0 -top-40 -z-10 transform-gpu overflow-hidden blur-3xl sm:-top-80"
				aria-hidden="true">
				<div
					class="relative left-[calc(50%-11rem)] aspect-[1155/678] w-[36.125rem] -translate-x-1/2 rotate-[30deg] bg-gradient-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%-30rem)] sm:w-[72.1875rem]"
					style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%);"></div>
			</div>
			<div class="mx-auto max-w-4xl py-32 sm:py-48 lg:py-56">
				<div class="hidden sm:mb-8 sm:flex sm:justify-center">
					<div
						class="relative rounded-full px-3 py-1 text-sm leading-6 text-gray-600 ring-1 ring-gray-900/10 hover:ring-gray-900/20">
						a revolution in accessing knowledge at your fingertips</div>
				</div>
				<div class="text-center">
					<h1
						class="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl">
						Digital Library System</h1>
					<p class="mt-6 text-lg leading-8 text-gray-600">
						Discover a world of knowledge at your fingertips with our Digital
						Library System.<br /> Seamlessly access a vast collection of
						books, articles, and multimedia resources anytime, anywhere.<br />
						Experience the ultimate in convenience and efficiency with
						advanced search features and a user-friendly interface designed to
						enhance your research and reading experience.
					</p>
					<div class="mt-10 flex items-center justify-center gap-x-6">
					
						<a href=<%= isLoggedIn ? "admin/dashboard.jsp" : "registration.jsp" %> class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"><%= isLoggedIn ? "Go to Dashboard" : "Create a new account" %></a>
					
					</div>
				</div>
			</div>
			<div
				class="absolute inset-x-0 top-[calc(100%-13rem)] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[calc(100%-30rem)]"
				aria-hidden="true">
				<div
					class="relative left-[calc(50%+3rem)] aspect-[1155/678] w-[36.125rem] -translate-x-1/2 bg-gradient-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%+36rem)] sm:w-[72.1875rem]"
					style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%);"></div>
			</div>
		</div>
	</div>
</body>
</html>