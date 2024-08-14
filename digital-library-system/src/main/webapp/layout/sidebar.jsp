<%@ page import="util.Helper" %>
<% 
	String fullURL = request.getRequestURL().toString(); 
		
%>

<!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">
    
      <ul class="sidebar-nav" id="sidebar-nav">
        <li class="nav-item">
          <a class="nav-link <%= Helper.getLastPartWithoutExtension(fullURL).equals("dashboard")? "" : "collapsed"  %>" href="dashboard.jsp">
            <i class="ri-layout-3-line"></i>
            <span>Dashboard</span>
          </a>
        </li> 
        <!-- End Dashboard Nav -->

        <li class="nav-heading">Book Details</li>

        <li class="nav-item">
          <a class="nav-link <%= Helper.getLastPartWithoutExtension(fullURL).equals("books")? "" : "collapsed"  %>" href="books.jsp">
            <i class="ri-git-repository-line"></i>
            <span>Books</span>
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link <%= Helper.getLastPartWithoutExtension(fullURL).equals("authors")? "" : "collapsed"  %>" href="authors.jsp">
            <i class="ri-account-pin-box-line"></i>
            <span>Author</span>
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link collapsed" href="Books/genre.html">
            <i class="ri-list-check-2"></i>
            <span>Genre</span>
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link collapsed" href="Books/publisher.html">
            <i class="ri-pen-nib-line"></i>
            <span>Publisher</span>
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link collapsed" href="Books/shelf_location.html">
            <i class="ri-map-pin-line"></i>
            <span>Shelf Location</span>
          </a>
        </li>
        
        <!-- End Book Nav -->

        <li class="nav-heading">Users</li>

        <li class="nav-item">
          <a class="nav-link collapsed" href="Users/add-user.html">
            <i class="ri-user-received-2-line"></i>
            <span>New Users</span>
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link collapsed" href="Users/all-users.html">
            <i class="ri-team-line"></i>
            <span>All Users</span>
          </a>
        </li>

        <!-- End User Nav -->

        <li class="nav-heading">Borrow</li>

        <li class="nav-item">
          <a class="nav-link collapsed" href="Users/add-user.html">
            <i class="ri-list-settings-line"></i>
            <span>Borrow List</span>
          </a>
        </li>

       
      </ul>
      
      
    </aside>
    <!-- End Sidebar-->
    
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Books</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
            <li class="breadcrumb-item active">
            	<%= Helper.capitalizeFirstLetter(Helper.getLastPartWithoutExtension(fullURL)) %>
            </li>
          </ol>
        </nav>
      </div>
