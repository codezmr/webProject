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
		
		<script src="javascripts/cities.js"></script>
		
		<script type="text/javascript">
		
		 function val(v)
         {
             document.getElementById(v).innerHTML="";
         }
		 
         function validation()
         {
             var flag=true;
             
             var name2=document.regform.name1.value;
             var email2=document.regform.email1.value;
             var pass2=document.regform.pass1.value;
             var gender2=document.regform.gender1.value;
             var city2 =document.regform.city1.value;
             
			 var name_pattern=/^[a-zA-Z ]{3,30}$/;
             var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
             var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
			
             
	               if(!name2.match(name_pattern)){
	            	 
	            	 document.getElementById('name_error').innerHTML = "<br>Name format is wrong";
	             		flag = false;
	             	}
	               if(name2==="")
	                {
	                    document.getElementById('name_error').innerHTML="<br>Name cannot be empty";
	                    flag=false;
	                }

	                if(!email2.match(email_pattern))
	                {
	                    document.getElementById('email_error').innerHTML="<br>Email is not properly formatted";
	                    flag=false;
	                }
	                if(email2==="")
	                {
	                    document.getElementById('email_error').innerHTML="<br>Email cannot be empty";
	                    flag=false;
	                }
	                
	                if(!pass2.match(password_pattern))
	                {
	                    document.getElementById('password_error').innerHTML="<br>Password is not properly formatted (should contain 0-9,special characters)";
	                    flag=false;
	                }
	                if(pass2==="")
	                {
	                    document.getElementById('password_error').innerHTML="<br>Password cannot be empty";
	                    flag=false;
	                }
	                
	                if(gender2==="")
	                {
	                    document.getElementById('gender_error').innerHTML="<br>Please select gender";
	                    flag=false;
	                }
	              
	             return flag;
			}
			
		
		</script>

	</head>
	<body>
		<div class="container-fluid">
			<jsp:include page="header.jsp" />
			<br><br>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 reg_div_design ">
				
					<form method="POST" name="regform"  onsubmit="return validation()" action="reg" >
					          
					         
						<h2>Register Form</h2><br>
						<input type="text" placeholder="Name" name="name1" class="textfield_design" onkeyup="val('name_error')"/>
							<sup><span id="name_error" style="color: red"> </span></sup>
						<br>
						
						<input type="email" placeholder="Email" name="email1" class="textfield_design" onkeyup="val('email_error')" />
							<sup><span id="email_error" style="color: red"> </span></sup>
						<br>
						
						<input type="password" placeholder="Password" name="pass1" class="textfield_design" onkeyup="val('password_error')" />
							<sup><span id="password_error" style="color: red"> </span></sup>
						<br><br>
						
						<b>Select Gender</b><br>
						<input type="radio" name="gender1" value="Male" class=""/> Male
						<input type="radio" name="gender1" value="Female"/> Female 
							<sup><span id="gender_error" style="color: red"> </span></sup>
						<br><br>
						
						<b>Select Field</b><br>
						<input type="checkbox" name="field1" value="Infrmation Technology"/> Information Technology <br>
						<input type="checkbox" name="field1" value="Marketing"/> Marketing
						<input type="checkbox" name="field1" value="Finance"/> Finance<br><br>
						
						
						<!-- =========Select State and City using JavaScript =============  -->
						
						<select onchange="print_city('state', this.selectedIndex);" id="sts" class="textfield_design" required></select>
						<select id ="state" class="textfield_design" name ="city1"  required></select>
						<script language="javascript">print_state("sts");</script>
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