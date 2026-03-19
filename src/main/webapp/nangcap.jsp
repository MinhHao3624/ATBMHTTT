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
<title>DuyAnh LT WEB</title>
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
<style type="text/css">
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
/*  CSS FORM  */
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
/* Định dạng chung cho container của form */
.user-upgrade-container {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

.user-upgrade-container h2 {
	text-align: center;
	color: #333;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.user-upgrade-section {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 600px;
	display: flex;
	justify-content: space-between;
}

.user-upgrade-left, .user-upgrade-right {
	width: 48%;
}

.user-upgrade-container label {
	font-weight: bold;
	display: block;
	margin-top: 10px;
}

.user-upgrade-info {
	background: #e9e9e9;
	padding: 8px;
	border-radius: 5px;
	margin-top: 5px;
}

.user-upgrade-button {
	width: 100%;
	padding: 10px;
	margin-top: 15px;
	border: none;
	border-radius: 5px;
	background-color: #007bff;
	color: white;
	font-size: 16px;
	cursor: pointer;
}

.user-upgrade-button:hover {
	background-color: #0056b3;
}

//
/* Nút mở form */
.history-open-btn {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	display: block;
	margin: 20px auto;
}

.history-open-btn:hover {
	background-color: #0056b3;
}

/* Lớp nền mờ */
.history-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	display: block;
	z-index: 10;
}

/* Form chính */
.history-form-container {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 80%;
	max-width: 900px;
	background: white;
	border-radius: 10px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
	padding: 20px;
	display: block;
	z-index: 20;
}

/* Header của form */
.history-form-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
}

.history-form-header h2 {
	margin: 0;
	font-size: 20px;
}

.history-close-btn {
	font-size: 20px;
	cursor: pointer;
	color: red;
}

.history-close-btn:hover {
	color: darkred;
}

/* Nội dung bảng */
.history-form-content {
	display: flex;
	flex-direction: column; /* Sắp xếp theo chiều dọc */
	gap: 20px;
	margin-top: 20px;
}

/* Container của từng bảng */
.history-table-container {
	background: #f9f9f9;
	padding: 15px;
	border-radius: 5px;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

/* Thanh cuộn */
.history-table-scroll {
	max-height: 200px;
	overflow-y: auto;
	overflow-x: auto;
	border: 1px solid #ddd;
}

/* Định dạng bảng */
.history-table {
	width: 100%;
	border-collapse: collapse;
}

.history-table th, .history-table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
	white-space: nowrap;
}

.history-table th {
	background: #007bff;
	color: white;
	position: sticky;
	top: 0;
}

.history-table-container h3 {
	text-align: center;
	margin-top: 0;
}

/* Thanh cuộn riêng cho từng bảng */
.history-table-scroll {
	max-height: 250px; /* Tăng chiều cao hiển thị */
	overflow-y: auto; /* Cuộn theo chiều dọc */
	overflow-x: auto; /* Cuộn theo chiều ngang */
	border: 1px solid #ddd;
	position: relative;
}

/* Thiết lập hiển thị bảng */
.history-table {
	width: 100%;
	min-width: 800px; /* Đảm bảo có thanh cuộn ngang nếu dữ liệu quá dài */
	border-collapse: collapse;
}

/* Header bảng cố định khi cuộn */
.history-table thead th {
	background: #007bff;
	color: white;
	position: sticky;
	top: 0;
	z-index: 1;
}

/* Ô bảng */
.history-table th, .history-table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
	white-space: nowrap; /* Giữ nội dung trên một dòng */
}

/* Căn chỉnh tiêu đề bảng */
.history-table-container h3 {
	text-align: center;
	margin-top: 0;
}

/* Tăng khoảng cách giữa 2 bảng */
.history-table-container {
	background: #f9f9f9;
	padding: 15px;
	border-radius: 5px;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	margin-bottom: 15px;
}

/* Bọc tất cả CSS trong class .custom-modal để tránh ảnh hưởng */
/* Nền mờ overlay (phủ toàn màn hình) */
.custom-modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5); /* Làm mờ nền */
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 9999; /* Đảm bảo form nằm trên cùng */
}

/* Form hiển thị ở giữa màn hình */
.custom-modal-content {
	background: white;
	width: 70%; /* Độ rộng form */
	max-width: 800px; /* Giới hạn kích thước form */
	max-height: 90vh; /* Giới hạn chiều cao form */
	overflow: hidden; /* Ẩn phần nội dung vượt quá */
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
	position: relative;
	display: flex;
	flex-direction: column;
}

/* Nút đóng (X) */
.custom-close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	background: red;
	color: white;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	border-radius: 50%;
	font-weight: bold;
}

.custom-close-btn:hover {
	background: darkred;
}

/* Tiêu đề */
.custom-modal-content h2 {
	text-align: center;
	margin-bottom: 15px;
}

/* Container chứa bảng (có thanh cuộn nếu nội dung dài) */
.custom-table-container {
	flex-grow: 1; /* Để bảng mở rộng khi cần */
	max-height: 60vh; /* Giới hạn chiều cao bảng */
	overflow-y: auto; /* Thanh cuộn khi cần */
	border: 1px solid #ccc;
	padding: 10px;
}

/* Định dạng bảng */
.custom-table {
	width: 100%;
	border-collapse: collapse;
}

.custom-table th, .custom-table td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

.custom-table th {
	background-color: #007bff;
	color: white;
}


/* Nền mờ overlay (phủ toàn màn hình) */
/* Nền mờ overlay phủ toàn màn hình */
/* Nền mờ overlay phủ toàn màn hình */
.custom-modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5); /* Làm mờ nền */
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 99999; /* Đảm bảo form luôn nằm trên cùng */
}

/* Form hiển thị ở giữa màn hình */
.custom-modal-content {
	background: white;
	width: 70%;
	max-width: 800px;
	max-height: 90vh;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.5);
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	display: flex;
	flex-direction: column;
	overflow: hidden;
	z-index: 100000; /* Form có z-index cao nhất */
}

/* Nút đóng (X) luôn hiển thị */
.custom-close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	background: red;
	color: white;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	border-radius: 50%;
	font-weight: bold;
	z-index: 100001; /* Đảm bảo luôn hiển thị trên cùng */
}

.custom-close-btn:hover {
	background: darkred;
}

/* Tiêu đề */
.custom-modal-content h2 {
	text-align: center;
	margin-bottom: 15px;
}

/* Container chứa bảng (có thanh cuộn nếu nội dung dài) */
.custom-table-container {
	flex-grow: 1; /* Để bảng mở rộng khi cần */
	max-height: 65vh; /* Giới hạn chiều cao bảng */
	overflow-y: auto; /* Thanh cuộn khi cần */
	border: 1px solid #ccc;
	padding: 10px;
}

/* Định dạng bảng */
.custom-table {
	width: 100%;
	border-collapse: collapse;
}

.custom-table th, .custom-table td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

.custom-table th {
	background-color: #007bff;
	color: white;
}

body {
	margin: 0;
	background-color: #f4f4f4;
}

.registration-wrapper {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
}

.registration-form {
	font-family: Arial, sans-serif;
	width: 400px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	background-color: #fff;
	text-align: center;
}

.registration-form h2 {
	margin-bottom: 15px;
}

.registration-form p, .registration-form ul, .registration-form ol {
	font-size: 14px;
	text-align: left;
}

.registration-form .buttons {
	margin-top: 15px;
}

.registration-form .btn-register, .registration-form .btn-cancel {
	padding: 10px 20px;
	margin: 5px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.registration-form .btn-register {
	background-color: #28a745;
	color: white;
}

.registration-form .btn-cancel {
	background-color: #dc3545;
	color: white;
}

body {
	margin: 0;
	background-color: #f4f4f4;
	font-family: Arial, sans-serif;
}

.registration-wrapper, .signup-form {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	display: none;
	justify-content: center;
	align-items: center;
	width: 100%;
}

.form-container {
	width: 400px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	background-color: #fff;
	text-align: center;
}

.form-container h2 {
	margin-bottom: 15px;
}

.buttons {
	margin-top: 15px;
}

.btn {
	padding: 10px 20px;
	margin: 5px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn-register {
	background-color: #28a745;
	color: white;
}

.btn-cancel {
	background-color: #dc3545;
	color: white;
}

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
							<li>Nâng cấp tài khoản</li>
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
				<div class="row-account">
					<div class="left-container">
						<div class="user-infor">
							<img src="avatar/${sessionScope.khachHang.imageAvatar}" alt="">
							<span>${sessionScope.khachHang.getFullName()}</span>
						</div>
						<div class="side-bar-content">
							<ul>
								<a
									href="http://localhost:8080/MobileWebApp/account-login?userID=${sessionScope.khachHang.userID}"><li
									class="slide-bar "><i class="fa fa-edit"></i><span>Thông
											tin tài khoản</span></li></a>
								<a href="go-to-don-hang?page=1"><li class="slide-bar active"><i
										class="fas fa-money-check"></i><span>Quản lý đơn hàng</span></li></a>
								<a href="go-to-phan-hoi?page=1"><li class="slide-bar"><i
										class="fas fa-money-check"></i><span>Phản hồi</span></li></a>
								<a href="go-to-so-du?userID=${sessionScope.khachHang.userID}"><li
									class="slide-bar"><i class="fas fa-money-check"></i><span>Số
											dư</span></li></a>
								<a href="go-to-nang-cap?userID=${sessionScope.khachHang.userID}"><li
									class="slide-bar"><i class="fas fa-money-check"></i><span>Nâng
											cấp</span></li></a>
								<!-- <a href="address-deliver.html"><li class="slide-bar"><i class="fas fa-map-marker-alt"></i><span> Địa chỉ nhận hàng</span></li></a> -->
								<a
									href="http://localhost:8080/MobileWebApp/profile-reset-password?userID=${sessionScope.khachHang.userID}">
									<li class="slide-bar"><i class="fas fa-lock"></i><span>
											Đổi mật khẩu</span></li>
								</a>
							</ul>
						</div>
					</div>
					<div class="user-upgrade-container">
						<h2>Nâng cấp tài khoản người dùng</h2>
						<div class="user-upgrade-section">
							<div class="user-upgrade-left">
								<label>Loại tài khoản:</label>
								<div class="user-upgrade-info" id="accountType">${loaiTaiKhoan}</div>

								<label>Số tiền đã nộp trong tháng gần nhất:</label>
								<div class="user-upgrade-info" id="lastDeposit">${soTienDaNop}
									VND</div>

								<a
									href="xem-lich-su-nap?userID=${sessionScope.khachHang.userID}"><button
										class="user-upgrade-button primary" class="open-form-btn">Xem
										lịch sử nạp tiền</button></a> <label>Lưu ý:</label>
								<div class="user-upgrade-info">Để nâng cấp thành tài khoản
									VIP, mỗi tháng phải nạp trên 2 triệu VND nếu không sẽ bị hạ
									cấp.</div>

								<button class="user-upgrade-button primary">Nạp tiền
									ngay</button>
							</div>
							<div class="user-upgrade-right">
								<label>Đăng ký cộng tác viên:</label> <label>${ctv}</label>
								<div class="user-upgrade-info" id="isPartner">Chưa đăng ký</div>

								<label>Số sản phẩm đã đăng bán:</label>
								<div class="user-upgrade-info" id="productsPosted">${soSPDaDangBan}</div>
								<a
									href="go-to-so-sp-dang-ban?userID=${sessionScope.khachHang.userID}"><button
										class="user-upgrade-button secondary">Xem danh sách</button></a> <label>Số
									sản phẩm đã thu hồi:</label>
								<div class="user-upgrade-info" id="productsWithdrawn">${soSPDaThuHoi}</div>
								<a
									href="go-to-san-pham-thu-hoi?userID=${sessionScope.khachHang.userID}"><button
										class="user-upgrade-button secondary">Xem danh sách</button></a> <label>Số
									sản phẩm đã bán được trong tháng gần nhất:</label>
								<div class="user-upgrade-info" id="productsSold">${soSPDaBanTrongThangGanNhat}</div>
								<a
									href="go-to-so-sp-ban-trong-thang?userID=${sessionScope.khachHang.userID}"><button
										class="user-upgrade-button secondary">Xem danh sách</button></a> <label>Số
									tiền kiếm được:</label>
								<div class="user-upgrade-info" id="earnedMoney">${soTienKiemDuoc}
									VND</div>

								<button class="user-upgrade-button primary"
									onclick="openRegistrationForm()">Đăng ký cộng tác viên</button>
								<button class="user-upgrade-button danger">Hủy làm cộng
									tác viên</button>
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
	<!-- Nền mờ khi form hiển thị -->
	<!-- Nút mở form -->
	<!-- <button class="history-open-btn" onclick="openHistoryForm()">Xem
		Lịch Sử Nạp Tiền</button> -->
	<c:if test="${kiemTra1 == true}">
		<!-- Nền mờ khi form hiển thị -->
		<div class="history-overlay" id="historyOverlay"
			onclick="closeHistoryForm()"></div>

		<!-- Form chính -->
		<div class="history-form-container" id="historyForm">
			<div class="history-form-header">
				<h2>Lịch Sử Nạp Tiền</h2>
				<button class="history-close-btn" onclick="closeHistoryForm()">✖</button>
			</div>

			<div class="history-form-content">
				<!-- Bảng nạp tiền qua ATM -->
				<div class="history-table-container">
					<h3>Nạp Tiền Qua ATM</h3>
					<div class="history-table-scroll">
						<table class="history-table">
							<thead>
								<tr>
									<th>User ID</th>
									<th>Số tiền trước</th>
									<th>Số tiền nạp</th>
									<th>Số tiền sau</th>
									<th>Ngày nạp</th>
									<th>Status</th>
									<th>Ngân hàng</th>
									<th>Số tài khoản</th>
									<th>Mã Pin</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list1}">
									<tr>
										<td>${item.userID.userID}</td>
										<td>${item.amountBeforeDesposit}</td>
										<td>${item.amountDesposit}</td>
										<td>${item.amountAfterDesposit}</td>
										<td>${item.date}</td>
										<td>${item.status}</td>
										<td>${item.bank}</td>
										<td>${item.numAccount}</td>
										<td>${item.pinCode}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- Bảng nạp tiền qua thẻ cào -->
				<div class="history-table-container">
					<h3>Nạp Tiền Qua Thẻ Cào</h3>
					<div class="history-table-scroll">
						<table class="history-table">
							<thead>
								<tr>
									<th>User ID</th>
									<th>Số seri</th>
									<th>Mã thẻ</th>
									<th>Mệnh giá</th>
									<th>Status</th>
									<th>Số tiền thực</th>
									<th>Nhà mạng</th>
									<th>Ngày nạp</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list2}">
									<tr>
										<td>${item.user.userID}</td>
										<td>${item.soSeri}</td>
										<td>${item.maThe}</td>
										<td>${item.menhGia}</td>
										<td>${item.status}</td>
										<td>${item.soTienReal}</td>
										<td>${item.nhaMang}</td>
										<td>${item.ngayNap}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- Nền mờ overlay -->
	<!-- Nền mờ overlay -->
	<c:if test="${check3 == 'true'}">
		<div class="custom-modal-overlay">
			<div class="custom-modal-content">
				<button class="custom-close-btn" onclick="closeCustomModal()">X</button>
				<h2>Danh Sách Sản Phẩm Đã Đăng Bán</h2>
				<div class="custom-table-container">
					<table class="custom-table">
						<thead>
							<tr>
								<th>ID Sản Phẩm</th>
								<th>Tên Sản Phẩm</th>
								<th>Giá</th>
								<th>Tồn Kho</th>
								<th>Ngày Đăng</th>
								<th>Loại Sản Phẩm</th>
								<th>Thông Tin</th>
								<th>User ID</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${dsSoSPDaDangBan}">
								<tr>
									<td>${item.productID}</td>
									<td>${item.name}</td>
									<td>${item.price}VND</td>
									<td>${item.stockQuantity}</td>
									<td>${item.createAt}</td>
									<td>${item.categories.nameCategories}</td>
									<td>${item.informationPro.info_ID}</td>
									<td>${item.userID.userID}</td>
									<td>${item.status}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${check4 == 'true'}">
		<div class="custom-modal-overlay">
			<div class="custom-modal-content">
				<button class="custom-close-btn" onclick="closeCustomModal()">X</button>
				<h2>Danh Sách Sản Phẩm Đã Đăng Bán</h2>
				<div class="custom-table-container">
					<table class="custom-table">
						<thead>
							<tr>
								<th>ID Sản Phẩm</th>
								<th>Tên Sản Phẩm</th>
								<th>Giá</th>
								<th>Tồn Kho</th>
								<th>Ngày Đăng</th>
								<th>Loại Sản Phẩm</th>
								<th>Thông Tin</th>
								<th>User ID</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${dsSoSPDaThuHoi}">
								<tr>
									<td>${item.productID}</td>
									<td>${item.name}</td>
									<td>${item.price}VND</td>
									<td>${item.stockQuantity}</td>
									<td>${item.createAt}</td>
									<td>${item.categories.nameCategories}</td>
									<td>${item.informationPro.info_ID}</td>
									<td>${item.userID.userID}</td>
									<td>${item.status}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${check5 == 'true'}">
		<div class="custom-modal-overlay">
			<div class="custom-modal-content">
				<button class="custom-close-btn" onclick="closeCustomModal()">X</button>
				<h2>Danh Sách Sản Phẩm Đã Đăng Bán</h2>
				<div class="custom-table-container">
					<table class="custom-table">
						<thead>
							<tr>
								<th>ID Sản Phẩm</th>
								<th>Tên Sản Phẩm</th>
								<th>Giá</th>
								<th>Tồn Kho</th>
								<th>Ngày Đăng</th>
								<th>Loại Sản Phẩm</th>
								<th>Thông Tin</th>
								<th>User ID</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${soSPDaBanTrongThang}">
								<tr>
									<td>${item.productID}</td>
									<td>${item.name}</td>
									<td>${item.price}VND</td>
									<td>${item.stockQuantity}</td>
									<td>${item.createAt}</td>
									<td>${item.categories.nameCategories}</td>
									<td>${item.informationPro.info_ID}</td>
									<td>${item.userID.userID}</td>
									<td>${item.status}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<button class="user-upgrade-button primary"
		onclick="openRegistrationForm()">Đăng ký cộng tác viên</button>

	<div class="registration-wrapper" id="registrationWrapper">
		<div class="form-container">
			<h2>Đăng ký Cộng tác viên</h2>
			<p>Để làm cộng tác viên bán hàng của trang web, bạn cần đáp ứng
				các yêu cầu sau:</p>
			<ul>
				<li>Trên 18 tuổi.</li>
				<li>Trình độ: Tốt nghiệp THPT.</li>
				<li>Có tài khoản ngân hàng để thuận tiện trong giao dịch.</li>
				<li>Cung cấp căn cước công dân.</li>
				<li>Cọc 10 triệu để web giữ vị trí.</li>
			</ul>
			<p>
				<strong>Các bước đăng ký:</strong>
			</p>
			<ol>
				<li>Điền đầy đủ thông tin.</li>
				<li>Nhấn Đăng ký, hệ thống sẽ hiển thị form nạp tiền.</li>
				<li>Nạp tiền và hoàn tất thanh toán.</li>
			</ol>
			<div class="buttons">
				<button class="btn btn-register" onclick="openSignupForm()">Đăng
					ký</button>
				<button class="btn btn-cancel"
					onclick="closeProductModal3()">Hủy bỏ</button>
			</div>
		</div>
	</div>

	<div class="signup-form" id="signupForm">
		<div class="form-container">
			<h2>Tiến hành đăng ký</h2>
			<form id="signupFormContent" action="dang-ky-ctv" method="post">
				<label>Họ và tên:</label> <input type="text" required name = "hoten"><br>
				<br> <label>Tuổi:</label> <input type="number" min="18" name = "age"
					required><br><label>Căn cước công dân:</label> <input type="text" name = "cccd"
					required> <br> <label>Giới tính:</label> <select
					required name = "gender">
					<option value="Nam">Nam</option>
					<option value="Nữ">Nữ</option>
					<option value="Khác">Khác</option>
				</select><br> <br> <label>Trình độ học vấn:</label> <select
					required name = "trinhdo">
					<option value="THPT">Tốt nghiệp THPT</option>
					<option value="Cao Đẳng">Cao Đẳng</option>
					<option value="Đại học">Đại học</option>
					<option value="Thạc sĩ">Thạc sĩ</option>
					<option value="Tiến sĩ">Tiến sĩ</option>
				</select><br> <br> <label>Số tài khoản:</label> <input type="text"
					required name = "soTaiKhoan"><br> <br> <label>Nhập mã
					captcha:</label> <input type="text" id="captchaInput" required><br>
				<span id="captchaCode"></span>
				<button type="button" onclick="generateCaptcha()">Tạo mã
					mới</button>
				<br> <br>
				<div class="buttons">
					<button class="btn btn-register" type="submit" id="submitButton"
						disabled>Xác nhận</button>
					<button class="btn btn-cancel" type="button"
						onclick="closeProductModal2()">Hủy bỏ</button>
				</div>
			</form>
		</div>
	</div>
	<c:if test="${check4 == true}">
	<div class="modal" id="successModal">
				<div class="modal-content">
					<img
						src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
						alt="Notify Icon" style="width: 100px; height: 50px" />
					<h3>${baoLoi}</h3>
					<button class="btn-close" onclick="closeModal()" name="action"
						value="xacThuc">Đóng</button>
				</div>
			</div>
			</c:if>

	<script>
        function openRegistrationForm() {
            document.getElementById("registrationWrapper").style.display = "flex";
        }
        
        function openSignupForm() {
            document.getElementById("signupForm").style.display = "flex";
            document.getElementById("registrationWrapper").style.display = "none";
            generateCaptcha();
        }
        
        function closeForm(id) {
            document.getElementById(id).style.display = "none";
        }
        
        function generateCaptcha() {
            let captcha = Math.random().toString(36).substring(2, 8);
            document.getElementById("captchaCode").innerText = captcha;
        }
        
        document.getElementById("captchaInput").addEventListener("input", function() {
            let input = this.value;
            let generated = document.getElementById("captchaCode").innerText;
            document.getElementById("submitButton").disabled = input !== generated;
        });
    </script>
	<script>
        function openHistoryForm() {
            document.getElementById("historyOverlay").style.display = "block";
            document.getElementById("historyForm").style.display = "block";
        }

        function closeHistoryForm() {
            document.getElementById("historyOverlay").style.display = 'none';
            document.getElementById("historyForm").style.display = 'none';
        }
        function openProductModal() {
            document.getElementById("productModal").style.display = "flex";
        }

        function closeProductModal() {
            document.getElementById("productModal").style.display = "none";
        }
        function closeProductModal2() {
            document.getElementById("signupForm").style.display = "none";
        }
        function closeProductModal3() {
            document.getElementById("registrationWrapper").style.display = "none";
        }
        function closeCustomModal() {
            document.querySelector(".custom-modal-overlay").style.display = "none";
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
	<script type="text/javascript">
	// Mở form
	function openForm() {
	    document.getElementById("overlay").classList.add("active");
	}

	// Đóng form
	function closeForm() {
	    document.getElementById("overlay").classList.remove("active");
	}
	</script>
</body>



</html>