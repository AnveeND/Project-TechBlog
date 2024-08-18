package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.io.PrintWriter;
import com.tech.blog.dao.*;
import com.tech.blog.entities.*;
import com.tech.blog.helper.*;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ptitle=request.getParameter("ptitle");
		PrintWriter out = response.getWriter();
//		out.print("Your post title is : "+ptitle);
		
		int cid=Integer.parseInt(request.getParameter("cid"));
		
		String pcontent=request.getParameter("pcontent");
		String pcode=request.getParameter("pcode");
		Part part=request.getPart("pic");
		
		// getting current userId
		
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("currentUser");
		
		
		
		Post p=new Post(ptitle,pcontent,pcode,part.getSubmittedFileName(),null,cid,user.getId()); 
		
		PostDao dao=new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(p)) {
			
			
			String path=request.getServletContext().getRealPath("")+File.separator+"blog_pics"+File.separator+part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			out.print("done");
			
		}else {
			out.print("error");
		}
		
		doGet(request, response);
	}

}
