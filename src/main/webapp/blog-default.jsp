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
    <title>Mobile Web App</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Style CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
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
<!-- /. header-section-->
<!-- page-header -->
<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb">
                        <li><a href="#">Trang chủ</a></li>
                        <li>Blog Default</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.page-header-->
<!-- blog -->
<div class="space-medium">
    <div class="container">
        <div class="row">
            <div class="isotope">
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 post-masonry ">
                    <div class="post-block">
                        <!-- post block -->
                        <h3 class="post-title"><a href="#" class="title">Commerce Free Template</a></h3>
                        <div class="meta">
                            <span class="meta-date">20 December 10, 2020</span>
                            <span>|&nbsp; &nbsp;</span>
                            <span class="meta-admin">By <a href="#" class="meta-title">Admin</a></span>
                        </div>
                        <div class="post-img">
                            <a href="#" class="imghover">
                                <img src="images/post_img_1.jpg" alt="" class="img-responsive"></a>
                        </div>
                        <div class="post-content">
                            <p>Etiased lorem sapiuis pharetra edexin fringliam acpurus semrbi non magna id ipsmm...
                            </p>
                            <a href="#" class="btn-link"><center>ĐỌC THÊM </center></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 post-masonry">
                    <div class="post-block ">
                        <!-- post block -->
                        <h3 class="post-title"><a href="#" class="title">Online Mobile Store E-Commerce</a></h3>
                        <div class="meta">
                            <span class="meta-date">18 Tháng 11, 2020</span>
                            <span>|&nbsp; &nbsp;</span>
                            <span class="meta-admin">By <a href="#" class="meta-title">Admin</a></span>
                        </div>
                        <div class="post-img">
                            <a href="#" class="imghover">
                                <img src="images/post_img_2.jpg" alt="" class="img-responsive"></a>
                        </div>
                        <div class="post-content">
                            <p>Nullam acdui utnisl interdum mattisut nonese maurisauris gravida auctor dignissim.
                            </p>
                            <a href="#" class="btn-link"><center>ĐỌC THÊM </center></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12  post-masonry ">
                    <div class="post-block">
                        <!-- post block -->
                        <h3 class="post-title"><a href="#" class="title">E-Commerce Free Template</a></h3>
                        <div class="meta">
                            <span class="meta-date">18 December, 2020</span>
                            <span>|&nbsp; &nbsp;</span>
                            <span class="meta-admin">By <a href="#" class="meta-title">Admin</a></span>
                        </div>
                        <div class="post-img">
                            <a href="#" class="imghover">
                                <img src="images/post_img_3.jpg" alt="" class="img-responsive"></a>
                        </div>
                        <div class="post-content">
                            <p>Etiased lorem sapiuis pharetra edexin fringliam acpurus semrbi non magna id ipsmm...
                            </p>
                            <a href="#" class="btn-link"><center>ĐỌC THÊM </center></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12  post-masonry ">
                    <div class="post-block">
                        <!-- post block -->
                        <h3 class="post-title"><a href="#" class="title">Online Mobile Shopping</a></h3>
                        <div class="meta">
                            <span class="meta-date">15 December, 2020</span>
                            <span>|&nbsp; &nbsp;</span>
                            <span class="meta-admin">By <a href="#" class="meta-title">Admin</a></span>
                        </div>
                        <div class="post-img">
                            <a href="#" class="imghover">
                                <img src="images/post_img_1.jpg" alt="" class="img-responsive"></a>
                        </div>
                        <div class="post-content">
                            <p>Aenean fringillaest euismod exdictum viverra Interdumet malesuada famesace.
                            </p>
                            <a href="#" class="btn-link"><center>ĐỌC THÊM </center></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12  post-masonry ">
                    <div class="post-block">
                        <!-- post block -->
                        <h3 class="post-title"><a href="#" class="title">Online Mobile Store</a></h3>
                        <div class="meta">
                            <span class="meta-date">16 December, 2020</span>
                            <span>|&nbsp; &nbsp;</span>
                            <span class="meta-admin">By <a href="#" class="meta-title">Admin</a></span>
                        </div>
                        <div class="post-img">
                            <a href="#" class="imghover">
                                <img src="images/post_img_2.jpg" alt="" class="img-responsive"></a>
                        </div>
                        <div class="post-content">
                            <p>Curabitur auctor lectus magnaac faucibus one mauris finibus tateget interdum erose.
                            </p>
                            <a href="#" class="btn-link"><center>ĐỌC THÊM </center></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 post-masonry">
                    <div class="post-block ">
                        <h3 class="post-title"><a href="#" class="title">Mobile Phones Online Shopping</a></h3>
                        <div class="meta">
                            <span class="meta-date">20 December, 2020</span>
                            <span>|&nbsp; &nbsp;</span>
                            <span class="meta-admin">By <a href="#" class="meta-title">Admin</a></span>
                        </div>
                        <div class="post-img">
                            <a href="#" class="imghover">
                                <img src="images/post_img_3.jpg" alt="" class="img-responsive"></a>
                        </div>
                        <div class="post-content">
                            <p>Etiased lorem sapiuis pharetra edexin fringliam acpurus semrbi non magna id ipsmm...
                            </p>
                            <a href="#" class="btn-link"><center>ĐỌC THÊM </center></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="st-pagination">
                <ul class="pagination">
                    <li><a href="#" aria-label="previous"><span aria-hidden="true">Trang trước</span></a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#" aria-label="Next"><span aria-hidden="true">Trang sau</span></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- blog -->
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
                        <span class="contact-text">Phường Linh Trung, Thủ Đức<br>Thành phố Hồ Chí Minh, Việt Nam - 1955</span>
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
                    <h3 class="footer-title">Tiện ích</h3>
                    <ul class="arrow">
                        <li><a href="index.html">Trang chủ </a></li>
                        <li><a href="product-list.html">Điện thoại</a></li>
                        <li><a href="about.html">Thông tin</a></li>
                        <li><a href="blog-default.html">Bài viết</a></li>
                        <li><a href="contact-us.html">Liên hệ, hỗ trợ</a></li>
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
                                        class="fa fa-facebook"></i></a></span>
                        <span><a href="#" class="btn-social btn-twitter"><i
                                class="fa fa-twitter"></i></a></span>
                        <span><a href="#" class="btn-social btn-googleplus"><i
                                class="fa fa-google-plus"></i></a></span>
                        <span><a href="#" class=" btn-social btn-linkedin"><i
                                class="fa fa-linkedin"></i></a></span>
                        <span><a href="#" class=" btn-social btn-pinterest"><i
                                class="fa fa-pinterest-p"></i></a></span>
                        <span><a href="#" class=" btn-social btn-instagram"><i class="fa fa-instagram"></i></a></span>
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
</body>


</html>