<%@ page import="java.util.List"%>
<%@ page import="model.Users"%>
<%@ page import="dao.BookInfoDAOImpl"%>
<%@ page import="util.DatabaseConnection"%>
<%
boolean isLoggedIn = Helper.isLoggedIn(session);
if (isLoggedIn) {
	List<Users> pending_users = (List<Users>) session.getAttribute("pending_users");
	/* for (Users user : users) {
		System.out.println(user.getUsername() + " in jsp " + user.getEmail());
	} */
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
						<h5 class="card-title">Pending Users</h5>
					</div>

					<!-- Table with stripped rows -->
					<table class="table datatable">
						<thead>
							<tr>
								<th>User Id</th>
								<th>Profile</th>
								<th>User Name</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (Users pending_user : pending_users) {
							%>
							<tr>
								<td><%=pending_user.getUser_id()%></td>
								<td><img
									src="../user_profile_images/<%=pending_user.getProfile()%>"
									alt="<%=pending_user.getUsername()%>" class="rounded"
									width="50" /></td>
								<td><%=pending_user.getUsername()%></td>
								<td><%=pending_user.getEmail()%></td>
								<td><%=pending_user.getPhone_number()%></td>
								<td>
									<button type="button" data-bs-toggle="modal"
										data-bs-target="#pendingUserDetail<%=pending_user.getUser_id()%>"
										class="btn btn-info">
										<i class="ri-eye-line"></i>
									</button>
									<div class="modal fade"
										id="pendingUserDetail<%=pending_user.getUser_id()%>"
										tabindex="-1">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title"><%=pending_user.getUsername()%></h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<div class="card mb-3">
														<div class="row g-0">
															<div class="col-md-4">
																<img
																	src="../user_profile_images/<%=pending_user.getProfile()%>"
																	class="img-fluid rounded-start" alt="...">
															</div>
															<div class="col-md-8">
																<div class="card-body">
																	<ul class="list-group">

																		<li class="list-group-item"><%=pending_user.getEmail()%></li>
																		<li class="list-group-item"><%=pending_user.getPhone_number()%></li>
																		<li class="list-group-item"><%=pending_user.getAddress()%></li>
																	</ul>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<a
														href="../UserController?action=activateUser&user_id=<%=pending_user.getUser_id()%>"
														class="btn btn-success"><i class="bi bi-check-circle"></i>
														<span class="px-2">Accept User</span></a>
												</div>
											</div>
										</div>
									</div>
							</tr>
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