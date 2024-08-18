<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.*"%>
<%@page import="com.tech.blog.dao.*"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.servlets.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

<!--  css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	
</head>
<body>

	<!-- navbar -->
	<%@include file="Normal_Navbar.jsp"%>


	<!-- Banner -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron basic-background text-white">
			<div class="container">
				<h3 class="display-4">Welcome To TechBlog</h3>
				<br> <br>
				<p>Welcome to TechBlog, to the world of technology.
					Software technologies can be compared to partially completed
					products. They serve as a blueprint, offering a set of rules and
					guidelines in the form of APIs, which allow developers to create
					software using various programming languages. If your plans to
					advance your career or change careers completely require you to
					master a programming language, you might wonder which one to learn.
					After all, it will take time and money to learn the language, so
					you want to make the right choice.</p>
				<br>
				<a href="Register_page.jsp" class="btn btn-outline-light btn-lg" id="start">
					<span class="	fa fa-edit"></span> Let's Start!
				</a>
				<a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span
					class="	fa fa-user-circle"></span> Login</a>




			</div>
		</div>

	</div>


	<!-- cards -->

	<div class="container">
		<div class="row mb-4">
		

		<!-- MY CODE -->

		<%
		PostDao d = new PostDao(ConnectionProvider.getConnection());
		List<Post> posts = d.getAllPosts();
		int count=0;

		for (Post p : posts) {
			count++;
			
			if(count>3){
				break;
			}
			
		%>

		
			<div class="col-md-4">

				<div class="card">

					<div class="card-body border border-secondary">
						<h5 class="card-title"><%=p.getPtitle()%></h5>
						<p class="card-text"> <%= p.getPcontent().length() > 100 ? p.getPcontent().substring(0, 80) + "..." : p.getPcontent() %></p>
						<a href="#" class="btn btn-outline-primary " id="read-more<%=count%>">Read More!</a>
					</div>
				</div>
			</div>
		



		<%
				}
				%>



		<!-- MY CODE END -->
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
	
	<script>
		$(document).ready(function() {
			
			$('#contact').click(function(){
				Swal.fire({
					  title: "Anvee Deshpande",
					  text: "email : deshpandeanvee@gmail.com",
					  imageUrl: "https://iotvnaw69daj.i.optimole.com/cb:Amyz.6583c/w:auto/h:auto/q:75/f:best/https://www.bloggingpro.com/wp-content/uploads/2023/10/Best-Tech-Blogs-featured-image.webp",
					  imageWidth: 400,
					  imageHeight: 200,
					  imageAlt: "computer.png"
					});
			})
			
			$('#start').click(function(e) {
			    // Prevent the default action (navigation)
			    e.preventDefault();

			    // Show the SweetAlert
			    Swal.fire({
			        title: "Login or Register to start!",
			        icon: "warning",
			        confirmButtonText: "OK"
			    }).then((result) => {
			        // Check if the user clicked "OK"
			        if (result.isConfirmed) {
			            // Navigate to the link's href
			            window.location.href = $(this).attr('href');
			        }
			    });
			});

			$('#read-more1').click(function(){
				Swal.fire({
					  title: "Login  !",
					  text: "To read more",
					  icon: "question"
					});
			})
			$('#read-more2').click(function(){
				Swal.fire({
					  title: "Login  !",
					  text: "To read more",
					  icon: "question"
					});
			})
			$('#read-more3').click(function(){
				Swal.fire({
					  title: "Login  !",
					  text: "To read more",
					  icon: "question"
					});
			})
			
			
			
			
		})

			</script>


</body>
</html>