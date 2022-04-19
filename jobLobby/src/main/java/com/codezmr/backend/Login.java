package com.codezmr.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codezmr.connection.DbConnection;

public class Login extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String email2 = req.getParameter("email1");
		String pass2 = req.getParameter("pass1");
		String remme2 = req.getParameter("rememberme1");
		
		String name2="", gender2="", city2="", field2="" ;
		
		try {
			Connection con = DbConnection.getConnect();
			PreparedStatement ps = con.prepareStatement("select * from register where email= ? and password = ?");
			ps.setString(1, email2);
			ps.setString(2, pass2);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				
				name2 = rs.getString("name");
				gender2 = rs.getString("gender");
				city2 = rs.getString("city");
				field2 = rs.getString("field");
				
				HttpSession session = req.getSession();
				session.setAttribute("session_name", name2);
				session.setAttribute("session_email", email2);
				session.setAttribute("session_gender", gender2);
				session.setAttribute("session_city", city2);
				session.setAttribute("session_field", field2);
				
				String title = "", skills = "";
				PreparedStatement ps2 = con.prepareStatement("select * from about_user where email=?");
				ps2.setString(1, email2);
				
				ResultSet rs2 = ps2.executeQuery();
				while(rs2.next()) {
					title = rs2.getString("about");
					skills = rs2.getString("skills");
				}
				
				session.setAttribute("session_title", title);
				session.setAttribute("session_skills", skills);
				
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
