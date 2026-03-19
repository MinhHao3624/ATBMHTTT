<%@page import="com.projectttweb.webphone.model.Product"%>
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
    <title>Duy Anh LTW</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Style CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Google Fonts -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
            crossorigin="anonymous"></script>
    <link
            href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
            rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/jquery.desoslide.css" />
    <link rel="stylesheet" type="text/css" href="css/animate.min.css">
    <link href="css/scrolling-nav.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/jquery.rateyo.min.css">
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
        #user-comments1 {
            max-height: 300px; /* Chiều cao tối đa của phần bình luận */
            overflow-y: auto; /* Hiển thị thanh cuộn dọc khi nội dung vượt quá */
            border: 1px solid #ccc; /* Đường viền để phân biệt phần bình luận */
            padding: 10px; /* Khoảng cách bên trong giữa nội dung và viền */
            background-color: #fff; /* Màu nền trắng */
            border-radius: 5px; /* Bo tròn góc cho phần bình luận */
        }
        #user-comments {
            max-height: 300px; /* Chiều cao tối đa của phần bình luận */
            min-height: 150px; /* Chiều cao tối thiểu để khung không bị quá nhỏ */
            overflow-y: auto; /* Hiển thị thanh cuộn dọc nếu nội dung vượt quá */
            border: 1px solid #ccc; /* Đường viền để phân biệt phần bình luận */
            padding: 10px; /* Khoảng cách bên trong giữa nội dung và viền */
            background-color: #fff; /* Màu nền trắng */
            border-radius: 5px; /* Bo tròn góc cho phần bình luận */
            display: flex; /* Sử dụng flexbox */
            flex-direction: column; /* Căn dọc nội dung */
            justify-content: space-between; /* Phân bổ khoảng cách giữa nội dung */
        }

        /* Căn chỉnh nội dung khi có ít bình luận */
        .customer-reviews {
            margin-bottom: 10px; /* Khoảng cách giữa các bình luận */
        }

        /* Tạo khoảng cách giữa các dòng đánh giá */
        .divider-line {
            border-top: 1px solid #ddd; /* Đường chia giữa các bình luận */
            margin: 10px 0; /* Khoảng cách trên dưới */
        }

        /* Điều chỉnh sao đánh giá */
        .product-rating .fa-star {
            color: gold; /* Màu vàng cho sao */
            margin-right: 2px; /* Khoảng cách giữa các sao */
        }

        /* Đoạn bình luận */
        .reviews-text {
            font-size: 14px; /* Kích thước chữ */
            color: #333; /* Màu chữ */
            margin-bottom: 5px; /* Khoảng cách dưới đoạn chữ */
        }

        .text-default {
            font-weight: bold; /* Chữ đậm cho tên người dùng */
            color: #007bff; /* Màu xanh để nổi bật */
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
        /* Đặt kích thước cho các ảnh nhỏ */
        .thumb-img2 img {
            width: 80px; /* Đặt chiều rộng ảnh nhỏ */
            height: 80px; /* Đặt chiều cao ảnh nhỏ */
            object-fit: cover; /* Giữ tỉ lệ ảnh và crop nếu cần */
            border: 2px solid transparent; /* Đường viền mặc định trong suốt */
            margin: 5px; /* Khoảng cách giữa các ảnh nhỏ */
            transition: all 0.3s ease;
            /* Hiệu ứng khi di chuột vào hoặc thay đổi trạng thái */
        }

        /* Thêm đường viền màu vàng cho ảnh được chọn */
        .thumb-img2.selected img {
            border: 2px solid gold; /* Đường viền màu vàng */
        }

        /* Hiệu ứng hover để hiển thị đường viền */
        .thumb-img2 img:hover {
            border: 2px solid lightgray; /* Đường viền khi hover */
            transform: scale(1.1); /* Phóng to ảnh khi di chuột */
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

        /* Danh sách gợi ý */
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
                                    class="fa fa-shopping-cart"></i><sup class="cart-quantity" id = "cart-quantity">${soLuongSP}</sup></a>
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
                            <li><a href="http://localhost:8080/MobileWebApp/load-product?page=1">Điệnthoại</a></li>
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
                        <li>Chi tiết sản phẩm</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.page-header-->
<!-- product-single -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box">
                    <!-- product-description -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                <ul id="demo1_thumbs" class="slideshow_thumbs">
                                    <!-- <li><a href="imagesphone/iphone13-hong.webp">
                                            <div class=" thumb-img">
                                                <img src="imagesphone/iphone13-hong.webp" alt="">
                                            </div>
                                    </a></li>
                                    <li><a href="imagesphone/iphone13-trang.webp">
                                            <div class=" thumb-img">
                                                <img src="imagesphone/iphone13-trang.webp" alt="">
                                            </div>
                                    </a></li> -->
                                    <c:if test="${imgString.size() != 0 }">
                                        <c:forEach var="string" items="${imgString}">
                                            <li><a href="imagesphone/${string}" alt="">
                                                <div class="thumb-img"
                                                     class="<c:if test="${string == link}">selected</c:if>">
                                                    <img src="imagesphone/${string}" alt="">
                                                </div>
                                            </a></li>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${imgString.size() == 0}">
                                        <img src="imagesphone/${imageAnh}" alt="" style="width: 200px; height: 200px; margin-left: 100px">
                                    </c:if>
                                </ul>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                <div id="slideshow"></div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="product-single">
                                    <h2>${productTmp.name}</h2>
                                    <div class="product-rating">
                                        <c:forEach var="i" begin="1" end="${startAvg}">
                                            <span><i class="fa fa-star"></i></span>
                                        </c:forEach>
                                        <!-- <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star-o"></i></span> -->
                                        <span class="text-secondary">&nbsp;(${tongSoDanhGia}
												đánh giá)</span>
                                    </div>
                                    <p class="product-price" style="font-size: 25px;">
                                        ${productTmp.price}<sup>Đ</sup><strike
                                            style="color: rgba(128, 128, 128, 0.658); font-size: 18px;">
                                        27.990.000đ</strike>
                                    </p>
                                    <div class="box-capacity">
                                        <!-- 		<a href=""> <span class="capacity">128GB</span>

                                        </a> <a href="" class="current-phone"> <span class="capacity">256GB</span>

                                        </a> -->
                                        <c:forEach var="string" items="${memoryStr}">
                                            <a
                                                    href="load-page-product-single-memory-color?memory=${string}&color=${colorCurrent}"
                                                    class="<c:if test='${memoryCurrent == string}'>current-phone</c:if>"><span
                                                    class="capacity">${string}</span> </a>
                                        </c:forEach>
                                    </div>

                                    <div class="color-phone">
                                        <!-- <a href="" class="current-color"> <span>Vàng đồng</span>
                                        </a> <a href=""> <span>Xám</span>
                                        </a> -->
                                        <c:forEach var="text" items="${lstColor}">
                                            <a
                                                    href="load-page-product-single-memory-color?memory=${memoryCurrent}&color=${text}"
                                                    class="<c:if test='${colorCurrent == text}'>current-color</c:if>"><span>${text}</span>
                                            </a>
                                        </c:forEach>
                                    </div>
                                    <div class="product-quantity">
                                        <h4>Số lượng</h4>
                                        <div class="quantity mb20">
                                            <input class="btn-quantity decrease-quantity"
                                                   onclick="dcQuantity()" type="button" value="-"> <input
                                                type="number" max="${stockQuantity}" min="1"
                                                name="quantity" value="1" class="quantity-input"
                                                id="quantity-input"> <input
                                                class="btn-quantity increase-quantity"
                                                onclick="icQuantity()" type="button" value="+">
                                        </div>
                                        <span class="rest-quantity">${stockQuantity} sản phẩm
												có sẵn</span>
                                    </div>
                                    <div>
                                        <c:if test="${not empty sessionScope.khachHang}">
                                            <button type="submit" class="btn btn-default add-to-cart" data-product-id="${productTmp.productID}">
                                                <i class="fa fa-shopping-cart"></i>&nbsp;Thêm vào giỏ hàng
                                            </button>
                                        </c:if>

                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box-head scroll-nav">
                    <div class="head-title">
                        <a class="page-scroll active" href="#product">Mô tả sản phẩm</a>
                        <a class="page-scroll" href="#rating">Đánh giá và nhận xét</a> <a
                            class="page-scroll" href="#review">Thêm nhận xét</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- highlights -->
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="description-details">
                    <div class="description-left">
                        <h2 class="dgctpro">Đặc điểm nổi bật</h2>
                        <div itemprop="description" class="content_hide content-desc"
                             style="height: 1180px;">
                            <!-- <h2>
                                <a href="https://www.xtmobile.vn/iphone-13-128gb"
                                    target="_blank"><span style="color: rgb(0, 0, 205);">iPhone
                                        13 128GB</span></a>&nbsp;gây ấn tượng với thiết kế sang trọng,
                                cấu hình mạnh mẽ với chip A15 Bionic, dung lượng lớn,
                                camera độc đáo. Đây là một trong những lý do khiến
                                người dùng không nên bỏ qua&nbsp;<a
                                    href="https://www.xtmobile.vn/iphone-13" target="_blank"><span
                                    style="color: rgb(0, 0, 205);">iPhone 13</span></a>&nbsp;series
                                trong năm nay.
                            </h2> -->
                            <!-- Khởi tạo biến đếm -->
                            <!-- Khởi tạo biến đếm -->
                            <%
                                int soPhanTu = (int) request.getAttribute("soPhanTuDes");
                                int count = 0;
                                String[] header = (String[]) request.getAttribute("header"); // Chuyển kiểu dữ liệu từ Object thành String[]
                                String[] description = (String[]) request.getAttribute("arrDescription"); // Chuyển kiểu dữ liệu từ Object thành String[]
                                Product pro = (Product) request.getAttribute("productTmp");
                            %>

                            <!-- Lặp qua mảng arrDescription -->
                            <%
                                for (int i = 0; i < description.length; i++) {
                            %>
                            <!-- Kiểm tra nếu i = 1, 5 hoặc 7 để hiển thị header -->
                            <%
                                if (i == 1 || i == 5 || i == 7) {
                            %>
                            <h3><%=header[count]%></h3>
                            <%
                                count++;
                            %>
                            <!-- Tăng biến đếm -->
                            <%
                                }
                            %>

                            <!-- Nội dung mô tả -->
                            <p><%=description[i]%></p>

                            <!-- Kiểm tra nếu i = 1, 5 hoặc 7 để hiển thị hình ảnh -->
                            <%
                                if (i == 1 || i == 5 || i == 7) {
                            %>
                            <p style="text-align: center;">
                                <img alt="thiet-ke-iphone-13-128gb-xtmobile"
                                     src="imagesphone/<%=pro.getImage()%>"
                                     style="width: 680px; height: 510px;">
                            </p>
                            <%
                                }
                            %>
                            <!-- Kết thúc if kiểm tra hình ảnh -->
                            <%
                                }
                            %>
                            <!-- Kết thúc vòng lặp for -->




                            <!-- <p>Để trang bị viên pin lớn hơn cho dòng iPhone 13,
                                "Táo khuyết" sẽ tăng độ dày của máy lên thêm khoảng
                                0,26mm. Mặt trước máy vẫn sử dụng notch tai thỏ đặt
                                trưng, tuy nhiên kích thước có phần nhỏ gọn hơn thế hệ
                                trước. Trong khi đó, mặt sau được thay đổi cách sắp xếp
                                camera giúp người dùng dễ dàng phân biệt giữa iPhone 13
                                và iPhone 12.</p>

                            <p>Nếu như iPhone 12 sở hữu mô-đun camera hình vuông
                                với ống kính xếp dọc thì trên iPhone 13 128GB giá rẻ
                                được sắp xếp theo đường chéo. Bên cạnh đó, cụm camera
                                cũng có phần to và lồi hơn. Thế hệ iPhone 2021 ra mắt
                                năm này được Apple bổ sung khá nhiều màu sắc mới mẻ,
                                giúp người dùng có nhiều lựa chọn hơn.</p>

                            <h3>Màn hình hiển thị chất lượng</h3>

                            <p>Màn hình iPhone 13 128GB không có nhiều nâng cấp so
                                với các model iPhone 13 Pro và iPhone 13 Pro Max. Theo đó,
                                máy vẫn sử dụng tấm nền OLED cao cấp với kích thước
                                6,1 inch và độ phân giải Full HD+. Mặc dù chỉ được hỗ
                                trợ tốc độ làm mới 60Hz tiêu chuẩn, nhưng chất lượng
                                hiển thị cũng được đánh giá cao với màu sắc rực rỡ,
                                hình ảnh tái hiện một cách chân thật.</p>

                            <p style="text-align: center;">
                                <img
                                    alt="Màn hình iPhone 13 128GB không có nhiều nâng cấp"
                                    src="https://www.xtmobile.vn/vnt_upload/product/10_2021/man-hinh-iphone-13-128gb-xtmobile.jpg"
                                    style="width: 680px; height: 510px;">
                            </p>

                            <p>Điều này chắc chắn đáp ứng tốt nhu cầu trải
                                nghiệm người dùng từ xem phim, chơi game, lướt web...Công
                                nghệ bảo mật nhận diện khuôn mặt - Face ID sẽ nhận
                                được một vài nâng cấp đáng chú ý, cho phép nhận diện
                                ở nhiều góc độ và tốc độ phản hồi nhanh hơn.</p>

                            <h3>Cấu hình iPhone 13 128GB vượt trội</h3>

                            <p>Sự xuất hiện của chip A15 Bionic chắc chắn sẽ mang
                                đến hiệu năng cực kỳ tốt cho iPhone 13 128GB. Chipset này
                                được sản xuất trên tiến trình 5nm+ của TSMC, hứa hẹn
                                mang đến hiệu suất hoạt động tốt và tiết kiệm điện
                                năng hơn so với A14 Bionic trên iPhone 12. Chính vì vậy,
                                mua iPhone 13 chính hãng giá rẻ sẽ mang đến cấu hình
                                vượt trội, đa nhiệm mượt mà.</p>

                            <p style="text-align: center;">
                                <img
                                    alt="Sự xuất hiện của chip A15 Bionic chắc chắn sẽ mang đến hiệu năng cực kỳ tốt cho iPhone 13 128GB"
                                    src="https://www.xtmobile.vn/vnt_upload/product/10_2021/camera-iphone-13-128gb-xtmobile.jpg"
                                    style="width: 680px; height: 510px;">
                            </p>

                            <p>Bộ nhớ lưu trữ trên iPhone 13 không có nhiều nâng
                                cấp so với thế hệ trước. Thiết bị vẫn chỉ đi kèm với
                                bộ nhớ RAM 4GB và bộ nhớ trong 128GB. Nhìn chung, dung
                                lượng bộ nhớ này có thể đáp ứng tốt việc lưu trữ
                                cũng như hỗ trợ đa nhiệm mượt mà cho người dùng. Tất
                                nhiên, Apple cũng sẽ mang đến khả năng kết nối 5G ấn
                                tượng cho loạt iPhone mới với nhiều tiện ích hơn.</p>

                            <p>
                                Ngoài sở hữu cấu hình mạnh mẽ, loạt iPhone mới còn
                                được Apple trang bị viên pin lớn hơn hứa hẹn mang đến
                                thời lượng sử dụng cải thiện đáng kể cho người
                                dùng.&nbsp;<span style="text-align: center;">&nbsp;Bên
                                    cạnh đó, điện thoại cũng sẽ được cải tiến pin thông
                                    qua việc triển khai lại bảng mạch pin và phụ kiện sạc
                                    linh hoạt mới.</span>
                            </p> -->

                        </div>
                        <button class="less-evaluation text-center" style="display: none">
                            <i class="fa fa-minus-circle"></i> Rút gọn
                        </button>
                        <button class="more-evaluation text-center">
                            <i class="fa fa-plus-circle"></i> Xem thêm
                        </button>

                    </div>
                    <div class="description-right">
                        <h2 class="dgctpro">Thông số kĩ thuật</h2>
                        <table class="charactestic_table">
                            <tbody>
                            <tr>
                                <td class="title_charactestic" width="30%">Hệ điều hành:
                                </td>
                                <td class="content_charactestic">${heDieuHanh}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Màn hình:</td>
                                <td class="content_charactestic">${manHinh}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Mặt kính cảm
                                    ứng:</td>
                                <td class="content_charactestic">${matKichCamUng}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Màn hình rộng:
                                </td>
                                <td class="content_charactestic">${manHinhRong}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Độ phân giải:
                                </td>
                                <td class="content_charactestic">${doPhanGiai}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Ram:</td>
                                <td class="content_charactestic">${ram}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Bộ nhớ trong:
                                </td>
                                <td class="content_charactestic">${memoryStr}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">CPU:</td>
                                <td class="content_charactestic">${CPU}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Chip đồ họa
                                    (GPU):</td>
                                <td class="content_charactestic">${GPU}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Camera Sau:</td>
                                <td class="content_charactestic">${camera}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Camera trước:
                                </td>
                                <td class="content_charactestic">${cameraSefies}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Thẻ sim:</td>
                                <td class="content_charactestic">${sim}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Thẻ nhớ ngoài:
                                </td>
                                <td class="content_charactestic">${theNhoNgoai}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Dung lượng
                                    pin:</td>
                                <td class="content_charactestic">${dungLuongPin}</td>
                            </tr>

                            <tr>
                                <td class="title_charactestic" width="30%">Màu sắc:</td>
                                <td class="content_charactestic">${color}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box" id="product">
                    <div class="box-body">
                        <div class="highlights">
                            <h4 class="product-small-title">Highlights</h4>
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <ul class="arrow">
                                        <li>12.2 MP Rear | 8 MP Front Camera</li>
                                        <li>4GB RAM</li>
                                        <li>2700 mAh battery</li>
                                    </ul>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <ul class="arrow">
                                        <li>Android 8.0</li>
                                        <li>Qualcomm Snapdragon 835</li>
                                        <li>Fingerprint Sensor</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="highlights">
                            <h4 class="product-small-title">Specification</h4>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <h4>General</h4>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb30">
                                    <ul>
                                        <li>Brand</li>
                                        <li>Model Number</li>
                                        <li>Body Material</li>
                                        <li>Sim Size</li>
                                    </ul>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb30">
                                    <ul>
                                        <li style="color: #1c1e1e;">Google Pixel</li>
                                        <li style="color: #1c1e1e;">Google XYZ</li>
                                        <li style="color: #1c1e1e;">Metal and Polycarbonate</li>
                                        <li style="color: #1c1e1e;">Micro</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <h4>Display</h4>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <ul>
                                        <li>Screen Size</li>
                                        <li>Display Resolution</li>
                                        <li>Pixel Density</li>
                                        <li>Screen Protection</li>
                                    </ul>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <ul>
                                        <li style="color: #1c1e1e;">5 inch</li>
                                        <li style="color: #1c1e1e;">1280 X 720 Pixels</li>
                                        <li style="color: #1c1e1e;">294 PPI</li>
                                        <li style="color: #1c1e1e;">Gorilla Glass 4</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- rating reviews  -->
        <div id="rating">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <div class="box container-rating-review">
                        <div class="box-head">
                            <h3 class="head-title">Đánh giá và nhận xét</h3>
                        </div>
                        <div class="box-body">
                            <div class="row  rating-box">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="rating-review">
                                        <div class="">
                                            <h1 class="score-rating">${startAvg}</h1>
                                        </div>
                                        <div>
                                            <div class="product-rating">
                                                <c:forEach var="i" begin="1" end="${startAvg}">
                                                    <span><i class="fa fa-star"></i></span>
                                                </c:forEach>
                                                <!-- <span><i
                                                    class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span> <span><i
                                                    class="fa fa-star-o"></i></span> -->
                                            </div>
                                            <p class="text-secondary">${tongSoDanhGia}nhậnxét</p>
                                        </div>
                                    </div>
                                    <div class="rating-view-details">
                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span> <span><i
                                                    class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span> <span><i
                                                    class="fa fa-star"></i></span>
                                            </div>
                                            <span>${soSaoLoai5}</span>
                                        </div>

                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span> <span><i
                                                    class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </div>
                                            <span>${soSaoLoai4}</span>
                                        </div>
                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span> <span><i
                                                    class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
                                            </div>
                                            <span>${soSaoLoai3}</span>
                                        </div>

                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span> <span><i
                                                    class="fa fa-star"></i></span>
                                            </div>
                                            <span>${soSaoLoai2}</span>
                                        </div>
                                        <div class="rating-level">
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span>
                                            </div>
                                            <span>${soSaoLoai1}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="user-comments"
                                 style="max-height: 300px; overflow-y: auto; border: 1px solid #ccc; padding: 10px;">
                                <div class="row review-box">
                                    <c:if test="${checkBinhLuan == false}">
                                        <c:forEach var="productReview" items="${danhSachDanhGia}">
                                            <div class="customer-reviews">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <p class="reviews-text">
                                                        <span class="text-default">${productReview.user.userName}</span>
                                                    </p>
                                                    <div class="product-rating">
                                                        <c:forEach var="i" begin="1"
                                                                   end="${productReview.rating}">
                                                            <span><i class="fa fa-star"></i></span>
                                                        </c:forEach>
                                                        <!-- <span><i
                                                    class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span> <span><i
                                                    class="fa fa-star-o"></i></span> -->
                                                    </div>
                                                    <p>${productReview.comment}</p>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="divider-line"></div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${checkBinhLuan == true }">
                                        <div class="customer-reviews">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <p class="reviews-text">
                                                    <span class="text-default">Không có bình luận nào cho sản phẩm này</span>
                                                </p>
                                            </div>
                                        </div>
                                    </c:if>
                                    <!-- 		<div class="customer-reviews">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <p class="reviews-text">
                                                <span class="text-default">Lưu Tee</span>
                                            </p>
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span> <span><i
                                                    class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span> <span><i
                                                    class="fa fa-star-o"></i></span>
                                            </div>

                                            <p>Mặc dù vận chuyển lâu do lỗi, nhưng shop vẫn hỗ trợ
                                                mình rất nhiệt tình</p>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="divider-line"></div>
                                        </div>
                                    </div>
                                    <div class="customer-reviews">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <p class="reviews-text">
                                                <span class="text-default">William Cassidy</span>
                                            </p>
                                            <div class="product-rating">
                                                <span><i class="fa fa-star"></i></span> <span><i
                                                    class="fa fa-star"></i></span> <span><i class="fa fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span> <span><i
                                                    class="fa fa-star-o"></i></span>
                                            </div>

                                            <p>Sản phẩm rất tốt vì là lần đầu tôi mua trên mạng đt
                                                nên thấy khá là lo lắng nhưng khi nhận đc hàng thì tôi lại
                                                thấy tốt hơn mong đợi của mình chúc Shop làm ăn mua may bán
                                                đắt</p>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

            <div id="review">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="box">
                            <div class="box-head">
                                <h3 class="head-title">Đánh giá và nhận xét của bạn</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="review-form">
                                        <div
                                                class="col-lg-12 col-md-12 col-sm-12 col-xs-12 review-left">
                                            <div class="review-rating">
                                                <h4>Đánh giá của bạn về sản phẩm này</h4>
                                                <br /> //
                                                <div class="star-rate" id="rateYo"></div>
                                            </div>
                                        </div>
                                        <form class="review-right" action="comment-product-review"
                                              method="post" onsubmit="return validateForm(event)">
                                            <c:if test="${empty sessionScope.khachHang}">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="control-label sr-only " for="name"></label>
                                                        <input id="name" type="text" class="form-control"
                                                               placeholder="Họ tên" required="required" name="hoTen">
                                                        <p class="error-message" id="name-error"
                                                           style="color: red; display: none;">Vui lòng nhập họ
                                                            tên!</p>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="control-label sr-only " for="email"></label>
                                                        <input id="email" type="text" class="form-control"
                                                               placeholder="Email" required="required" name="email">
                                                        <p class="error-message" id="email-error"
                                                           style="color: red; display: none;">Vui lòng nhập
                                                            email!</p>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <select class="form-control" id="rating" name="rating"
                                                            required="required">
                                                        <option></option>
                                                        <option value="5">5 sao</option>
                                                        <option value="4">4 sao</option>
                                                        <option value="3">3 sao</option>
                                                        <option value="2">2 sao</option>
                                                        <option value="1">1 sao</option>
                                                    </select>
                                                    <p class="error-message" id="rating-error"
                                                       style="color: red; display: none;">Vui lòng chọn số
                                                        sao!</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label sr-only " for="textarea"></label>
                                                    <textarea class="form-control" id="textarea"
                                                              name="textarea" rows="4"
                                                              placeholder="Mời bạn nhập bình luận" required="required"></textarea>
                                                    <p class="error-message" id="textarea-error"
                                                       style="color: red; display: none;">Vui lòng nhập bình
                                                        luận!</p>
                                                </div>
                                                <button id="submit" name="singlebutton"
                                                        class="btn btn-primary">Gửi đánh giá</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.reviews-form -->

        </div>


    </div>
    <!-- /.product-description -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box-head">
                    <h3 class="head-title">Sản phẩm liên quan</h3>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-body">
                <div class="row">
                    <!-- product -->
                    <c:forEach var="productLQ" items="${danhSachSanPhamLienQuan}">
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                            <a
                                    href="load-page-product-single?productID=${productLQ.productID}">
                                <div class="product-block">
                                    <div class="product-img">
                                        <img src="imagesphone/${productLQ.image}" alt="">
                                    </div>
                                    <div class="product-content">
                                        <h5>
                                            <a href="#" class="product-title">${productLQ.name}</a>
                                        </h5>
                                        <div class="product-meta">
                                            <a href="#" class="product-price">${productLQ.price}</a> <a
                                                href="#" class="discounted-price">$1400</a> <span
                                                class="offer-price">20%off</span>
                                        </div>
                                        <div class="shopping-btn">
                                            <a href="#" class="product-btn btn-like"><i
                                                    class="fa fa-heart"></i></a> <a href="#"
                                                                                    class="product-btn btn-cart"><i
                                                class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                    </c:forEach>
                    <!-- /.product -->
                    <!-- product -->
                    <!-- <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <div class="product-img">
                                <img src="images/product_img_2.png" alt="">
                            </div>
                            <div class="product-content">
                                <h5>
                                    <a href="#" class="product-title">HTC U Ultra <strong>(64GB,
                                            Blue)</strong></a>
                                </h5>
                                <div class="product-meta">
                                    <a href="#" class="product-price">$1200</a> <a href="#"
                                        class="discounted-price">$1700</a> <span class="offer-price">10%off</span>
                                </div>
                                <div class="shopping-btn">
                                    <a href="#" class="product-btn btn-like"><i
                                        class="fa fa-heart"></i></a> <a href="#"
                                        class="product-btn btn-cart"><i
                                        class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    /.product
                    product
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <div class="product-img">
                                <img src="images/product_img_3.png" alt="">
                            </div>
                            <div class="product-content">
                                <h5>
                                    <a href="#" class="product-title">Samsung Galaxy Note 8</a>
                                </h5>
                                <div class="product-meta">
                                    <a href="#" class="product-price">$1500</a> <a href="#"
                                        class="discounted-price">$2000</a> <span class="offer-price">40%off</span>
                                </div>
                                <div class="shopping-btn">
                                    <a href="#" class="product-btn btn-like"><i
                                        class="fa fa-heart"></i></a> <a href="#"
                                        class="product-btn btn-cart"><i
                                        class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    /.product
                    product
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <div class="product-img">
                                <img src="images/product_img_4.png" alt="">
                            </div>
                            <div class="product-content">
                                <h5>
                                    <a href="#" class="product-title">Vivo V5 Plus <strong>(Matte
                                            Black)</strong></a>
                                </h5>
                                <div class="product-meta">
                                    <a href="#" class="product-price">$1500</a> <a href="#"
                                        class="discounted-price">$2000</a> <span class="offer-price">15%off</span>
                                </div>
                                <div class="shopping-btn">
                                    <a href="#" class="product-btn btn-like"> <i
                                        class="fa fa-heart"></i></a> <a href="#"
                                        class="product-btn btn-cart"><i
                                        class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    <!-- /.product -->
                </div>
            </div>
        </div>
    </div>
    <!-- /.product-single -->
</div>
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
<c:if test="${sourceServlet == 'DisplayCommentProduct'}">
    <c:if test="${kiemTraComment == true}">
        <div class="modal" id="successModal">
            <div class="modal-content">
                <img
                        src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
                        alt="Notify Icon" style="width: 100px; height: 50px" />
                <h3>${thongBao}</h3>
                <button class="btn-close" onclick="closeModal()" name="action"
                        value="xacThuc">Đóng</button>
            </div>
        </div>
    </c:if>
</c:if>
<c:if test="${sourceServlet == 'DisplayCommentProductNotUser'}">
    <c:if test="${kiemTraComment == true}">
        <div class="modal" id="successModal">
            <div class="modal-content">
                <img
                        src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
                        alt="Notify Icon" style="width: 100px; height: 50px" />
                <h3>${thongBao}</h3>
                <button class="btn-close" onclick="closeModal()" name="action"
                        value="xacThuc">Đóng</button>
                <button class="btn-close" name="action" value="xacThuc">
                    <a href="login-form.jsp">Đăng nhập</a>
                </button>
            </div>
        </div>
    </c:if>
</c:if>
<c:if test="${sourceServlet == 'DisplayCommentProductEmailError'}">
    <c:if test="${kiemTraComment == true}">
        <div class="modal" id="successModal">
            <div class="modal-content">
                <img
                        src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
                        alt="Notify Icon" style="width: 100px; height: 50px" />
                <h3>${thongBao}</h3>
                <button class="btn-close" onclick="closeModal()" name="action"
                        value="xacThuc">Đóng</button>
                <button class="btn-close" name="action" value="xacThuc">
                    <a href="signup-form.jsp">Đăng ký</a>
                </button>
            </div>
        </div>
    </c:if>
</c:if>
<c:if test="${sourceServlet == 'LoadPageProSingleMemoryColor'}">
    <c:if test="${kiemTraComment == true}">
        <div class="modal" id="successModal">
            <div class="modal-content">
                <img
                        src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
                        alt="Notify Icon" style="width: 100px; height: 50px" />
                <h3>${thongBao}</h3>
                <button class="btn-close" onclick="closeModal()" name="action"
                        value="xacThuc">Đóng</button>
            </div>
        </div>
    </c:if>
</c:if>
<!-- /.footer -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js" type="text/javascript"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/menumaker.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.sticky.js"></script>
<script type="text/javascript" src="js/sticky-header.js"></script>
<script type="text/javascript" src="js/scrolling-nav.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.rateyo.min.js"></script>
<script src="js/jquery.desoslide.js"></script>

<script type="text/javascript">
    function closeModal() {
        document.getElementById("successModal").style.display = "none";

    }
    function validateForm(event) {
        // Lấy các giá trị từ form
        const name = document.getElementById('name');
        const email = document.getElementById('email');
        const rating = document.getElementById('rating');
        const textarea = document.getElementById('textarea');

        // Lấy các thông báo lỗi
        const nameError = document.getElementById('name-error');
        const emailError = document.getElementById('email-error');
        const ratingError = document.getElementById('rating-error');
        const textareaError = document.getElementById('textarea-error');

        // Reset thông báo lỗi
        let isValid = true;
        nameError.style.display = 'none';
        emailError.style.display = 'none';
        ratingError.style.display = 'none';
        textareaError.style.display = 'none';

        // Kiểm tra Họ tên
        if (name && name.value.trim() === '') {
            nameError.style.display = 'block';
            isValid = false;
        }

        // Kiểm tra Email
        if (email && email.value.trim() === '') {
            emailError.style.display = 'block';
            isValid = false;
        }

        // Kiểm tra Số sao
        if (rating.value.trim() === '') {
            ratingError.style.display = 'block';
            isValid = false;
        }

        // Kiểm tra Bình luận
        if (textarea.value.trim() === '') {
            textareaError.style.display = 'block';
            isValid = false;
        }

        // Nếu có lỗi, ngăn việc gửi form
        if (!isValid) {
            event.preventDefault(); // Ngăn form submit
        }

        return isValid; // Chỉ submit khi hợp lệ
    }
</script>
<script type="text/javascript">
    document.querySelector('.add-to-cart').addEventListener('click', function() {
        const productID = this.getAttribute('data-product-id');
        const soLuong = document.getElementById("quantity-input").value;

        fetch(`add-to-cart2?productID=`+productID+`&soLuong=`+soLuong, {
            method: 'GET',
        })
            .then(response => response.json()) // Chuyển đổi kết quả thành JSON
            .then(data => {
                if (data.success) {
                    // Cập nhật số lượng sản phẩm trong giỏ hàng
                    const cartQuantityElement = document.getElementById("cart-quantity");
                    cartQuantityElement.innerHTML = data.soluongSP;
                } else {
                    alert("Sản phẩm này đã tồn tại trong giỏ hàng của bạn");
                }
            })
            .catch(error => {
                console.error("Error:", error);
                alert("Đã xảy ra lỗi khi xóa sản phẩm.");
            });
    });



</script>
<script type="text/javascript">
    $('#slideshow').desoSlide({
        thumbs : $('ul.slideshow_thumbs li > a'),
        effect : {
            provider : 'animate',
            name : 'fade'
        }

    });
</script>

<script type="text/javascript">
    $(function() {
        $("#rateYo").rateYo({
            rating : 3.6,
            starWidth : "25px"
        });

    });
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
<!--
<script>
    function dcQuantity() {
        var result = document.getElementById('quantity-input');
        var qty = result.value;
        if (!isNaN(qty) && qty > 1) {
            result.value--;
            document.getElementById('quantity-input').innerHTML = qty;
        }
        return false;
    };
    function icQuantity() {
        var result = document.getElementById('quantity-input');
        var qty = result.value;
        if (!isNaN(qty) && qty < 10) {
            result.value++;
            document.getElementById('quantity-input').innerHTML = qty;
        }
        return false;
    }
</script> -->
<script>
    function dcQuantity() {
        var result = document.getElementById('quantity-input');
        var qty = parseInt(result.value); // Lấy giá trị hiện tại
        var min = parseInt(result.min); // Lấy giá trị min
        if (!isNaN(qty) && qty > min) { // Kiểm tra không nhỏ hơn min
            result.value = qty - 1; // Giảm số lượng
        }
        return false;
    };

    function icQuantity() {
        var result = document.getElementById('quantity-input');
        var qty = parseInt(result.value); // Lấy giá trị hiện tại
        var max = parseInt(result.max); // Lấy giá trị max
        if (!isNaN(qty) && qty < max) { // Kiểm tra không lớn hơn max
            result.value = qty + 1; // Tăng số lượng
        }
        return false;
    }
</script>
<script>
    $(document).ready(function() {
        $('.less-evaluation').click(function() {
            $('.content-desc').css('height', '1180px');
            $(this).css('display', 'none');
            $('.more-evaluation').css('display', 'block');
        })
    })

    $(document).ready(function() {
        $('.more-evaluation').click(function() {
            $('.content-desc').css('height', 'auto');
            $(this).css('display', 'none');
            $('.less-evaluation').css('display', 'block');
        })
    })

    $(document).ready(function() {
        $('.page-scroll').click(function() {
            $('.page-scroll').removeClass('active');
            $(this).addClass('active');
        })
    })
</script>
</body>

</html>