
<%
boolean isLoggedIn = Helper.isLoggedIn(session);
if (isLoggedIn) {
	int[] data = Helper.getLast7DaysData("user");
%>
<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>

<section class="section dashboard">
	<div class="row">
		<!-- Left side columns -->
		<div class="col-lg-8">
			<div class="row">
				<!-- Sales Card -->
				<div class="col-xxl-4 col-md-6">
					<div class="card info-card sales-card">
						<div class="card-body">
							<h5 class="card-title">Books</h5>
							<div class="d-flex align-items-center">
								<div
									class="card-icon rounded-circle d-flex align-items-center justify-content-center">
									<i class="bi bi-book-half"></i>
								</div>
								<div class="ps-3">
									<h6>145</h6>
									<span class="text-success small pt-1 fw-bold">12%</span> <span
										class="text-muted small pt-2 ps-1">increase</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Sales Card -->

				<!-- Revenue Card -->
				<div class="col-xxl-4 col-md-6">
					<div class="card info-card revenue-card">
						<div class="card-body">
							<h5 class="card-title">Revenue</h5>

							<div class="d-flex align-items-center">
								<div
									class="card-icon rounded-circle d-flex align-items-center justify-content-center">
									<i class="bi bi-cash"></i>
								</div>
								<div class="ps-3">
									<h6>MMK 3,264</h6>
									<span class="text-success small pt-1 fw-bold">8%</span> <span
										class="text-muted small pt-2 ps-1">increase</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Revenue Card -->

				<!-- Customers Card -->
				<div class="col-xxl-4 col-xl-12">
					<div class="card info-card customers-card">
						<div class="card-body">
							<h5 class="card-title">Users</h5>

							<div class="d-flex align-items-center">
								<div
									class="card-icon rounded-circle d-flex align-items-center justify-content-center">
									<i class="bi bi-people"></i>
								</div>
								<div class="ps-3">
									<h6><%=Helper.countRows("user")%></h6>
									<span class="text-danger small pt-1 fw-bold">12%</span> <span
										class="text-muted small pt-2 ps-1">decrease</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Customers Card -->

				<!-- Reports -->
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Reports</h5>

							<!-- Line Chart -->
							<div id="reportsChart"></div>

							<script>
							
							function getLast7DaysISOString() {
	                    	    const datesArray = [];
	                    	    const today = new Date();

	                    	    for (let i = 0; i < 7; i++) {
	                    	        const pastDate = new Date(today);
	                    	        pastDate.setDate(today.getDate() - i);
	                    	        datesArray.unshift(formatDateToISOString(pastDate));
	                    	    }

	                    	    return datesArray;
	                    	}
							
		                      function formatDateToISOString(date) {
		                        // Convert to UTC and return the ISO string
		                        return new Date(
		                          Date.UTC(
		                            date.getFullYear(),
		                            date.getMonth(),
		                            date.getDate()
		                          )
		                        ).toISOString();
		                      }
		
		                      function getLast7Days() {
		                    	    const datesArray = [];
		                    	    const today = new Date();
		
		                    	    for (let i = 0; i < 7; i++) {
		                    	        const pastDate = new Date(today);
		                    	        pastDate.setDate(today.getDate() - i);
		                    	        datesArray.unshift(formatDateToCustomFormat(pastDate));
		                    	    }
		
		                    	    return datesArray;
		                    	}
		
		                    	function formatDateToCustomFormat(date) {
		                    	    const day = String(date.getDate()).padStart(2, '0');
		                    	    const month = String(date.getMonth() + 1).padStart(2, '0');
		                    	    const year = String(date.getFullYear()).slice(-2); // Get the last two digits of the year
		
		                    	    return day + "/" + month + "/" + year;
		                    	}              	
                      
                      
                      document.addEventListener("DOMContentLoaded", () => {
                        new ApexCharts(
                          document.querySelector("#reportsChart"),
                          {
                            series: [
                              {
                                name: "Books",
                                data: [31, 40, 28, 51, 42, 82, 56],
                              },
                              {
                                name: "Revenue",
                                data: [11, 32, 45, 32, 34, 52, 41],
                              },
                              {
                                name: "Users",
                                data: [<%=data[6]%> , <%=data[5]%> , <%=data[4]%> , <%=data[3]%> , <%=data[2]%> , <%=data[1]%> , <%=data[0]%>],
                              },
                            ],
                            chart: {
                              height: 350,
                              type: "area",
                              toolbar: {
                                show: false,
                              },
                            },
                            markers: {
                              size: 4,
                            },
                            colors: ["#4154f1", "#2eca6a", "#ff771d"],
                            fill: { 
                              type: "gradient",
                              gradient: {
                                shadeIntensity: 1,
                                opacityFrom: 0.3,
                                opacityTo: 0.4,
                                stops: [0, 90, 100],
                              },
                            },
                            dataLabels: {
                              enabled: false,
                            },
                            stroke: {
                              curve: "smooth",
                              width: 2,
                            },
                            xaxis: {
                              type: "datetime",
                              categories: getLast7DaysISOString(),
                            },
                            tooltip: {
                              x: {
                                format: "dd/MM/yy",
                              },
                            },
                          }
                        ).render();
                      });
                    </script>
							<!-- End Line Chart -->
						</div>
					</div>
				</div>
				<!-- End Reports -->
			</div>
		</div>
		<!-- End Left side columns -->

		<!-- Right side columns -->
		<div class="col-lg-4">
			<!-- Recent Activity -->
			<div class="card">
				<div class="filter">
					<a class="icon" href="#" data-bs-toggle="dropdown"><i
						class="bi bi-three-dots"></i></a>
					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
						<li class="dropdown-header text-start">
							<h6>Filter</h6>
						</li>

						<li><a class="dropdown-item" href="#">Today</a></li>
						<li><a class="dropdown-item" href="#">This Month</a></li>
						<li><a class="dropdown-item" href="#">This Year</a></li>
					</ul>
				</div>

				<div class="card-body">
					<h5 class="card-title">Recent Activity</h5>

					<div class="activity">
						<div class="activity-item d-flex">
							<div class="activite-label">32 min</div>
							<i
								class="bi bi-circle-fill activity-badge text-success align-self-start"></i>
							<div class="activity-content">
								Quia quae rerum <a href="#" class="fw-bold text-dark">explicabo
									officiis</a> beatae
							</div>
						</div>
						<!-- End activity item-->

						<div class="activity-item d-flex">
							<div class="activite-label">56 min</div>
							<i
								class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>
							<div class="activity-content">Voluptatem blanditiis
								blanditiis eveniet</div>
						</div>
						<!-- End activity item-->

						<div class="activity-item d-flex">
							<div class="activite-label">2 hrs</div>
							<i
								class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>
							<div class="activity-content">Voluptates corrupti molestias
								voluptatem</div>
						</div>
						<!-- End activity item-->

						<div class="activity-item d-flex">
							<div class="activite-label">1 day</div>
							<i
								class="bi bi-circle-fill activity-badge text-info align-self-start"></i>
							<div class="activity-content">
								Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati
									voluptatem</a> tempore
							</div>
						</div>
						<!-- End activity item-->

						<div class="activity-item d-flex">
							<div class="activite-label">2 days</div>
							<i
								class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>
							<div class="activity-content">Est sit eum reiciendis
								exercitationem</div>
						</div>
						<!-- End activity item-->

						<div class="activity-item d-flex">
							<div class="activite-label">4 weeks</div>
							<i
								class="bi bi-circle-fill activity-badge text-muted align-self-start"></i>
							<div class="activity-content">Dicta dolorem harum nulla
								eius. Ut quidem quidem sit quas</div>
						</div>
						<!-- End activity item-->
					</div>
				</div>
			</div>
			<!-- End Recent Activity -->
		</div>
		<!-- End Right side columns -->
	</div>
</section>
</main>
<!-- End #main -->

<%@ include file="../layout/footer.jsp"%>

<%
} else {
response.sendRedirect("../index.jsp");
}
%>