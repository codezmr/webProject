<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.Connection" %>
<%@page import=" com.codezmr.connection.DbConnection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>

<jsp:scriptlet>

 	String name   = (String) session.getAttribute("session_name");
 	String email   = (String) session.getAttribute("session_email");
 
	
 	if(name==null || name.equals("")){
 		response.sendRedirect("login.jsp");
 	}
 	
 	String id = request.getParameter("id");

 	
</jsp:scriptlet>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Resume Builder</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >	
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" >
		<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600&display=swap" rel="stylesheet">
    	
    	<link rel="stylesheet" type="text/css" href="css/style.css" />
   			
   		<script type="text/javascript">
   			function submitFun(clicked){
   				
   				if(clicked === 'update'){
   					
   					document.editEduForm.action = "editProfileEducation";
   					document.editEduForm.submit();
   					
   				}if(clicked === 'delete'){
   					document.editEduForm.action = "deleteProfileEducation";
   					document.editEduForm.submit();
   				}
   			}
   		</script>
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
						<h2>Build Resume</h2>
						
					 	<form name="editEduForm" method="post">
					 		
					 		<input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1" />
					 		
					 		<span class="disable">Name</span>  <br><input type="text" value="<jsp:expression>name</jsp:expression>" name="name1" class="textfield_design"/><br>
					 		<span class="disable">Email</span><br><input type="text" value="<jsp:expression>email</jsp:expression>" name="email1" class="textfield_design"/><br>
					 		
					 		<span class="disable">Address</span><br><textarea placeholder="Address" class="textfield_design" style="height: 70px" name="address1"></textarea><br>
					 		
					 		<span class="disable">Career Objective</span><br><textarea placeholder="Career Objective" class="textfield_design" style="height: 70px" name="careerObjective1"></textarea><br>  
					 		
<!-- ======= For Education Start-->		
							<span class="disable">Education Qualification</span><br>			 		
					 		<jsp:scriptlet>
					 				
					 			String school_rb = "", year_rb = "", degree_rb = "", grade_rb ="";
					 			try{
					 				
					 				Connection con2 = DbConnection.getConnect();
					 				PreparedStatement ps2 = con2.prepareStatement("Select * from education where email=?");
					 				
					 				ps2.setString(1, email);
					 				ResultSet rs2 = ps2.executeQuery();
					 				
					 				while(rs2.next()){
					 					
					 					school_rb = rs2.getString("school");
					 					year_rb = rs2.getString("yearDuration");
					 					degree_rb = rs2.getString("degree");
					 					grade_rb = rs2.getString("grade");
					 					
					 			</jsp:scriptlet>
					 				
					 				<!-- <span class="disable">School</span> -->
					 				<input type="text" value="<jsp:expression>school_rb</jsp:expression>" />	
					 					
					 				<!-- <span class="disable">Year</span>	 -->	
					 				<input type="text" value="<jsp:expression>year_rb</jsp:expression>" style="width: 70px;"/>	
					 					
					 				<!-- <span class="disable">Degree</span>	 -->
					 				<input type="text" value="<jsp:expression>degree_rb</jsp:expression>" style="width: 100px;" />	
					 					
					 				<!-- <span class="disable">Grade</span> -->		
					 				<input type="text" value="<jsp:expression>grade_rb</jsp:expression>" style="width: 70px;"/>	
					 				<br>		
					 					
					 			<jsp:scriptlet>
					 				}
					 				
					 				
					 			}catch(Exception e){
					 				out.println("Exception in Education section : "+ e);
					 				e.printStackTrace();
					 			}
					 		</jsp:scriptlet> <br> 
<!-- ======= For Education End -->		

				 		
<!-- ======= For Experience strat -->	
				 		
				 			<span class="disable">Work Experience</span><br>
					 		<jsp:scriptlet>
					 				
					 			String company_rb = "", yearDuration_rb = "", location_rb = "", jobtitle_rb ="";
					 			try{
					 				
					 				Connection con3 = DbConnection.getConnect();
					 				PreparedStatement ps3 = con3.prepareStatement("Select * from experience where email=?");
					 				
					 				ps3.setString(1, email);
					 				ResultSet rs3 = ps3.executeQuery();
					 				
					 				while(rs3.next()){
					 					
					 					company_rb = rs3.getString("company");
					 					yearDuration_rb = rs3.getString("yearDuration");
					 					location_rb = rs3.getString("location");
					 					jobtitle_rb = rs3.getString("jobtitle");
					 					
					 			</jsp:scriptlet>
					 				
					 				
					 				<input type="text" value="<jsp:expression>company_rb</jsp:expression>" />	
					 					
					 				
					 				<input type="text" value="<jsp:expression>yearDuration_rb</jsp:expression>" style="width: 70px;"/>	
					 					
					 				
					 				<input type="text" value="<jsp:expression>location_rb</jsp:expression>" style="width: 100px;" />	
					 					
					 					
					 				<input type="text" value="<jsp:expression>jobtitle_rb</jsp:expression>" style="width: 70px;"/>	
					 				<br>		
					 					
					 			<jsp:scriptlet>
					 				}
					 				
					 				
					 			}catch(Exception e){
					 				out.println("Exception in Experience section : "+ e);
					 				e.printStackTrace();
					 			}
					 		</jsp:scriptlet><br>
					 		
<!-- ======= For Experience end -->	

							<span class="disable">Hobbies</span><br><textarea placeholder="Hobbies" class="textfield_design" style="height: 70px" name="hobbies1"></textarea><br>
							
							<span class="disable">Personal Details</span><br> 
							
							
							<span class="disable">Date Of Birth</span><br>
							<input type="date" class="textfield_design"><br>
							
							<span class="disable">Gender/ Marital Status</span><br>
							<input type="text" class="textfield_design"><br>
							
							<span class="disable">Language Proficiency</span><br>
							<input type="text" class="textfield_design"><br>
							
							
							<input type="submit" value="Build Resume" class="btn btn-success"/><br>
							
												 		
					    </form>	<br>	
					 	
					</div>
				</div>
			
			 	
			</div>
			<div class="col-md-2"></div>
	 </div>
	 
	  
	  <jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>