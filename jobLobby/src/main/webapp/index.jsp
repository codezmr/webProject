<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Job Lobby</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >	
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600&display=swap" rel="stylesheet">
    	
    	<link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    
	<body>
      <div class="container-fluid">
		 <jsp:include page="header.jsp"></jsp:include>
		<br><br>
	     
	     <div class="row">     	 
	     	 <object data="svg_file/interview.svg" width="300" height="300"> </object>
	     	
	     </div>
	     
	     <!-- ==================Search Job div Start====================== -->
	     <div class="row">
	       <div class="col-md-2"></div>
	       <div class="col-md-8 jab_search_div">
	       	 <h3> Find A Job at India's No. 1 Job Site </h3>
	       	 <br>
	         <input type="text" placeholder="Technology" class="textfield_design"/>
	         <input type="text" placeholder="Location" class="textfield_design"/>
	         <input type="submit" value="search" class="btn btn-primary"/>
	       </div>
	       <div class="col-md-2"></div>
	     </div>
	      <!-- ==================Search Job div End====================== -->
	      
	      <div class="row">
	      	<div class="col-md-3">
	      		<ul>
	      			<li><a href=""> IBM </a></li>
	      			<li><a href=""> Wipro </a></li>
	      			<li><a href=""> Uber </a></li>
	      			<li><a href=""> Flipkart </a></li>
	      			<li><a href=""> Infosys </a></li>
	      		</ul>
	      	</div> 
	      	
	      	<!-- ============Display Job start ================= -->
	      	
	      	<div class="col-md-6 " >
	      		<div class="row">
	      			<div class="col-md-12  display_job_style">
	      				<b>Java Software Devloper</b> <br> 
	      				<span>Company : CodeZMR</span><br> 
	      				<span>0-2 Years</span> <br>
	      				<span>Writing efficient code and documnet it as per the design specification.</span><br> 
	      				<a href="">See Full Details</a>
	      			</div>
	      			
	      			<div class="col-md-12 display_job_style">
	      				<b>Web Devloper</b> <br>
	      				<span>Company : CodeZMR</span> <br>
	      				<span>0-2 Years</span> <br>
	      				<span>Writing efficient code and documnet it as per the design specification.</span> <br>
	      				<a href="">See Full Details</a>
	      			</div>
	      			
	      			<div class="col-md-12 display_job_style">
	      				<b>Spring Devloper</b> <br>
	      				<span>Company : CodeZMR</span> <br>
	      				<span>0-2 Years</span> <br>
	      				<span>Writing efficient code and documnet it as per the design specification.</span><br> 
	      				<a href="">See Full Details</a>
	      			</div>
	      			
	      			<div class="col-md-12 display_job_style">
	      				<b>Cloud Engineer</b> <br>
	      				<span>Company : CodeZMR</span> <br>
	      				<span>0-2 Years</span> <br>
	      				<span>Writing efficient code and documnet it as per the design specification.</span> <br>
	      				<a href="">See Full Details</a>
	      			</div>
	      		</div>
	      	</div>
	      	
	      		<!-- ============Display Job Ends ================= -->
	      	
	      	<div class="col-md-3">
	      		<ul>
	      			<li>
	      				<a href="" class="company_name"> <img alt="ibm logo" src="https://www.ibm.com/brand/experience-guides/developer/b1db1ae501d522a1a4b49613fe07c9f1/01_8-bar-positive.svg" height="50" style="border-radius: 100%; margin-right: 5px">IBM </a>
	      			</li>
	      			<li>
	      				<a href="" class="company_name"> <img alt="ibm logo" src="https://www.ibm.com/brand/experience-guides/developer/b1db1ae501d522a1a4b49613fe07c9f1/01_8-bar-positive.svg" height="50" style="border-radius: 100%; margin-right: 5px">IBM </a>
	      			</li>
	      			<li>
	      				<a href="" class="company_name"> <img alt="ibm logo" src="https://www.ibm.com/brand/experience-guides/developer/b1db1ae501d522a1a4b49613fe07c9f1/01_8-bar-positive.svg" height="50" style="border-radius: 100%; margin-right: 5px">IBM </a>
	      			</li>
	      			<li>
	      				<a href="" class="company_name"> <img alt="ibm logo" src="https://www.ibm.com/brand/experience-guides/developer/b1db1ae501d522a1a4b49613fe07c9f1/01_8-bar-positive.svg" height="50" style="border-radius: 100%; margin-right: 5px">IBM </a>
	      			</li>
	      			<li>
	      				<a href="" class="company_name"> <img alt="ibm logo" src="https://www.ibm.com/brand/experience-guides/developer/b1db1ae501d522a1a4b49613fe07c9f1/01_8-bar-positive.svg" height="50" style="border-radius: 100%; margin-right: 5px">IBM </a>
	      			</li>
	      		</ul>
	      	</div>
	      </div>
	      

	     <jsp:include page="footer.jsp"></jsp:include>
	  

	  	
	  	
	  </div>
		
	</body>
</html>