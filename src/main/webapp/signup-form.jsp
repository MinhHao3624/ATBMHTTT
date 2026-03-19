<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="keywords" content="">
<title>Duy LTW</title>
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
	<!-- header-section-->
	<div class="top-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-7 col-sm-6 hidden-xs">
					<p class="top-text">Flexible Delivery, Fast Delivery.</p>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6 col-xs-12">
					<ul>
						<li>+03434 634 29</li>
						<li>laptrinhweb@mail.com</li>
					</ul>
				</div>
			</div>
			<!-- /.top-header-->
		</div>
	</div>
	<!-- header-section-->
	<%-- <%
String sourceServlet = request.getAttribute("sourceServlet")+"";
sourceServlet = sourceServlet.equals("null")?"":sourceServlet;
Object obj = session.getAttribute("khachHang");
User us = null;
boolean check1 = false;
if(sourceServlet.equals("loginController")) {
	if(obj != null) {
		us = (User) obj;
		check1 = true;
	}
}

%> --%>
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

	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

					<div class="page-breadcrumb">
						<ol class="breadcrumb">
							<li><a href="#">Trang chủ</a></li>
							<li>Đăng ký</li>
						</ol>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="container">
			<div class="box sing-form">
				<div class="row">
					<div
						class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-12 col-xs-12 ">
						<!-- form -->
						<div class="box-body">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12 mb20">
									<h3 class="mb10">Tạo tài khoản</h3>
									<p>Vui lòng điền đầy đủ các thông tin bên dưới</p>
								</div>
								<%
								/* 	String sourceServlet = request.getAttribute("sourceServlet")+"";
									sourceServlet = sourceServlet.equals("null")?"":sourceServlet;
									Object obj = session.getAttribute("khachHang");
									User us = null;
									boolean check1 = false;
									if(sourceServlet.equals("loginController")) {
										if(obj != null) {
									us = (User) obj;
									check1 = true;
										}
									} */
								String sourceServlet = request.getAttribute("sourceServlet") + "";
								sourceServlet = sourceServlet.equals("null") ? "" : sourceServlet;
								String baoLoi = "";
								String tenDangNhap = "";
								String hoVaTen = "";
								String email = "";
								String phone = "";
								String dateOfBirth = "";
								String addRess = "";
								String sex = "";
								boolean kiemTra = false;
								boolean xacThuc = false;
								boolean mo = false;
								boolean dong = false;
								boolean xacThuc2 = false;
								boolean xacThuc3 = false;
								String message = "";
								if (sourceServlet.equals("signUpController")) {
									String trangThaiDangKy = request.getAttribute("kiemTra") + "";
									if (trangThaiDangKy.equals("true")) {
										kiemTra = true;
										out.println(kiemTra);
										tenDangNhap = request.getAttribute("username") + "";
										tenDangNhap = tenDangNhap.equals("null") ? "" : tenDangNhap;
									} else {
										baoLoi = request.getAttribute("baoLoi") + "";
										baoLoi = baoLoi.equals("null") ? "" : baoLoi;

										tenDangNhap = request.getAttribute("username") + "";
										tenDangNhap = tenDangNhap.equals("null") ? "" : tenDangNhap;

										hoVaTen = request.getAttribute("fullName") + "";
										hoVaTen = hoVaTen.equals("null") ? "" : hoVaTen;

										email = request.getAttribute("email") + "";
										email = email.equals("null") ? "" : email;

										phone = request.getAttribute("phone") + "";
										phone = phone.equals("null") ? "" : phone;

										dateOfBirth = request.getAttribute("dateofbirth") + "";
										dateOfBirth = dateOfBirth.equals("null") ? "" : dateOfBirth;

										addRess = request.getAttribute("addRess") + "";
										addRess = addRess.equals("null") ? "" : addRess;

										sex = request.getAttribute("sex") + "";
										sex = addRess.equals("null") ? "" : sex;
									}
								} else if (sourceServlet.equals("VertifyController")) {
									String hd = request.getAttribute("hanhDong") + "";
									hd = hd.equals("null") ? "" : hd;
									if (hd.equals("confirm")) {
										String trangThaiXacThuc = request.getAttribute("isXacThuc") + "";
										trangThaiXacThuc = trangThaiXacThuc.equals("null") ? "" : trangThaiXacThuc;
										String msg = request.getAttribute("thongBao") + "";
										msg = msg.equals("null") ? "" : msg;
										if (trangThaiXacThuc.equals("true")) {
									xacThuc = true;
									message = msg;
										} else {
									message = msg;
									kiemTra = true;
									mo = true;
										}
									} else if (hd.equals("close")) {
										String msg = request.getAttribute("thongBao") + "";
										msg = msg.equals("null") ? "" : msg;
										message = msg;
										dong = true;
									}

								} else if (sourceServlet.equals("RegisterImage")) {
									String kq = request.getAttribute("kiemTra") + "";
									kq = kq.equals("null") ? "" : kq;
									if (kq.equals("true")) {
										String msg = request.getAttribute("thongBao") + "";
										msg = msg.equals("null") ? "" : msg;
										message = msg;
										xacThuc2 = true;
									}
								} else if (sourceServlet.equals("InsertImage")) {
									String kt = request.getAttribute("check") + "";
									kt = kt.equals("null") ? "" : kt;
									String msg = request.getAttribute("thongTin") + "";
									msg = msg.equals("null") ? "" : msg;
									if (kt.equals("true")) {
										xacThuc3 = true;
										message = msg;
									}
								}
								%>
								<div class="red" id="baoLoi"
									style="color: red; margin-left: 20px;">
									<%=baoLoi%>
								</div>
								<form action="sign-up" method="post">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label sr-only" for="name"> </label> <input
												id="name" name="username" type="text" class="form-control"
												placeholder="TÊN ĐĂNG NHẬP" required="required"
												value="<%=tenDangNhap%>">
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label sr-only" for="phone"></label> <input
												id="password" name="password" type="password"
												class="form-control" placeholder="MẬT KHẨU"
												required="required" />
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label sr-only" for="email"></label><span
												class="red" id="msg" style="color: red"></span> <input
												id="again-password" name="again-password" type="password"
												class="form-control" placeholder="NHẬP LẠI MẬT KHẨU"
												required="required" onkeyup="xacNhanMatKhau()" />
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label  sr-only" for="password"></label>
											<input id="fullName" name="fullName" type="text"
												class="form-control" placeholder="HỌ VÀ TÊN"
												required="required" value="<%=hoVaTen%>">
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label  sr-only" for="password"></label>
											<input id="email" name="email" type="email"
												class="form-control" placeholder="Email" required="required"
												value="<%=email%>">
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-;xs-12">
										<div class="form-group">
											<label class="control-label  sr-only" for="re_password"></label>
											<input id="phone" name="phone" type="text"
												class="form-control" placeholder="SỐ ĐIỆN THOẠI"
												required="required" value="<%=phone%>">
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label  sr-only" for="re_password"></label>
											<input id="dateOfBirth" name="dateOfBirth" type="date"
												class="form-control" required="required"
												value="<%=dateOfBirth%>">
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label  sr-only" for="re_password"></label>
											<input id="address" name="address" type="text"
												class="form-control" placeholder="ĐỊA CHỈ"
												required="required" value="<%=addRess%>">
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label for="gioiTinh" class="form-label">Giới tính</label> <select
												class="form-control" id="gioiTinh" name="gioiTinh">
												<option></option>
												<option value="Nam"
													<%=(sex.equals("Nam")) ? "selected = 'selected'" : ""%>>Nam</option>
												<option value="Nữ"
													<%=(sex.equals("Nữ")) ? "selected = 'selected'" : ""%>>Nữ</option>
												<option value="Khác"
													<%=(sex.equals("Khác")) ? "selected = 'selected'" : ""%>>Khác</option>
											</select>
										</div>
									</div>
									<!-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="control-label  sr-only" for="re_password"></label>
											<input id="avatar" name="avatar" type="file"
												class="form-control" accept="image/*">
										</div>
									</div> -->
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
										<button class="btn btn-primary btn-block mb10">Đăng
											Ký</button>
										<div>
											<p>
												Bạn đã có tài khoản?<a href="login-form.jsp"> Đăng Nhập</a>
											</p>
										</div>
									</div>
								</form>
							</div>
							<!-- /.form -->
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
									<h4>Mức độ uy tín!</h4>
									<p>Được đánh giá an toàn, tin cậy hàng đầu Việt Nam với
										nhiều chính sách hỗ trợ chăm sóc khách hàng.</p>
								</div>
							</div>
							<div class="feature-left">
								<div class="feature-icon">
									<img src="images/feature_icon_2.png" alt="">
								</div>
								<div class="feature-content">
									<h4>Thanh toán tức thì!</h4>
									<p>Thanh toán mọi nơi mọi lúc, giao dịch nhanh gọn, bảo
										đảm, an toàn, với liên kết 90% ngân hàng, ví tiền, VISA trong
										toàn quốc!</p>
								</div>
							</div>
							<div class="feature-left">
								<div class="feature-icon">
									<img src="images/feature_icon_3.png" alt="">
								</div>
								<div class="feature-content">
									<h4>Ưu đãi hấp dẫn!</h4>
									<p>Với mong muốn làm hài lòng khách hàng, Mobistore luôn
										mang đến những ưu đãi cực kỳ tốt với chất lượng cao</p>
								</div>
							</div>
						</div>
					</div>
					<!-- /.features -->
				</div>
			</div>
		</div>
	</div>
	<!-- /.sign-up form -->
	<!-- footer -->
	<!-- Modal thông báo đăng ký thành công -->
	<%
	if (kiemTra == true) {
	%>
	<div class="modal" id="successModal">
		<div class="modal-content">
			<img src="https://img.icons8.com/color/48/000000/checked--v1.png"
				alt="Success Icon" />
			<h3>Đăng ký thành công</h3>
			<p>Bạn vui lòng truy cập email để kích hoạt tài khoản.</p>
			<!-- Thêm nhãn và ô nhập mã xác nhận -->
			<%
			if (mo == true) {
			%>) <span class="red" style="color: red"><%=message%></span>
			<%
			}
			%>
			<form action="VerifyServlet" method="post">
				<label for="verificationCode">Nhập mã xác nhận:</label> <input
					type="text" name="maXacNhan" id="verificationCode"
					placeholder="Nhập mã xác nhận" />
				<button class="btn-close" name="action" value="confirm">Xác
					nhận</button>
				<button class="btn-close" name="action" value="close">Đóng</button>
			</form>
		</div>
	</div>
	<%
	}
	%>
	<%
	if (xacThuc == true) {
	%>
	<form action="register-img" method="post">
		<div class="modal" id="successModal">
			<div class="modal-content">
				<img src="https://img.icons8.com/color/48/000000/checked--v1.png"
					alt="Success Icon" />
				<h3><%=message%></h3>
				<button class="btn-close" name="action" value="xacThuc"
					onclick="closeModal()">Đóng</button>
			</div>
		</div>
	</form>
	<%
	}
	%>
	<%
	if (dong == true) {
	%>
	<form action="register-img" method="post">
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
	</form>
	<%
	}
	%>
	<%
	if (xacThuc2 == true) {
	%>
	<form action="up-Load-File" method="post" enctype="multipart/form-data">
		<div class="modal" id="successModal">
			<div class="modal-content">
				<img
					src="https://tse3.mm.bing.net/th?id=OIP.pAyRN_lNf6IPukCMXYcRcQAAAA&pid=Api&P=0&h=180"
					alt="Avatar Icon" />
				<h3><%=message%></h3>
				<div class="form-group">
					<label class="control-label  sr-only" for="re_password"></label> <input
						id="avatar" name="file" type="file" class="form-control"
						accept="image/*">
				</div>
				<button class="btn-close" name="action" value="upLoad" type="submit">Upload</button>
				<button class="btn-close" name="action" value="upLoadSau"
					type="button" onclick="closeModal()">
					<a href="http://localhost:8080/MobileWebApp/huyPhien">Upload
						sau</a>
				</button>
			</div>
		</div>
	</form>
	<%
	}
	%>
	<%
	if (xacThuc3 == true) {
	%>
	<div class="modal" id="successModal">
		<div class="modal-content">
			<img src="https://img.icons8.com/color/48/000000/checked--v1.png"
				alt="Success Icon" />
			<h3><%=message%></h3>
			<button class="btn-close" name="action" value="xacThuc"
				onclick="closeModal()">Đóng</button>
		</div>
	</div>
	<%
	}
	%>

	<!-- /.footer -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/menumaker.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.sticky.js"></script>
	<script type="text/javascript" src="js/sticky-header.js"></script>
	-->
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
	
	<script>
		// Hàm đóng modal
		function closeModal() {
			document.getElementById("successModal").style.display = "none";
			
		}

	<%-- 	// Kiểm tra trạng thái đăng ký thành công và hiển thị modal
		window.onload = function() {
	<%if ("true".equals(request.getAttribute("kiemTra") + "")) {%>
		document.getElementById("successModal").style.display = "flex";
	<%}%>
		}; --%>

		// Hàm đóng modal
		function closeModal1() {
			document.getElementById("successModal1").style.display = "none";
		}

		// Kiểm tra trạng thái đăng ký thành công và hiển thị modal
	<%-- window.onload = function() {
	<%if ("true".equals(request.getAttribute("xacThuc") + "")) {%>
		document.getElementById("successModal1").style.display = "flex";
	<%}%> --%>
	
	</script>
	

</body>
<script>
	function xacNhanMatKhau() {
		var matKhau = document.getElementById("password").value;
		var matKhauNhapLai = document.getElementById("again-password").value;
		if (matKhau != matKhauNhapLai) {
			document.getElementById("msg").innerHTML = "Mật khẩu nhập lại không đúng";
			return false;
		} else {
			document.getElementById("msg").innerHTML = "";
			return true;
		}
	}
</script>

</html>