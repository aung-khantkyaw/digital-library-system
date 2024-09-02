
<%
boolean isLoggedIn = Helper.isLoggedIn(session);
if (isLoggedIn) {
	int[] userCount = Helper.getLast7DaysData("user");
	int[] physicalCount = Helper.getLast7DaysData("physical_book");
	int[] ebookCount = Helper.getLast7DaysData("ebook");
%>
<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>

<section class="section dashboard">
	<div class="row">
		<div class="col-lg-12">
			<div class="row">
				<div class="col-xxl-4 col-md-6">
					<div class="card info-card sales-card">
						<div class="card-body">
							<h5 class="card-title">Physical Books</h5>
							<div class="d-flex align-items-center">
								<div
									class="card-icon rounded-circle d-flex align-items-center justify-content-center">
									<i class="bi bi-book-half"></i>
								</div>
								<div class="ps-3">
									<h6><%=Helper.countRows("physical_book")%>
										books
									</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xxl-4 col-md-6">
					<div class="card info-card revenue-card">
						<div class="card-body">
							<h5 class="card-title">E Books</h5>

							<div class="d-flex align-items-center">
								<div
									class="card-icon rounded-circle d-flex align-items-center justify-content-center">
									<i class="bi bi-cash"></i>
								</div>
								<div class="ps-3">
									<h6><%=Helper.countRows("physical_book")%>
										books
									</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
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
									<h6><%=Helper.countRows("user")%>
										members
									</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Reports</h5>

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
			                    	    const year = String(date.getFullYear()).slice(-2);
			                    	    return day + "/" + month + "/" + year;
			                    	}              	
                      
                      
			                      document.addEventListener("DOMContentLoaded", () => {
			                        new ApexCharts(
			                          document.querySelector("#reportsChart"),
			                          {
			                            series: [
			                              {
			                                name: "Physical Book",
			                                data: [<%=physicalCount[6]%> , <%=physicalCount[5]%> , <%=physicalCount[4]%> , <%=physicalCount[3]%> , <%=physicalCount[2]%> , <%=physicalCount[1]%> , <%=physicalCount[0]%>],
			                              },
			                              {
			                                  name: "EBooks",
			                                  data: [<%=ebookCount[6]%> , <%=ebookCount[5]%> , <%=ebookCount[4]%> , <%=ebookCount[3]%> , <%=ebookCount[2]%> , <%=ebookCount[1]%> , <%=ebookCount[0]%>],
			                                },
			                              {
			                                name: "Users",
			                                data: [<%=userCount[6]%> , <%=userCount[5]%> , <%=userCount[4]%> , <%=userCount[3]%> , <%=userCount[2]%> , <%=userCount[1]%> , <%=userCount[0]%>],
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