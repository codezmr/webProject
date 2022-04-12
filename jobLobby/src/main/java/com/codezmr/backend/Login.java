package com.codezmr.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String email2 = req.getParameter("email1");
		String pass2 = req.getParameter("pass1");
		String remme2 = req.getParameter("rememberme1");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/joblobby", "root", "codezmr");
		
			PreparedStatement ps = con.prepareStatement("select * from register where email= ? and password = ?");
			ps.setString(1, email2);
			ps.setString(2, pass2);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				resp.sendRedirect("profile.jsp");
			}else {
				
				//resp.sendRedirect("login.jsp");
				RequestDispatcher rd1 = req.getRequestDispatcher("header.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2 = req.getRequestDispatcher("menubar.jsp");
				rd2.include(req, resp);
				
				RequestDispatcher rd3 = req.getRequestDispatcher("loginerror.jsp");
				rd3.include(req, resp);
				
				RequestDispatcher rd4 = req.getRequestDispatcher("logindiv.jsp");
				rd4.include(req, resp);
				
				RequestDispatcher rd5 = req.getRequestDispatcher("footer.jsp");
				rd5.include(req, resp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
