<%@ page import="java.util.List"%>
<%@ page import="dao.BookInfoDAOImpl"%>
<%@ page import="model.Users"%>
<%@ page import="util.DatabaseConnection"%>
<%
boolean isLoggedIn = Helper.isLoggedIn(session);
if (isLoggedIn) {
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<%
List<Users> all_users = (List<Users>) session.getAttribute("all_users");
Users loginUser = null;

for (Users userData : all_users) {
    if (userData.getUser_id().equals(user.getUser_id())) {
        loginUser = new Users();
        loginUser.setUser_id(userData.getUser_id());
        loginUser.setUsername(userData.getUsername());
        loginUser.setEmail(userData.getEmail());
        loginUser.setPhone_number(userData.getPhone_number());
        loginUser.setProfile(userData.getProfile());
        loginUser.setAddress(userData.getAddress());
        break; 
    }
}
%>
<section class="section profile">
	<div class="row">
		<div class="col-xl-12">

			<div class="card">
				<div
					class="card-body profile-card pt-4 d-flex flex-column align-items-center">
					<img src="../user_profile_images/<%=loginUser.getProfile()%>"
						alt="Profile" class="rounded" width="200px" height="100px">
					<h2><%=loginUser.getUsername()%></h2>
				</div>
			</div>

		</div>

		<div class="col-xl-12">

			<div class="card">
				<div class="card-body pt-3">
					<ul class="nav nav-tabs nav-tabs-bordered">

						<li class="nav-item">
							<button class="nav-link active" data-bs-toggle="tab"
								data-bs-target="#profile-overview">Overview</button>
						</li>

						<li class="nav-item">
							<button class="nav-link" data-bs-toggle="tab"
								data-bs-target="#profile-edit">Edit Profile</button>
						</li>

					</ul>
					<div class="tab-content pt-2">

						<div class="tab-pane fade show active profile-overview"
							id="profile-overview">
							<h5 class="card-title">Profile Details</h5>

							<div class="row">
								<div class="col-lg-3 col-md-4 label ">Full Name</div>
								<div class="col-lg-9 col-md-8"><%=loginUser.getUsername()%></div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">Address</div>
								<div class="col-lg-9 col-md-8"><%=loginUser.getAddress()%></div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">Phone</div>
								<div class="col-lg-9 col-md-8"><%=loginUser.getPhone_number()%></div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">Email</div>
								<div class="col-lg-9 col-md-8"><%=loginUser.getEmail()%></div>
							</div>

						</div>

						<div class="tab-pane fade profile-edit pt-3" id="profile-edit">
							<form action="../UserController" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="action" value="editUser"> <input
									type="hidden" name="user_id" value="<%= loginUser.getUser_id()%>">
								<div class="row mb-3">
									<label for="profileImage"
										class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
									<div class="col-md-8 col-lg-9">
										<input class="form-control" type="file" id="profileImage"
											name="profile" value="<%=loginUser.getProfile()%>">
									</div>
								</div>

								<div class="row mb-3">
									<label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full
										Name</label>
									<div class="col-md-8 col-lg-9">
										<input type="text" class="form-control" id="fullName"
											name="username" required value="<%=loginUser.getUsername()%>">
									</div>
								</div>

								<div class="row mb-3">
									<label for="email" class="col-md-4 col-lg-3 col-form-label">Email</label>
									<div class="col-md-8 col-lg-9">
										<input type="email" class="form-control" id="email"
											name="email" required value="<%=loginUser.getEmail()%>">
									</div>
								</div>

								<div class="row mb-3">
									<label for="phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
									<div class="col-md-8 col-lg-9">
										<input type="text" class="form-control" id="phone"
											name="phone_number" required
											value="<%=loginUser.getPhone_number()%>">
									</div>
								</div>

								<div class="row mb-3">
									<label for="address" class="col-md-4 col-lg-3 col-form-label">Address</label>
									<div class="col-md-8 col-lg-9">
										<input type="text" class="form-control" id="address"
											name="address" required value="<%=loginUser.getAddress()%>">
									</div>
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary">Save
										Changes</button>
								</div>
							</form>
						</div>
					</div>
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