<%@page import="java.util.ArrayList"%>
<%@page import="com.projectttweb.webphone.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.projectttweb.webphone.model.User"%>
<%@page import="java.nio.file.attribute.UserDefinedFileAttributeView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from easetemplate.com/free-website-templates/mobistore/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Nov 2021 09:40:15 GMT -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description"
	content="create ecommerce website template for your online store, responsive mobile templates">
<meta name="keywords"
	content="ecommerce website templates, online store,">
<title>Index</title>
<!-- Bootstrapppppp -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Style CSS -->
<link href="css/style.css" rel="stylesheet">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet">
<!-- owl-carousel -->
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/owl.theme.default.css" rel="stylesheet">
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
						<li>+03434 634 29</li>
						<li>laptrinhweb@mail.com</li>
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
						<a href="LoadDataMain"><img src="images/logo.png" alt="">
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
									href="account-login?userID=${sessionScope.khachHang.userID}"
									class="title hidden-xs">Hi <c:out
											value="${sessionScope.khachHang.userName}" /></a>|</li>
								<li><a href="dang-xuat"
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
								<li><a href="load-product?page=1">Điện thoại</a></li>
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
								<li><a href="go-to-contactus">Liên hệ, hỗ trợ</a></li>
							</ul>
						</div>
					</div>
					<!-- /.navigations-->
				</div>
			</div>
		</div>
	</div>

	<!-- /. header-section-->
	<!-- slider -->
	<div class="slider">
		<div class="owl-carousel owl-one owl-theme">
			<div class="item">
				<div class="slider-img">
					<img src="images/slider_1.jpg" alt="">
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-5 col-md-8 col-sm-6 col-xs-12">
							<div class="slider-captions">
								<div class="brand-img">
									<img src="imagesphone/iphone14-den.webp" alt="">
								</div>
								<h1 class="slider-title">
									Red Mi <span>Y1</span>
								</h1>
								<p class="hidden-xs">LED Selfie-light | Fingerprint sensor |
									Dedicated microSD card slot Snapdragon 435 octa-core processor
								</p>
								<p class="slider-price">$138.99</p>
								<a href="cart.jsp" class="btn btn-primary btn-lg hidden-xs">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="slider-img">
					<img src="images/slider_2.jpg" alt="">
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-5 col-md-8 col-sm-6 col-xs-12">
							<div class="slider-captions">
								<div class="brand-img">
									<img src="images/google_logo.png" alt="">
								</div>
								<h1 class="slider-title">Google Pixel 2</h1>
								<p class="hidden-xs">The latest Qualcomm Snapdragon 835
									processor | Water-resistant metal unibody | Up to 7 hours of
									battery.</p>
								<p class="slider-price">$ 938.10</p>
								<a href="cart.jsp" class="btn btn-primary btn-lg hidden-xs">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="slider-img">
					<img src="images/slider_3.jpg" alt="">
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-5 col-md-8 col-sm-6 col-xs-12">
							<div class="slider-captions">
								<div class="brand-img">
									<img src="images/apple_logo.png" alt="">
								</div>
								<h1 class="slider-title">iphone 8 plus</h1>
								<p class="hidden-xs">
									5.5 inch Retina HD Display | 12MP wide-angle cameras <br>
									| 64 GB &amp; 256 GB ROM Memory
								</p>
								<p class="slider-price">$759.64</p>
								<a href="" class="btn btn-primary btn-lg hidden-xs">Buy Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.slider -->
	<!-- mobile showcase -->
	<div class="space-medium">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="showcase-block">
						<div class="display-logo ">
							<a href="#"> <img src="images/nexus.png" alt=""></a>
						</div>
						<div class="showcase-img">
							<a href="#"> <img src="images/display_img_1.png" alt=""></a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="showcase-block active">
						<div class="display-logo alignleft">
							<a href="#"> <img src="images/iphone.png" alt="">
							</a>
						</div>
						<div class="showcase-img">
							<a href="#"> <img src="images/display_img_2.png" alt=""
								style="padding-left: 80px;"></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="showcase-block ">
						<div class="display-logo ">
							<a href="#"> <img src="images/samsung.png" alt="">
							</a>
						</div>
						<div class="showcase-img">
							<a href="#"><img src="images/display_img_3.png" alt=""></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="showcase-block">
						<div class="display-logo ">
							<a href="#"><img src="images/htc.png" alt=""></a>
						</div>
						<div class="showcase-img">
							<a href="#"><img src="images/display_img_4.png" alt=""></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="showcase-block">
						<div class="display-logo">
							<a href="#"> <img src="images/alcatel.png" alt=""></a>
						</div>
						<div class="showcase-img">
							<a href="#"> <img src="images/display_img_5.png" alt="">
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="showcase-block">
						<div class="display-logo ">
							<a href="#"><img src="images/pixel.png" alt=""></a>
						</div>
						<div class="showcase-img">
							<a href="#"> <img src="images/display_img_6.png" alt=""></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="showcase-block">
						<div class="display-logo ">
							<a href="#"> <img src="images/vivo.png" alt=""></a>
						</div>
						<div class="showcase-img">
							<a href="#"><img src="images/display_img_7.png" alt=""></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.mobile showcase -->
	<!-- latest products -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="box">
					<div class="box-head">
						<h3 class="head-title">Sản phẩm mới nhất</h3>
					</div>
					<div class="box-body">
						<div class="row">
							<!-- product -->
							<c:forEach var="product" items="${danhSachMain2}">
								<a
									href="load-page-product-single?productID=${product.productID}">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
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
														href="#" class="discounted-price">${product.priceDis}</a>
												</div>
												<div class="shopping-btn">
													<a
														href="add-product-list-favorite?productID=${product.productID}"
														class="product-btn btn-like"><i class="fa fa-heart"></i></a>
													<a href="add-to-cart?productID=${product.productID}&uri=${uri}" class="product-btn btn-cart"><i
														class="fa fa-shopping-cart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
							<!-- /.product -->
							<!-- product -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.latest products -->
	<!-- seller products -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="box">
					<div class="box-head">
						<h3 class="head-title">Bán chạy nhất</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="product-carousel">
			<div class="box-body">
				<div class="row">
					<div class="owl-carousel owl-two owl-theme">
						<!-- product -->
						<!-- product -->
						<c:forEach var="product" items="${danhSachMain1}">

							<div class="item">
								<a
									href="load-page-product-single?productID=${product.productID}">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
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
														href="#" class="discounted-price">${product.priceDis}</a>
												</div>
												<div class="shopping-btn">
													<a
														href="add-product-list-favorite?productID=${product.productID}"
														class="product-btn btn-like"><i class="fa fa-heart"></i></a>
													<a href="add-to-cart?productID=${product.productID}&uri=${uri}" class="product-btn btn-cart" ><i
														class="fa fa-shopping-cart"></i></a>
												</div>
											</div>
										</div>
									</div> <!-- /.product -->
								</a>
							</div>

						</c:forEach>
						<!--     <div class="item">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="product-block">
                                <div class="product-img"><img src="images/product_img_5.png" alt=""></div>
                                <div class="product-content">
                                    <h5><a href="#" class="product-title">Apple iPhone 6 <strong>(32 GB, Gold)</strong></a></h5>
                                    <div class="product-meta"><a href="#" class="product-price">$1700</a>
                                        <a href="#" class="discounted-price">$2000</a>
                                        <span class="offer-price">20%off</span>
                                    </div>
                                    <div class="shopping-btn">
                                        <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                        <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        /.product
                    </div>
                    product
                    <div class="item">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="product-block">
                                <div class="product-img"><img src="images/product_img_6.png" alt=""></div>
                                <div class="product-content">
                                    <h5><a href="#" class="product-title">Apple iPhone 7 <strong>(256 GB, Black)</strong> </a></h5>
                                    <div class="product-meta"><a href="#" class="product-price">$1400</a>
                                        <a href="#" class="discounted-price"><strike>$1800</strike></a>
                                        <span class="offer-price">20%off</span>
                                    </div>
                                    <div class="shopping-btn">
                                        <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                        <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    /.product
                    product
                    <div class="item">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="product-block">
                                <div class="product-img"><img src="images/product_img_7.png" alt=""></div>
                                <div class="product-content">
                                    <h5><a href="#" class="product-title">Apple iPhone 6S <strong>(32GB, Gold)</strong> </a></h5>
                                    <div class="product-meta"><a href="#" class="product-price">$1300</a>
                                        <a href="#" class="discounted-price"><strike>$2000</strike></a>
                                        <span class="offer-price">20%off</span>
                                    </div>
                                    <div class="shopping-btn">
                                        <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                        <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    /.product
                    product
                    <div class="item">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="product-block">
                                <div class="product-img"><img src="images/product_img_8.png" alt=""></div>
                                <div class="product-content">
                                    <h5><a href="#" class="product-title">Apple iPhone X <strong>(64 GB, Grey)</strong></a></h5>
                                    <div class="product-meta"><a href="#" class="product-price">$1200</a>
                                        <a href="#" class="discounted-price"><strike>$2000</strike></a>
                                        <span class="offer-price">20%off</span>
                                    </div>
                                    <div class="shopping-btn">
                                        <a href="#" class="product-btn btn-like"><i class="fa fa-heart"></i></a>
                                        <a href="#" class="product-btn btn-cart"><i class="fa fa-shopping-cart"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        /.product
                </div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.seller products -->
	<!-- featured products -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="box">
					<div class="box-head">
						<h3 class="head-title">Đang khuyến mãi</h3>
					</div>
					<div class="box-body">
						<div class="row">
							<!-- product -->
							<c:forEach var="product" items="${danhSachMain3}">
								<a
									href="load-page-product-single?productID=${product.productID}">
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
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
														href="#" class="discounted-price"><strike>${product.priceDis}</strike></a>
												</div>
												<div class="shopping-btn">
													<a
														href="add-product-list-favorite?productID=${product.productID}"
														class="product-btn btn-like"><i class="fa fa-heart"></i></a>
													<a href="add-to-cart?productID=${product.productID}&uri=${uri}" class="product-btn btn-cart" ><i
														class="fa fa-shopping-cart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
							<!-- /.product -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.featured products -->
	<!-- cta -->
	<!-- /.cta -->
	<!-- features -->
	<div class="bg-default pdt40 pdb40">
		<div class="container">
			<div class="row">
				<!-- features -->
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="feature-left">
						<div class="feature-outline-icon">
							<i class="fa fa-credit-card"></i>
						</div>
						<div class="feature-content">
							<h3 class="text-white">Thanh toán an toàn</h3>
							<p>Mang đến dịch vụ trải nghiệm thoải mái nhất, an toàn, tiện
								dụng, Mobistore!</p>
						</div>
					</div>
				</div>
				<!-- features -->
				<!-- features -->
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="feature-left">
						<div class="feature-outline-icon">
							<i class="fa fa-users"></i>
						</div>
						<div class="feature-content">
							<h3 class="text-white">Phản hồi 24/7</h3>
							<p>Trợ giúp liên lạc, tham khảo , tra cứu 24/7!</p>
						</div>
					</div>
				</div>
				<!-- features -->
				<!-- features -->
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="feature-left feature-circle">
						<div class="feature-outline-icon">
							<i class="fa fa-rotate-left "></i>
						</div>
						<div class="feature-content">
							<h3 class="text-white">Đổi trả miễn phí</h3>
							<p>Miễn phí bảo hành đổi trả lên đến 365 ngày!</p>
						</div>
					</div>
				</div>

				<!-- features -->
				<!-- features -->
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="feature-left">
						<div class="feature-outline-icon">
							<i class="fa fa-dollar"></i>
						</div>
						<div class="feature-content">
							<h3 class="text-white">Giá tốt nhất</h3>
							<p>Giá thành tốt nhất trong thị trường. Cập nhật sản phẩm
								24/7!</p>
						</div>
					</div>
				</div>
				<!-- features -->
			</div>
		</div>
	</div>
	<!-- /.features -->
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
							<li><a href="index.jsp">Home </a></li>
							<li><a href="product-list.jsp">Mobie</a></li>
							<li><a href="about.jsp">About</a></li>
							<li><a href="blog-default.jsp">Blog</a></li>
							<li><a href="contact-us.jsp">Contact</a></li>
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
	<c:if test="${baoLoi2 == true }">
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
					<h3>Sản phẩm bạn chọn đã hết hàng</h3>
					<button class="btn-close" onclick="closeModal()" name="action"
						value="xacThuc">Đóng</button>
				</div>
			</div>
	</c:if>

	<!-- /.footer -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/menumaker.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.sticky.js"></script>
	<script type="text/javascript" src="js/sticky-header.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="js/multiple-carousel.js"></script>
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
	function closeModal() {
		document.getElementById("successModal").style.display = "none";

	}

	</script>
	<script type="text/javascript">
	document.querySelectorAll('.add-to-cart').forEach(link => {
	    link.addEventListener('click', function (event) {
	        // Ngăn chặn hành vi mặc định của thẻ <a>
	        event.preventDefault();

	        // Lấy productId từ thuộc tính data-product-id
	        const productId = this.getAttribute('data-product-id');
	        console.log(productId);

	        // Gửi yêu cầu AJAX
	        const xhr = new XMLHttpRequest();
	        xhr.open('POST', '/MobileWebApp/add-to-cart', true);
	        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

	        xhr.onreadystatechange = function () {
	            if (xhr.readyState === 4 && xhr.status === 200) {
	                // Nhận phản hồi từ server
	                const response = JSON.parse(xhr.responseText);

	                // Cập nhật số lượng giỏ hàng trên giao diện
	                document.getElementById('cart-count').innerText = "";
	                document.getElementById('cart-count').innerText = `${response.cartCount}`;
	            }
	        };

	        // Gửi productId đến server
	        xhr.send(`productId=${productId}`);
	    });
	});
	</script>
</body>


</html>
