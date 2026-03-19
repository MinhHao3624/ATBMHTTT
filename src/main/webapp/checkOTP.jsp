<%@page import="com.projectttweb.webphone.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keywords" content="">
<title>Check OTP</title>
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.modal {
	display: flex;
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
}

.search-bg {
	position: relative;
}

.suggestions-list {
	position: absolute;
	top: 100%;
	left: 0;
	right: 0;
	background-color: white;
	z-index: 10000000000000;
	border: 1px solid #ddd;
	border-radius: 4px;
	max-height: 300px;
	overflow-y: auto;
	display: none;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	list-style: none;
	padding: 0;
	margin: 0;
}

.suggestions-list.active {
	display: block;
}

.suggestions-list li {
	padding: 10px;
	cursor: pointer;
	border-bottom: 1px solid #f1f1f1;
}

.suggestions-list li:hover {
	background-color: #f9f9f9;
}

/* Thêm CSS mới cho captcha */
.captcha-container {
	margin-top: 15px;
	padding: 15px;
	background: #f9f9f9;
	border-radius: 5px;
	border: 1px solid #ddd;
}

.captcha-container input {
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

#countdown {
	color: red;
	font-weight: bold;
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
							<input type="text" class="form-control"
								placeholder="Tìm kiếm sản phẩm..." id="searchBox"
								class="search-box" autocomplete="off" list="product-suggestions"
								name="searchOnBox" value="${required}"> <input
								type="hidden" id="pageNumber" name="page" value="1">
							<button type="Submit">
								<i class="fa fa-search"></i>
							</button>
							<ul id="product-suggestions" class="suggestions-list"></ul>
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
									href="load-page-favorite-list?userID=${sessionScope.khachHang.userID}">
										<i class="fa fa-heart"></i><sup class="cart-quantity">${soLuongSanPhamLike}</sup>
								</a></li>
								<li><a href="go-to-cart" class="title"><i
										class="fa fa-shopping-cart"></i> <sup class="cart-quantity">${soLuongSP}</sup></a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- navigation -->
		<div class="navigation">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
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
								<li><a
									href="http://localhost:8080/MobileWebApp/go-to-contactus">Liên
										hệ, hỗ trợ</a></li>
							</ul>
						</div>
					</div>
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
							<li>Quên mật khẩu</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- login-form -->
	<%
	Object obj = session.getAttribute("khachHang");
	User user = null;
	if (obj != null) {
		user = (User) obj;
	}
	String sourceServlet = request.getAttribute("sourceServlet") + "";
	sourceServlet = sourceServlet.equals("null") ? "" : sourceServlet;
	String soNgauNhien = "";
	String msg = "";
	boolean kiemTra = false;
	if (sourceServlet.equals("sendEmailPass")) {
		soNgauNhien = request.getAttribute("maXacNhan") + "";
		soNgauNhien = soNgauNhien.equals("null") ? "" : soNgauNhien;
	} else if (sourceServlet.equals("checkOTPController")) {
		soNgauNhien = request.getAttribute("soNgauNhien") + "";
		soNgauNhien = soNgauNhien.equals("null") ? "" : soNgauNhien;
		msg = request.getAttribute("baoLoi") + "";
		msg = msg.equals("null") ? "" : msg;
		kiemTra = true;
	}

	Boolean showCaptcha = (Boolean) request.getAttribute("showCaptcha");
	Long lastAttemptTime = (Long) session.getAttribute("lastAttemptTime");
	%>
	<div class="content">
		<div class="forgot-container">
			<form action="check-OTP" method="post">
				<img src="images/otp-icon.png" alt="">
				<h1 class="title">Nhập mã OTP</h1>
				<p>Mã OTP được gửi qua email</p>
				<input type="hidden" name="soNgauNhien" value="<%=soNgauNhien%>">
				<input type="text" class="field-email" placeholder="Nhập mã OTP"
					name="maOTP" required="required">

				<%
				if (showCaptcha != null && showCaptcha) {
					String captcha = (String) session.getAttribute("captcha");
				%>
				<div class="captcha-container">
					<div
						style="display: flex; align-items: center; margin-bottom: 10px;">
						<span
							style="background: #f0f0f0; padding: 8px 12px; font-weight: bold; letter-spacing: 2px; margin-right: 10px;"><%=captcha%></span>
						<input type="text" name="captcha" placeholder="Nhập mã captcha"
							required style="padding: 8px; width: 150px;">
					</div>
					<p style="color: #888; font-size: 12px;">Vui lòng nhập đúng mã
						captcha để tiếp tục</p>
				</div>
				<%
				}
				%>

				<button type="submit" class="submit-email mb20">Tiếp tục</button>
			</form>
			<a
				href="<%="http://localhost:8080/MobileWebApp/send-mail?email=" + user.getEmail()%>"
				class="text-blue">Gửi lại mã OTP</a>
		</div>
	</div>
	<!-- /.login-form -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="row">
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
		</div>
	</div>

	<%
	if (kiemTra) {
		boolean showCloseButton = false;
		if (lastAttemptTime != null) {
			long remainingTime = Math.max(0, 10000 - (System.currentTimeMillis() - lastAttemptTime)) / 1000;
			showCloseButton = (remainingTime <= 0);
		} else {
			showCloseButton = true;
		}
	%>
	<div class="modal" id="successModal">
		<div class="modal-content">
			<img
				src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
				alt="Notify Icon" style="width: 100px; height: 50px" />
			<h3><%=msg%></h3>
			<%
			if (lastAttemptTime != null) {
				long remainingTime = Math.max(0, 10000 - (System.currentTimeMillis() - lastAttemptTime)) / 1000;
			%>
			<p id="countdown">
				Bạn có thể thử lại sau: <span id="time"><%=remainingTime%></span>
				giây
			</p>
			<%
			}
			%>
			<button class="btn-close" id="closeButton"
				style="display: <%=showCloseButton ? "block" : "none"%>">Đóng</button>
		</div>
	</div>
	<%
	}
	%>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/menumaker.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.sticky.js"></script>
	<script type="text/javascript" src="js/sticky-header.js"></script>
	<script type="text/javascript">
        // Hàm đóng modal
        function closeModal() {
            document.getElementById("successModal").style.display = "none";
        }

        // Đếm ngược thời gian nếu có
        <%if (lastAttemptTime != null) {%>
            var timeLeft = <%=Math.max(0, 10000 - (System.currentTimeMillis() - lastAttemptTime)) / 1000%>;
            var countdown = setInterval(function() {
                timeLeft--;
                document.getElementById("time").textContent = timeLeft;
                if (timeLeft <= 0) {
                    clearInterval(countdown);
                    document.getElementById("countdown").style.display = "none";
                    // Hiển thị nút đóng khi hết thời gian
                    document.getElementById("closeButton").style.display = "block";
                }
            }, 1000);
        <%}%>

        // Gán sự kiện click cho nút đóng
        document.getElementById("closeButton")?.addEventListener("click", closeModal);

        // Phần xử lý tìm kiếm giữ nguyên
        const searchBox = document.getElementById("searchBox");
        const suggestionsList = document.getElementById("product-suggestions");

        searchBox.addEventListener("input", function () {
            const keyword = this.value.trim();

            if (keyword.length > 1) {
                fetch(`SearchServlet?ans=`+keyword)
                    .then(response => response.json())
                    .then(data => {
                        suggestionsList.innerHTML = "";
                        data.forEach(product => {
                            const suggestionItem = document.createElement("li");
                            suggestionItem.textContent = product.name;
                            suggestionItem.addEventListener("click", function () {
                                searchBox.value = product.name;
                                suggestionsList.innerHTML = "";
                                suggestionsList.classList.remove("active");
                            });
                            suggestionsList.appendChild(suggestionItem);
                        });
                        suggestionsList.classList.add("active");
                    });
            } else {
                suggestionsList.innerHTML = "";
                suggestionsList.classList.remove("active");
            }
        });

        document.addEventListener("click", function (e) {
            if (!searchBox.contains(e.target) && !suggestionsList.contains(e.target)) {
                suggestionsList.innerHTML = "";
                suggestionsList.classList.remove("active");
            }
        });
    </script>
</body>
</html>