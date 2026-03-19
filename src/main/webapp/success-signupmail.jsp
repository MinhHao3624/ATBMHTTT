<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Duy Lt Web</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description"
	content="create ecommerce website template for your online store, responsive mobile templates">
<meta name="keywords"
	content="ecommerce website templates, online store,">
<title>Duy Anh Lập trình Web</title>
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
<!-- Liên kết Bootstrap CSS cho thiết kế đẹp mắt -->

</head>
<body>
	<!-- top-header-->
	<!-- header-section-->
	<jsp:include page="header.jsp">
		<jsp:param name="pageTitle" value="Trang sản phẩm" />
	</jsp:include>
	<%
	String xacThuc = request.getAttribute("isXacThuc") + "";
	xacThuc = xacThuc.equals("null") ? "" : xacThuc;
	String baoLoi = request.getAttribute("thongBao") + "";
	baoLoi = baoLoi.equals("null") ? "" : baoLoi;
	%>

	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card text-center shadow-lg p-3 mb-5 bg-white rounded">
					<%
					if (xacThuc.equals("true")) {
					%>
					<div class="card-body">
						<img src="https://img.icons8.com/color/96/000000/checked--v1.png"
							alt="Success Icon" class="mb-3" />
						<h3 class="card-title text-success">Thông báo!</h3>
						<p class="card-text mt-3"><%=baoLoi%>
							qua email. Bây giờ bạn có thể truy cập và sử dụng tất cả các tính
							năng của chúng tôi.
						</p>
						<a href="login-form.jsp" class="btn btn-success btn-lg mt-4">Đăng
							nhập ngay</a>
					</div>
					<%
					} else {
					%>
					<div class="card-body">
						<img
							src="https://tse2.mm.bing.net/th?id=OIP.786j1Omfn5v_4aAUNBdepgHaG8&pid=Api&P=0&h=180"
							alt="Defeat Icon" class="mb-3" />
						<h3 class="card-title text-success">Thông báo!</h3>
						<p class="card-text mt-3">
							Tài khoản của bạn
							<%=baoLoi%>
							qua email.
						</p>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<!-- End Center -->
	<!-- footer -->
	<jsp:include page="footer.jsp">
		<jsp:param name="contactInfo" value="info@example.com" />
	</jsp:include>

	<!-- /.footer -->
	<%-- <jsp:forward page="signup-form.jsp">
        <jsp:param name="thongBao" value="${thongBao}" />
        <jsp:param name="isXacThuc" value="${isXacThuc}" />
        <jsp:param name="sourceServlet" value="${sourceServlet}" />
        <jsp:param name="hanhDong" value="${hanhDong}" />
 </jsp:forward> --%>
</body>
</html>