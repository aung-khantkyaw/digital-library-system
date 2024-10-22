<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - Digital Library System</title>
<meta content="" name="description" />
<meta content="" name="keywords" />

<!-- Favicons -->
<link href="assets/img/online-library.png" rel="icon" />
<link href="assets/img/online-library.png" rel="apple-touch-icon" />

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet" />

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet" />
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet" />
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet" />
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet" />
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet" />

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet" />
</head>

<body>
	<main>
		<div class="container">
			<section
				class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">

						<div
							class="col-md-6 d-flex flex-column align-items-center justify-content-center">
							<div class="card mb-3">
								<div class="card-body">
									<h5 class="card-title">Create an Account</h5>
									<form class="row g-3" action="UserController" method="post"
										enctype="multipart/form-data">
										<input type="hidden" name="action" value="addUser">
										<div class="col-md-12">
											<label for="inputProfile" class="form-label">Your
												Profile</label> <input class="form-control" type="file"
												id="inputProfile" name="profile" required>
										</div>
										<div class="col-md-12">
											<label for="inputName" class="form-label">Your Name</label> <input
												type="text" class="form-control" id="inputName"
												name="username" required>
										</div>
										<div class="col-md-6">
											<label for="inputEmail" class="form-label">Email</label> <input
												type="email" class="form-control" id="inputEmail"
												name="email" required>
										</div>
										<div class="col-md-6">
											<label for="inputPhoneNo" class="form-label">Phone</label> <input
												type="text" class="form-control" id="inputPhoneNo"
												name="phone_number" required>
										</div>
										<div class="col-12">
											<label for="inputPassword5" class="form-label">Password</label>
											<input type="password" class="form-control"
												id="inputPassword5" name="password" required>
										</div>
										<div class="col-12">
											<label for="inputAddress5" class="form-label">Address</label>
											<input type="text" class="form-control" id="inputAddress5"
												name="address" placeholder="1234 Main St">
										</div>
										<div class="col-12">
											<div class="form-check">
												<input class="form-check-input" name="terms" type="checkbox"
													value="" id="acceptTerms" required> <label
													class="form-check-label" for="acceptTerms"> I agree
													and accept the <a href="#">terms and conditions</a>
												</label>
												<div class="invalid-feedback">You must agree before
													submitting.</div>
											</div>
										</div>
										<div class="col-12">
											<button class="btn btn-primary w-100" type="submit">Create
												Account</button>
										</div>
										<div class="col-12">
											<p class="small mb-0">
												Already have an account? <a href="login.jsp">Log in</a>
											</p>
										</div>
									</form>

								</div>
							</div>

						</div>
					</div>
				</div>
			</section>
		</div>
	</main>

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/chart.js/chart.umd.js"></script>
	<script src="assets/vendor/echarts/echarts.min.js"></script>
	<script src="assets/vendor/quill/quill.js"></script>
	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
</body>
</html>