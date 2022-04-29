<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:scriptlet>
    String name=(String)session.getAttribute("session_name");
	String profile_pic = (String) session.getAttribute("session_profilepic");

</jsp:scriptlet>

<!DOCTYPE html>

<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <title> Welcome : <jsp:expression> name.toUpperCase() </jsp:expression> </title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" type="text/css" href="css/style.css" />
	</head>
<body>
	<nav class="navbar navbar-light bg-light fixed-top navStyle " >
	  <div class="container-fluid" >
	     <span><img alt="" src="images/logo.png" height="50"><span style="font-size: 26px;">JOB LOBBY</span></span>
	     
	       <div class="col-md-4" style="text-align:center;">
			  <img src="profile_pics/<jsp:expression>profile_pic</jsp:expression>" height="30">
			  <a href="profile.jsp" class="header-text-design" style=""> <jsp:expression> name.toUpperCase() </jsp:expression> </a>
			</div>
			
			
	    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
	      <div class="offcanvas-header">
	        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">JOB LOBBY</h5>
	        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	      </div>
	      <div class="offcanvas-body">
	        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
	        
	          <li class="nav-item">
	            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" href="#">About Us</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" aria-current="page" href="#">Contact Us</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" href="blogs.jsp">Blogs</a>
	          </li>
	        
	        </ul>
	        
	       <br> <hr>
	        <a href="Logout"><button class="btn btn-outline-success" type="submit" style="width: 48%">LOGOUT</button></a>
			<br><br>
			
	      </div>
	    </div>
	  </div>
	</nav>
	<br><br>
	<br><br>
</body>

</html>
















