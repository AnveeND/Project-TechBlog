package com.tech.blog.dao;
import java.sql.*;
import com.tech.blog.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		
		this.con = con;
	}
	
	// method to insert user to database
	
	public boolean saveUser(User user) {
		boolean f=false;
		try {
			
			// insert user to database.
			
			String query="insert into user(name,email,password,gender) values(?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.executeUpdate();
			f=true;
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	//get user by user email and user password
	
	public User getUserByEmailAndPassword(String email, String password) {
		User user=null;
		try {
			
			String query="Select * from user where email=? and password=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set=pstmt.executeQuery();
			
			if(set.next()) {
				user=new User();
				String name=set.getString("name");  // getting data from database
				user.setName(name);                 // setting the data in user
				
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();		
			}
		
		return user;
		
	}
	
	public boolean updateUser(User user) {
		boolean f=false;
		try {
			
			String query="update user set name=? , email=? , password=? , gender=? , profile=? where id=?";
			PreparedStatement p=con.prepareStatement(query);
			p.setString(1, user.getName());
			p.setString(2, user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4, user.getGender());
			p.setString(5, user.getProfile());
			p.setInt(6,user.getId());
			
			p.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	public User getUserByUserID(int uid) {
		
		User us=null;
		
		String query="select * from user where id=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, uid);
			
			ResultSet set=ps.executeQuery();
			if(set.next()){
				us=new User();
				us.setId(uid);
				us.setName(set.getString("name"));
				us.setEmail(set.getString("email"));
				us.setPassword(set.getString("password"));
				us.setGender(set.getString("gender"));
				us.setDateTime(set.getTimestamp("rdate"));
				us.setProfile(set.getString("profile"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return us;
		
	}
	

}
