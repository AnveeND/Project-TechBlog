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
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// fetch all data

		String userName = request.getParameter("user_name");
		String userEmail = request.getParameter("user_email");
		String userPassword = request.getParameter("user_password");
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();


		// get the user from the current session

		HttpSession s = request.getSession();
		User user = (User)s.getAttribute("currentUser");
		String oldProfileName=user.getProfile();
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		String oldFile=user.getProfile();
		if(imageName!=null || !imageName.isEmpty()) {
		user.setProfile(imageName);
		}else {
			user.setProfile(oldProfileName);
		}
		String NewProfileName=user.getProfile();


		// update database 
		UserDao userdao=new UserDao(ConnectionProvider.getConnection());
		boolean ans=userdao.updateUser(user);
		if(ans) {
			Message msg1=new Message("Profile Updated Successfully ! ", "success", "alert-success");

			s.setAttribute("msg", msg1);
			s.setAttribute("currentUser", user);
			

			if(!NewProfileName.equals(oldProfileName)) {


				String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();


				String pathOldFile=request.getRealPath("/")+"pics"+File.separator+oldFile;

				if(!oldFile.equals("default.png")) {

					Helper.deleteFile(pathOldFile);}

				if(Helper.saveFile(part.getInputStream(), path)) {
					//					response.getWriter().append("updated to db ");

					Message msg=new Message("Profile Updated Successfully ! ", "success", "alert-success");

					s.setAttribute("msg", msg);

				}else {

					Message msg=new Message("Cannot update profile Pic", "error", "alert-danger");


					s.setAttribute("msg", msg);

				}	

			}
		}else {
			Message msg=new Message("Something went wrong! ", "error", "alert-danger");


			s.setAttribute("msg", msg);


		}
		response.sendRedirect("profile.jsp");


		doGet(request, response);
	}

}
