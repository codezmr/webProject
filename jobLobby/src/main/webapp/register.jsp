<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Register</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >	
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600&display=swap" rel="stylesheet">
    	
    	<link rel="stylesheet" type="text/css" href="css/style.css" />
    
	</head>
	<body>
		<div class="container-fluid">
			<jsp:include page="header.jsp" />
			<jsp:include page="menubar.jsp" /><br><br>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 reg_div_design ">
				
					<form action="reg" method="post">
						<h2>Register Form</h2><br>
						<input type="text" placeholder="Name" name="name1" class="textfield_design"><br>
						<input type="email" placeholder="Email" name="email1" class="textfield_design"/><br>
						<input type="password" placeholder="Password" name="pass1" class="textfield_design" /><br><br>
						
						<b>Select Gender</b><br>
						<input type="radio" name="gender1" value="Male" class=""/> Male
						<input type="radio" name="gender1" value="Female"/> Female <br><br>
						
						<b>Select Field</b><br>
						<input type="checkbox" name="field1" value="Infrmation Technology"/> Information Technology <br>
						<input type="checkbox" name="field1" value="Marketing"/> Marketing
						<input type="checkbox" name="field1" value="Finance"/> Finance<br><br>
						
						<select name="city1" class="select_option">
						    <option>Select City</option>
							<option value="Munger">Munger</option>
							<option value="Gaya">Gaya</option>
							<option value="Darbhanga">Darbhanga</option>
							<option value="Patna">Patna</option>
							<option value="Bhagalpur">Bhagalpur</option>
						</select>
						<br><br>
						
						<input type="submit" value="Register" class="btn btn-primary"/><br>
						
					</form>
				  
				</div>
				<div class="col-md-3"></div>
			
			</div><br><br>
			
			
			
			<jsp:include page="footer.jsp" />
		</div>
		
		
	</body>
</html>