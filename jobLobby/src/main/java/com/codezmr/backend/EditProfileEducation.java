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

public class EditProfileEducation extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		String email2 = (String) session.getAttribute("session_email");
		
		
		
		String id2 = req.getParameter("id1");
		String school2 = req.getParameter("school1");
		String degree2 = req.getParameter("degree1");
		
		String fromyear1 = req.getParameter("fromyear1");
		String toyear1 = req.getParameter("toyear1");
			String  yearDuration1 = fromyear1 +"-"+ toyear1;
		
		String grade2 = req.getParameter("grade1");
		String edudesc2 = req.getParameter("edudesc1");
		
		Connection con = null;
		
		try {
			con = DbConnection.getConnect();
			con.setAutoCommit(false);
			
			PreparedStatement ps1 = con.prepareStatement("update education set school = ?, degree=?, yearDuration=?, grade=?, edudesc=? where id=?");
		
			ps1.setString(1, school2);
			ps1.setString(2, degree2);
			ps1.setString(3, yearDuration1);
			ps1.setString(4, grade2);
			ps1.setString(5, edudesc2);
			ps1.setString(6, id2);
			
			int i1 = ps1.executeUpdate();
			
			if(i1>0) {
					con.commit();			
				resp.sendRedirect("profile.jsp");
			}else {
				con.rollback();
				RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2 = req.getRequestDispatcher("edit_profile_education.jsp");
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
			
			RequestDispatcher rd2 = req.getRequestDispatcher("edit_profile_education.jsp");
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
