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
    <title>Mobile Phone</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Style CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
    <!-- owl-carousel -->
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.default.css" rel="stylesheet">
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
						<a href="index.jsp"><img src="images/logo.png" alt="">
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
<!-- page-header -->
<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb">
                        <li><a href="#">Trang chủ</a></li>
                        <li>Thông tin</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.page-header-->
<!-- about -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box">
                    <!-- about description -->
                    <div class="box-head">
                        <h2 class="head-title">Chào mừng đến với MobileStore </h2>
                    </div>
                    <div class="box-body">
                        <p class="lead">MobileStore là một trang web bán điện thoại trực tuyến do công ty MobileStore
                            tạo ra và chi phối. Để có thể tạo được sự thuận tiện đến khách hàng khi mua sản phẩm thì
                            ngoài các chi nhánh chúng tôi còn mở ra một trang web bán hàng trực tuyến. Trang web có tất
                            cả
                            các sản phẩm diện thoại của công ty chúng tôi. Khách hàng có thể thoải mái lựa chọn phù hợp
                            với như cầu
                            của mình.</p>
                    </div>
                    <!-- /.about description -->
                </div>
            </div>
        </div>
    </div>
    <!-- counters -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box">
                    <div class="box-head">
                        <h2 class="head-title">MobileStore là một công ty lớn với </h2>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <!-- counter-block -->
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="counter-block">
                                    <div class="counter-icon">
                                        <img src="images/mobile_icon.png" alt="">
                                    </div>
                                    <div class="counter-content">
                                        <h3 class="counter-text">1,00,000 <sup>+</sup></h3>
                                        <h4>Sản phẩm</h4>
                                    </div>
                                </div>
                            </div>
                            <!-- /.counter-block -->
                            <!-- counter-block -->
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="counter-block">
                                    <div class="counter-icon">
                                        <img src="images/user_icon.png" alt="">
                                    </div>
                                    <div class="counter-content">
                                        <h3 class="counter-text">80,000 <sup>+</sup></h3>
                                        <h4>Khách hàng</h4>
                                    </div>
                                </div>
                            </div>
                            <!-- /.counter-block -->
                            <!-- counter-block -->
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="counter-block">
                                    <div class="counter-icon">
                                        <img src="images/location_icon.png" alt="">
                                    </div>
                                    <div class="counter-content">
                                        <h3 class="counter-text">100 <sup>+</sup></h3>
                                        <h4>Chi nhánh</h4>
                                    </div>
                                </div>
                            </div>
                            <!-- /.counter-block -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.counters -->
    <!-- features -->
    <div class="container">
        <div class="row">
            <!-- features-block -->
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mt40  mb40">
                <div class="feature">
                    <div class="feature-content">
                        <h3>Nhiệm vụ</h3>
                        <p>Mang đến sự dễ dàng và thuận tiện khi khách hàng mua sản phẩm.</p>
                    </div>
                </div>
            </div>
            <!-- /.features-block -->
            <!-- features-block -->
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mt40  mb40">
                <div class="feature">
                    <div class="feature-content">
                        <h3>Tầm nhìn</h3>
                        <p>Mở rộng chuỗi cửa hàng ra cả nước, phục vụ cho tất cả các khách hàng.</p>
                    </div>
                </div>
            </div>
            <!-- /.features-block -->
            <!-- features-block -->
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mt40 mb40">
                <div class="feature">
                    <div class="feature-content">
                        <h3>Giá cả</h3>
                        <p>Gía cả phù hợp với từng sản phẩm. Ngoài ra chũng tôi còn có dịch vụ giảm giá và
                            miễn phí vận chuyển.</p>
                    </div>
                </div>
            </div>
            <!-- /.features-block -->
        </div>
    </div>
    <!-- /.features -->
    <!-- timeline -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box">
                    <div class="box-head">
                        <h2 class="head-title">Thời gian phát triển MobileStore</h2>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <!-- timeline-block -->
                            <ul class="timeline">
                                <li>
                                    <div class="tl-circ"></div>
                                    <div class="timeline-panel">
                                        <div class="tl-heading">
                                            <h3>2010 - 2012</h3>
                                        </div>
                                        <div class="tl-body">
                                            <h4>Lịch sử</h4>
                                            <p>Xây dựng ý tưởng mở công ty MobileStore. Tìm kiếm nguồn vốn, nguồn nhân
                                                lực, quản lý, ... </p>
                                        </div>
                                    </div>
                                </li>
                                <!-- /.timeline-block -->
                                <!-- timeline-block -->
                                <li class="timeline-inverted">
                                    <div class="tl-circ"></div>
                                    <div class="timeline-panel">
                                        <div class="tl-heading">
                                            <h3>2013 - 2014</h3>
                                        </div>
                                        <div class="tl-body">
                                            <h4>Lịch sử</h4>
                                            <p>Công ty MobileStore được thành lập. Tiếp tục khó khắn trong việc tìm kiếm
                                                khách hàng.</p>
                                        </div>
                                    </div>
                                </li>
                                <!-- /.timeline-block -->
                                <!-- timeline-block -->
                                <li>
                                    <div class="tl-circ"></div>
                                    <div class="timeline-panel">
                                        <div class="tl-heading">
                                            <h3>2014 - 2015</h3>
                                        </div>
                                        <div class="tl-body">
                                            <h4>Lịch sử</h4>
                                            <p>Công ty đi vào thời kỳ ổn định.
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <!-- /.timeline-block -->
                                <!-- timeline-block -->
                                <li class="timeline-inverted">
                                    <div class="tl-circ"></div>
                                    <div class="timeline-panel">
                                        <div class="tl-heading">
                                            <h3>2017 - 2018</h3>
                                        </div>
                                        <div class="tl-body">
                                            <h4>Lịch sử</h4>
                                            <p>Công ty MobileStore đã phát triển mạnh. Mở thêm nhiều chi nhánh và trang
                                                web MobileStore để phục vụ nhiều khách hàng hơn.</p>
                                        </div>
                                    </div>
                                </li>
                                <!-- /.timeline-block -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.timeline -->
    <!-- testimonial -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box">
                    <div class="box-head">
                        <h2 class="head-title">Bình luận nổi bật của các khách hàng</h2>
                    </div>
                    <div class="box-body">
                        <div class="row">

                            <div class="testimonial-carousel">
                                <div class="owl-carousel owl-three owl-theme">
                                    <!-- testimonial-block -->
                                    <div class="item">
                                        <div class="testimonial-block">
                                            <div class="testimonial-content">
                                                <p class="testimonial-text">“Tôi thật sự thích công ty này, họ luôn mang
                                                    đến cho tôi sự thuận tiện khi tôi mua sản phẩm của họ.”</p>
                                                <h4>Henry Odom</h4>
                                                <span class="text-default">(Ahemedabad)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.testimonial-block -->
                                    <!-- testimonial-block -->
                                    <div class="item">
                                        <div class="testimonial-block">
                                            <div class="testimonial-content">
                                                <p class="testimonial-text">“Công ty có một đội tuyển phục vụ rất tốt. Họ
                                                    tư vấn cho tôi một cách tận tình khi tôi có khó khăn trong việc mua sản
                                                    phẩm.”</p>
                                                <h4>George Walker</h4>
                                                <span class="text-default">(Baroda)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.testimonial-block -->
                                    <!-- testimonial-block -->
                                    <div class="item">
                                        <div class="testimonial-block">
                                            <div class="testimonial-content">
                                                <p class="testimonial-text">“Công ty có khá nhiều loại sản phẩm khác
                                                    nhau. Giá cả lại rất phù hợp. Tôi rất thích công ty này.”</p>
                                                <h4>Henry Odom</h4>
                                                <span class="text-default">(Ahemedabad)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.testimonial-block -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- testimonial -->
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
                        <li><a href="index.jsp">Trang chủ </a></li>
                        <li><a href="product-list.jsp">Điện thoại</a></li>
                        <li><a href="about.jsp">Thông tin</a></li>
                        <li><a href="blog-default.jsp">Bài viết</a></li>
                        <li><a href="contact-us.jsp">Liên hệ, hỗ trợ</a></li>
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
                        <span><a href="#" class="btn-social btn-googleplus"><i class="fa fa-google-plus"></i></a></span>
                        <span><a href="#" class=" btn-social btn-linkedin"><i class="fa fa-linkedin"></i></a></span>
                        <span><a href="#" class=" btn-social btn-pinterest"><i class="fa fa-pinterest-p"></i></a></span>
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
                        <a href="https://easetemplate.com/" target="_blank" class="copyrightlink">Nhom 21</a></p>
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