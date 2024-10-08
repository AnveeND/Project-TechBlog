<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.*"%>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.servlets.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
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
<%@include file="Normal_Navbar.jsp" %>

	<main class="standard-bg p-3">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">


					<div class="card-header text-center ">
						<span class=" fa-3x fa fa-user-plus "></span><br> Register
						Here!
					</div>

					<div class="card-body">
						<form id=reg-form action="RegisterServlet" method="POST">
						
						<div class="form-group">
								<label for="exampleInputEmail1">User Name</label> <input name="user_name"
									type="user_name" class="form-control" id="user_name"
									aria-describedby="emailHelp" placeholder="Enter username">
						
							</div>
						
						
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input name="user_email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							
							
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input name="user_password"
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							
							
							<div class="form-group">
								<label for="gender">Select Gender</label>
								<br>
								 <input type="radio"  id="gender" name="gender" value="female">Female
								 <input type="radio"  id="gender" name="gender" value="male">Male
							</div>
						
							
							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms and Conditions.</label>
							</div>
							
							<br>
							<div class="container text-center" id="loader" style="display:none;">
							<span class = "	fa fa-refresh fa-spin fa-2x" ></span>
							<h6>please wait ..... </h6>
						
							
							</div>
							
							<button id="submit-btn" type="submit" class="btn btn-primary mb-2">Submit</button>
							
							
						</form>
					</div>
			



				</div>

			</div>
		</div>

	</main>



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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
	
	$(document).ready(function(){
		console.log("loaded....")
		$('#reg-form').on('submit',function(event){
			
			event.preventDefault();
			
			let form=new FormData(this);
			
			$("#submit-btn").hide();
			$("#loader").show();
			
			
			//send to register servlet
			//using ajax
			
			$.ajax({
				url: "RegisterServlet",
				type : 'POST',
				data : form,
				success : function(data,textStatus,jqXHR){
					console.log(data)
					$("#submit-btn").show();
					$("#loader").hide();
					
					if(data.trim()=='done'){
					
					swal("Registered ! ", "Data submited!", "success").then((value)=>{
						window.location="login_page.jsp"
					});
					}else{
						swal(data);
						
					}
				},
				error :function(jqXHR, textStatus , errorThrown){
					swal("Somethig went wrong !!  ", "Try Again ");
					
					
				},
				processData : false,
				contentType: false
				
			});
			
		});
		
	});
	
	
	
	
	</script>
	
	<script>
	$(document).ready(function(e){
		$('#contact').click(function(){
			swal("Anvee Deshpande", "email : deshpandeanvee@gmail.com");
		})
		
	})
	
	
	
	
	
	</script>
</body>
</html>