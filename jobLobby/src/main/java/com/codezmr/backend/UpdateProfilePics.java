package com.codezmr.backend;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UpdateProfilePics extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		try {
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			ServletFileUpload sfu = new ServletFileUpload(factory);
			
			
			List<FileItem> items = sfu.parseRequest(req);
			
			FileItem item = items.get(0);
			
			String file_path = item.getName();
			
			
			File file = new File(file_path);
			String file_name = file.getName();
			
			File f1 = new File(PathDetails.PROFILE_PIC_PATH + file_name);
		
			item.write(f1);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
}
