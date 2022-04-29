<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.Connection" %>
<%@page import=" com.codezmr.connection.DbConnection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>

<jsp:scriptlet>
	String name   = (String) session.getAttribute("session_name");
	String email   = (String) session.getAttribute("session_email");
	String gender = (String) session.getAttribute("session_gender");
	String city   = (String) session.getAttribute("session_city");
	String title  = (String) session.getAttribute("session_title");
	String skills = (String) session.getAttribute("session_skills");
	
	String profile_pic = (String) session.getAttribute("session_profilepic");
 
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
		<title>Welcome: <jsp:expression>name.toUpperCase()</jsp:expression> </title>
		
		<!-- ========== For Bootstrap ============= -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >	
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    	
    	<!-- ========== For Goolge Fonts ========== -->
    	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600&display=swap" rel="stylesheet">
    	
		<!-- ===========For icon =============== -->    	
    	<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    	
    	<!-- =========== My Own CSS ================ -->
    	<link rel="stylesheet" type="text/css" href="css/style.css" />
   

	</head>
	<body>
	  <jsp:include page="profile_header.jsp"></jsp:include>
	 
	  	
	  	
	  <div class="row"><!-- <======> Main Div End -->
	   <div class="col-md-2"></div>
	   <div class="col-md-8">
	   
<!-- =========About Details Start==========  -->
	   	<div class="row " style="border-radius: 10px; border: 1px solid gray; box-shadow: 0px 0px 3px gray;">
	   		<div class="col-md-2" >
	   		
	   			 <a href="edit_profile_pics.jsp" class="icon_style" >
            		 <i class="ri-edit-2-fill" style="float: right"></i>
         		 </a>
         		 
	   			<img alt="<jsp:expression>profile_pic</jsp:expression>" src="profile_pics/<jsp:expression>profile_pic</jsp:expression>" height="100" style="border-radius: 50%"/>
	   			 
	   		</div>
	   		<div class="col-md-10">
	   			<h3 style="color: blue"><jsp:expression>name.toUpperCase()</jsp:expression>
	   			   
	   			      <a href="edit_profile_about.jsp" class="icon_style">
			             <i class="ri-edit-2-fill"></i>
			           </a>
			       
	   			</h3><br>
	   		
	   			<span class="profile_text_color">Title : </span><jsp:expression>title</jsp:expression><br>
	   			<span class="profile_text_color">Skills : </span><jsp:expression>skills</jsp:expression><br><br>
	   			
	   			<span class="profile_text_color">Gender : </span> <jsp:expression>gender</jsp:expression> <br>
	   			<span class="profile_text_color">City : </span> <jsp:expression>city</jsp:expression><br>
	   			
	   			
	   			
	   		</div>
	   	</div><br>
<!-- =========About Details End==========  -->	 

  	
<!-- =========Education Details Start==========  -->
	   	
	   	<div class="row" style="border-radius: 10px; border: 1px solid gray; box-shadow: 0px 0px 3px gray;">
	   		
	   		<div class="col-md-12">
	   			<h4> <b>Education Details</b> 
   			        <a href="add_profile_education.jsp" class="icon_style ">
		             <i class="ri-add-fill"></i>
		            </a>	   
	   			 </h4>
	   			 
	   			 <jsp:scriptlet>
	   			 	
	   			 String school = "", degree="", grade="", yearDuration="", id="";
	   			 Connection con = null;
	   			 try{
	   				 
	   				 con = DbConnection.getConnect();
	   				 PreparedStatement ps = con.prepareStatement("SELECT * from education where email=? ORDER BY id DESC ");
	   				 ps.setString(1, email);
	   				 
	   				ResultSet rs = ps.executeQuery();
	   				while(rs.next()){
	   					
	   					id = rs.getString("id");
	   					school = rs.getString("school");
	   					degree = rs.getString("degree");
	   					grade = rs.getString("grade");
	   					yearDuration = rs.getString("yearDuration");
	   			 </jsp:scriptlet>
	   			
	   				<div class="row" style="background-color: #eeecec; border-radius: 5px;">
	   					<div class="col-md-2">&nbsp; &nbsp; &nbsp;<img alt="edu.png" src="images/edu.png" height="50" style="margin-top: 30%;"></div>
	   					<div class="col-md-10">
	   					
	   							<!-- URL re-writing  -->
	   						 <a href="edit_profile_education.jsp?id=<jsp:expression>id</jsp:expression>" class="icon_style">
			             		 <i class="ri-edit-2-fill"></i>
			          		 </a>
	   					
	   						<i class="ri-building-4-line"></i><b></span>&nbsp;<jsp:expression>school</jsp:expression></b><br>
	   						<i class="ri-book-open-line"></i>&nbsp;<jsp:expression>degree</jsp:expression>
	   						<span style="color: #858585">(<jsp:expression>yearDuration</jsp:expression>)</span><br>
	   						<i class="ri-medal-line"></i>&nbsp;<jsp:expression>grade</jsp:expression><br>
	   					</div>
	   				</div><br>
	   			
	   					
	   			 <jsp:scriptlet>
	   					
	   				}
	   				
	   			 }catch(Exception e){
	   				 out.print(e);
	   			 }
	   				
	   			 
	   			 </jsp:scriptlet>
	   			 
	   		</div>
	   		
	   	
	   	</div> <br><br>
<!-- =========Education Details End==========  -->
	   	
	   	
	   	
	   	
<!-- =========Experience Details Start==========  -->

	   	<div class="row" style="border-radius: 10px; border: 1px solid gray; box-shadow: 0px 0px 3px gray;">
   		
   		<div class="col-md-12">
   			<h4> <b>Experience Details</b> 
  			        <a href="add_profile_experience.jsp" class="icon_style ">
	             <i class="ri-add-fill"></i>
	            </a>	   
   			 </h4>
   			 
   			 <jsp:scriptlet>
   			 	
    			 String company1 = "", location1 ="", jobtitle1 ="", yearDurationExp1 ="", idExp1 ="" , expdesc1="";
    			 Connection con2 = null;
    			 try{
   				 
   				con2 = DbConnection.getConnect();
   				PreparedStatement ps = con.prepareStatement("select * from experience where email=? ORDER BY id DESC");
   				ps.setString(1, email);
   				 
   				ResultSet rs = ps.executeQuery();
   				while(rs.next()){
   					
   					idExp1 = rs.getString("id");
   					company1 = rs.getString("company");
   					location1 = rs.getString("location");
   					jobtitle1 = rs.getString("jobtitle");
   					yearDurationExp1 = rs.getString("yearDuration");
   					expdesc1 = rs.getString("expdesc");
   			 </jsp:scriptlet>
   			
   				<div class="row" style="background-color: #eeecec; border-radius: 5px;">
   					<div class="col-md-2">&nbsp; &nbsp; &nbsp;<img alt="expr.png" src="images/expr.png" height="40" style="margin-top: 40%"></div>
   					<div class="col-md-10">
   					
   							<!-- URL re-writing  -->
   						 <a href="edit_profile_experience.jsp?id=<jsp:expression>idExp1</jsp:expression>" class="icon_style">
		             		 <i class="ri-edit-2-fill"></i>
		          		 </a>
   					
   						 <i class="ri-team-fill"></i><b> &nbsp;<jsp:expression>company1</jsp:expression></b><br>
   						 <i class="ri-map-pin-2-fill"></i>&nbsp;<jsp:expression>location1</jsp:expression><br>
   						 <i class="ri-send-plane-fill"></i>&nbsp;<jsp:expression>yearDurationExp1</jsp:expression>
   						    <abbr title="<jsp:expression>expdesc1</jsp:expression>" style="text-decoration: none;">
   						      <span style="color: #858585; font-size: 13px; cursor: zoom-in;" >(Experience)</span>
   						    </abbr><br>
				
   						 <i class="ri-user-2-fill"></i>&nbsp;<jsp:expression>jobtitle1</jsp:expression><br>
   					</div>
   				</div><br>
   			
   					
   			 <jsp:scriptlet>
   					
   				}
   				
   			 }catch(Exception e){
   				 out.print(e);
   			 }finally{
   				 try{
   					 con2.close();
   				 }catch(Exception e2){
   					 out.println(e2);
   				 }
   			 }
   			 
   			 </jsp:scriptlet>
   			 
   	   	</div>
   		
   	
   	   </div> <br><br>


<!-- =========Experience Details End============  -->
	   	
	   	<div class="row" style="background-color: #ececec; border-radius: 10px">
	   		<div class="col-md-2"></div>
	   		<div class="col-md-8">
	   			<input type="submit" value="Follow" style="border-radius: 5px"/>
	   		</div>
	   		<div class="col-md-2"></div>
	   	</div>
	   	
	   	
	   </div>
	   <div class="col-md-2"></div>
	   
	  </div><!-- <======> Main Div End -->
	 
	  
	  <jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>