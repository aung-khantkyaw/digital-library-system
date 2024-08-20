<%@ page import="util.Helper"%>
<%@ page import="model.Users"%>
<%
Users user = (Users) session.getAttribute("user");
String fullURL = request.getRequestURL().toString();
%>
<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">
	<div class="d-flex align-items-center justify-content-between">
		<a href="index.html" class="logo d-flex align-items-center"> <img
			src="assets/img/online-library.png" alt="" class="d-lg-none" /> <span
			class="d-none d-lg-block">Digital Library System</span>
		</a> <i class="bi bi-list toggle-sidebar-btn"></i>
	</div>
	<!-- End Logo -->

	<div class="search-bar">
		<form class="search-form d-flex align-items-center" method="POST"
			action="#">
			<input type="text" name="query" placeholder="Search"
				title="Enter search keyword" />
			<button type="submit" title="Search">
				<i class="bi bi-search"></i>
			</button>
		</form>
	</div>
	<!-- End Search Bar -->

	<nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">
			<li class="nav-item d-block d-lg-none"><a
				class="nav-link nav-icon search-bar-toggle" href="#"> <i
					class="bi bi-search"></i>
			</a></li>
			<!-- End Search Icon-->

			<li class="nav-item dropdown pe-3"><a
				class="nav-link nav-profile d-flex align-items-center pe-0" href="#"
				data-bs-toggle="dropdown"> <img src="../user_profile_images/<%= user.getProfile() %>"
					alt="Profile" class="rounded" /> <span
					class="d-none d-md-block dropdown-toggle ps-2"><%=user.getUsername()%></span>
			</a> <!-- End Profile Iamge Icon -->

				<ul
					class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
					<li class="dropdown-header">
						<h6><%=user.getUsername()%></h6> <span><%=user.getRole()%></span>
					</li>
					<li>
						<hr class="dropdown-divider" />
					</li>

					<li><a class="dropdown-item d-flex align-items-center"
						href="users-profile.html"> <i class="bi bi-person"></i> <span>My
								Profile</span>
					</a></li>
					<li>
						<hr class="dropdown-divider" />
					</li>

					<li><a class="dropdown-item d-flex align-items-center"
						href="users-profile.html"> <i class="bi bi-gear"></i> <span>Account
								Settings</span>
					</a></li>
					<li>
						<hr class="dropdown-divider" />
					</li>

					<li><a class="dropdown-item d-flex align-items-center"
						href="../UserController?action=logout"> <i class="bi bi-box-arrow-right"></i>
							<span>Logout</span>
					</a></li>
				</ul> <!-- End Profile Dropdown Items --></li>
			<!-- End Profile Nav -->
		</ul>
	</nav>
	<!-- End Icons Navigation -->
</header>
<!-- End Header -->


<!-- ======= Sidebar ======= -->

<%
if (user.getRole().equals("Admin")) {
%>
<aside id="sidebar" class="sidebar">

	<ul class="sidebar-nav" id="sidebar-nav">
		<li class="nav-item"><a
			class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("dashboard") ? "" : "collapsed"%>"
			href="dashboard.jsp"> <i class="ri-layout-3-line"></i> <span>Dashboard</span>
		</a></li>
		<!-- End Dashboard Nav -->

		<li class="nav-heading">Book Details</li>

		<li class="nav-item"><a
			class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("books") ? "" : "collapsed"%>"
			href="../WebPageController?action=books"> <i class="ri-git-repository-line"></i> <span>Books</span>
		</a></li>

		<li class="nav-item"><a
			class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("authors") ? "" : "collapsed"%>"
			href="../WebPageController?action=authors"> <i class="ri-account-pin-box-line"></i> <span>Author</span>
		</a></li>

		<li class="nav-item"><a class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("genre") ? "" : "collapsed"%>"
			href="../WebPageController?action=genre"> <i class="ri-list-check-2"></i> <span>Genre</span>
		</a></li>

		<li class="nav-item"><a class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("publishers") ? "" : "collapsed"%>"
			href="../WebPageController?action=publishers"> <i class="ri-pen-nib-line"></i> <span>Publisher</span>
		</a></li>

		<li class="nav-item"><a class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("shelf_location") ? "" : "collapsed"%>"
			href="../WebPageController?action=shelf_location"> <i class="ri-map-pin-line"></i>
				<span>Shelf Location</span>
		</a></li>

		<!-- End Book Nav -->

		<li class="nav-heading">Users</li>

		<li class="nav-item"><a class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("pending_users") ? "" : "collapsed"%>"
			href="../WebPageController?action=pending_users"> <i class="ri-user-received-2-line"></i>
				<span>Pending Users</span>
		</a></li>

		<li class="nav-item"><a class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("all_users") ? "" : "collapsed"%>"
			href="../WebPageController?action=all_users"> <i class="ri-user-follow-line"></i>
				<span>All Users</span>
		</a></li>

		<!-- End User Nav -->

		<li class="nav-heading">Borrow</li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="Users/add-user.html"> <i class="ri-list-settings-line"></i>
				<span>Borrow List</span>
		</a></li>


	</ul>


</aside>
<%
} else {
%>
<aside id="sidebar" class="sidebar">

	<ul class="sidebar-nav" id="sidebar-nav">
		<li class="nav-item"><a
			class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("dashboard") ? "" : "collapsed"%>"
			href="dashboard.jsp"> <i class="ri-layout-3-line"></i> <span>USER</span>
		</a></li>
		<!-- End Dashboard Nav -->

		<li class="nav-heading">Book Details</li>

		<li class="nav-item"><a
			class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("physical_books") ? "" : "collapsed"%>"
			href="../WebPageController?action=books&user=true&type=physical"> <i class="ri-git-repository-line"></i> <span>Physical Books</span>
		</a></li>
		
		<li class="nav-item"><a
			class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("ebooks") ? "" : "collapsed"%>"
			href="../WebPageController?action=books&user=true&type=ebook"> <i class="ri-git-repository-line"></i> <span>E Books</span>
		</a></li>

		<li class="nav-item"><a
			class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("authors") ? "" : "collapsed"%>"
			href="../WebPageController?action=authors&user=true"> <i class="ri-account-pin-box-line"></i> <span>Author</span>
		</a></li>

		<li class="nav-item "><a class="nav-link <%=Helper.getLastPartWithoutExtension(fullURL).equals("publishers") ? "" : "collapsed"%>"
			href="../WebPageController?action=publishers&user=true"> <i class="ri-pen-nib-line"></i> <span>Publisher</span>
		</a></li>

		<!-- End Book Nav -->

		<li class="nav-heading">Users</li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="Users/all-users.html"> <i class="ri-team-line"></i> <span>Profile</span>
		</a></li>

		<!-- End User Nav -->
	</ul>
</aside>
<%
}
%>
<!-- End Sidebar-->

<main id="main" class="main">
	<div class="pagetitle">
		<h1><%=Helper.capitalizeFirstLetter(Helper.getLastPartWithoutExtension(fullURL))%></h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
				<li class="breadcrumb-item active"><%=Helper.capitalizeFirstLetter(Helper.getLastPartWithoutExtension(fullURL))%>
				</li>
			</ol>
		</nav>
	</div>