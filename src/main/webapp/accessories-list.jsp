<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Accessories List</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Style CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- HTML5 shim and Respond.js for IE8 support -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        /* styles.css */
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
<!-- Top Header -->
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

<!-- Header Section -->
<div class="header-wrapper">
    <div class="container">
        <div class="row">
            <!-- Logo -->
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-8">
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/LoadDataMain"><img src="images/logo.png" alt=""></a>
                </div>
            </div>
            <!-- Search -->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <form action="SearchOnBox" method="post">
                    <div class="search-bg">
                        <input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm..." id="searchBox"
                               class="search-box" autocomplete="off" list="product-suggestions" name="searchOnBox"
                               value="${required}">
                        <input type="hidden" id="pageNumber" name="page" value="1">
                        <button type="Submit">
                            <i class="fa fa-search"></i>
                        </button>
                        <ul id="product-suggestions" class="suggestions-list"></ul>
                    </div>
                </form>
            </div>
            <!-- Account -->
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="account-section">
                    <ul>
                        <c:if test="${empty sessionScope.khachHang}">
                            <li><a href="noAccount.jsp" class="title hidden-xs">Tài khoản</a></li>
                            <li class="hidden-xs">|</li>
                            <li><a href="login-form.jsp" class="title hidden-xs">Đăng Nhập</a></li>
                        </c:if>
                        <c:if test="${not empty sessionScope.khachHang}">
                            <li><a href="${pageContext.request.contextPath}/account-login?userID=${sessionScope.khachHang.userID}"
                                   class="title hidden-xs">Hi <c:out value="${sessionScope.khachHang.userName}" /></a>|</li>
                            <li><a href="${pageContext.request.contextPath}/dang-xuat" class="title hidden-xs">Log out</a></li>
                            <li><a href="${pageContext.request.contextPath}/load-page-favorite-list?userID=${sessionScope.khachHang.userID}">
                                <i class="fa fa-heart"></i><sup class="cart-quantity">${soLuongSanPhamLike}</sup></a></li>
                            <li><a href="${pageContext.request.contextPath}/go-to-cart" class="title">
                                <i class="fa fa-shopping-cart"></i><sup class="cart-quantity">${soLuongSP}</sup></a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Navigation -->
    <div class="navigation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div id="navigation">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/LoadDataMain">Trang chủ</a></li>
                            <li><a href="${pageContext.request.contextPath}/load-product?page=1">Điện thoại</a></li>
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
                            <li><a href="${pageContext.request.contextPath}/go-to-blog">Thông tin</a></li>
                            <li><a href="${pageContext.request.contextPath}/go-to-about">Bài viết</a></li>
                            <li><a href="${pageContext.request.contextPath}/go-to-contactus">Liên hệ, hỗ trợ</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Page Header -->
<div class="page-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="page-breadcrumb">
                    <ol class="breadcrumb">
                        <li><a href="${pageContext.request.contextPath}/LoadDataMain">Trang chủ</a></li>
                        <li>Phụ kiện</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Accessories List -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                <!-- Sidebar Section -->
                <div id='cssmenu'>
                    <ul>
                        <!-- Loại phụ kiện -->
                        <li class='has-sub'><a href='#'>Loại phụ kiện</a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?type=Tatca&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryType == 'Tatca'}">checked</c:if>>
                                    <span class="checkbox-list">Tất cả</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?type=sac-cap&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryType == 'sac-cap'}">checked</c:if>>
                                    <span class="checkbox-list">Sạc, cáp</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?type=tai-nghe&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryType == 'tai-nghe'}">checked</c:if>>
                                    <span class="checkbox-list">Tai nghe</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?type=op-lung&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryType == 'op-lung'}">checked</c:if>>
                                    <span class="checkbox-list">Ốp lưng</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?type=camera-flycam-gimbal&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryType == 'camera-flycam-gimbal'}">checked</c:if>>
                                    <span class="checkbox-list">Camera/Flycam/Gimbal</span></a></li>
                            </ul>
                        </li>
                        <!-- Thương hiệu -->
                        <li class='has-sub'><a href='#'>Thương hiệu</a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?brand=Tatca&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryBrand == 'Tatca'}">checked</c:if>>
                                    <span class="checkbox-list">Tất cả</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?brand=Apple&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryBrand == 'Apple'}">checked</c:if>>
                                    <span class="checkbox-list">Apple</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?brand=Samsung&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryBrand == 'Samsung'}">checked</c:if>>
                                    <span class="checkbox-list">Samsung</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?brand=Anker&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryBrand == 'Anker'}">checked</c:if>>
                                    <span class="checkbox-list">Anker</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?brand=JBL&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryBrand == 'JBL'}">checked</c:if>>
                                    <span class="checkbox-list">JBL</span></a></li>
                            </ul>
                        </li>
                        <!-- Giá bán -->
                        <li class='has-sub'><a href='#'>Giá bán</a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?price=Tatca&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryPrice == 'Tatca'}">checked</c:if>>
                                    <span class="checkbox-list">Tất cả</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?price=duoi500ngan&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryPrice == 'duoi500ngan'}">checked</c:if>>
                                    <span class="checkbox-list">Dưới 500 nghìn</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?price=tu500nganden1trieu&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryPrice == 'tu500nganden1trieu'}">checked</c:if>>
                                    <span class="checkbox-list">Từ 500 nghìn - 1 triệu</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?price=tren1trieu&page=1">
                                    <input type="radio" name="radio" <c:if test="${accessoryPrice == 'tren1trieu'}">checked</c:if>>
                                    <span class="checkbox-list">Trên 1 triệu</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb10 alignright">
                        <form action="${pageContext.request.contextPath}/load-accessories-by-option" method="post" id="sortForm">
                            <div class="select-option form-group">
                                <input type="hidden" name="page" value="1">
                                <select class="form-control" name="list-option"
                                        onchange="document.getElementById('sortForm').submit();">
                                    <option value="" default>Sắp xếp theo</option>
                                    <option value="Bán chạy" <c:if test="${nameOption == 'Bán chạy'}">selected</c:if>>Bán Chạy</option>
                                    <option value="Giá thấp" <c:if test="${nameOption == 'Giá thấp'}">selected</c:if>>Giá Thấp</option>
                                    <option value="Giá cao" <c:if test="${nameOption == 'Giá cao'}">selected</c:if>>Giá Cao</option>
                                </select>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="row">
                    <!-- Accessories -->
                    <c:forEach var="accessory" items="${listAccessories}">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
                            <a href="${pageContext.request.contextPath}/load-page-accessory-single?accessoryID=${accessory.accessoryID}">
                                <div class="product-block">
                                    <div class="product-img">
                                        <img src="imagesaccessories/${accessory.image}" alt="">
                                    </div>
                                    <div class="product-content">
                                        <h5>
                                            <a href="#" class="product-title">${accessory.name}</a>
                                        </h5>
                                        <div class="product-meta">
                                            <a href="#" class="product-price">${accessory.price}</a>
                                            <a href="#" class="discounted-price">${accessory.originalPrice}</a>
                                            <span class="offer-price">${accessory.discount}%off</span>
                                        </div>
                                        <div class="shopping-btn">
                                            <a href="${pageContext.request.contextPath}/add-accessory-list-favorite?accessoryID=${accessory.accessoryID}" class="product-btn btn-like">
                                                <i class="fa fa-heart"></i></a>
                                            <a href="${pageContext.request.contextPath}/add-to-cart?accessoryID=${accessory.accessoryID}&uri=${uri}&thamSo=${thamSo}" class="product-btn btn-cart">
                                                <i class="fa fa-shopping-cart"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>

                <!-- Pagination -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="st-pagination">
                            <ul class="pagination">
                                <li><a href="${pageContext.request.contextPath}/load-accessories?category=${accessoryCategory}&page=${currentPage == 1? tongSoTrang: currentPage - 1}"
                                       aria-label="previous"><i class="fa fa-angle-left" style="font-size: 16px;"></i></a></li>
                                <c:forEach var="i" begin="1" end="${tongSoTrang}">
                                    <li class="${currentPage == i ? 'active' : ''}">
                                        <a href="${pageContext.request.contextPath}/load-accessories?category=${accessoryCategory}&page=${i}" onclick="setActive(this)">${i}</a>
                                    </li>
                                </c:forEach>
                                <li><a href="${pageContext.request.contextPath}/load-accessories?category=${accessoryCategory}&page=${currentPage == tongSoTrang? 1: currentPage + 1}"
                                       aria-label="Next"><i class="fa fa-angle-right" style="font-size: 16px;"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
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
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="footer-widget">
                    <h3 class="footer-title">Truy cập nhanh</h3>
                    <ul class="arrow">
                        <li><a href="${pageContext.request.contextPath}/LoadDataMain">Trang chủ</a></li>
                        <li><a href="${pageContext.request.contextPath}/load-product?page=1">Điện thoại</a></li>
                        <li><a href="${pageContext.request.contextPath}/load-accessories?page=1">Phụ kiện</a></li>
                        <li><a href="${pageContext.request.contextPath}/go-to-blog">Thông tin</a></li>
                        <li><a href="${pageContext.request.contextPath}/go-to-about">Bài viết</a></li>
                        <li><a href="${pageContext.request.contextPath}/go-to-contactus">Liên hệ</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
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
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="footer-widget">
                    <h3 class="footer-title">Liên lạc với chúng tôi</h3>
                    <div class="ft-social">
                        <span><a href="#" class="btn-social btn-facebook"><i class="fa fa-facebook"></i></a></span>
                        <span><a href="#" class="btn-social btn-twitter"><i class="fa fa-twitter"></i></a></span>
                        <span><a href="#" class="btn-social btn-googleplus"><i class="fa fa-google-plus"></i></a></span>
                        <span><a href="#" class="btn-social btn-linkedin"><i class="fa fa-linkedin"></i></a></span>
                        <span><a href="#" class="btn-social btn-pinterest"><i class="fa fa-pinterest-p"></i></a></span>
                        <span><a href="#" class="btn-social btn-instagram"><i class="fa fa-instagram"></i></a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tiny-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="payment-method alignleft">
                        <ul>
                            <li><a href="#"><i class="fa fa-cc-paypal fa-2x"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-mastercard fa-2x"></i></a></li>
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
    </div>
</div>

<!-- Scripts -->
<script src="js/jquery.min.js" type="text/javascript"></script>
<script>
    function setActive(element) {
        document.querySelectorAll(".pagination li").forEach((el) => el.classList.remove("active"));
        element.parentElement.classList.add("active");
    }
    function closeModal() {
        document.getElementById("successModal").style.display = "none";
    }
</script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/menumaker.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.sticky.js"></script>
<script type="text/javascript" src="js/sticky-header.js"></script>
<script type="text/javascript">
    const searchBox = document.getElementById("searchBox");
    const suggestionsList = document.getElementById("product-suggestions");

    searchBox.addEventListener("input", function () {
        const keyword = this.value.trim();
        if (keyword.length > 1) {
            fetch(`SearchServlet?ans=` + keyword)
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
<script type="text/javascript">
    (function($) {
        $(document).ready(function() {
            $('#cssmenu ul ul li:odd').addClass('odd');
            $('#cssmenu ul ul li:even').addClass('even');
            $('#cssmenu > ul > li > a').click(function() {
                $('#cssmenu li').removeClass('active');
                $(this).closest('li').addClass('active');
                var checkElement = $(this).next();
                if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                    $(this).closest('li').removeClass('active');
                    checkElement.slideUp('normal');
                }
                if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                    $('#cssmenu ul ul:visible').slideUp('normal');
                    checkElement.slideDown('normal');
                }
                if ($(this).closest('li').find('ul').children().length == 0) {
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