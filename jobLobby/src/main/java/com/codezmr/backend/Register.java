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
			PreparedStatement ps = con.prepareStatement("insert into register(name, email, password, gender, field, city) values(?,?,?,?,?,?)");
			ps.setString(1, name2);
			ps.setString(2, email2);
			ps.setString(3, pass2);
			ps.setString(4, gender2);
			ps.setString(5, fields2);
			ps.setString(6, city2);
			
			int i = ps.executeUpdate();
			if(i>0) {
				
				resp.sendRedirect("profile.jsp");
				
			}else {
				out.print("User register failure.");
			}
			
		} catch (Exception e) {
			out.print(e);
		}
	 }
}
