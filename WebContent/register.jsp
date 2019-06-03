<!DOCTYPE html>
<html lang="zxx">
<head>
<title>Fuji Film</title>
<meta charset="UTF-8">
<meta name="description" content=" Fuji Film">
<meta name="keywords" content="fujifilm, eCommerce, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="img/favicon.ico" rel="shortcut icon" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i"
	rel="stylesheet">


<!-- Stylesheets -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/slicknav.min.css" />
<link rel="stylesheet" href="css/jquery-ui.min.css" />
<link rel="stylesheet" href="css/owl.carousel.min.css" />
<link rel="stylesheet" href="css/animate.css" />
<link rel="stylesheet" href="css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
	function comparePasswords() {
		if ($('#password').val() == $('#confirm_password').val()) {
			$('#message').html('').css('color', 'green');
		} else {
			$('#message').html('Passwords are not matching').css('color', 'red');
		}
	}
</script>

<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 text-center text-lg-left">
						<!-- logo -->
						<a href="./index.html" class="site-logo"> <img
							src="img/logo.png" alt="">
						</a>
					</div>
					<div class="col-xl-6 col-lg-5">
						<form class="header-search-form">
							<input type="text" placeholder="Search on divisima ....">
							<button>
								<i class="flaticon-search"></i>
							</button>
						</form>
					</div>
					<div class="col-xl-4 col-lg-5">
						<div class="user-panel">
							<div class="up-item">
								<i class="flaticon-profile"></i> <a href="login.jsp">Sign</a> In or <a
									href="register.jsp">Create Account</a>
							</div>
							<div class="up-item">
								<div class="shopping-card">
									<i class="flaticon-bag"></i> <span>0</span>
								</div>
								<a href="#">Shopping Cart</a>
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
					<li><a href="index.html">Home</a></li>
					<li><a href="blog.html">Blog</a></li>
					<li><a href="about.html">About Us</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<!-- Header section end -->


	<!-- Page info -->
	<div class="page-top-info">
		<div class="container">
			<h4>Register</h4>
			<div class="site-pagination">
				<a href="index.html">Home</a> / <a href="register.jsp">Register</a>
			</div>
		</div>
	</div>
	<!-- Page info end -->


	<!-- Register section -->
	<section class="contact-section" style="width: 100%">
		<div class="container" style="width: 100%">
			<h4>Please use this form to register yourself. If you're
				registering as an employee then please provide your employee id.</h4>
			<br />
			<form action="handleregister" method="post">
				<table style="width: 50%; margin: 0 auto;">
					<tr>
						<td>First Name*</td>
						<td><input type="text" name="first_name" id="first_name"
							style="width: 200px !important;" required /></td>
					</tr>
					<tr>
						<td>Last Name*</td>
						<td><input type="text" name="last_name" id="last_name"
							style="width: 200px !important;" required /></td>
					</tr>
					<tr>
						<td>Email*</td>
						<td><input type="text" name="emailid" id="emailid"
							style="width: 200px !important;" required /></td>
					</tr>
					<tr>
						<td>Address*</td>
						<td><input type="text" name="address" id="address"
							style="width: 200px !important;" required /></td>
					</tr>
					<tr>
						<td>Phone*</td>
						<td><input type="text" name="contact" id="contact"
							style="width: 200px !important;" required /></td>
					</tr>
					<tr>
						<td>Employee ID</td>
						<td><input type="text" name="employee_id" id="employee_id"
							style="width: 200px !important;" placeholder="If applicable" /></td>
					</tr>
					<tr>
						<td>UserName*</td>
						<td><input type="text" name="username" id="username"
							style="width: 200px !important;" required /></td>
					</tr>
					<tr>
						<td>Password*</td>
						<td><input type="password" name="password" id="password"
							style="width: 200px !important;" required onkeyup="comparePasswords()"/></td>
					</tr>
					<tr>
						<td>Confirm Password*</td>
						<td><input type="password" name="confirm_password"
							id="confirm_password" style="width: 200px !important;" required  onkeyup="comparePasswords()"/></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td id="message"></td>
					</tr>
					<tr>
						<td><input type="submit" value="Submit"
							style="width: 200px !important;" /></td>
						<td></td>
					</tr>
				</table>
				<br />
			</form>
		</div>
	</section>
	<!-- Register section end -->


	<!-- Related product section -->
	<section class="related-product-section spad">
		<div class="container">
			<div class="section-title">
				<h2>Your Favorites</h2>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<div class="tag-new">New</div>
							<img src="./img/product/4.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$999.00</h6>
							<p>FUJIFILM X-T30</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/2.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$4,499.00</h6>
							<p>FUJIFILM GFX 50S</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/3.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$3,999.00</h6>
							<p>FUJIFILM GFX 50R</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="./img/product/1.jpg" alt="">
							<div class="pi-links">
								<a href="login.jsp" class="add-card"><i class="flaticon-bag"></i><span>ADD
										TO CART</span></a> <a href="login.jsp" class="wishlist-btn"><i
									class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$9,999.95</h6>
							<p>Fujifilm GFX 100</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Related product section end -->


	<!-- Footer section -->
	<section class="footer-section">
		<div class="container">
			<div class="footer-logo text-center">
				<a href="index.html"><img src="./img/logo-light.png" alt=""></a>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget about-widget">
						<h2>About</h2>
						<p>At Fujifilm we create innovative products and deliver
							effective solutions in a wide variety of fields to serve society,
							contribute to the quality of life, and enhance environmental
							sustainability.</p>
						<img src="img/cards.png" alt="">
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget about-widget">
						<h2>Site Map</h2>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="blog.html">Blog</a></li>
							<li><a href="about.html">About Us</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget about-widget">
						<h2>Testimonials</h2>
						<div class="fw-latest-post-widget">
							<div class="lp-item">
								<div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/1.jpg"></div>
								<div class="lp-content">
									<h6 style="opacity: 1.0 !important;">No camera can beat
										Fuji GFX! Thank you Fuji Film.</h6>
									<span>May 31, 2019</span> <a href="#" class="readmore">Read
										More</a>
								</div>
							</div>
							<div class="lp-item">
								<div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/2.jpg"></div>
								<div class="lp-content">
									<h6 style="opacity: 1.0 !important;">Very happy with my
										Fuji Film XCinema. Simply awesome!</h6>
									<span>Feb 21, 2019</span> <a href="#" class="readmore">Read
										More</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="footer-widget contact-widget">
						<h2>Contact</h2>
						<div class="con-info">
							<span>C.</span>
							<p>Fuji Film Ltd</p>
						</div>
						<div class="con-info">
							<span>B.</span>
							<p>7-3, Akasaka 9-chome, Minato-ku, Tokyo 107-0052, Japan</p>
						</div>
						<div class="con-info">
							<span>T.</span>
							<p>+81 3-6271-3350</p>
						</div>
						<div class="con-info">
							<span>E.</span>
							<p>globalsales@fujifilm.com</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="social-links-warp">
			<div class="container">
				<div class="social-links">
					<a href="" class="instagram"><i class="fa fa-instagram"></i><span>instagram</span></a>
					<a href="" class="google-plus"><i class="fa fa-google-plus"></i><span>g+plus</span></a>
					<a href="" class="pinterest"><i class="fa fa-pinterest"></i><span>pinterest</span></a>
					<a href="" class="facebook"><i class="fa fa-facebook"></i><span>facebook</span></a>
					<a href="" class="twitter"><i class="fa fa-twitter"></i><span>twitter</span></a>
					<a href="" class="youtube"><i class="fa fa-youtube"></i><span>youtube</span></a>
					<a href="" class="tumblr"><i class="fa fa-tumblr-square"></i><span>tumblr</span></a>
				</div>

				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				<p class="text-white text-center mt-5">
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="fa fa-heart-o" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
				</p>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

			</div>
		</div>
	</section>
	<!-- Footer section end -->



	<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nicescroll.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
