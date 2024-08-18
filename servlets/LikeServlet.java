package com.tech.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import com.tech.blog.dao.*;
import com.tech.blog.entities.*;
import com.tech.blog.helper.*;



/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String operation = request.getParameter("operation");
        String uidStr = request.getParameter("uid");
        String pidStr = request.getParameter("pid");

        // Check for null parameters
        if (operation == null || uidStr == null || pidStr == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        // Parse parameters
        int uid;
        int pid;
        try {
            uid = Integer.parseInt(uidStr);
            pid = Integer.parseInt(pidStr);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        // Prepare response
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
//        out.println(operation + " " + uid + " " + pid);
        
        LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
        if(operation.equals("like")) {
        	boolean istrue=ld.isLikedByUser(pid, uid);
        	if(istrue==false) {
        	boolean f=ld.insertLike(pid, uid);
        	out.println(f);
        	}
        	
        	
        }else if(operation.equals("dislike")) {
        	boolean k=ld.deleteLike(pid, uid);
        	out.print(k);
        }
        
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		
		doGet(request, response);
	}

}
