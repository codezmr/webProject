<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:scriptlet>
 	String name   = (String) session.getAttribute("session_name");
 	String gender = (String) session.getAttribute("session_gender");
 	String city   = (String) session.getAttribute("session_city");
 	String field  = (String) session.getAttribute("session_field");
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
	   	<div class="row">
	   		<div class="col-md-2">
	   			<img alt="" src="images/logo.png" height="100" style="border-radius: 50%"/>
	   		</div>
	   		<div class="col-md-10">
	   			<h3 style="color: blue"><jsp:expression>name.toUpperCase()</jsp:expression></h3>
	   			<table>
	   				<tr>
	   			     <td><span class="profile_text_color">Gender</span></td>
	   			     <td><input type="text" value="<jsp:expression>gender</jsp:expression>" class="textfield_design"/></td>
	   				</tr>
	   				
	   				<tr>
	   			     <td><span class="profile_text_color">City</span></td>
	   			     <td><input type="text" value="<jsp:expression>city</jsp:expression>" class="textfield_design"/></td>
	   				</tr>
	   				
	   				<tr>
	   			     <td><span class="profile_text_color">Fields</span></td>
	   			     <td><input type="text" value="<jsp:expression>field</jsp:expression>" class="textfield_design"/></td>
	   				</tr>
	   				
	   				<tr>
	   				  <td></td>
	   				  <td><input type="submit" value="Update" class="btn btn-danger" /></td>
	   				</tr>
	   			</table>
	   			
	   		</div>
	   	</div>
	   	
	   	<div class="row">
	   		<div class="col-md-2"></div>
	   		<div class="col-md-10">
	   			<h5>Education Details <span style="font-size:12px; "></span></h5>
	   			<table>
	   				<tr>
	   				 <td>School</td>
	   				 <td><input type="text" value="" class="textfield_design"/></td>
	   				</tr>
	   				
	   				<tr>
	   				 <td>Year</td>
	   				 <td><input type="text" value="" class="textfield_design"/></td>
	   				</tr>
	   				
	   				<tr>
	   				 <td>College</td>
	   				 <td><input type="text" value="" class="textfield_design"/></td>
	   				</tr>
	   				
	   				<tr>
	   				 <td>Passing Year</td>
	   				 <td><input type="text" value="" class="textfield_design"/></td>
	   				</tr>
	   				
	   				<tr>
	   				 <td>Experience</td>
	   				 <td><input type="text" value="" class="textfield_design"/></td>
	   				</tr>
	   			</table>
		   	</div>
	   		
	   	
	   	</div>
	   	
	   	<div class="row" style="background-color: #ececec">
	   		<div class="col-md-2"></div>
	   		<div class="col-md-8">
	   			<input type="submit" value="Update" class="btn btn-danger" />
	   		</div>
	   		<div class="col-md-2"></div>
	   	</div>
	   	
	   	
	   </div>
	   <div class="col-md-2"></div>
	  </div>
	 
	  
	  <jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>