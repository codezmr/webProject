package com.codezmr.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Register extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	 {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String name2 = req.getParameter("name1");
		String email2 = req.getParameter("email1");
		String pass2 = req.getParameter("pass1");
		String gender2 = req.getParameter("gender1");
		String[] field2 = req.getParameterValues("field1");
		
			String fields2 = "";
			for(String s: field2) {
				fields2 = fields2 + s + ",";
			}
		String city2 = req.getParameter("city1");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/joblobby", "root", "codezmr");			
			PreparedStatement ps1 = con.prepareStatement("insert into register(name, email, password, gender, field, city) values(?,?,?,?,?,?)");
			ps1.setString(1, name2);
			ps1.setString(2, email2);
			ps1.setString(3, pass2);
			ps1.setString(4, gender2);
			ps1.setString(5, fields2);
			ps1.setString(6, city2);
			int i1 = ps1.executeUpdate();
			
			PreparedStatement ps2 = con.prepareStatement("insert into about_user(email, about, skills) values(?,?,?)");
			ps2.setString(1, email2);
			ps2.setString(2, "");
			ps2.setString(3, "");
			int i2 = ps2.executeUpdate();
			
			
			
			if(i1>0 && i2>0) {
				
				HttpSession session = req.getSession();
				session.setAttribute("session_name", name2);
				session.setAttribute("session_email", email2);
				session.setAttribute("session_gender", gender2);
				session.setAttribute("session_city", city2);
				session.setAttribute("session_field", field2);
				
				resp.sendRedirect("profile.jsp");
				
			}else {
				out.print("User register failure.");
			}
			
		} catch (Exception e) {
			out.print(e);
		}
	 }
}
