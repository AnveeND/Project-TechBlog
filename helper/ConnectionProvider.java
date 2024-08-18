package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
   private static Connection con;
	public static Connection getConnection() {
		try {
			if(con==null || con.isClosed()) {
				try {
				Class.forName("com.mysql.cj.jdbc.Driver");}
				catch(Exception e) {System.out.print("Failed to load driver");}
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","hello@123");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		return con;
		
	}

}
