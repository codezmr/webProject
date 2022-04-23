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

 <jsp:scriptlet>
			 String school = "", degree="", grade="", yearDuration="", edudesc = "", fromYear = "", toYear="";
			 Connection con = null;	 
			 try{
				 		con = DbConnection.getConnect();			
		   						   				
		   				PreparedStatement ps = con.prepareStatement("select * from education where id=?");
		   				ps.setString(1, id);
		   				 
		   				ResultSet rs = ps.executeQuery();
		   				while(rs.next()){
		   					school = rs.getString("school");
		   					degree = rs.getString("degree");
		   					grade = rs.getString("grade");
		   					yearDuration = rs.getString("yearDuration");
		   					edudesc = rs.getString("edudesc");
		   					
		   				}
		   				   String yd = yearDuration;
		   			       String[] parts = yd.split("-");
			   			   fromYear = parts[0];
			   			   toYear = parts[1];
	   			 }catch(Exception e){
	   				 out.println(e);
	   			 }finally{
	   				 try{
	   					 con.close();
	   				 }catch(Exception e2){
	   					 out.println(e2);
	   				 }
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
	  <jsp:include page="menubar.jsp"></jsp:include>
	  	
	  	
	  <div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row " style="border-radius: 10px; border: 1px solid gray; box-shadow: 0 0 10px #0000ff;">
					<div class="col-md-2" >
						<img alt="" src="images/logo.png" height="100" style="border-radius: 50%"/>
					</div>
					<div class="col-md-10">
						<h2>Edit Education Details</h2>
					    <h6><b><jsp:expression>name</jsp:expression><span style="font-size: 12px">(<jsp:expression>email</jsp:expression>)</span></b></h6>
						
					 	<form name="editEduForm" method="post">
					 		
					 		<input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1" />
					 		
					 		School/College <br><input type="text" value="<jsp:expression>school</jsp:expression>" name="school1" class="textfield_design" /><br>
					 		
					 		Degree <br><input type="text" value="<jsp:expression>degree</jsp:expression>" name="degree1" placeholder="Eg.10th/12th/B.tech..." class="textfield_design" /><br>
					 		
					 		Year Duration <br>  
					 			From <input type="number" min="2000" max="2099" step="1" value="<jsp:expression>fromYear</jsp:expression>" name= "fromyear1" style="border-radius: 5px; width: 100px"/> &nbsp;&nbsp;
					 			To <input type="number" min="2000" max="2099" step="1" value="<jsp:expression>toYear</jsp:expression>" name="toyear1" style="border-radius: 5px; width: 100px" /><br><br>
					 		
					 		Grade <br><input type="text" value="<jsp:expression>grade</jsp:expression>" name="grade1" placeholder="Eg.78% or 8.00"  class="textfield_design" /><br>							
							
							Description <br><textarea rows="5" cols="7"   name="edudesc1" class="textfield_design" ><jsp:expression>edudesc</jsp:expression>
							</textarea><br>
							
							<input type="submit" value="Update Education"  class="btn btn-danger" onclick="submitFun('update')"/>
							<input type="submit" value="Delete Education"  class="btn btn-danger" onclick="submitFun('delete')"/>
					 	</form>	<br>	
					 	
					</div>
				</div>
			
			 	
			</div>
			<div class="col-md-2"></div>
	 </div>
	 
	  
	  <jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>