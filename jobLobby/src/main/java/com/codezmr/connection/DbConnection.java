package com.codezmr.connection;

import java.sql.Connection;
import java.sql.DriverManager;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

public class DbConnection {

	static Connection con;
	
	public static Connection getConnect() { 
		
		try {
			
			/*
			 * Class.forName("com.mysql.jdbc.Driver");
			 * 
			 * con = DriverManager.getConnection("jdbc:mysql://localhost:3306/joblobby",
			 * "root", "codezmr");
			 */
			
			MysqlDataSource ds = new MysqlDataSource();
			ds.setURL("jdbc:mysql://localhost:3306/joblobby");
			ds.setUser("root");
			ds.setPassword("codezmr");
			
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}
	
}
