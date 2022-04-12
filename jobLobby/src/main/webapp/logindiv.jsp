<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<br><br>
	<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 reg_div_design ">
				
					<form action="login" method="post">
						<h2>Login Here</h2><br>
						<input type="email" placeholder="Email" name="email1" class="textfield_design"/><br>
						<input type="password" placeholder="Password" name="pass1" class="textfield_design" /><br><br>
						<input type="checkbox" name="rememberme1" value="Remember Me"/> Remember Me <br><br><br>
						
						
						<input type="submit" value="Login" class="btn btn-primary"/><br>
						
					</form>
				  
				</div>
				<div class="col-md-3"></div>
			
			</div>
			<br><br>
</body>
</html>