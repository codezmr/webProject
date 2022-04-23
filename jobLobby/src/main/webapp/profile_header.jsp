<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:scriptlet>
    String name=(String)session.getAttribute("session_name");
	String profile_pic = (String) session.getAttribute("session_profilepic");

</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title> Welcome : <jsp:expression> name.toUpperCase() </jsp:expression> </title>
   		<link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <div class="row header_bg" >
            <div class="col-md-4">
                <img src="images/logo.png" height="50" />
                <span class="header-text-design"> Job Portal </span>
            </div>

			<div class="col-md-4" style="text-align:center;">
			  <img src="profile_pics/<jsp:expression>profile_pic</jsp:expression>" height="30">
			  <a href="profile.jsp" class="header-text-design" style=""> <jsp:expression> name.toUpperCase() </jsp:expression> </a>
			</div>

            <div class="col-md-4" style="text-align:right;" >
                <a href="Logout" class="header-text-design" > Logout </a>
            </div>
        </div>
    </body>
</html>