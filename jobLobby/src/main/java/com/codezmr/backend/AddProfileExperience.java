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

public class AddProfileExperience extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		String email2 = (String) session.getAttribute("session_email");
		
		String company2 = req.getParameter("company1");
		String location2 = req.getParameter("location1");
		
		String fromyear1 = req.getParameter("fromyear1");
		String toyear1 = req.getParameter("toyear1");
			String  yearDuration1 = fromyear1 +"-"+ toyear1;
		
		String jobtitle2 = req.getParameter("jobtitle1");
		String expdesc2 = req.getParameter("expdesc1");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/joblobby", "root", "codezmr");			
			PreparedStatement ps1 = con.prepareStatement("insert into experience(email, company, location, yearDuration, jobtitle, expdesc ) values(?,?,?,?,?,?)");
			ps1.setString(1, email2);
			ps1.setString(2, company2);
			ps1.setString(3, location2);
			ps1.setString(4, yearDuration1);
			ps1.setString(5, jobtitle2);
			ps1.setString(6, expdesc2);
			
			int i1 = ps1.executeUpdate();
			
			if(i1>0) {
				
				session.setAttribute("session_school", company2);
				
				resp.sendRedirect("profile.jsp");
			}else {
				RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2 = req.getRequestDispatcher("add_profile_experience.jsp");
				rd2.include(req, resp);
			}
			
			
		} catch (Exception e) {
			out.print(e);
		}
	}
}
