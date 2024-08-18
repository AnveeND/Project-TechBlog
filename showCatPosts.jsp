<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.*"%>
<%@page import="com.tech.blog.dao.*"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.servlets.*"%>
<%@page import="java.util.*"%>
    
    <%
int categoryId = Integer.parseInt(request.getParameter("cat_id"));

PostDao pd = new PostDao(ConnectionProvider.getConnection());


%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>posts</title>


<!--  css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	
</head>
<body >

<div class="container mt-3 pt-3">
<div class="col md-4 bg-dark text-center ">

<%
List<Post> li=pd.getPostByCatId(categoryId);

int count=0;

for(Post p:li){
	count++;
	if(count>3){
		break;
	}

%>


			

				<div class="card">

					<div class="card-body border border-secondary">
						<h5 class="card-title "><b><%=p.getPtitle()%></b></h5>
						<p class="card-text"> <%= p.getPcontent().length() > 100 ? p.getPcontent().substring(0, 500) + "..." : p.getPcontent() %></p>
						<a href="login_page.jsp" class="btn btn-outline-primary " >Login To Read More!</a>
					</div>
				</div>
				<br>
				<br>
			
		


<%}
%>
</div>
</div>



<!-- Java Script  -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	
</body>
</html>