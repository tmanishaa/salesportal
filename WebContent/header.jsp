<!-- Header section -->
<header class="header-section">
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 text-center text-lg-left">
					<!-- logo -->
					<a href="./index.jsp" class="site-logo"> <img
						src="img/logo.png" alt="">
					</a>
				</div>
				<div class="col-xl-6 col-lg-5">
					<form class="header-search-form">
						<input type="text" placeholder="Search on Fujifilm ....">
						<button>
							<i class="flaticon-search"></i>
						</button>
					</form>
				</div>
				<div class="col-xl-4 col-lg-5">
					<div class="user-panel">
						<div class="up-item">
							<i class="flaticon-profile"></i>
							<%
                                    String who = null;
								    if (session != null)
								    {
								    	if (session.getAttribute("who") != null)
								    	{
								    	   who = session.getAttribute("who").toString();
								    	}
								    }
                                    if (who != null && who.length() > 0) 
                                    {
                                  %>
							<a href="logout.jsp" style="color: red;">Sign Out</a>
							<%= who %>
							<% } 
                                     else 
                                     {
                                  %>
							<a href="login.jsp" style="color: green;">Sign In</a> or <a
								href="register.jsp">Create Account</a>
							<% 
								     } 
								  %>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<nav class="main-navbar">
		<div class="container">
			<!-- menu -->
			<ul class="main-menu">
				<li><a href="index.jsp">Home</a></li>
				<%
					String hdrfile = null;
					if (session != null) {
						if (session.getAttribute("hdr") != null) {
							hdrfile = session.getAttribute("hdr").toString();
						}
					}
					if (hdrfile != null && hdrfile.length() > 0) {
				%>
				<li><a href="<%= session.getAttribute("hdr") %>"><%= session.getAttribute("hdrlink") %></a></li>
				<% } %>
				<li><a href="blog.jsp">Blog</a></li>
				<li><a href="about.jsp">About Us</a></li>
				<li><a href="contact.jsp">Contact</a></li>
			</ul>
		</div>
	</nav>
</header>
<!-- Header section end -->
