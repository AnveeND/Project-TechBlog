package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}


	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list=new ArrayList<>();
		try {
			String q="select * from categories";

			Statement st=con.createStatement();
			ResultSet set=st.executeQuery(q);

			while(set.next()) {
				int cid=set.getInt("cid");
				String name=set.getString("name");
				String description = set.getString("Description");
				Category c=new Category(cid,name,description);
				list.add(c);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public boolean savePost(Post p) {
		boolean f=false;

		try {
			String q="insert into posts (ptitle,pcontent,pcode,ppics,catid,userId) values (?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setString(1,p.getPtitle());
			pstmt.setString(2, p.getPcontent());
			pstmt.setString(3, p.getPcode());
			pstmt.setString(4, p.getPpic());
			pstmt.setInt(5, p.getCatid());
			pstmt.setInt(6, p.getUserId());

			pstmt.executeUpdate();
			f=true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}


		return f;
	}


	// get all the posts 

	public List<Post> getAllPosts(){

		List<Post> list=new ArrayList<>();
		//fetch all the posts

		try {

			PreparedStatement p= con.prepareStatement("select * from posts order by pid desc");

			ResultSet set=p.executeQuery();

			while(set.next()) {


				int pid=set.getInt("pid");
				String ptitle=set.getString("ptitle");
				String pcontent=set.getString("pcontent");
				String pcode=set.getString("pcode");
				String ppics=set.getString("ppics");
				Timestamp pdate=set.getTimestamp("pdate");
				int catid=set.getInt("catid");
				int userId=set.getInt("userId");

				Post post=new Post(pid, ptitle, pcontent, pcode, ppics, pdate, catid, userId);
				list.add(post);

			}

		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// get post of specific category
	public List<Post> getPostByCatId(int catid){
		List<Post> list=new ArrayList<>();
		//fetch all the posts

		try {
			

			PreparedStatement p= con.prepareStatement("select * from posts where catid=?");
			p.setInt(1, catid);

			ResultSet set=p.executeQuery();

			while(set.next()) {


				int pid=set.getInt("pid");
				String ptitle=set.getString("ptitle");
				String pcontent=set.getString("pcontent");
				String pcode=set.getString("pcode");
				String ppics=set.getString("ppics");
				Timestamp pdate=set.getTimestamp("pdate");
				int userId=set.getInt("userId");

				Post post=new Post(pid, ptitle, pcontent, pcode, ppics, pdate, catid, userId);
				list.add(post);

			}

		}catch(Exception e) {
			e.printStackTrace();
		}



		return list;
	}
	
	public Post getPostByPostId(int postId) {
		Post post=null;
		String q="select * from posts where pid=?";
		
		try {
			PreparedStatement p=this.con.prepareStatement(q);
			
			p.setInt(1, postId);
			
			ResultSet set=p.executeQuery();
			
			if(set.next()) {

				int pid=set.getInt("pid");
				String ptitle=set.getString("ptitle");
				String pcontent=set.getString("pcontent");
				String pcode=set.getString("pcode");
				String ppics=set.getString("ppics");
				Timestamp pdate=set.getTimestamp("pdate");
				int userId=set.getInt("userId");
				int catid=set.getInt("catid");

				post=new Post(pid, ptitle, pcontent, pcode, ppics, pdate,catid, userId);
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return post;
		
	}

	// get post of specific userId
	
	public List<Post> getPostByUid(int uid) {
		List<Post> list=new ArrayList<>();
		
		PreparedStatement p;
		try {
			p = con.prepareStatement("select * from posts where userId=?");
			p.setInt(1, uid);
			
			ResultSet rs=p.executeQuery();
			

			while(rs.next()) {

				int pid=rs.getInt("pid");
				String ptitle=rs.getString("ptitle");
				String pcontent=rs.getString("pcontent");
				String pcode=rs.getString("pcode");
				String ppics=rs.getString("ppics");
				Timestamp pdate=rs.getTimestamp("pdate");
				int catid=rs.getInt("catid");

				Post post=new Post(pid, ptitle, pcontent, pcode, ppics, pdate,catid, uid);
				list.add(post);
				
			}
			
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
		
	}

}
