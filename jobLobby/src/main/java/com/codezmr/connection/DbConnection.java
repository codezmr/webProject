package com.codezmr.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	
	/* Use Connection Pooling
	 * Use Properties file
	 * Use static factory design pattern for connection 
	 * */
	
	static Connection con;
	static {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/joblobby", "root", "codezmr");			

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnect() { 
		
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/joblobby", "root", "codezmr");			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}
	
}
