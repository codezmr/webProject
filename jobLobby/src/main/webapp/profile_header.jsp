<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:scriptlet>
    String name=(String)session.getAttribute("session_name");
    String gender=(String)session.getAttribute("session_gender");
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title> Welcome : <jsp:expression> name </jsp:expression> </title>
    </head>
    <body>
        <div class="row header_bg">
            <div class="col-md-4">
                <img src="images/smartprogramminglogo.png" height="50" />
                <span class="logo_text_design"> Job Portal </span>
            </div>
            <div class="col-md-6">
                <span style="color: yellow"> Welcome : <a href="Profile.jsp"> <jsp:expression> name </jsp:expression> </a> </span>
            </div>
            <div class="col-md-2">
                <a href="Logout" class="hyperlinks_design"> Logout </a>
            </div>
        </div>
    </body>
</html>