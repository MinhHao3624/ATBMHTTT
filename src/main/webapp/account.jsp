<%@page import="com.projectttweb.webphone.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keywords" content="">
<title>Account</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Style CSS -->
<link href="css/style.css" rel="stylesheet">
<!-- Google Fonts -->
<link rel="stylesheet"
	href="fonts/fontawesome-free-5.15.4-web/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet">
<!-- FontAwesome CSS -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
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
								placeholder="Tìm kiếm sản phẩm..." id="searchBox"
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
				<%
				Object obj = session.getAttribute("khachHang");
				User user = null;
				if (obj != null) {
					user = (User) obj;

				}
				%>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="account-section">
						<ul>
							<c:if test="${empty sessionScope.khachHang}">
								<li><a href="noAccount.jsp" class="title hidden-xs">Tài
										khoản</a></li>
								<li class="hidden-xs">|</li>
								<li><a href="login-form.jsp" class="title hidden-xs">Đăng
										Nhập</a></li>
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
										class="fa fa-shopping-cart"></i><sup class="cart-quantity">${soLuongSP}</sup></a>
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
								<li class="active"><a href="LoadDataMain">Trang chủ</a></li>
								<li><a href="http://localhost:8080/MobileWebApp/load-product?page=1">Điện thoại</a></li>
								<li class="has-sub"><a href="load-accessories">Phụ kiện</a>
									<ul>
										<li><a href="load-accessories?type=op-lung&page=1">Ốp lưng - Bao da</a></li>
										<li><a href="load-accessories?type=sac-cap&page=1">Sạc - Cáp</a></li>
										<li><a href="load-accessories?type=tai-nghe&page=1">Tai nghe</a></li>
										<li><a href="load-accessories?type=pin-sac-du-phong&page=1">Pin sạc dự phòng</a></li>
										<li><a href="load-accessories?type=dan-man-hinh&page=1">Dán màn hình</a></li>
										<li><a href="load-accessories?type=hub-chuyen-doi&page=1">Hub chuyển đổi</a></li>
									</ul>
								</li>
								<li><a href="go-to-blog">Thông tin</a></li>
								<li><a href="go-to-about">Bài viết</a></li>
								<li><a href="http://localhost:8080/MobileWebApp/go-to-contactus">Liên hệ, hỗ trợ</a></li>
							</ul>
						</div>
					</div>
					<!-- /.navigations-->
				</div>
			</div>
		</div>
	</div>

	<!-- /. header-section-->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-breadcrumb">
						<ol class="breadcrumb">
							<li><a href="#">Trang chủ</a></li>
							<li>Thông tin tài khoản</li>
						</ol>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- login-form -->
	<%
	String sourceServlet = request.getAttribute("sourceServlet") + "";
	sourceServlet = sourceServlet.equals("null") ? "" : sourceServlet;
	String img = "";
	String name = "";
	String email = "";
	String phone = "";
	String addRess = "";
	String date = "";
	String sex = "";
	String message = "";
	boolean kiemTra = false;
	String hd = "";
	if (sourceServlet.equals("accountLogin")) {
		img = request.getAttribute("image") + "";
		img = img.equals("null") ? "" : img;
		name = request.getAttribute("hoVaTen") + "";
		name = name.equals("null") ? "" : name;
		email = request.getAttribute("email") + "";
		email = email.equals("null") ? "" : email;
		phone = request.getAttribute("phone") + "";
		phone = phone.equals("null") ? "" : phone;
		addRess = request.getAttribute("addRess") + "";
		addRess = addRess.equals("null") ? "" : addRess;
		date = request.getAttribute("date") + "";
		date = date.equals("null") ? "" : date;
		sex = request.getAttribute("sex") + "";
		sex = sex.equals("null") ? "" : sex;

	} else if (sourceServlet.equals("changeInformation")) {
		hd = request.getAttribute("hanhDong") + "";
		hd = hd.equals("null") ? "" : hd;
		String msg = request.getAttribute("tinNhan") + "";
		msg = msg.equals("null") ? "" : msg;
		if (hd.equals("success")) {
			img = request.getAttribute("image") + "";
			img = img.equals("null") ? "" : img;
			String nameNew = request.getAttribute("hoVaTenNew") + "";
			nameNew = nameNew.equals("null") ? "" : nameNew;
			String emailNew = request.getAttribute("emailNew") + "";
			emailNew = emailNew.equals("null") ? "" : emailNew;
			String phoneNew = request.getAttribute("phoneNew") + "";
			phoneNew = phoneNew.equals("null") ? "" : phoneNew;
			String diaChiNew = request.getAttribute("diaChiNew") + "";
			diaChiNew = diaChiNew.equals("null") ? "" : diaChiNew;
			String dateNew = request.getAttribute("dateNew") + "";
			dateNew = dateNew.equals("null") ? "" : dateNew;
			String gioiTinhNew = request.getAttribute("gioiTinhNew") + "";
			gioiTinhNew = gioiTinhNew.equals("null") ? "" : gioiTinhNew;
			name = nameNew;
			email = emailNew;
			phone = phoneNew;
			addRess = diaChiNew;
			date = dateNew;
			sex = gioiTinhNew;
			kiemTra = true;
			message = msg;
		} else if (hd.equals("nosuccess")) {
			img = request.getAttribute("image") + "";
			img = img.equals("null") ? "" : img;
			String nameNew = request.getAttribute("hoVaTenNew") + "";
			nameNew = nameNew.equals("null") ? "" : nameNew;
			String emailNew = request.getAttribute("emailNew") + "";
			emailNew = emailNew.equals("null") ? "" : emailNew;
			String phoneNew = request.getAttribute("phoneNew") + "";
			phoneNew = phoneNew.equals("null") ? "" : phoneNew;
			String diaChiNew = request.getAttribute("diaChiNew") + "";
			diaChiNew = diaChiNew.equals("null") ? "" : diaChiNew;
			String dateNew = request.getAttribute("dateNew") + "";
			dateNew = dateNew.equals("null") ? "" : dateNew;
			String gioiTinhNew = request.getAttribute("gioiTinhNew") + "";
			gioiTinhNew = gioiTinhNew.equals("null") ? "" : gioiTinhNew;
			name = nameNew;
			email = emailNew;
			phone = phoneNew;
			addRess = diaChiNew;
			date = dateNew;
			sex = gioiTinhNew;
			kiemTra = true;
			message = msg;
		}
	} else if (sourceServlet.equals("changeImg")) {
		message = request.getAttribute("tinNhan") + "";
		message = message.equals("null") ? "" : message;
		name = user.getFullName();
		email = user.getEmail();
		phone = user.getPhoneNumber();
		addRess = user.getAddress();
		date = String.valueOf(user.getDateOfBirth());
		sex = user.getSex();
		img = request.getAttribute("imageNew") + "";
		img = img.equals("null") ? "" : img;
		kiemTra = true;
	} else if (sourceServlet.equals("changeAvatarFaild")) {
		message = request.getAttribute("hopThu") + "";
		message = message.equals("null") ? "" : message;
		name = user.getFullName();
		email = user.getEmail();
		phone = user.getPhoneNumber();
		addRess = user.getAddress();
		date = String.valueOf(user.getDateOfBirth());
		sex = user.getSex();
		img = request.getAttribute("duongDan") + "";
		img = img.equals("null") ? "" : img;
		kiemTra = true;
	} else {
		name = user.getFullName();
		email = user.getEmail();
		phone = user.getPhoneNumber();
		addRess = user.getAddress();
		date = String.valueOf(user.getDateOfBirth());
		sex = user.getSex();
		img = user.getImageAvatar();
	}
	%>

	<div class="content">
		<div class="container">
			<div class="box">
				<div class="row-account">
					<div class="left-container">
						<div class="user-infor">
							<img src="avatar/<%=img%>" alt="error"> <span><%=name%></span>
						</div>
						<div class="side-bar-content">
							<ul>
								<a href="http://localhost:8080/MobileWebApp/account-login?userID=${sessionScope.khachHang.userID}"><li class="slide-bar active"><i
										class="fa fa-edit"></i><span>Thông tin tài khoản</span></li></a>
								<a href="go-to-don-hang?page=1"><li class="slide-bar"><i
										class="fas fa-money-check"></i><span>Quản lý đơn hàng</span></li></a>
							   <a href="go-to-phan-hoi?page=1"><li class="slide-bar"><i
										class="fas fa-money-check"></i><span>Phản hồi</span></li></a>
							   <a href="go-to-so-du?userID=${sessionScope.khachHang.userID}"><li class="slide-bar"><i
										class="fas fa-money-check"></i><span>Số dư</span></li></a>
							   <a href="go-to-nang-cap?userID=${sessionScope.khachHang.userID}"><li class="slide-bar"><i
										class="fas fa-money-check"></i><span>Nâng cấp</span></li></a>
								<!-- <a href="address-deliver.html"><li class="slide-bar"><i class="fas fa-map-marker-alt"></i><span> Địa chỉ nhận hàng</span></li></a> -->
							   <a href="http://localhost:8080/MobileWebApp/profile-reset-password?userID=${sessionScope.khachHang.userID}">
									<li class="slide-bar"><i class="fas fa-lock"></i><span>
											Đổi mật khẩu</span></li>
								</a>
							</ul>
						</div>
					</div>
					<div class="right-container">
						<b><h3 class="title-content" style="font-weight: bold;">Thông
								tin tài khoản</h3></b>
						<form action="change-Avatar" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<b><span>Chọn ảnh đại diện mới</span></b> <label
									class="control-label  sr-only" for="re_password"></label> <input
									id="avatar" name="file" type="file" class="form-control"
									accept="image/*" value="chọn ảnh đại diện mới">
								<button class="btn-upload" id="re-btn-upload"
									style="position: relative; top: -54px; right: -300px; border: none; background-color: #87CEFA; color: white; border-radius: 8px;">Upload</button>
							</div>
						</form>
						<div class="account-infor">
							<form action="cap-nhat-thong-tin" method="post">
								<div class="form-control">
									<label for="" class="input-label"> Họ & tên </label> <input
										type="text" placeholder="Thêm họ tên" class="input-field"
										value="<%=name%>" name="hoVaTen">
								</div>
								<div class="form-control">
									<label for="" class="input-label"> Email </label> <input
										type="email" placeholder="Thêm email" class="input-field"
										value="<%=email%>" name="email">
								</div>

								<div class="form-control">
									<label for="" class="input-label"> Số điện thoại </label> <input
										type="phone" placeholder="Thêm số điện thoại"
										class="input-field" value="<%=phone%>" name="soDienThoai">
								</div>
								<div class="form-control">
									<label for="" class="input-label"> Địa chỉ giao hàng </label> <input
										type="phone" placeholder="Địa chỉ" class="input-field"
										value="<%=addRess%>" name="diaChiGiaoHang">
								</div>
								<div class="form-control">
									<label for="" class="input-label"> Ngày sinh </label> <input
										type="date" placeholder="Thêm ngày sinh" class="input-field"
										value="<%=date%>" name="ngaySinh">
								</div>

								<div class="form-control">
									<label for="" class="input-label"> Giới tính </label> <input
										type="radio" name="gender" value="Nam" checked
										class="input-radio"
										<%=sex.equals("Nam") ? "checked = 'checked'" : ""%>>
									Nam <input type="radio" name="gender" value="Nữ"
										class="input-radio"
										<%=sex.equals("Nữ") ? "checked = 'checked'" : ""%>> Nữ
									<input type="radio" name="gender" value="Khác"
										class="input-radio"
										<%=sex.equals("Khác") ? "checked = 'checked'" : ""%>>
									Khác

								</div>

								<button class="btn-update">Cập nhật</button>
							</form>
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
	if (kiemTra == true) {
	%>
	<div class="modal" id="successModal">
		<div class="modal-content">
			<img
				src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
				alt="Notify Icon" style="width: 100px; height: 50px" />
			<h3><%=message%></h3>
			<button class="btn-close" onclick="closeModal()" name="action"
				value="xacThuc">Đóng</button>
		</div>
	</div>
	<%
	}
	%>
	<script type="text/javascript">
	 function closeModal() {
		document.getElementById("successModal").style.display = "none";
		
	}
	</script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/menumaker.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.sticky.js"></script>
	<script type="text/javascript" src="js/sticky-header.js"></script>
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