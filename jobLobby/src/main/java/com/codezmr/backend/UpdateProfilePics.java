package com.codezmr.backend;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.codezmr.connection.DbConnection;

public class UpdateProfilePics extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("session_email");
	
		String file_name = "";
		try { 
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			ServletFileUpload sfu = new ServletFileUpload(factory);
			
			
			List<FileItem> items = sfu.parseRequest(req);
			
			FileItem item = items.get(0);
			
			String file_path = item.getName();
			
			
			File file = new File(file_path);
			file_name = file.getName();
			
			File f1 = new File(PathDetails.PROFILE_PIC_PATH + file_name);
		
			item.write(f1);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		Connection con = null;
		
		try {
			
			con = DbConnection.getConnect();
			con.setAutoCommit(false);
			
			PreparedStatement ps = con.prepareStatement("update profile_pic set path=? where email=?");
			ps.setString(1, file_name);
			ps.setString(2, email);
			
			int i = ps.executeUpdate();
			
			
			if(i>0) {
				session.setAttribute("session_profilepic", file_name);
				con.commit();
				
				
				resp.sendRedirect("profile.jsp");
				
			}
			else {
				con.rollback();
				
				RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				
				RequestDispatcher rd2 = req.getRequestDispatcher("edit_profile_pics.jsp");
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
			
			RequestDispatcher rd2 = req.getRequestDispatcher("edit_profile_pics.jsp");
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
