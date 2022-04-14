<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:scriptlet>
 	String name   = (String) session.getAttribute("session_name");
 	
</jsp:scriptlet>
<jsp:scriptlet>
		
		if(name == null || name.equals("")){
			response.sendRedirect("login.jsp");
		}
	</jsp:scriptlet>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Profile</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >	
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600&display=swap" rel="stylesheet">
    	
    	<link rel="stylesheet" type="text/css" href="css/style.css" />
   
	</head>
	<body>
	  <jsp:include page="profile_header.jsp"></jsp:include>
	  <jsp:include page="menubar.jsp"></jsp:include>
	  	
	  	
	  <div class="row">
	   <div class="col-md-2"></div>
	   <div class="col-md-8">
	   	<div class="row " style="border-radius: 10px; border: 1px solid gray; box-shadow: 0px 0px 5px gray;">
	   		<div class="col-md-2" >
	   			<img alt="" src="images/logo.png" height="100" style="border-radius: 50%"/>
	   		</div>
	   		<div class="col-md-10">
	   			<h3 style="color: blue"><jsp:expression>name.toUpperCase()</jsp:expression>
	   			<span style="font-size:12px; ">{<a href="edit_profile_about.jsp"  style="text-decoration: none; ">Edit Details</a>}</span></h3>
	   		</div>
	   	</div>
	   	
	   	<div class="row">
	   		<div class="col-md-2"></div>
	   		<div class="col-md-10">
	   			<h5>Education Details <span style="font-size:12px; ">{<a href="edit_details.jsp"  style="text-decoration: none; ">Edit Details</a>}</span></h5>
	   			School : <br>
	   			Year : <br>
	   			College : <br>
	   			Passing Year : <br>
	   			Experience : <br>
	   		</div>
	   		
	   	
	   	</div>
	   	
	   	<div class="row" style="background-color: #ececec">
	   		<div class="col-md-2"></div>
	   		<div class="col-md-8">
	   			<input type="submit" value="Follow" />
	   		</div>
	   		<div class="col-md-2"></div>
	   	</div>
	   	
	   	
	   </div>
	   <div class="col-md-2"></div>
	  </div>
	 
	  
	  <jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>