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
    	
    	<script type="text/javascript">
    		
    	  function val(v){
    		  document.getElementById(v).innerHTML= "";
    		 
    	  }
    	
    	  function validation() 
    	  {
    		var flag = false;
			var name2 = document.regform.name1.value;
			var email2 = document.regform.email1.value;
			var pass2 = document.regform.pass1.value;
			var gender2 = document.regform.gender1.value;
			var fields2 = document.regform.field1.value;
			var city2= document.regform.city1.value;
			
			if(name2 === ""){
				document.getElementById('name_error').innerHTML= "<br>Name can not be empty.";
				flag = false;
			}
			 else if(email2 === ""){
					document.getElementById('email_error').innerHTML= "<br>Email Id can not be empty.";
					flag = false;
			}
			 else if(pass2 === ""){
					document.getElementById('password_error').innerHTML= "<br> Password can not be empty.";
					flag = false;
			}
			 else if(gender2 === ""){
					document.getElementById('gender_error').innerHTML= "<br>Please select gender.";
					flag = false;
			}
			 else if(city2 === "Select City"){
					document.getElementById('city_error').innerHTML= "<br>Please select city.";
					flag = false;
			} 
			return flag;
			
			
			//=========================
			/* if(name2 === ""){
				alert("Name cannot be empty!!");
				return false;
			}
			 else if(email2 === ""){
				 alert("Email cannot be empty!!");
				 return false;
			}
			 else if(pass2 === ""){
				 alert("Password cannot be empty!!");
				 return false;
			}
			 else if(gender2 === ""){
				 alert("Please select gender.");
				 return false;
			}
			 else if(city2 === "Select City"){
				 alert("Please select the city.");
				 return false;
			} 
			 else if(fields2 === ""){
				 alert("Please select atleast one field.");
				 return false;
			} else{
				document.regform.action="reg";
				document.regform.submit();
			} */
			
		  }
    	</script>
	</head>
	<body>
		<div class="container-fluid">
			<jsp:include page="header.jsp" />
			<jsp:include page="menubar.jsp" /><br><br>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 reg_div_design ">
				
					<form method="POST" name="regform" onsubmit="return validation()" action="reg">
					          <!-- client side validation
					              when click on submit so first check validation() return value
					          		if return true so continue next page 
					          		else show error messages.
					          -->
					         
						<h2>Register Form</h2><br>
						<input type="text" placeholder="Name" name="name1" class="textfield_design" onkeypress="val('name_error')" /><small><span id="name_error" style="color:red;" ></span></small><br>
						<input type="email" placeholder="Email" name="email1" class="textfield_design"/><small><span id="email_error" style="color:red;"></span></small><br>
						<input type="password" placeholder="Password" name="pass1" class="textfield_design" /><small><span id="password_error" style="color:red;"></span></small><br><br>
						
						<b>Select Gender</b><br>
						<input type="radio" name="gender1" value="Male" class=""/> Male
						<input type="radio" name="gender1" value="Female"/> Female <small><span id="gender_error" style="color:red;"></span></small><br><br>
						
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
						</select><small><span id="city_error" style="color:red;"></span></small>
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