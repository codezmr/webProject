<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:scriptlet>

 	String name   = (String) session.getAttribute("session_name");
 	String email   = (String) session.getAttribute("session_email");
	
 	if(name==null || name.equals("")){
 		response.sendRedirect("login.jsp");
 	}
</jsp:scriptlet>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Welcome: <jsp:expression>name.toUpperCase()</jsp:expression></title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >	
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" >
		<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600&display=swap" rel="stylesheet">
    	
    	<link rel="stylesheet" type="text/css" href="css/style.css" />
   
	</head>
	<body>
	  <jsp:include page="profile_header.jsp"></jsp:include>
	  
	  	
	  	
	  <div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row " style="border-radius: 10px; border: 1px solid gray; box-shadow: 0 0 10px #0000ff;">
					<div class="col-md-2" >
						<img alt="" src="images/logo.png" height="100" style="border-radius: 50%"/>
					</div>
					<div class="col-md-10">
						<h2>Add Education Details</h2>
					    <h6><b><jsp:expression>name</jsp:expression><span style="font-size: 12px">(<jsp:expression>email</jsp:expression>)</span></b></h6>
						
					 	<form action="addProfileEducation" method="post">
					 		
					 		School/College <br><input type="text"  name="school1" class="textfield_design" /><br>
					 		
					 		Degree <br><input type="text" name="degree1" placeholder="Eg.10th/12th/B.tech..." class="textfield_design" /><br>
					 		
					 		Year Duration <br>  
					 			From <input type="number" min="2000" max="2099" step="1" value="2018" name= "fromyear1" style="border-radius: 5px; width: 100px"/> &nbsp;&nbsp;
					 			To <input type="number" min="2000" max="2099" step="1" value="2022" name="toyear1" style="border-radius: 5px; width: 100px" /><br><br>
					 		
					 		Grade <br><input type="text" name="grade1" placeholder="Eg.78% or 8.00"  class="textfield_design" /><br>							
							
							Description <br><textarea rows="5" cols="7" placeholder="Short Description Related To Degree"  name="edudesc1" class="textfield_design" ></textarea><br>
							
							<input type="submit" value="Add Education"  class="btn btn-danger"/>
					 	</form>		
					 			
					</div>
				</div>
			
			 	
			</div>
			<div class="col-md-2"></div>
	 </div>
	 
	  
	  <jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>