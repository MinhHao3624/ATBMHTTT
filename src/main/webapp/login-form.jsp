<%@page import="com.projectttweb.webphone.util.NgonNguDAO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/login-form.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:41:05 GMT -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="keywords" content="">
<title>Login</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Style CSS -->
<link href="css/style.css" rel="stylesheet">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet">
<!-- FontAwesome CSS -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- Bootstrap CSS -->

<style>
/* CSS cho modal */
.modal {
	display: flex; /* Ẩn modal ban đầu */
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	justify-content: center;
	align-items: center;
}

.modal-content {
	background-color: #fff;
	padding: 30px;
	border-radius: 8px;
	text-align: center;
	position: relative;
	width: 90%;
	max-width: 400px;
}

.modal-content img {
	width: 50px;
	margin-bottom: 20px;
}

.modal-content h3 {
	margin: 0;
	font-size: 24px;
	color: #28a745;
}

.modal-content p {
	margin-top: 10px;
	font-size: 16px;
	color: #555;
}

.btn-close {
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #d9534f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

.btn-close:hover {
	background-color: #c9302c;
	/*CSS form xác nhận thành công */
}

.search-bg {
	position: relative; /* Giữ vị trí tương đối cho gợi ý */
}

/* Danh sách gợi ý */
.suggestions-list {
	position: absolute; /* Định vị độc lập */
	top: 100%; /* Hiển thị ngay bên dưới thanh input */
	left: 0;
	right: 0;
	background-color: white; /* Nền trắng cho danh sách */
	z-index: 10000000000000; /* Đảm bảo nằm trên navigation */
	border: 1px solid #ddd;
	border-radius: 4px;
	max-height: 300px; /* Giới hạn chiều cao */
	overflow-y: auto; /* Thêm scroll nếu danh sách quá dài */
	display: none; /* Mặc định ẩn */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	list-style: none;
	padding: 0;
	margin: 0;
}

/* Hiển thị danh sách gợi ý */
.suggestions-list.active {
	display: block;
}

/* Các mục trong danh sách gợi ý */
.suggestions-list li {
	padding: 10px;
	cursor: pointer;
	border-bottom: 1px solid #f1f1f1;
}

.suggestions-list li:hover {
	background-color: #f9f9f9;
}
/* Container của dropdown */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Nút chính của dropdown */
.dropdown-button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.dropdown-button:hover {
	background-color: #45a049;
}

/* Menu dropdown (ẩn mặc định) */
.dropdown-menu {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 160px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	z-index: 1;
	overflow: hidden;
}

/* Các mục trong menu */
.dropdown-item {
	padding: 10px 15px;
	text-decoration: none;
	display: block;
	color: #333;
	font-size: 14px;
	cursor: pointer;
}

.dropdown-item:hover {
	background-color: #f0f0f0;
	color: #4CAF50;
}

/* Icon hoặc hình ảnh trong mục */
.dropdown-item img {
	width: 20px;
	height: 15px;
	margin-right: 10px;
	border-radius: 2px;
	border: 1px solid #ccc;
}

#navigation li:hover > ul > li {
	height: 50px;
	border: 1px solid white;
}

#navigation ul li.has-sub ul li a {
	color: #fff; /* Màu chữ trắng để nổi trên nền xanh */
	text-decoration: none; /* Bỏ gạch chân */
	display: block;
	font-size: 14px; /* Kích thước chữ */
}
</style>
</head>

<body>
	<!-- top-header-->
	<!-- top-header-->
	<%
		Map<String, String> m = (Map<String, String>) request.getAttribute("map");
		if (m == null) {
			m = new NgonNguDAO().vietnameseLanguage();
		}
		String error = (String) request.getAttribute("error");
		if (error == null) {
			error = ""; // Giá trị mặc định nếu error không được thiết lập
		}
	%>
	<div class="top-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-7 col-sm-6 hidden-xs">
					<p class="top-text">Flexible Delivery, Fast Delivery.</p>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6 col-xs-12">
					<ul>
						<li>+084 123 4567</li>
						<li>nhom21@laptrinhweb.com</li>
					</ul>
				</div>
			</div>
			<!-- /.top-header-->
		</div>
	</div>
	<!-- header-section-->
	<div class="header-wrapper">
		<div class="container">
			<div class="row">
				<!-- logo -->
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-8">
					<div class="logo">
						<a href="index.html"><img src="images/logo.png" alt="">
						</a>
					</div>
				</div>
				<!-- /.logo -->
				<!-- search -->
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<form action="SearchOnBox" method="post">
						<div class="search-bg">
							<!-- <input type="text"placeholder="Search Here"
							id="searchBox" class="search-box" autocomplete="off"> -->
							<input type="text" class="form-control"
								placeholder="<%= m.get("Login.Search") %>..." id="searchBox"
								class="search-box" autocomplete="off" list="product-suggestions"
								name="searchOnBox" value="${required}"> <input
								type="hidden" id="pageNumber" name="page" value="1">
							<button type="Submit">
								<i class="fa fa-search"></i>
							</button>
							<ul id="product-suggestions" class="suggestions-list">
								<!-- Gợi ý sẽ được thêm bằng JavaScript -->
							</ul>
						</div>
					</form>
				</div>
				<!-- /.search -->
				<!-- account -->
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="account-section">
						<ul>
							<c:if test="${empty sessionScope.khachHang}">
								<li><a href="noAccount.jsp" class="title hidden-xs"> <%=m.get("Login.TaiKhoan")%></a></li>
								<li class="hidden-xs">|</li>
								<li><a href="login-form.jsp" class="title hidden-xs"><%=m.get("Login.DangNhap")%>
								</a></li>
							</c:if>
							<c:if test="${not empty sessionScope.khachHang}">
								<li><a
									href="http://localhost:8080/MobileWebApp/account-login?userID=${sessionScope.khachHang.userID}"
									class="title hidden-xs">Hi <c:out
											value="${sessionScope.khachHang.userName}" /></a>|</li>
								<li><a href="http://localhost:8080/MobileWebApp/dang-xuat"
									class="title hidden-xs">Log out </a></li>
								<li><a
									href="load-page-favorite-list?userID=${sessionScope.khachHang.userID}"><i
										class="fa fa-heart"></i><sup class="cart-quantity">${soLuongSanPhamLike}</sup></a></li>
								<li><a href="go-to-cart" class="title"><i
										class="fa fa-shopping-cart"></i><sup class="cart-quantity">1</sup></a>
								</li>
							</c:if>
						</ul>
					</div>
					<!-- /.account -->
				</div>
				<!-- search -->
			</div>
		</div>
		<!-- navigation -->
		<div class="navigation">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<!-- navigations-->
						<div id="navigation">
							<ul>
								<li class="active"><a href="LoadDataMain"><%=m.get("Login.TrangChu")%></a></li>
								<li><a href="http://localhost:8080/MobileWebApp/load-product?page=1"><%=m.get("Login.DienThoai")%>
								</a></li>
								<li><a href="go-to-blog"><%=m.get("Login.ThongTin")%></a></li>
								<li><a href="go-to-about"><%=m.get("Login.BaiViet")%></a></li>
								<li><a
									href="http://localhost:8080/MobileWebApp/go-to-contactus"><%=m.get("Login.LienHe")%></a></li>
							</ul>
						</div>
					</div>
					<!-- /.navigations-->
				</div>
			</div>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropdown-button" id="dropdownButton">Ngôn Ngữ</button>
		<div class="dropdown-menu" id="dropdownMenu">
			<a class="dropdown-item" href="da-ngon-ngu?lang=vi"> <img
				src="https://upload.wikimedia.org/wikipedia/commons/2/21/Flag_of_Vietnam.svg"
				alt="Vietnamese"> Tiếng Việt
			</a> <a class="dropdown-item" href="da-ngon-ngu?lang=en"> <img
				src="https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_States.svg"
				alt="English"> English
			</a>
		</div>
	</div>

	<!-- /. header-section-->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-breadcrumb">
						<ol class="breadcrumb">
							<li><a href="#"><%=m.get("Login.TrangChu")%></a></li>
							<li><%=m.get("Login.DangNhap")%></li>
						</ol>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- login-form -->

	<div class="content">
		<div class="container">
			<div class="box">
				<div class="row">
					<div
						class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-12 col-xs-12 ">
						<div class="box-body">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12 mb20">
									<h3 class="mb10"><%=m.get("Login.DangNhap")%></h3>
								</div>
								<!-- form -->
								<%
								String sourceServlet = request.getAttribute("sourceServlet") + "";
								sourceServlet = sourceServlet.equals("null") ? "" : sourceServlet;
								boolean check1 = false;
								boolean check2 = false;
								boolean check3 = false;
								boolean check4 = false;
								boolean check5 = false;
								String msg = "";
								if (sourceServlet.equals("loginController")) {
									String thongBao = request.getAttribute("thongBao") + "";
									thongBao = thongBao.equals("null") ? "" : thongBao;
									if (error.equals("taiKhoanChuaXacNhan")) {
										check1 = true;
										msg = thongBao;
									} else if (error.equals("errorUserNameOrPass")) {
										check2 = true;
										msg = thongBao;
									} else if (error.equalsIgnoreCase("taikhoanbikhoa")) {
										check3 = true;
										msg = thongBao;
									} else if (error.equalsIgnoreCase("errorAccountEqualsTen")) {
										check4 = true;
										msg = thongBao;
									} else if (error.equalsIgnoreCase("errorAccountEqualsFive")) {
										check5 = true;
										msg = thongBao;
									}

								}
								%>
								<%
								if (check5 == true) {
								%>
								<div class="alert alert-danger"><%=msg%></div>
								<%
								}
								%>
								<form action="Login-Servlet" method="post">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label sr-only" for="email"></label>
											<div class="login-input">
												<input id="email" type="text" class="form-control"
													placeholder="<%=m.get("Login.TenDangNhap")%>"
													required="required" name="userName">
												<div class="login-icon">
													<i class="fa fa-user"></i>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label sr-only"></label>
											<div class="login-input">
												<input name="password" type="password" class="form-control"
													placeholder="<%= m.get("Login.MatKhau") %>" required="required">
												<div class="login-icon">
													<i class="fa fa-lock"></i>
												</div>
												<div class="eye-icon">
													<i class="fa fa-eye"></i>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb20 ">
										<%-- <button class="btn btn-primary btn-block mb10"><%= m.get("Login.DangNhap") %>
											</button> --%>
										<button id="loginButton"
											class="btn btn-primary btn-block mb10"
											<%="errorAccountEqualsFive".equals(error) ? "disabled" : ""%>>
											<%=m.get("Login.DangNhap")%>
										</button>
										<div style="margin: 0 auto; width: 50%">
											<a href="signup-form.jsp" style="margin-right: 40px;"
												class="text-blue"><%=m.get("Login.DangKy")%></a> <a
												href="forgot-password.jsp" class="text-blue"><%=m.get("Login.QuenMK")%>
											</a>
										</div>
									</div>
								</form>

								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
									<h4 class="mb20"><%=m.get("Login.Other1")%></h4>
									<div class="social-media">
										<a href="#" class="btn-social-rectangle btn-facebook"><i
											class="fa fa-facebook"></i><span class="social-text">Facebook</span></a>
										<a href="#" class="btn-social-rectangle btn-twitter"><i
											class="fa fa-twitter"></i><span class="social-text">Twitter</span>
										</a> <a href="#" class="btn-social-rectangle btn-googleplus"><i
											class="fa fa-google-plus"></i><span class="social-text">Google
												Plus</span></a>
									</div>
								</div>
								<!-- /.form -->
							</div>
						</div>
					</div>
					<!-- features -->
					<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
						<div class="box-body">
							<div class="feature-left">
								<div class="feature-icon">
									<img src="images/feature_icon_1.png" alt="">
								</div>
								<div class="feature-content">
									<h4><%=m.get("Login.MucDoUyTin")%></h4>
									<p><%=m.get("Login.text1")%></p>
								</div>
							</div>
							<div class="feature-left">
								<div class="feature-icon">
									<img src="images/feature_icon_2.png" alt="">
								</div>
								<div class="feature-content">
									<h4><%=m.get("Login.Other2")%></h4>
									<p><%=m.get("Login.text2")%></p>
								</div>
							</div>
							<div class="feature-left">
								<div class="feature-icon">
									<img src="images/feature_icon_3.png" alt="">
								</div>
								<div class="feature-content">
									<h4><%=m.get("Login.Other3")%></h4>
									<p><%=m.get("Login.text3")%></p>
								</div>
							</div>
						</div>
					</div>
					<!-- /.features -->
				</div>
			</div>
		</div>
	</div>
	<!-- /.login-form -->
	<!-- footer -->
	<!-- footer -->


	<div class="footer">
		<div class="container">
			<div class="row">
				<!-- footer-company-links -->
				<!-- footer-contact links -->
				<div class=" col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="footer-widget">
						<h3 class="footer-title">Thông tin hỗ trợ</h3>
						<div class="contact-info">
							<span class="contact-icon"><i class="fa fa-map-marker"></i></span>
							<span class="contact-text">Phường Linh Trung, Thủ Đức<br>Thành
								phố Hồ Chí Minh, Việt Nam - 1955
							</span>
						</div>
						<div class="contact-info">
							<span class="contact-icon"><i class="fa fa-phone"></i></span> <span
								class="contact-text">+084-123-4567 / 89</span>
						</div>
						<div class="contact-info">
							<span class="contact-icon"><i class="fa fa-envelope"></i></span>
							<span class="contact-text">nhom21@ltweb.com</span>
						</div>
					</div>
				</div>
				<!-- /.footer-useful-links -->
				<div class=" col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="footer-widget">
						<h3 class="footer-title">Tiện ích</h3>
						<ul class="arrow">
							<li><a href="index.html">Home </a></li>
							<li><a href="product-list.html">Mobie</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="blog-default.html">Blog</a></li>
							<li><a href="contact-us.html">Contact</a></li>
						</ul>
					</div>
				</div>
				<!-- /.footer-useful-links -->
				<!-- footer-policy-list-links -->
				<div class=" col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="footer-widget">
						<h3 class="footer-title">Chính sách</h3>
						<ul class="arrow">
							<li><a href="#">Thanh toán</a></li>
							<li><a href="#">Hủy, trả hàng</a></li>
							<li><a href="#">Giao hàng và vận chuyển</a></li>
							<li><a href="#">Chính sách bảo mật</a></li>
						</ul>
					</div>
				</div>
				<!-- /.footer-policy-list-links -->
				<!-- footer-social links -->
				<div class=" col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="footer-widget">
						<h3 class="footer-title">Liên lạc với chúng tôi</h3>
						<div class="ft-social">
							<span><a href="#" class="btn-social btn-facebook"><i
									class="fa fa-facebook"></i></a></span> <span><a href="#"
								class="btn-social btn-twitter"><i class="fa fa-twitter"></i></a></span>
							<span><a href="#" class="btn-social btn-googleplus"><i
									class="fa fa-google-plus"></i></a></span> <span><a href="#"
								class=" btn-social btn-linkedin"><i class="fa fa-linkedin"></i></a></span>
							<span><a href="#" class=" btn-social btn-pinterest"><i
									class="fa fa-pinterest-p"></i></a></span> <span><a href="#"
								class=" btn-social btn-instagram"><i class="fa fa-instagram"></i></a></span>
						</div>
					</div>
				</div>
				<!-- /.footer-social links -->
			</div>
		</div>
		<!-- tiny-footer -->
		<div class="tiny-footer">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="payment-method alignleft">
							<ul>
								<li><a href="#"><i class="fa fa-cc-paypal fa-2x"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-mastercard  fa-2x"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-visa fa-2x"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-discover fa-2x"></i></a></li>
							</ul>
						</div>
						<p class="alignright">
							Copyright © All Rights Reserved 2020 Template Design by <a
								href="https://easetemplate.com/" target="_blank"
								class="copyrightlink">Nhom 21</a>
						</p>
					</div>
				</div>
			</div>
			<!-- /. tiny-footer -->
		</div>
	</div>
	<%
	if (check1 == true) {
	%>
	<div class="modal" id="successModal">
		<div class="modal-content">
			<img
				src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
				alt="Notify Icon" style="width: 100px; height: 50px" />
			<h3><%=msg%></h3>
			<button class="btn-close" onclick="closeModal()">Đóng</button>
		</div>
	</div>
	<%
	}
	%>
	<%
	if (check2 == true) {
	%>
	<div class="modal" id="successModal">
		<div class="modal-content">
			<img
				src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
				alt="Notify Icon" style="width: 100px; height: 50px" />
			<h3><%=msg%></h3>
			<button class="btn-close" onclick="closeModal()">Đóng</button>
		</div>
	</div>
	<%
	}
	%>
	<%
	if (check3 == true) {
	%>
	<div class="modal" id="successModal">
		<div class="modal-content">
			<img
				src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
				alt="Notify Icon" style="width: 100px; height: 50px" />
			<h3><%=msg%></h3>
			<button class="btn-close" onclick="closeModal()">Đóng</button>
		</div>
	</div>
	<%
	}
	%>
	<%
	if (check4 == true) {
	%>
	<div class="modal" id="successModal">
		<div class="modal-content">
			<img
				src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
				alt="Notify Icon" style="width: 100px; height: 50px" />
			<h3><%=msg%></h3>
			<button class="btn-close" onclick="closeModal()">Đóng</button>
		</div>
	</div>
	<%
	}
	%>
	<script>
    // Nếu tài khoản bị khóa, đếm ngược 30 giây trước khi bật lại nút đăng nhập
    <% if ("errorAccountEqualsFive".equals(error)) { %>
        let countdown = 30;
        let loginButton = document.getElementById("loginButton");
        let interval = setInterval(() => {
            if (countdown > 0) {
                loginButton.innerText = "Vui lòng đợi " + countdown + "s";
                countdown--;
            } else {
                loginButton.innerText = "<%= m.get("Login.DangNhap") %>";
                loginButton.disabled = false;
                clearInterval(interval);
            }
        }, 1000);
    <% } %>
</script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- Bootstrap JS -->

	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script>
        // Lấy các phần tử HTML
        const dropdownButton = document.getElementById('dropdownButton');
        const dropdownMenu = document.getElementById('dropdownMenu');

        // Thêm sự kiện click vào nút dropdown
        dropdownButton.addEventListener('click', () => {
            // Hiển thị hoặc ẩn menu khi nhấn nút
            const isVisible = dropdownMenu.style.display === 'block';
            dropdownMenu.style.display = isVisible ? 'none' : 'block';
        });

        // Ẩn menu khi click ra ngoài dropdown
        window.addEventListener('click', (e) => {
            if (!dropdownButton.contains(e.target) && !dropdownMenu.contains(e.target)) {
                dropdownMenu.style.display = 'none';
            }
        });
    </script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/menumaker.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.sticky.js"></script>
	<script type="text/javascript" src="js/sticky-header.js"></script>
	<script>
	// Hàm đóng modal
	function closeModal() {
		document.getElementById("successModal").style.display = "none";
	}
    </script>
	<script type="text/javascript">
	const searchBox = document.getElementById("searchBox");
	const suggestionsList = document.getElementById("product-suggestions");

	 // Xử lý khi người dùng nhập từ khóa
	searchBox.addEventListener("input", function () {
	    const keyword = this.value.trim();

	    // Nếu từ khóa có ít nhất 1 ký tự
	    if (keyword.length > 1) {
	    	console.log(keyword);
	    	console.log(`URL Fetch: SearchServlet?ans=`+keyword);
	        fetch(`SearchServlet?ans=`+keyword)
	            .then(response => response.json())
	            .then(data => {
	                // Xóa các gợi ý cũ
	                suggestionsList.innerHTML = "";
                  
	                // Thêm các gợi ý mới
	                data.forEach(product => {
	                    const suggestionItem = document.createElement("li");
	                    suggestionItem.textContent = product.name;
	                    suggestionItem.addEventListener("click", function () {
	                        searchBox.value = product.name; // Gán sản phẩm được chọn vào thanh tìm kiếm
	                        suggestionsList.innerHTML = ""; // Xóa gợi ý
	                        suggestionsList.classList.remove("active"); // Ẩn danh sách
	                    });
	                    suggestionsList.appendChild(suggestionItem);
	                });

	                // Hiển thị danh sách gợi ý
	                suggestionsList.classList.add("active");
	            });
	            
	    } else {
	        // Ẩn danh sách nếu không có từ khóa
	        suggestionsList.innerHTML = "";
	        suggestionsList.classList.remove("active");
	    }
	});

	// Ẩn danh sách khi nhấp ra ngoài
	document.addEventListener("click", function (e) {
	    if (!searchBox.contains(e.target) && !suggestionsList.contains(e.target)) {
	        suggestionsList.innerHTML = "";
	        suggestionsList.classList.remove("active");
	    }
	}); 
	
	</script>
</body>

</html>