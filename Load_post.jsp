<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.*"%>
<%@page import="com.tech.blog.dao.*"%>
<%@page import="com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.servlets.*"%>
<%@page import="java.util.*"%>
<!-- This is page to show post -->

<div class="row">

	<%
	
	User uu=(User)session.getAttribute("currentUser");
	PostDao d = new PostDao(ConnectionProvider.getConnection());

	int cid1 = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;

	if (cid1 == 0) {
		posts = d.getAllPosts();

	}else if(cid1 == 101){ 
		
		User user = (User) session.getAttribute("currentUser");
		
		posts=d.getPostByUid(user.getId());

	
	}else {

		posts = d.getPostByCatId(cid1);

	}

	if (posts.size() == 0) {
		out.println("<h3 class='display-3 text-center'>No posts in this category</h3>");
		return;
	}

	for (Post p : posts) {
	%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img class="card-img-top" src="blog_pics/<%=p.getPpic()%>"
				alt="Card image cap">
			<div class="card-body">

				<b><%=p.getPtitle()%></b>
				<p class="card-text"> <%= p.getPcontent().length() > 100 ? p.getPcontent().substring(0, 200) + "..." : p.getPcontent() %></p>

			</div>

			<div class="card-footer d-flex justify-content-between ">
			
			<%
			LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
			
			%>
			<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=uu.getId() %>)" class="btn btn-outline-primary btn-sm "><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid()) %></span></a>

				<a href="show_blog_page.jsp?post_id=<%=p.getPid()%>"
					class="btn btn-outline-primary btn-sm "> Read More..</a> 
				
				
				<a href="#!" class="btn btn-outline-primary btn-sm "><i class="fa fa-commenting-o"></i><span>20</span></a>
					


			</div>

		</div>


	</div>




	<%
}
%>
</div>