package com.codezmr.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditProfileAbout extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		
		
		String email2 = (String)session.getAttribute("session_email");
		String name2 = req.getParameter("name1");
		String city2 = req.getParameter("city1");
		String gender2 = req.getParameter("gender1");
		String title2 = req.getParameter("title1");
		String skills2 = req.getParameter("skills1");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/joblobby", "root", "codezmr");			
			PreparedStatement ps1 = con.prepareStatement("update register set name=?, city=?, gender=? where email=?");
			
			ps1.setString(1, name2);
			ps1.setString(2, city2);
			ps1.setString(3, gender2);
			ps1.setString(4, email2);
			int i1 = ps1.executeUpdate();
			
			PreparedStatement ps2 = con.prepareStatement("update about_user set about=?, skills=? where email=?");
			ps2.setString(1, title2);
			ps2.setString(2, skills2);
			ps2.setString(3, email2);
			int i2 = ps1.executeUpdate();
			
			
			if(i1>0 && i2>0) {
				
				
				session.setAttribute("session_name", name2);
				session.setAttribute("session_email", email2);
				session.setAttribute("session_gender", gender2);
				session.setAttribute("session_city", city2);
				
				session.setAttribute("session_title", title2);
				session.setAttribute("session_skills", skills2);
				
				
				resp.sendRedirect("profile.jsp");
				
			}else {
				
				RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2 = req.getRequestDispatcher("edit_profile_about.jsp");
				rd2.include(req, resp);
				
			}
			
			
		} catch (Exception e) {
			out.print(e);
		}
	}
}
