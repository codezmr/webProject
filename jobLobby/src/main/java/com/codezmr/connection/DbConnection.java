package com.codezmr.connection;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

public class DbConnection {

	static Connection con;
	
	public static Connection getConnect() { 
		
		String jdbc_url = null, username = null, password = null;
		try {
			
			InputStream is = DbConnection.class.getResourceAsStream("/com/codezmr/resources/db.properties");
			Properties p = new Properties();
			p.load(is);
			
			jdbc_url = p.getProperty("jdbc-url");
			username = p.getProperty("username");
			password = p.getProperty("password");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			
			
			
			MysqlDataSource ds = new MysqlDataSource();
			ds.setURL(jdbc_url);
			ds.setUser(username);
			ds.setPassword(password);
			
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}
	
}
