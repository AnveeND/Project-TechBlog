<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.*"%>
<%@page import="com.tech.blog.dao.*"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.servlets.*"%>
<%@page import="java.util.ArrayList"%>

<%@page errorPage="Error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Navbar</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="#"><span class="fa fa-desktop  "></span>  TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="contact" href="#"><span class ="	fa fa-address-book-o"></span> contact</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-sitemap"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();

								for (Category c : list) {
								%>
								<a class="dropdown-item" href="showCatPosts.jsp?cat_id=<%=c.getCid()%>"><%=c.getName()%></a>


								<%
								}
								%>
        
         
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="login_page.jsp"><span class ="fa fa-user-circle"></span> Log in</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="Register_page.jsp"><span class ="fa fa-user-plus"></span> Sign Up</a>
      </li>
    </ul>
    
  </div>
</nav>

</body>
</html>