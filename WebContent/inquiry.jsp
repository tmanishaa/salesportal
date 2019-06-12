
<%@page import="com.mysql.cj.exceptions.RSAException"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Fujifilm.Connection.ConnectionManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>Fuji Film</title>
<meta charset="UTF-8">
<meta name="description" content=" Fuji Film">
<meta name="keywords" content="fujifilm, eCommerce, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta Http-Equiv="Cache-Control" Content="no-cache">
<meta Http-Equiv="Pragma" Content="no-cache">
<meta Http-Equiv="Expires" Content="0">

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
	
	function populateProductId(){
		var selectBox=document.getElementById('selectbox');
		var selectedProductId=selectBox.options[selectBox.selectedIndex].value;
		document.getElementById('productId').value=selectedProductId;
	}
</script>

<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>



	<%!int clicks = 101;%>
	<%
		try {
			ResultSet resultset;
			ResultSet rs;
			PreparedStatement pstmt;
			Connection conn = ConnectionManager.getCustConnection();

			Statement statement = conn.createStatement();

			resultset = statement.executeQuery("select product_id,product_name from product");
	%>





	<%--  <%String param = request.getParameter("count");

		try {

			int i = Integer.parseInt(param);
			clicks++;
		} catch (NumberFormatException e) {
		}

	%>  --%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Included header section -->
	<jsp:include page="header.jsp" />

	<!-- Register section -->
	<section class="contact-section" style="width: 100%">
		<div class="container" style="width: 100%">
			<form action="" method="post" style="border: 2px solid red">

				<table class="table">

					<tr align="center" bgcolor="Black">
						<td colspan="4"><h3>
								<font color="white">Inquiry Form</font>
							</h3></td>
					</tr>
					<tr>

						<td><b>First name :</b></td>
						<td><input type="text" name="Username" required="required" /></td>

						<td><b>Date: <%=(new java.util.Date()).toLocaleString()%>
						</b></td>
					</tr>
					<tr>
						<td><b>Last Name :</b></td>
						<td><input type="text" name="address" required="required" /></td>
						<td><b>Inquiry No: #INO<%=clicks%></b></td>
					</tr>
					<tr>
						<td><b>Address :</b></td>
						<td><input type="text" name="address" required="required" /></td>
					</tr>
					<tr>
						<td><b>Mobile No :</b></td>
						<td><input type="text" name="mobile" required="required" /></td>
					</tr>
					<tr>
						<td><b>Email id :</b></td>
						<td><input type="email" name="email" required="required" /></td>
					</tr>
					<tr>
						<td><input type="hidden" name="form1" value="login" /></td>
					</tr>
					<tr>
						<td><b>S.No:</b></td>

						<td><b>product Name:</b></td>
						<td><b>Product No:</b></td>
						<td><b>Quantity:</b></td>

					</tr>

					<tr>
						<td><input type="number" name="sno" value="sno"
							required="required"></td>

						<td><select id="selectbox" onchange="populateProductId();"
							name="pname">
								<%
									while (resultset.next()) {
								%>
								<option value="<%=resultset.getString(1)%>"><%=resultset.getString(2)%></option>
								<%
									}
								%>
						</select> <%
 	} catch (Exception e) {
 		out.println("wrong entry" + e);
 	}
 %></td>
						<td><input type="number" required="required" name="pno"
							id="productId" value="" disabled="disabled"></td>
						<td><input type="text" name="pno"></td>
					</tr>

					<tr>
					<tr>
						<td colspan="4"><div align="right">
								<button class="site-btn">
									<b> Submit </b>
								</button>
							</div></td>
					</tr>


				</table>
			</form>

		</div>

	</section>

	<!-- Register section end -->

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
