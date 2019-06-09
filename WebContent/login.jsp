<%
HttpServletResponse httpResponse = (HttpServletResponse) response;
httpResponse.setHeader("Cache-Control", "max-age=0, max-stale=0, private, no-cache, no-store, must-revalidate"); // HTTP 1.1
httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
httpResponse.setDateHeader("Expires", 0);
%>

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

 <script>
	window.onpageshow = function(event) {
	    if (event.persisted) {
	        window.location.reload() 
	    }
	};
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

	<!-- Included header section -->
    <jsp:include page="header.jsp" />
    

	<!-- Login section -->
	<section class="contact-section" style="width: 100%">
		<div class="container" style="width: 100%">
			<h4>Please enter your employee id if you're an employee. If you're a customer please leave the employee id field blank.</h4>
			<br />
			<form action="handlelogin" method="post">
				<table style="margin: 0; background:#ADD8E6 !important; border-collapse: separate; border-spacing: 10px; border-radius: 10px !important;">
					<tr>
						<td>UserName*</td>
						<td><input type="text" name="username" id="username"
							style="width: 200px !important; border-radius:10px;" required/></td>
					</tr>
					<tr>
						<td>Password*</td>
						<td><input type="password" name="password" id="password"
							style="width: 200px !important; border-radius:10px;" required /></td>
					</tr>
					<tr>
						<td>Employee ID</td>
						<td><input type="text" name="employee_id" id="employee_id"
							style="width: 200px !important; border-radius:10px;" placeholder="If applicable" /></td>
					</tr>
					<tr>
					 	<td>&nbsp;&nbsp;</td>
					 	<td>&nbsp;</td>
					</tr>
					<tr>
					    <td></td>
						<td><input type="submit" value="Submit"
							style="width: 200px !important;" class="site-btn sb-white" /></td>
					</tr>
				</table>
				<br />
			</form>
		</div>
	</section>
	<!-- Login section end -->


	<!-- Included footer section -->
	<jsp:include page="footer.jsp" /> 

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
