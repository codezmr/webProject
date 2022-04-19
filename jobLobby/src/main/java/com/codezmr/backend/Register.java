package com.codezmr.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.codezmr.connection.DbConnection;

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
		
		Connection con = null;
		
		try {
			con = DbConnection.getConnect();
			con.setAutoCommit(false);
			
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
				
				con.commit();
				HttpSession session = req.getSession();
				session.setAttribute("session_name", name2);
				session.setAttribute("session_email", email2);
				session.setAttribute("session_gender", gender2);
				session.setAttribute("session_city", city2);
				session.setAttribute("session_field", field2);
				
				session.setAttribute("session_title", "");
				session.setAttribute("session_skills", "");
				
				resp.sendRedirect("profile.jsp");
				
			}else {
				con.rollback();
				RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
				rd2.include(req, resp);
			}
			
		} catch (Exception e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
			rd1.include(req, resp);
			
			RequestDispatcher rd2 = req.getRequestDispatcher("register.jsp");
			rd2.include(req, resp);
		}finally {
			try {
				con.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	 }
}
