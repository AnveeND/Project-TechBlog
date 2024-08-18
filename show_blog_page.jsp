<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error_page.jsp"%>
<%@page import="com.tech.blog.helper.*"%>
<%@page import="com.tech.blog.dao.*"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.servlets.*"%>
<%@page import="java.util.ArrayList"%>

<%
User user = (User) session.getAttribute("currentUser");

if (user == null) {
	response.sendRedirect("login.jsp");
}
%>

<%
int postId = Integer.parseInt(request.getParameter("post_id"));

PostDao d = new PostDao(ConnectionProvider.getConnection());

Post p = d.getPostByPostId(postId);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getPtitle()%></title>



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
<script src="js/myjs.js" type="text/javascript"></script>

	<!-- NAVBAR START -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="#"><span class="fa fa-desktop  "></span>
			TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link" href="index.jsp"><span
						class="fa fa-home"></span> Home </a></li>
				<li class="nav-item"><a class="nav-link" id="contact" href="#"><span
						class="	fa fa-address-book-o"></span> contact</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="		fa fa-edit"></span> NEW POST </a></li>
				<li class="nav-item dropdown">
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link " href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle  "></span><%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link " href="LogoutServlet"><span
						class="fa fa-user-times"></span>Logout</a></li>

			</ul>
		</div>
	</nav>


	<!-- NAVBAR END -->





	<!--  MAIN CONTENT -->

	<div class="container">
		<div class="row mt-4">
			<div class="col-md-8 offset-md-2">

				<div class="card basic-background text-white">

					<div
						class="card-header text-white  basic-backgound border border-white">

						<h4 class=" text-center"><%=p.getPtitle()%></h4>

					</div>

					<div class="card-body">
						<div class="text-center">
							<img class="card-img-top mt-5" src="blog_pics/<%=p.getPpic()%>"
								alt="Card image cap" style="height: 250px; width: auto;">
						</div>
						<br> <br>
						<p><%=p.getPcontent()%></p>
						<br> <br>
						<pre class="text-white"><%=p.getPcode()%></pre>

					</div>
					<div class="card-footer ">
						<%
						UserDao ud = new UserDao(ConnectionProvider.getConnection());
						User Post_User = ud.getUserByUserID(p.getUserId());
						%>

						<h5 class="text-right">
							-
							<%=Post_User.getName()%></h5>
							
							<%
							LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
							if(!ld.isLikedByUser(p.getPid(),user.getId())){
								%>
									<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm text-left"><i
								class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %></span></a>
								
								
								
								<% 
								
							}else{
								%>
							
								<a href="#!" onclick="delLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm text-left"><i
								class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %></span></a> 
								
								
								<% 
							}
							%>
						

							 <a href="#!"
								class="btn btn-outline-light btn-sm text-left"><i
								class="fa fa-commenting-o"></i><span>20</span></a>
						


					</div>

				</div>
			</div>


		</div>



	</div>

	<!-- END OF  MAIN CONTENT -->




	<!--  profile modal  -->



	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLongTitle">Tech-Blogger</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="max-width: 150px;"> <br>
						<h5 class="modal-title mt-3" id="exampleModalLongTitle"><%=user.getName()%></h5>


						<div id="profile-details">
							<table class="table mt-3">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">EMAIL :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">GENDER :</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">MEMBER FROM :</th>
										<td><%=user.getDateTime().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>

						<!-- Profile edit -->

						<div id="profile-edit" style="display: none;">
							<h4 class="mt-3">Edit Here</h4>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>

									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>

									<tr>
										<td>Profile :</td>
										<td><input type="file" name="image" class="form-control"></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>

								</div>
							</form>





						</div>




						<!-- Profile edit END-->


					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn primary-background text-white"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>




	<!--  profile modal END -->


	<!--  ADD POST MODAL -->





	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Post
						Details :</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">

						<div class="form-group ">
							<select class="form-control text-center" name="cid">
								<option selected disabled>---- Select Category ----</option>

								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();

								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>


								<%
								}
								%>


							</select>
						</div>


						<div class="form-group ">
							<input name="ptitle" type="text" placeholder="Enter post title"
								class="form-control">

						</div>
						<div class="form-group">
							<textarea name="pcontent" class="form-control"
								style="height: 100px;" placeholder="Enter your content"></textarea>

						</div>
						<div class="form-group">
							<textarea name="pcode" class="form-control" style="height: 50px;"
								placeholder="Enter program code (If any)"></textarea>

						</div>
						<div class="form-group">
							<label>Select pic for post : </label> <br> <input
								type="file" name="pic">

						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-primary">POST</button>
						</div>

					</form>


				</div>
			</div>
		</div>
	</div>
	<!--  ADD POST MODAL END -->


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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="js/myjs.js" type="text/javascript"></script>

	<script>
		$(document).ready(function() {
			let editStatus = false;

			$('#edit-profile-btn').click(function() {
				if (editStatus == false) {
					$("#profile-details").hide();
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$("#profile-details").show();
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit");
				}

			})

		})
	</script>


	<!-- ADD-POST JS -->

	<script>
		$(document).ready(function(e) {

			$("#add-post-form").on("submit", function(event) {

				event.preventDefault();
				console.log("You have submitted");
				let form = new FormData(this);

				$.ajax({

					url : "AddPostServlet",
					type : "post",
					data : form,
					success : function(data, textStatus, jqXHR) {
						//success .....
						console.log(data);
						if (data.trim() == "done") {
							swal("Good Job !", "Posted Successfully ");
						} else {
							swal("Error!", "Something went wrong !");
						}

					},
					error : function(data, textStatus, jqXHR) {
						swal("Error!", "Something went wrong !");

					},
					processData : false,
					contentType : false

				})

			})

		})
	</script>












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
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
		$(document)
				.ready(
						function() {
							$('#contact')
									.click(
											function() {
												Swal
														.fire({
															title : "Anvee Deshpande",
															text : "email: deshpandeanvee@gmail.com ",
															imageUrl : "https://iotvnaw69daj.i.optimole.com/cb:Amyz.6583c/w:auto/h:auto/q:75/f:best/https://www.bloggingpro.com/wp-content/uploads/2023/10/Best-Tech-Blogs-featured-image.webp",
															imageWidth : 400,
															imageHeight : 200,
															imageAlt : "computer.png"
														});
											});
						});
	</script>
</body>
</html>