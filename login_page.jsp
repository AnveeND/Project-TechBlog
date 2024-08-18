<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.*"%>
<%@page import="com.tech.blog.dao.*"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.servlets.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

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
	<%@include file="Normal_Navbar.jsp"%>
	<main class="d-flex align-items-center basic-background"
		style="height: 80vh;">
		<div class="container">
			<div class="col-md-4 offset-md-4 ">
				<div class="card ">
					<div class="card-header standard-bg text-white text-center">
						<span class="fa fa-user-circle fa-3x"></span>
						<h3>Login Here!</h3>
					</div>

					<%
					Message m = (Message)session.getAttribute("msg");
					if(m!=null){
						%>

					<div class="alert <%= m.getCssClass() %>" role="alert">
						<%= m.getContent() %>
					</div>




					<% 
					session.removeAttribute("msg");
					}
					
					
					%>



					<div class="card-body"></div>
					<form action="LoginServlet" method="post">
						<div class="form-group m-2">
							<label for="exampleInputEmail1">Email address</label> <input
								name="email" required type="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter email"> <small id="emailHelp"
								class="form-text text-muted">We'll never share your
								email with anyone else.</small>
						</div>
						<div class="form-group m-2">
							<label for="exampleInputPassword1">Password</label> <input
								name="password" required type="password" class="form-control"
								id="exampleInputPassword1" placeholder="Password">
						</div>

						<div class="container text-center">
							<button type="submit"
								class="btn standard-bg text-white ml-2 mb-2 ">Submit</button>

						</div>
					</form>


				</div>


			</div>
		</div>
	</main>
<body>




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
	$(document).ready(function(e){
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
	})
	
	
	
	
	
	</script>
</body>
</html>