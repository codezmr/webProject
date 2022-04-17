<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:scriptlet>
 	String name   = (String) session.getAttribute("session_name");
 	String email   = (String) session.getAttribute("session_email");
 	String gender = (String) session.getAttribute("session_gender");
 	String city   = (String) session.getAttribute("session_city");
 	String title  = (String) session.getAttribute("session_title");
    String skills  = (String) session.getAttribute("session_skills");

		if(title == null || title.equals("")){
			title = "";
		} 
		if(skills == null || skills.equals("")){
			skills = "";
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
   		
   		<!-- javascript file for select city -->
   		<script src="javascripts/cities.js"></script>
   		
   		<script type="text/javascript">
   			function changeGender(){
   				
   			    var oldGender = document.getElementById('changegender_tf').value
   				var newGender = document.getElementById('changegender').value;
   				
   				if(! newGender.match('Change Gender')){
   					document.getElementById('changegender_tf').value = newGender;
   				}else{
   					document.getElementById('changegender_tf').value = oldGender;
   				}
   				
   				
   			}
   			
   			function showCity(){
   				const [city] = document.getElementsByName("city1")
				var newCity = city.value;
   				
   				document.getElementById('changeCity_tf').value = newCity;
   			}
   	
   			
   		</script>
	</head>
	<body>
	  <jsp:include page="profile_header.jsp"></jsp:include>
	  <jsp:include page="menubar.jsp"></jsp:include>
	  	
	  	
	  <div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row " style="border-radius: 10px; border: 1px solid gray; box-shadow: 0 0 10px #0000ff;">
					<div class="col-md-2" >
						<img alt="" src="images/logo.png" height="100" style="border-radius: 50%"/>
					</div>
					<div class="col-md-10">
					    <h2>Personal Details</h2>
					    <input type="text" value="<jsp:expression>email</jsp:expression>" class="textfield_readonly" readonly="readonly" style="background-color: #acaaaa; "/><br>
					 	<form action="editProfileAbout" method="post">
					 		
					 		<input type="text"  value="<jsp:expression>name</jsp:expression>" name="name1" placeholder="Name" class="textfield_design" /><br>
					 		<input id="changegender_tf" type="text"  name="gender1" value="<jsp:expression>gender</jsp:expression>" placeholder="" class="textfield_readonly" readonly="readonly" />
					 			<select id="changegender" onchange="changeGender()" style="border-radius: 4px; padding: 5px 10px;">
					 				<option>Change Gender</option>
					 				<option>Male</option>
					 				<option>Female</option>
					 			</select><br>
					 		
					 		<input type="text" id="changeCity_tf" value="<jsp:expression>city</jsp:expression>" class="textfield_readonly" readonly="readonly" />
					 		
					 		<!-- =========Select State and City using JavaScript =============  -->
						
							<select onchange="print_city('state', this.selectedIndex);" id="sts" class="textfield_design" required></select>
							<select onchange="showCity()" id ="state" class="textfield_design" name ="city1"  required></select><br>
							<script type="text/javascript">
							 print_state("sts");
							</script>
						
							
					
					 		
					 		<input type="text"  value="<jsp:expression>title</jsp:expression>" name="title1" class="textfield_design" placeholder="Profile Title" /><br>							
							<textarea rows="5" cols="7" placeholder="Skills"  name="skills1" class="textfield_design" ><jsp:expression>skills</jsp:expression></textarea><br>
							
							<input type="submit" value="Update"  class="btn btn-danger"/>
					 	</form>		
					 			
					</div>
				</div>
			
			 	
			</div>
			<div class="col-md-2"></div>
	 </div>
	 
	  
	  <jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>