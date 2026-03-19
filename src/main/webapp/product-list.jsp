<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/product-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:53 GMT -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="keywords" content="">
<title>Duy Anh LT WEB</title>
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
<style type="text/css">
/* styles.css */

/* styles.css */
/* body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f9;
}

.header-wrapper {
    position: relative;
    z-index: 1;
} */
/* 
.search-bg {
    position: relative;
    display: flex;
    align-items: center;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 5px;
    background-color: #fff;
}

.search-box {
    width: 100%;
    padding: 10px 15px;
    font-size: 16px;
    border: none;
    outline: none;
}

.search-box:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.4);
} */
/* button[type="submit"] {
	background: transparent;
	border: none;
	cursor: pointer;
}

button[type="submit"] i {
	font-size: 20px;
	color: #333;
}

/* Style for overlay */

/* Đặt gợi ý bên trong tìm kiếm */
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
								<li><a href="load-page-favorite-list?userID=${sessionScope.khachHang.userID}"><i class="fa fa-heart"></i><sup class="cart-quantity">${soLuongSanPhamLike}</sup></a></li>
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
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-breadcrumb">
						<ol class="breadcrumb">
							<li><a href="index.html">Trang chủ</a></li>
							<li>Điện thoại</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /. header-section-->
	<!-- product-list -->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<!-- sidenav-section -->

					<div id='cssmenu'>
						<ul>
							<li class='has-sub'><a href='#'>Hệ điều hành</a>
								<ul>
									<%-- <c:choose>
										<c:when test="${sourceServlet == 'loadProductByOs'}"> --%>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-os?os=Tatca&page=1"><input
													type="radio" name="radio"
													<c:if test="${nameRadio == 'Tatca'}">checked</c:if>>
													<span class="checkbox-list">Tất cả</span></a></li>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-os?os=Android&page=1"><input
													type="radio" name="radio"
													<c:if test="${nameRadio == 'Android'}">checked</c:if>>
													<span class="checkbox-list">Android</span></a></li>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-os?os=IOS&page=1"><input
													type="radio" name="radio"
													<c:if test="${nameRadio == 'IOS'}">checked</c:if>>
													<span class="checkbox-list">IOS</span> </a></li>
										<%-- </c:when> --%>
										<%-- <c:when test="${sourceServlet == 'loadProduct'}"> --%>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-os?os=Tatca&page=1"><input
													type="radio" name="radio"> <span
													class="checkbox-list">Tất cả</span></a></li>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-os?os=Android&page=1"><input
													type="radio" name="radio"> <span
													class="checkbox-list">Android</span></a></li>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-os?os=IOS&page=1"><input
													type="radio" name="radio"> <span
													class="checkbox-list">IOS</span> </a></li>
										<%-- </c:when> --%>
										<%-- <c:when test="${sourceServlet == 'loadProductByCategories'}"> --%>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-os?os=Tatca&page=1"><input
													type="radio" name="radio"> <span
													class="checkbox-list">Tất cả</span></a></li>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-os?os=Android&page=1"><input
													type="radio" name="radio"> <span
													class="checkbox-list">Android</span></a></li>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-os?os=IOS&page=1"><input
													type="radio" name="radio"> <span
													class="checkbox-list">IOS</span> </a></li>
										<%-- </c:when>
									</c:choose> --%>
								</ul></li>
							<li class='has-sub'><a href='#'>Hãng sản xuất</a>
								<ul>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=Tatca&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'Tatca'}">checked</c:if>>
												<span class="checkbox-list">Tất cả </span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=Samsung&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'Samsung'}">checked</c:if>>
												<span class="checkbox-list">Samsung</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=Apple&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'Apple'}">checked</c:if>>
												<span class="checkbox-list">Apple</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=Xiaomi&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'Xiaomi'}">checked</c:if>>
												<span class="checkbox-list">Xiaomi</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=Vsmart&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'Vsmart'}">checked</c:if>>
												<span class="checkbox-list">Vsmart</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=OPPO&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'OPPO'}">checked</c:if>>
												<span class="checkbox-list">OPPO</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=Vivo&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'Vivo'}">checked</c:if>>
												<span class="checkbox-list">Vivo</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=Nokia&page=1">
												<input type="radio" name="radio"
												<c:if test="${nameRadio == 'Nokia'}">checked</c:if>>
												<span class="checkbox-list">Nokia</span>
										</a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=Huawei&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'Huawei'}">checked</c:if>>
												<span class="checkbox-list">Huawei</span></a> </label></li>
								</ul></li>
							<li class='has-sub'><a href='#'>Giá Bán</a>
								<ul>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-price?price=Tatca&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'Tatca'}">checked</c:if>>
												<span class="checkbox-list">Tất cả</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-price?price=duoihaitrieu&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'duoihaitrieu'}">checked</c:if>>
												<span class="checkbox-list">Dưới 2 triệu</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-price?price=tuhaidennamtrieu&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'tuhaidennamtrieu'}">checked</c:if>>
												<span class="checkbox-list">Từ 2 - 5 triệu</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-price?price=tunamdenmuoitrieu&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'tunamdenmuoitrieu'}">checked</c:if>>
												<span class="checkbox-list">Từ 5 - 10 triệu</span></a> </label></li>

									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-price?price=tumuoidenmuoilamtrieu&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'tumuoidenmuoilamtrieu'}">checked</c:if>>
												<span class="checkbox-list">Từ 10 - 15 triệu</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-price?price=trenmuoilamtrieu&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'trenmuoilamtrieu'}">checked</c:if>>
												<span class="checkbox-list">Trên 15 triệu</span></a> </label></li>

								</ul></li>
							<li class='has-sub'><a href='#'>Màn hình</a>
								<ul>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-screen?screen=Tatca&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'Tatca'}">checked</c:if>>
												<span class="checkbox-list">Tất cả</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-screen?screen=duoi5.0inch&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'duoi5.0inch'}">checked</c:if>>
												<span class="checkbox-list">Dưới 5.0 inch</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-screen?screen=tren6.0inch&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'tren6.0inch'}">checked</c:if>>
												<span class="checkbox-list">Trên 6.0 inch</span></a> </label></li>
								</ul></li>
							<li class='has-sub'><a href='#'>Bộ nhớ trong</a>
								<ul>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-memory?memory=Tatca&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'Tatca'}">checked</c:if>>
												<span class="checkbox-list">Tất cả</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-memory?memory=duoi32GB&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'duoi32GB'}">checked</c:if>>
												<span class="checkbox-list">Dưới 32GB</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-memory?memory=64GB128GB&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == '64GB128GB'}">checked</c:if>>
												<span class="checkbox-list">64GB và 128GB</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-memory?memory=256GB512GB&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == '256GB512GB'}">checked</c:if>>
												<span class="checkbox-list">256GB và 512GB</span></a> </label></li>
									<li><label><a
											href="http://localhost:8080/MobileWebApp/load-product-by-memory?memory=tren512GB&page=1"><input
												type="radio" name="radio"
												<c:if test="${nameRadio == 'tren512GB'}">checked</c:if>>
												<span class="checkbox-list">Trên 512GB</span></a> </label></li>
								</ul></li>

						</ul>
					</div>
					<!-- /.sidenav-section -->
				</div>
				<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb10 alignright">
							<form action="load-product-by-option" method="post" id="sortForm">
								<div class="select-option form-group">
									<input type="hidden" name="page" value="1"> <select
										class="form-control" placeholder="Sắp xếp theo"
										name="list-option"
										onchange="document.getElementById('sortForm').submit();">
										<option value="" default>Sắp xếp theo</option>
										<option value="Bán chạy"
											<c:if test="${nameOption == 'Bán chạy'}">selected</c:if>>Bán
											Chạy</option>
										<option value="Giá thấp"
											<c:if test="${nameOption == 'Giá thấp'}">selected</c:if>>Giá
											Thấp</option>
										<option value="Giá cao"
											<c:if test="${nameOption == 'Giá cao'}">selected</c:if>>Giá
											Cao</option>
									</select>
								</div>
							</form>
						</div>
					</div>
					<div class="row">
						<!-- product -->
						<c:choose>
							<c:when test="${sourceServlet == 'loadProduct'}">
								<c:forEach var="product" items="${listPro}">
									<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
										<a
											href="load-page-product-single?productID=${product.productID}">
											<div class="product-block">
												<div class="product-img">
													<img src="imagesphone/${product.image}" alt="">
												</div>
												<div class="product-content">
													<h5>
														<a href="#" class="product-title">${product.name}</a>
													</h5>
													<div class="product-meta">
														<a href="#" class="product-price">${product.price}</a> <a
															href="#" class="discounted-price">$1400</a> <span
															class="offer-price">20%off</span>
													</div>
													<div class="shopping-btn">
														<a href="add-product-list-favorite?productID=${product.productID}" class="product-btn btn-like"><i
															class="fa fa-heart"></i></a> <a href="add-to-cart?productID=${product.productID}&uri=${uri}&thamSo=${thamSo}"
															class="product-btn btn-cart"><i
															class="fa fa-shopping-cart"></i></a>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByOs'}">
								<c:forEach var="product" items="${listPro}">
									<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
										<a href="load-page-product-single?productID=${product.productID}">
											<div class="product-block">
												<div class="product-img">
													<img src="imagesphone/${product.image}" alt="">
												</div>
												<div class="product-content">
													<h5>
														<a href="#" class="product-title">${product.name}</a>
													</h5>
													<div class="product-meta">
														<a href="#" class="product-price">${product.price}</a> <a
															href="#" class="discounted-price">$1400</a> <span
															class="offer-price">20%off</span>
													</div>
													<div class="shopping-btn">
														<a href="add-product-list-favorite?productID=${product.productID}" class="product-btn btn-like"><i
															class="fa fa-heart"></i></a> <a href="add-to-cart?productID=${product.productID}&uri=${uri}&thamSo=${thamSo}"
															class="product-btn btn-cart"><i
															class="fa fa-shopping-cart"></i></a>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByCategories'}">
								<c:forEach var="product" items="${listPro}">
									<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
										<a href="load-page-product-single?productID=${product.productID}">
											<div class="product-block">
												<div class="product-img">
													<img src="imagesphone/${product.image}" alt="">
												</div>
												<div class="product-content">
													<h5>
														<a href="#" class="product-title">${product.name}</a>
													</h5>
													<div class="product-meta">
														<a href="#" class="product-price">${product.price}</a> <a
															href="#" class="discounted-price">$1400</a> <span
															class="offer-price">20%off</span>
													</div>
													<div class="shopping-btn">
														<a href="add-product-list-favorite?productID=${product.productID}" class="product-btn btn-like"><i
															class="fa fa-heart"></i></a> <a href="add-to-cart?productID=${product.productID}&uri=${uri}&thamSo=${thamSo}"
															class="product-btn btn-cart"><i
															class="fa fa-shopping-cart"></i></a>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByPrice'}">
								<c:forEach var="product" items="${listPro}">
									<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
										<a href="load-page-product-single?productID=${product.productID}">
											<div class="product-block">
												<div class="product-img">
													<img src="imagesphone/${product.image}" alt="">
												</div>
												<div class="product-content">
													<h5>
														<a href="#" class="product-title">${product.name}</a>
													</h5>
													<div class="product-meta">
														<a href="#" class="product-price">${product.price}</a> <a
															href="#" class="discounted-price">$1400</a> <span
															class="offer-price">20%off</span>
													</div>
													<div class="shopping-btn">
														<a href="add-product-list-favorite?productID=${product.productID}" class="product-btn btn-like"><i
															class="fa fa-heart"></i></a> <a href="add-to-cart?productID=${product.productID}&uri=${uri}&thamSo=${thamSo}"
															class="product-btn btn-cart"><i
															class="fa fa-shopping-cart"></i></a>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByScreen'}">
								<c:forEach var="product" items="${listPro}">
									<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
										<a href="load-page-product-single?productID=${product.productID}">
											<div class="product-block">
												<div class="product-img">
													<img src="imagesphone/${product.image}" alt="">
												</div>
												<div class="product-content">
													<h5>
														<a href="#" class="product-title">${product.name}</a>
													</h5>
													<div class="product-meta">
														<a href="#" class="product-price">${product.price}</a> <a
															href="#" class="discounted-price">$1400</a> <span
															class="offer-price">20%off</span>
													</div>
													<div class="shopping-btn">
														<a href="add-product-list-favorite?productID=${product.productID}" class="product-btn btn-like"><i
															class="fa fa-heart"></i></a> <a href="add-to-cart?productID=${product.productID}&uri=${uri}&thamSo=${thamSo}"
															class="product-btn btn-cart"><i
															class="fa fa-shopping-cart"></i></a>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByMemory'}">
								<c:forEach var="product" items="${listPro}">
									<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
										<a href="load-page-product-single?productID=${product.productID}">
											<div class="product-block">
												<div class="product-img">
													<img src="imagesphone/${product.image}" alt="">
												</div>
												<div class="product-content">
													<h5>
														<a href="#" class="product-title">${product.name}</a>
													</h5>
													<div class="product-meta">
														<a href="#" class="product-price">${product.price}</a> <a
															href="#" class="discounted-price">$1400</a> <span
															class="offer-price">20%off</span>
													</div>
													<div class="shopping-btn">
														<a href="add-product-list-favorite?productID=${product.productID}" class="product-btn btn-like"><i
															class="fa fa-heart"></i></a> <a href="add-to-cart?productID=${product.productID}&uri=${uri}&thamSo=${thamSo}"
															class="product-btn btn-cart"><i
															class="fa fa-shopping-cart"></i></a>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByOption'}">
								<c:forEach var="product" items="${listPro}">
									<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
										<a href="load-page-product-single?productID=${product.productID}">
											<div class="product-block">
												<div class="product-img">
													<img src="imagesphone/${product.image}" alt="">
												</div>
												<div class="product-content">
													<h5>
														<a href="#" class="product-title">${product.name}</a>
													</h5>
													<div class="product-meta">
														<a href="#" class="product-price">${product.price}</a> <a
															href="#" class="discounted-price">$1400</a> <span
															class="offer-price">20%off</span>
													</div>
													<div class="shopping-btn">
														<a href="add-product-list-favorite?productID=${product.productID}" class="product-btn btn-like"><i
															class="fa fa-heart"></i></a> <a href="add-to-cart?productID=${product.productID}&uri=${uri}&thamSo=${thamSo}"
															class="product-btn btn-cart"><i
															class="fa fa-shopping-cart"></i></a>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:when>
							<c:when test="${sourceServlet == 'searchOnBox'}">
								<c:forEach var="product" items="${listPro}">
									<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
										<a href="load-page-product-single?productID=${product.productID}">
											<div class="product-block">
												<div class="product-img">
													<img src="imagesphone/${product.image}" alt="">
												</div>
												<div class="product-content">
													<h5>
														<a href="#" class="product-title">${product.name}</a>
													</h5>
													<div class="product-meta">
														<a href="#" class="product-price">${product.price}</a> <a
															href="#" class="discounted-price">$1400</a> <span
															class="offer-price">20%off</span>
													</div>
													<div class="shopping-btn">
														<a href="add-product-list-favorite?productID=${product.productID}" class="product-btn btn-like"><i
															class="fa fa-heart"></i></a> <a href="add-to-cart?productID=${product.productID}&uri=${uri}&thamSo=${thamSo}"
															class="product-btn btn-cart"><i
															class="fa fa-shopping-cart"></i></a>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
						<!-- /.product -->
						<!-- product -->
						<!-- <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
                            <a href="product-single.html">
                                <div class="product-block">
                                    <div class="product-img"><img src="images/product_img_2.png" alt=""></div>
                                    <div class="product-content">
                                        <h5><a href="#" class="product-title">HTC U Ultra <strong>(64GB,
                                                    Blue)</strong></a>
                                        </h5>
                                        <div class="product-meta"><a href="#" class="product-price">$1200</a>
                                            <a href="#" class="discounted-price">$1700</a>
                                            <span class="offer-price">10%off</span>
                                        </div>
                                        <div class="shopping-btn">
                                            <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                            <a href="#" class="product-btn btn-cart"><i
                                                    class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        /.product
                        product
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
                            <a href="product-single.html">
                                <div class="product-block">
                                    <div class="product-img"><img src="images/product_img_3.png" alt=""></div>
                                    <div class="product-content">
                                        <h5><a href="#" class="product-title">Samsung Galaxy Note 8</a></h5>
                                        <div class="product-meta"><a href="#" class="product-price">$1500</a>
                                            <a href="#" class="discounted-price">$2000</a>
                                            <span class="offer-price">40%off</span>
                                        </div>
                                        <div class="shopping-btn">
                                            <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                            <a href="#" class="product-btn btn-cart"><i
                                                    class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        /.product
                        product
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
                            <a href="product-single.html">
                                <div class="product-block">

                                    <div class="product-img"><img src="images/product_img_3.png" alt=""></div>
                                    <div class="product-content">
                                        <h5><a href="#" class="product-title">Samsung Galaxy Note 8</a></h5>
                                        <div class="product-meta"><a href="#" class="product-price">$1500</a>
                                            <a href="#" class="discounted-price">$2000</a>
                                            <span class="offer-price">40%off</span>
                                        </div>
                                        <div class="shopping-btn">
                                            <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                            <a href="#" class="product-btn btn-cart"><i
                                                    class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                        /.product
                        product
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
                            <a href="product-single.html">
                                <div class="product-block">
                                    <div class="product-img"><img src="images/product_img_4.png" alt=""></div>
                                    <div class="product-content">
                                        <h5><a href="#" class="product-title">Vivo V5 Plus <strong>(Matte
                                                    Black)</strong></a></h5>
                                        <div class="product-meta"><a href="#" class="product-price">$1500</a>
                                            <a href="#" class="discounted-price">$2000</a>
                                            <span class="offer-price">15%off</span>
                                        </div>
                                        <div class="shopping-btn">
                                            <a href="#" class="product-btn btn-like">
                                                <i class="fa fa-heart"></i></a>
                                            <a href="#" class="product-btn btn-cart"><i
                                                    class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        /.product
                        product
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
                            <a href="product-single.html">
                                <div class="product-block">
                                    <div class="product-img"><img src="images/product_img_2.png" alt=""></div>
                                    <div class="product-content">
                                        <h5><a href="#" class="product-title">HTC U Ultra <strong>(64GB,
                                                    Blue)</strong></a>
                                        </h5>
                                        <div class="product-meta"><a href="#" class="product-price">$1200</a>
                                            <a href="#" class="discounted-price">$1700</a>
                                            <span class="offer-price">10%off</span>
                                        </div>
                                        <div class="shopping-btn">
                                            <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                            <a href="#" class="product-btn btn-cart"><i
                                                    class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        /.product
                        product
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
                            <a href="product-single.html">
                                <div class="product-block">
                                    <div class="product-img"><img src="images/product_img_2.png" alt=""></div>
                                    <div class="product-content">
                                        <h5><a href="#" class="product-title">HTC U Ultra <strong>(64GB,
                                                    Blue)</strong></a>
                                        </h5>
                                        <div class="product-meta"><a href="#" class="product-price">$1200</a>
                                            <a href="#" class="discounted-price">$1700</a>
                                            <span class="offer-price">10%off</span>
                                        </div>
                                        <div class="shopping-btn">
                                            <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                            <a href="#" class="product-btn btn-cart"><i
                                                    class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        /.product
                        product
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
                            <a href="product-single.html">
                                <div class="product-block">
                                    <div class="product-img"><img src="images/product_img_3.png" alt=""></div>
                                    <div class="product-content">
                                        <h5><a href="#" class="product-title">Samsung Galaxy Note 8</a></h5>
                                        <div class="product-meta"><a href="#" class="product-price">$1500</a>
                                            <a href="#" class="discounted-price">$2000</a>
                                            <span class="offer-price">40%off</span>
                                        </div>
                                        <div class="shopping-btn">
                                            <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                            <a href="#" class="product-btn btn-cart"><i
                                                    class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div> -->
						<!-- /.product -->
						<!-- product -->
						<!-- <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
                            <a href="product-single.html">
                                <div class="product-block">
                                    <div class="product-img"><img src="images/product_img_2.png" alt=""></div>
                                    <div class="product-content">
                                        <h5><a href="#" class="product-title">HTC U Ultra <strong>(64GB,
                                                    Blue)</strong></a>
                                        </h5>
                                        <div class="product-meta"><a href="#" class="product-price">$1200</a>
                                            <a href="#" class="discounted-price">$1700</a>
                                            <span class="offer-price">10%off</span>
                                        </div>
                                        <div class="shopping-btn">
                                            <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                            <a href="#" class="product-btn btn-cart"><i
                                                    class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div> -->
						<!-- /.product -->
					</div>

					<div class="row">
						<!-- pagination start -->
						<c:choose>
							<c:when test="${sourceServlet == 'loadProduct'}">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="st-pagination">
										<ul class="pagination">
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product?page=${currentPage == 1? tongSoTrang: currentPage - 1}"
												aria-label="previous"><i class="fa fa-angle-left"
													style="font-size: 16px;"></i></a> <!-- Dùng JSTL để lặp qua các trang -->
												<c:forEach var="i" begin="1" end="${tongSoTrang}">
													<li class="${currentPage == i ? 'active' : ''}"><a
														href="http://localhost:8080/MobileWebApp/load-product?page=${i}"
														onclick="setActive(this)">${i}</a></li>
												</c:forEach>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product?page=${currentPage == tongSoTrang? 1: currentPage + 1}"
												aria-label="Next"><i class="fa fa-angle-right"
													style="font-size: 16px;"></i></li>
										</ul>
									</div>
								</div>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByOs'}">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="st-pagination">
										<ul class="pagination">
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-os?os=${nameRadio}&page=${currentPage == 1? tongSoTrang: currentPage -1}"
												aria-label="previous"><i class="fa fa-angle-left"
													style="font-size: 16px;"></i></a> <!-- Dùng JSTL để lặp qua các trang -->
												<c:forEach var="i" begin="1" end="${tongSoTrang}">
													<li class="${currentPage == i ? 'active' : ''}"><a
														href="http://localhost:8080/MobileWebApp/load-product-by-os?os=${nameRadio}&page=${i}"
														onclick="setActive(this)">${i}</a></li>
												</c:forEach>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-os?os=${nameRadio}&page=${currentPage == tongSoTrang? 1: currentPage +1}"
												aria-label="Next"><i class="fa fa-angle-right"
													style="font-size: 16px;"></i></li>
										</ul>
									</div>
								</div>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByCategories'}">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="st-pagination">
										<ul class="pagination">
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=${nameRadio}&page=${currentPage == 1? tongSoTrang: currentPage -1}"
												aria-label="previous"><i class="fa fa-angle-left"
													style="font-size: 16px;"></i></a> <!-- Dùng JSTL để lặp qua các trang -->
												<c:forEach var="i" begin="1" end="${tongSoTrang}">
													<li class="${currentPage == i ? 'active' : ''}"><a
														href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=${nameRadio}&page=${i}"
														onclick="setActive(this)">${i}</a></li>
												</c:forEach>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-categories?categories=${nameRadio}&page=${currentPage == tongSoTrang? 1: currentPage +1}"
												aria-label="Next"><i class="fa fa-angle-right"
													style="font-size: 16px;"></i></li>
										</ul>
									</div>
								</div>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByPrice'}">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="st-pagination">
										<ul class="pagination">
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-price?price=${nameRadio}&page=${currentPage == 1? tongSoTrang: currentPage -1}"
												aria-label="previous"><i class="fa fa-angle-left"
													style="font-size: 16px;"></i></a> <!-- Dùng JSTL để lặp qua các trang -->
												<c:forEach var="i" begin="1" end="${tongSoTrang}">
													<li class="${currentPage == i ? 'active' : ''}"><a
														href="http://localhost:8080/MobileWebApp/load-product-by-price?price=${nameRadio}&page=${i}"
														onclick="setActive(this)">${i}</a></li>
												</c:forEach>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-price?price=${nameRadio}&page=${currentPage == tongSoTrang? 1: currentPage +1}"
												aria-label="Next"><i class="fa fa-angle-right"
													style="font-size: 16px;"></i></li>
										</ul>
									</div>
								</div>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByScreen'}">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="st-pagination">
										<ul class="pagination">
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-screen?screen=${nameRadio}&page=${currentPage == 1? tongSoTrang: currentPage -1}"
												aria-label="previous"><i class="fa fa-angle-left"
													style="font-size: 16px;"></i></a> <!-- Dùng JSTL để lặp qua các trang -->
												<c:forEach var="i" begin="1" end="${tongSoTrang}">
													<li class="${currentPage == i ? 'active' : ''}"><a
														href="http://localhost:8080/MobileWebApp/load-product-by-screen?screen=${nameRadio}&page=${i}"
														onclick="setActive(this)">${i}</a></li>
												</c:forEach>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-screen?screen=${nameRadio}&page=${currentPage == tongSoTrang? 1: currentPage +1}"
												aria-label="Next"><i class="fa fa-angle-right"
													style="font-size: 16px;"></i></li>
										</ul>
									</div>
								</div>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByMemory'}">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="st-pagination">
										<ul class="pagination">
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-memory?memory=${nameRadio}&page=${currentPage == 1? tongSoTrang: currentPage -1}"
												aria-label="previous"><i class="fa fa-angle-left"
													style="font-size: 16px;"></i></a> <!-- Dùng JSTL để lặp qua các trang -->
												<c:forEach var="i" begin="1" end="${tongSoTrang}">
													<li class="${currentPage == i ? 'active' : ''}"><a
														href="http://localhost:8080/MobileWebApp/load-product-by-memory?memory=${nameRadio}&page=${i}"
														onclick="setActive(this)">${i}</a></li>
												</c:forEach>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-memory?memory=${nameRadio}&page=${currentPage == tongSoTrang? 1: currentPage +1}"
												aria-label="Next"><i class="fa fa-angle-right"
													style="font-size: 16px;"></i></li>
										</ul>
									</div>
								</div>
							</c:when>
							<c:when test="${sourceServlet == 'loadProductByOption'}">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="st-pagination">
										<ul class="pagination">
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-option?list-option=${nameOption}&page=${currentPage == 1? tongSoTrang: currentPage -1}"
												aria-label="previous"><i class="fa fa-angle-left"
													style="font-size: 16px;"></i></a> <!-- Dùng JSTL để lặp qua các trang -->
												<c:forEach var="i" begin="1" end="${tongSoTrang}">
													<li class="${currentPage == i ? 'active' : ''}"><a
														href="http://localhost:8080/MobileWebApp/load-product-by-option?list-option=${nameOption}&page=${i}"
														onclick="setActive(this)">${i}</a></li>
												</c:forEach>
											<li><a
												href="http://localhost:8080/MobileWebApp/load-product-by-option?list-option=${nameOption}&page=${currentPage == tongSoTrang? 1: currentPage +1}"
												aria-label="Next"><i class="fa fa-angle-right"
													style="font-size: 16px;"></i></li>
										</ul>
									</div>
								</div>
							</c:when>
							<c:when test="${sourceServlet == 'searchOnBox'}">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="st-pagination">
										<ul class="pagination">
											<li><a
												href="http://localhost:8080/MobileWebApp/SearchOnBox?searchOnBox=${required}&page=${currentPage == 1? tongSoTrang: currentPage -1}"
												aria-label="previous"><i class="fa fa-angle-left"
													style="font-size: 16px;"></i></a> <!-- Dùng JSTL để lặp qua các trang -->
												<c:forEach var="i" begin="1" end="${tongSoTrang}">
													<li class="${currentPage == i ? 'active' : ''}"><a
														href="http://localhost:8080/MobileWebApp/SearchOnBox?searchOnBox=${required}&page=${i}"
														onclick="setActive(this)">${i}</a></li>
												</c:forEach>
											<li><a
												href="http://localhost:8080/MobileWebApp/SearchOnBox?searchOnBox=${required}&page=${currentPage == tongSoTrang? 1: currentPage +1}"
												aria-label="Next"><i class="fa fa-angle-right"
													style="font-size: 16px;"></i></li>
										</ul>
									</div>
								</div>
							</c:when>
						</c:choose>
						<!-- pagination close -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.product-list -->
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
                            <span class="contact-text">Phường Linh Trung, Thủ Đức<br>Thành phố Hồ Chí Minh, Việt Nam -
                                1955</span>
                        </div>
                        <div class="contact-info">
                            <span class="contact-icon"><i class="fa fa-phone"></i></span>
                            <span class="contact-text">+084-123-4567 / 89</span>
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
                        <h3 class="footer-title">Truy cập nhanh</h3>
                        <ul class="arrow">
                            <li><a href="index.html">Trang chủ</a></li>
                            <li><a href="product-list.html">Điện thoại</a></li>
                            <li><a href="about.html">Thông tin</a></li>
                            <li><a href="blog-default.html">Bài viết</a></li>
                            <li><a href="contact-us.html">Liên hệ</a></li>
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
                            <span><a href="#" class="btn-social btn-facebook"><i class="fa fa-facebook"></i></a></span>
                            <span><a href="#" class="btn-social btn-twitter"><i class="fa fa-twitter"></i></a></span>
                            <span><a href="#" class="btn-social btn-googleplus"><i
                                        class="fa fa-google-plus"></i></a></span>
                            <span><a href="#" class=" btn-social btn-linkedin"><i class="fa fa-linkedin"></i></a></span>
                            <span><a href="#" class=" btn-social btn-pinterest"><i
                                        class="fa fa-pinterest-p"></i></a></span>
                            <span><a href="#" class=" btn-social btn-instagram"><i
                                        class="fa fa-instagram"></i></a></span>
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
                        <p class="alignright">Copyright © All Rights Reserved 2020 Template Design by
                            <a href="https://easetemplate.com/" target="_blank" class="copyrightlink">Nhom 21</a>
                        </p>
                    </div>
                </div>
            </div>
            <!-- /. tiny-footer -->
        </div>
    </div>
	
	<c:if test="${sourceServlet == 'searchOnBox'}">
		<c:if test="${checkNoInput == true}">
			<div class="modal" id="successModal">
				<div class="modal-content">
					<img
						src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
						alt="Notify Icon" style="width: 100px; height: 50px" />
					<h3>${message}</h3>
					<button class="btn-close" onclick="closeModal()" name="action"
						value="xacThuc">Đóng</button>
				</div>
			</div>
		</c:if>
	</c:if>
	<c:if test="${checkNoInput == true}">
			<div class="modal" id="successModal">
				<div class="modal-content">
					<img
						src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
						alt="Notify Icon" style="width: 100px; height: 50px" />
					<h3>Sản phẩm đã tồn tại trong giỏ hàng của bạn rồi</h3>
					<button class="btn-close" onclick="closeModal()" name="action"
						value="xacThuc">Đóng</button>
				</div>
			</div>
	</c:if>
	<c:if test="${checkHetHang == true}">
			<div class="modal" id="successModal">
				<div class="modal-content">
					<img
						src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
						alt="Notify Icon" style="width: 100px; height: 50px" />
					<h3>Sản phẩm này đã hết hàng</h3>
					<button class="btn-close" onclick="closeModal()" name="action"
						value="xacThuc">Đóng</button>
				</div>
			</div>
	</c:if>
	
	<!-- /.footer -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script>
    function setActive(element) {
        // Loại bỏ class "active" khỏi tất cả các phần tử <li> trong .pagination
        document.querySelectorAll(".pagination li").forEach((el) => el.classList.remove("active"));
        
        // Thêm class "active" vào phần tử được click
        element.parentElement.classList.add("active");
    }
    function closeModal() {
		document.getElementById("successModal").style.display = "none";
		
	}
</script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/menumaker.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.sticky.js"></script>
	<script type="text/javascript" src="js/sticky-header.js"></script>
	<!-- <script type="text/javascript"> 
/* 	document.getElementById("searchBox").addEventListener("input", function () {
	    const keyword = this.value;

	    if (keyword.length > 1) {
	        fetch(`SearchServlet?q=${keyword}`) // Gửi yêu cầu tìm kiếm
	            .then(response => response.json())
	            .then(data => {
	                const suggestionsList = document.getElementById("product-suggestions");
	                suggestionsList.innerHTML = ""; // Xóa gợi ý cũ

	                // Hiển thị gợi ý
	                if (data.length == 0) {
	                    const noResult = document.createElement("option");
	                    noResult.textContent = "Không tìm thấy sản phẩm.";
	                    suggestionsList.appendChild(noResult);
	                }

	                data.forEach(product => {
	                    const suggestionItem = document.createElement("option");
	                    suggestionItem.value = product.name;
	                    suggestionsList.appendChild(suggestionItem);
	                });

	                // Hiển thị overlay
	                document.getElementById("overlay").classList.add("show");
	            })
	            .catch(err => console.error("Error fetching suggestions:", err));
	    } else {
	        document.getElementById("overlay").classList.remove("show");
	        document.getElementById("product-suggestions").innerHTML = ""; // Xóa gợi ý khi không có từ khóa
	    }
	});

	// Đóng overlay khi người dùng click bên ngoài
	document.getElementById("overlay").addEventListener("click", function () {
	    document.getElementById("overlay").classList.remove("show");
	    document.getElementById("product-suggestions").innerHTML = ""; // Xóa gợi ý
	}); */
<!-- 	document.getElementById("searchBox").addEventListener("input", function () {
	    const keyword = this.value;
	    const suggestionsDiv = document.getElementById("product-suggestions");
	    const overlay = document.getElementById("overlay");

	    // Nếu từ khóa dài hơn 1 ký tự, tìm kiếm gợi ý
	    if (keyword.length > 1) {
	        fetch(`SearchServlet?q=${keyword}`)
	            .then(response => response.json())
	            .then(data => {
	                suggestionsDiv.innerHTML = ""; // Xóa các gợi ý cũ

	                // Thêm các sản phẩm vào datalist
	                data.forEach(product => {
	                    const option = document.createElement("option");
	                    option.value = product.name; // Gán giá trị sản phẩm
	                    suggestionsDiv.appendChild(option);
	                });

	                // Hiển thị overlay khi có gợi ý
	                overlay.style.display = 'block';
	            });
	    } else {
	        // Nếu không có từ khóa hoặc quá ngắn, ẩn overlay
	        overlay.style.display = 'none';
	    }
	});

	// Khi người dùng chọn một gợi ý, ẩn datalist và overlay
	document.getElementById("searchBox").addEventListener("change", function () {
	    const overlay = document.getElementById("overlay");
	    const suggestionsDiv = document.getElementById("product-suggestions");
	    
	    // Ẩn datalist và overlay khi chọn xong
	    suggestionsDiv.innerHTML = "";
	    overlay.style.display = 'none';
	});

	// Nếu người dùng nhấn vào overlay, ẩn nó
	document.getElementById("overlay").addEventListener("click", function () {
	    const overlay = document.getElementById("overlay");
	    const suggestionsDiv = document.getElementById("product-suggestions");

	    // Ẩn overlay và datalist
	    suggestionsDiv.innerHTML = "";
	    overlay.style.display = 'none';
	});
	</script>  -->
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
		(function($) {
			$(document).ready(
					function() {
						$('#cssmenu ul ul li:odd').addClass('odd');
						$('#cssmenu ul ul li:even').addClass('even');
						$('#cssmenu > ul > li > a').click(
								function() {
									$('#cssmenu li').removeClass('active');
									$(this).closest('li').addClass('active');
									var checkElement = $(this).next();
									if ((checkElement.is('ul'))
											&& (checkElement.is(':visible'))) {
										$(this).closest('li').removeClass(
												'active');
										checkElement.slideUp('normal');
									}
									if ((checkElement.is('ul'))
											&& (!checkElement.is(':visible'))) {
										$('#cssmenu ul ul:visible').slideUp(
												'normal');
										checkElement.slideDown('normal');
									}
									if ($(this).closest('li').find('ul')
											.children().length == 0) {
										return true;
									} else {
										return false;
									}
								});
					});
		})(jQuery);
	</script>

</body>



</html>