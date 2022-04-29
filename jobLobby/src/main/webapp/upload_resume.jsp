<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:scriptlet>
 	String name   = (String) session.getAttribute("session_name");
 	String email   = (String) session.getAttribute("session_email");
	String profile_pic = (String) session.getAttribute("session_profilepic");


	
</jsp:scriptlet>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Upload Resume</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >	
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600&display=swap" rel="stylesheet">
    	
    	<link rel="stylesheet" type="text/css" href="css/style.css" />
   	   		
	</head>
	<body>
	  <jsp:include page="profile_header.jsp"></jsp:include>
	  	
	  	
	  <div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row " style="border-radius: 10px; border: 1px solid gray; box-shadow: 0 0 10px #0000ff;">
					<div class="col-md-3" >
						<img alt="<jsp:expression>profile_pic</jsp:expression>" src="profile_pics/<jsp:expression>profile_pic</jsp:expression>" height="150" style="border-radius: 50%"/>
					</div>
					<div class="col-md-9">
					    <h2>Upload Resume</h2>
					    <h6><b><jsp:expression>name</jsp:expression><span style="font-size: 12px">(<jsp:expression>email</jsp:expression>)</span></b></h6>
					    
					 	<form action="uploadResume" method="post" enctype="multipart/form-data">
					 		
					 		<jsp:expression>name</jsp:expression><br>
					 		
					 		<input type="file" name="uploadResume"/> <br><br>
							<input type="submit" value="Upload"  class="btn btn-danger"/>
					 	</form>		
					 			
					</div>
				</div>
			
			 	
			</div>
			<div class="col-md-2"></div>
	 </div>
	 
	  
	  <jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>