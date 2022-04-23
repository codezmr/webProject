package com.codezmr.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codezmr.connection.DbConnection;

public class DeleteProfileExperience extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id2 = req.getParameter("id1");
		
		Connection con = null;
		
		try {
			
			con = DbConnection.getConnect();
			con.setAutoCommit(false);
			
			PreparedStatement ps = con.prepareStatement("delete from experience where id=?");
			ps.setString(1, id2);
			
			int i = ps.executeUpdate();
			
			if(i>0) {
				con.commit();
				resp.sendRedirect("profile.jsp");
				
			}
			else {
				con.rollback();
				
				RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2 = req.getRequestDispatcher("edit_profile_experience.jsp");
				rd2.include(req, resp);
			}
			
		} catch (Exception e) {
			try {
				con.rollback();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
			rd1.include(req, resp);
			
			RequestDispatcher rd2 = req.getRequestDispatcher("edit_profile_experience.jsp");
			rd2.include(req, resp);
		}
		finally {
			try {
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
