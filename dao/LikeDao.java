package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {
	Connection con;
	
	
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}


	public boolean insertLike(int pid,int uid) {
		
		boolean f=false;
		
		try {
			String query="insert into liketable(pid,uid)values (?,?)";
			PreparedStatement p=this.con.prepareStatement(query);
			p.setInt(1, pid);
			p.setInt(2, uid);
			
			p.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
		
		
	}
	
	public int countLikeOnPost(int pid) {
		
		int count=0;
		
		String query="select count(*) from liketable where pid=?";
		
		try {
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1,pid);
			
			ResultSet set=ps.executeQuery();
			
			if(set.next()) {
				count=set.getInt("count(*)");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		return count;
		
	}
	
	public boolean isLikedByUser(int pid,int uid) {
		boolean f=false;
		
		String query="select * from liketable where pid=? AND uid=?";
		
		try {
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1,pid);
			ps.setInt(2, uid);
			
			ResultSet set=ps.executeQuery();
			
			if(set.next()) {
				f=true;
			}
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteLike(int pid, int uid)
	{
		boolean f=false;
		
		try {
			
			PreparedStatement ps=this.con.prepareStatement("delete from liketable where pid=? AND uid=?");
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			
			ps.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		return f;
	}

}
