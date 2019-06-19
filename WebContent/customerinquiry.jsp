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
	
	function populateProductId(idx) {
		var selectBox = document.getElementById('selectbox[' + idx + ']');
		var selectedProductId = selectBox.options[selectBox.selectedIndex].value;
		document.getElementById('pno[' + idx + ']').value = selectedProductId;
		document.getElementById('qty[' + idx + ']').value = 1;
	}
	
	function addRow(tableID) {
		var table = document.getElementById(tableID);
		var rowCount = table.rows.length;
		var index = rowCount;
		var row = table.insertRow(rowCount);
		var cell1 = row.insertCell(0);
		var sno = document.createElement("input");
		sno.type = "text";
		sno.id = "sno[" + index + "]";
		sno.name = "sno[" + index + "]";
		sno.style.display = "none";
		cell1.appendChild(sno);
		var cell2 = row.insertCell(1);
		var pname = document.createElement("select");
		var elemen = document.getElementById("selectbox[0]");
		var ele = document.createElement("option");
		pname.id = "selectbox[" + index + "]";
		pname.name = "selectbox[" + index + "]";
		pname.onchange = function() { populateProductId(index) };
		pname.innerHTML = pname.innerHTML + elemen.innerHTML;
		cell2.appendChild(pname);
		var cell3 = row.insertCell(2);
		var pno = document.createElement("input");
		pno.type = "text";
		pno.id = "pno[" + index + "]";
		pno.name = "pno[" + index + "]";
		cell3.appendChild(pno);
		var cell4 = row.insertCell(3);
		var Qty = document.createElement("input");
		Qty.type = "number";
		Qty.id = "qty[" + index + "]";
		Qty.name = "qty[" + index + "]";
		Qty.min = 0;
		cell4.appendChild(Qty);
	}
</script>

<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>

	<%
		int clicks;
		Random rand = new Random();
		clicks = rand.nextInt(90000) + 10000;
		session.getAttribute("cId");
		session.setAttribute("clicks", clicks);
	%>
	<%
		try {
			ResultSet resultset;
			PreparedStatement pstmt;
			Connection conn = ConnectionManager.getCustConnection();
			Statement statement = conn.createStatement();
			resultset = statement.executeQuery("select product_id,product_name from product");
	%>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Included header section -->
	<jsp:include page="header.jsp" />

	<!-- Inquiry section -->
	<section class="contact-section" style="width: 100%">
		<div class="container" style="width: 100%">
			<form action="handleinquiry" method="post"
				style="border: 2px solid red" id="f">

				<table class="table" id="dataTable">

					<tr align="center" bgcolor="Black">
						<td colspan="5"><h3>
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
						<td><input type="text" name="lastName" required="required" /></td>
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
						<td></td>

						<td><b>product Name:</b></td>
						<td><b>Product No:</b></td>
						<td><b>Quantity:</b></td>

					</tr>

					<tr>
					    <td></td>	
						<td><select id="selectbox[0]" onchange="populateProductId(0);" name="selectbox[0]">
								<option>---- Select Product ----</option>
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
						<td><input type="number" required="required" name="pno[0]" id="pno[0]" value="" disabled></td>
						<td><input type="number" name="qty[0]" id="qty[0]" min=0 required></td>
						
						<td><input type="button" value="Add" id="add[0]"
							onclick="addRow('dataTable');"></td>
						<td colspan="4"></td>
					</tr>

				</table>

				<div align="center">
					<button class="site-btn">
						<b> Submit </b>
					</button>
				</div>
				<br />
			</form>

		</div>

	</section>
	<!-- Inquiry section end -->


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