package com.codezmr.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codezmr.connection.DbConnection;

public class AddProfileEducation extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		String email2 = (String) session.getAttribute("session_email");
		
		String school2 = req.getParameter("school1");
		String degree2 = req.getParameter("degree1");
		
		String fromyear1 = req.getParameter("fromyear1");
		String toyear1 = req.getParameter("toyear1");
			String  yearDuration1 = fromyear1 +"-"+ toyear1;
		
		String grade2 = req.getParameter("grade1");
		String edudesc2 = req.getParameter("edudesc1");
		
		try {
			Connection con = DbConnection.getConnect();
			
			PreparedStatement ps1 = con.prepareStatement("insert into education(email, school, degree, yearDuration, grade, edudesc ) values(?,?,?,?,?,?)");
			ps1.setString(1, email2);
			ps1.setString(2, school2);
			ps1.setString(3, degree2);
			ps1.setString(4, yearDuration1);
			ps1.setString(5, grade2);
			ps1.setString(6, edudesc2);
			
			int i1 = ps1.executeUpdate();
			
			if(i1>0) {
				
				session.setAttribute("session_school", school2);
				
				resp.sendRedirect("profile.jsp");
			}else {
				RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2 = req.getRequestDispatcher("add_profile_education.jsp");
				rd2.include(req, resp);
			}
			
			
		} catch (Exception e) {
			out.print(e);
		}
	}
}
