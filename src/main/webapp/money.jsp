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
<!-- Bootstrap Icons -->

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

#nap-tien-container {
	display: flex;
	justify-content: center;
	align-items: flex-start; /* Đưa phần này lên trên thay vì căn giữa */
	min-height: 80vh; /* Giảm chiều cao để đẩy lên trên */
	padding-top: 50px; /* Đẩy phần này lên trên một chút */
}

#nap-tien-container .card {
	background: white;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: 400px; /* Mở rộng chiều rộng */
	max-width: 90%; /* Giữ cho không bị quá lớn trên màn hình nhỏ */
}

#nap-tien-container .balance {
	font-size: 28px;
	font-weight: bold;
	color: #28a745;
	margin-bottom: 15px;
}

#nap-tien-container .button-group {
	display: flex;
	gap: 15px; /* Tăng khoảng cách giữa các nút */
	flex-direction: row; /* Hiển thị nút theo hàng ngang */
	justify-content: center;
}

#nap-tien-container .btn {
	flex: 1; /* Để hai nút bằng nhau */
	padding: 12px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-size: 16px;
	min-width: 150px;
}

#nap-tien-container .card-btn {
	background: #007bff;
	color: white;
}

#nap-tien-container .bank-btn {
	background: #28a745;
	color: white;
}

#nap-tien-container .btn:hover {
	opacity: 0.85;
}

//
css form /* Định dạng container chính */
        #nap-tien-container {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	min-height: 80vh;
	padding-top: 50px;
}

/* Định dạng card chính */
.card {
	background: white;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: 400px;
	max-width: 90%;
}

.balance {
	font-size: 28px;
	font-weight: bold;
	color: #28a745;
	margin-bottom: 15px;
}

.button-group {
	display: flex;
	gap: 15px;
	flex-direction: row;
	justify-content: center;
}

.btn {
	flex: 1;
	padding: 12px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-size: 16px;
	min-width: 150px;
	color: white;
}

.card-btn {
	background: #007bff;
}

.bank-btn {
	background: #28a745;
}

.btn:hover {
	opacity: 0.85;
}

/* ========== FORM NẠP TIỀN ========== */
.nap-tien-form {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: white;
	padding: 25px;
	width: 350px;
	border-radius: 10px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
	text-align: center;
	z-index: 1000;
}

.nap-tien-form h3 {
	margin-bottom: 15px;
	color: #333;
}

.nap-tien-form select, .nap-tien-form input {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.nap-tien-form .submit-btn {
	background: #28a745;
	color: white;
	padding: 10px;
	width: 100%;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
}

.nap-tien-form .submit-btn:hover {
	opacity: 0.85;
}

.close-btn {
	background: #dc3545;
	color: white;
	padding: 8px 12px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	position: absolute;
	top: 10px;
	right: 10px;
}

/* Hiệu ứng hiển thị */
.show {
	display: block;
	animation: fadeIn 0.3s ease-in-out;
}

keyframes fadeIn {from { opacity:0;
	transform: translate(-50%, -60%);
}

to {
	opacity: 1;
	transform: translate(-50%, -50%);
}

}

/* Màn hình mờ khi hiển thị form */
.overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 999;
}

.overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5); /* Màu nền mờ */
	z-index: 99;
}

/* Form thanh toán */
.nap-tien-form {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
	z-index: 100;
	width: 350px;
	text-align: center;
}

/* Nút đóng form */
.close-btn {
	position: absolute;
	top: 10px;
	right: 15px;
	background: none;
	border: none;
	font-size: 18px;
	cursor: pointer;
}

/* Input và Select */
input, select {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
}

/* Nút Submit */
.submit-btn {
	width: 100%;
	padding: 10px;
	background: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.submit-btn:hover {
	background: #218838;
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

/* ccccc */
/* Style chung cho overlay */
.overlay1 {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 998;
}

/* Style cho form nhập mã PIN */
.pin-form {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 999;
    width: 350px;
    text-align: center;
}

/* Style cho nút đóng */
.close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    border: none;
    background: none;
    font-size: 20px;
    cursor: pointer;
}

/* Style cho input và button */
.pin-form input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

.pin-form .submit-btn {
    width: 100%;
    padding: 10px;
    background: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

.pin-form .submit-btn:hover {
    background: #218838;
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

/* Icon mã PIN */
.pin-form label i {
    margin-right: 8px;
    color: #007bff;
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
							<li>Số dư</li>
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
								<!-- <a href="address-deliver.html"><li class="slide-bar"><i class="fas fa-map-marker-alt"></i><span> Địa chỉ nhận hàng</span></li></a> -->
								<a
									href="http://localhost:8080/MobileWebApp/profile-reset-password?userID=${sessionScope.khachHang.userID}">
									<li class="slide-bar"><i class="fas fa-lock"></i><span>
											Đổi mật khẩu</span></li>
								</a>
							</ul>
						</div>
					</div>
					<!-- 		<div id="nap-tien-container">
						<div class="card">
							<h3 class="title">Số Dư Tài Khoản</h3>
							<div class="balance">
								<span>500,000 VNĐ</span>
							</div>

							<h5 class="subtitle">Chọn phương thức nạp tiền</h5>

							<div class="button-group">
								<button class="btn card-btn">Nạp bằng thẻ cào</button>
								<button class="btn bank-btn">Nạp qua ngân hàng</button>
							</div>
						</div>
					</div> -->
					<div id="nap-tien-container">
						<div class="card">
							<h3 class="title">Số Dư Tài Khoản</h3>
							<div class="balance">
								<span>${soDu}</span>
							</div>
							<h5 class="subtitle">Chọn phương thức nạp tiền</h5>
							<div class="button-group">
								<button class="btn card-btn" onclick="showForm()">Nạp
									bằng thẻ cào</button>
								<button class="btn bank-btn" onclick="openBankForm()">Nạp
									qua ngân hàng</button>
							</div>
						</div>
					</div>

					<!-- Overlay màn hình mờ -->
					<div class="overlay" id="overlay" onclick="closeForm()"
						style="display: ${kiemTra1 == true ? 'block' : 'none'};"></div>

					<div class="nap-tien-form" id="napTienForm"
						style="display: ${kiemTra1 == true ? 'block' : 'none'};">
						<button class="close-btn" type="button" onclick="closeForm()"
							style="color: red">✖</button>
						<h3>Nạp Tiền Qua Thẻ Cào</h3>
						<c:if test="${kiemTra1 == true}">
							<span id="errorid" style="color: red;">${baoLoi}</span>
						</c:if>

						<form action="NapTheServlet" method="post">
							<label for="network">Chọn nhà mạng:</label> <select id="network"
								name="network">
								<option value="viettel">Viettel</option>
								<option value="mobifone">Mobifone</option>
								<option value="vinaphone">Vinaphone</option>
							</select> <label for="seri">Số Seri:</label> <input type="text" id="seri"
								name="seri" placeholder="Nhập số seri" required> <label
								for="maThe">Mã Thẻ:</label> <input type="text" id="maThe"
								name="maThe" placeholder="Nhập mã thẻ" required> <label
								for="menhgia">Mệnh giá:(Nhập sai mệnh giá trừ 50% số
								tiền):</label> <input type="text" id="menhgia" name="menhgia"
								placeholder="Nhập mệnh giá" required>

							<button class="submit-btn" type="submit">Nạp Tiền</button>
						</form>
					</div>


					<!-- Overlay màn hình mờ -->
					<div id="overlay2" class="overlay" onclick="closeBankForm()"
						style="display: ${check1 == true ? 'block' : 'none'};"></div>

					<!-- Form Thanh toán qua Ngân hàng -->
					<div class="nap-tien-form" id="bankForm"
						style="display: ${check1 == true ? 'block' : 'none'};">
						<button class="close-btn" type="button" onclick="closeBankForm()"
							style="color: red">✖</button>
						<h3>Nạp Tiền Qua Ngân Hàng</h3>
						<c:if test="${check1 == true}">
							<span id="error2" style="color: red;">${error}</span>
						</c:if>

						<form action="NapTienBankServlet" method="post">
							<label for="bank">Chọn Ngân Hàng:</label> <select id="bank"
								name="bank">
								<option value="BIDV">BIDV</option>
								<option value="Sacombank">Sacombank</option>
								<option value="Momo">Momo</option>
								<option value="MBBank">MBBank</option>
								<option value="TPBank">TPBank</option>
							</select> <label for="accountNumber">Số Tài Khoản:</label> <input
								type="text" id="accountNumber" name="accountNumber"
								placeholder="Nhập số tài khoản" required> <label
								for="amount">Số Tiền Nạp:</label> <input type="number"
								id="amount" name="amount" placeholder="Nhập số tiền" required>

							<button class="submit-btn" type="submit">Nạp Tiền</button>
						</form>
					</div>


					<!-- Hiển thị ở đây -->

					<!-- /.features -->
				</div>
			</div>
		</div>
	</div>
	<!-- Overlay màn hình mờ -->
	<div class="overlay" id="overlayPin" onclick="closePinForm()"
	style="display: ${check2 == true ? 'block' : 'none'};"></div>

	<!-- Form nhập mã PIN -->
	<div class="pin-form" id="pinForm"
	style="display: ${check2 == true ? 'block' : 'none'};">
		<button class="close-btn" type="button" onclick="closePinForm()"
			style="color: red">✖</button>
		<h3>${error}</h3>

		<form action="XacNhanPinServlet" method="post">
			<!-- Hiển thị thông báo lỗi nếu có -->
			<c:if test="${kiemTraPin == true}">
				<span style="color: red;" id = "errorPin">${baoLoiPin}</span>
			</c:if>

			<label for="pin"><i class="fas fa-key"></i> Nhập Mã PIN:</label> <input
				type="password" id="pin" name="pin" placeholder="Nhập mã PIN"
				required>

			<!-- Các input hidden để truyền dữ liệu -->
			<input type="hidden" id="hiddenBank" name="bank" value="${bank}">
			<input type="hidden" id="hiddenAccount" name="account"
				value="${stk}"> <input type="hidden" id="hiddenAmount"
				name="amount" value="${soTien}">

			<button class="submit-btn" type="submit">Xác Nhận</button>
		</form>
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
	<c:if test="${kiemTra2 == true}">
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
	<c:if test="${check3 == true}">
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
        function showForm() {
            document.getElementById('napTienForm').classList.add('show');
            document.getElementById('overlay').style.display = 'block';
        }

        function closeForm() {
            document.getElementById('napTienForm').classList.remove('show');
            document.getElementById('overlay').style.display = 'none';
            document.getElementById('napTienForm').style.display = 'none';
         // Reset form về trạng thái ban đầu
            document.getElementById('napTienForm').querySelector("form").reset();
            document.getElementById('errorid').innerHTML = "";
        }

        function openBankForm() {
            document.getElementById("overlay2").style.display = "block";
            document.getElementById("bankForm").style.display = "block";
        }

        function closeBankForm() {
        	document.getElementById('bankForm').classList.remove('show');
            document.getElementById('overlay2').style.display = 'none';
            document.getElementById('bankForm').style.display = 'none';
            
            document.getElementById('bankForm').querySelector("form").reset();
            document.getElementById('error2').innerHTML = "";
            
        }
        function closePinForm() {
        	 let confirmClose = confirm("Vui lòng nhập mã PIN để hoàn tất giao dịch.\nNhấn OK để tiếp tục nhập PIN hoặc Thoát để hủy giao dịch.");
        	    
        	    if (confirmClose) {
        	        // Người dùng chọn "OK", không đóng form
        	        return;
        	    } else {
        	        // Người dùng chọn "Thoát", đóng form
        	        document.getElementById('pinForm').style.display = 'none';
        	        document.getElementById('overlayPin').style.display = 'none';
        	        document.getElementById('errorPin').style.display = 'none';
        	    }
        }
        function closeModal() {
    		document.getElementById("successModal").style.display = 'none';

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