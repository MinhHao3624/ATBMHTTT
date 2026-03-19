<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Dữ liệu khách hàng</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!---->
<!--Font Awesome-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<!--  <link rel="stylesheet" href="Admin/assets/css/admin.css">
  <link rel="stylesheet" href="Admin/../fonts/fontawesome-free-5.15.4-web/css/all.min.css">
  <link rel="stylesheet" href="Admin/vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="Admin/../css/css_admin/admin1.css">
  <link rel="stylesheet" href="Admin/../css/css_admin/admin.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Admin/assets/css/admin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/fonts/fontawesome-free-5.15.4-web/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Admin/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/css_admin/admin1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/css_admin/admin.css">
<style type="text/css">
/*  CSS FORM  */
.modal5 {
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

.modal-content5 {
	background-color: #fff;
	padding: 30px;
	border-radius: 8px;
	text-align: center;
	position: relative;
	width: 90%;
	max-width: 400px;
}

.modal-content5 img {
	width: 50px;
	margin-bottom: 20px;
}

.modal-content5 h3 {
	margin: 0;
	font-size: 24px;
	color: #28a745;
}

.modal-content5 p {
	margin-top: 10px;
	font-size: 16px;
	color: #555;
}

.btn-close5 {
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #d9534f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

.btn-close5:hover {
	background-color: #c9302c;
	/*CSS form xác nhận thành công */
}
</style>

</head>

<body>
	<!-- Left Panel -->

	<!-- /#left-panel -->

	<!-- Left Panel -->

	<!-- Right Panel -->

	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<!--Nav-->
		<div class="side-bar bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading text-center">
				<b>Mobile Shop</b>
			</div>
			<div class="profile">
				<div class="profile-pic">
					<img src="${pageContext.request.contextPath}/Admin/images/admin.jpg" alt="">
				</div>
				<div class="profile-info">
					<span>Welcome</span>
					<h5>Administrator</h5>
				</div>
			</div>
			<div class="list-group list-group-flush">
				<ul>
					<li><a href="${pageContext.request.contextPath}/Admin/admin.jsp"
						class="list-group-item list-group-item-action  "> Trang chủ <i
							class="menu-icon fa fa-laptop"></i></a></li>
					<li><a href="${pageContext.request.contextPath}/load-user-data"
						class="list-group-item list-group-item-action active "> Thông
							tin người dùng<i class="menu-icon fas fa-users font-list"></i>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/load-product-data"
						class="list-group-item list-group-item-action "> Thông tin sản
							phẩm <i class="menu-icon fas fa-mobile-alt font-list"></i>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/load-recipt-data"
						class="list-group-item list-group-item-action "> Quản lí đơn
							hàng <i class="menu-icon fas fa-shopping-cart font-list"></i>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/load-product-categories"
						class="list-group-item list-group-item-action "> Thông tin
							thương hiệu <i class="menu-icon fas fa-archway"></i>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/load-cancel-receipt"
						class="list-group-item list-group-item-action"> Đơn hàng bị
							hủy <i class="menu-icon fas fa-phone-slash"></i>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/load-feedback"
						class="list-group-item list-group-item-action"> Phản hồi khách
							hàng <i class="menu-icon far fa-paper-plane"></i>
					</a></li>
					<!-- <li>
            <a href="admin-filter.html" class="list-group-item list-group-item-action "> Dữ liệu lọc <i
                class="menu-icon fas fa-filter"></i></a>
          </li> -->
				</ul>
			</div>
		</div>
		<!--/Nav-->
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<button class="btn btn-primary" id="menu-toggle">
					<i class="fas fa-bars"></i>
				</button>
				<div class=""></div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item active"><a class="nav-link" href="#"
							data-toggle="modal" data-target="#log-out">Đăng xuất <span
								class="log-out"><i class="fas fa-arrow-right"></i></span></a></li>
						<!-- <li class="nav-item">
                  <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    Dropdown
                  </a>
                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </div>
                </li> -->
					</ul>
					<div class="modal fade" id="log-out" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">Xác
										nhận đăng xuất</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Bạn có muốn đăng xuất?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Hủy</button>
									<a href="dang-xuat"><button type="button" class="btn btn-primary">Đăng
										xuất</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav>


			<div class="container-fluid">
				<div class="mb-5 mt-3 ">
					<div class="content">
						<div class="animated fadeIn">
							<div class="row">

								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<div class=" mb-2">
												<h4 class="text-center mt-3 mb-4">Danh sách khách hàng</h4>
												<div class="row">
													<div class="show-page mb-3 ml-3">

														Hiển thị <span> <select id="show"
															onclick="select_page()">
																<option value="10">10</option>
																<option value="20">20</option>
																<option value="50">50</option>
														</select></span> cột
													</div>

													<div class="show-page  arrange">

														Sắp xếp <span> <select id="show"
															onclick="select_page()">
																<option value="10">A-Z</option>
																<option value="20">Z-A</option>
														</select></span>
													</div>
													<div class="show-page  arrange">

														Tìm kiếm <span> <input id="myInput"
															style="padding-left: 15px; border: 0.5px solid grey;"
															text" placeholder="Search.."></span>
													</div>
												</div>
												<table s id="bootstrap-data-table"
													class="table table-hover table-text-center">
													<thead class="thead-light">
														<tr>
															<th><span data-toggle="tooltip" data-placement="top"
																title="Mã khách hàng">Mã KH</span></th>
															<th>Họ tên</th>
															<th>Số điện thoại</th>
															<th>Địa chỉ mặc định</th>
															<th>Trạng thái</th>
															<th>Email</th>
															<th></th>
														</tr>
													</thead>
													<tbody id="content-table">
													<c:forEach var ="user" items = "${listUser}">
														<tr>
															<td>${user.userID}</td>
															<td>${user.fullName}</td>
															<td>${user.phoneNumber}</td>
															<td>${user.address}</td>
															<td>${user.isKey}</td>
															<td>${user.email}</td>
															<td class="row" style="border: none;">
																<div style="margin: auto;">
																	<a href="kiem-tra-khoa-tai-khoan?userID=${user.userID}"><button class="btn btn-success sizeTh1" value="true"
																		id='block' data-placement="top" title="Block"
																		data-target="#block-user" data-toggle="modal" style="${!user.isKey.equals('Hoạt động') ? 'color: red;' : ''}">
																		<i class="txt-center fas fa-lock" ></i>
																	</button></a>
																</div>
															</td>
														</tr>
														</c:forEach>
													</tbody>
												</table>
												<div class="page-navigation">
													<div class="beta">
														<button onclick="previous_page()">Trước</button>
														<span id="page-number"> </span>
														<button onclick="next_page()">Sau</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- .animated -->
						</div>
						<!-- .content -->
						<!-- Add -->
						<div class="modal fade" id="add" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Thêm
											User</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">...</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Đóng</button>
										<button type="button" class="btn btn-primary">Lưu</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /#right-panel -->
				</div>
			</div>
			<!-- /#page-content-wrapper -->
		</div>
	<c:if test="${kiemTra == true}">
			<div class="modal5" id="successModal5">
				<div class="modal-content5">
					<img
						src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
						alt="Notify Icon" style="width: 100px; height: 50px" />
					<h3>${msg}</h3>
					<button class="btn-close5" onclick="closeModal()" name="action"
						value="xacThuc">Close</button>
				    <a href="block-user?userID=${userID}"><button class="btn-close5"  name="action"
						value="xacThuc">Block user</button></a>
				</div>
			</div>
			</c:if>

		<c:if test="${kiemTra == false}">
			<div class="modal5" id="successModal5">
				<div class="modal-content5">
					<img
						src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
						alt="Notify Icon" style="width: 100px; height: 50px" />
					<h3>${msg}</h3>
					<button class="btn-close5" onclick="closeModal()" name="action"
						value="xacThuc">Close</button>
					<a href="unblock-user?userID=${userID}"><button class="btn-close5" name="action"
						value="xacThuc">UnBlock user</button></a>
				</div>
			</div>
		</c:if>

		<!-- Right Panel -->
		<script
			src="${pageContext.request.contextPath}/Admin/vendor/jquery/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<script
			src="${pageContext.request.contextPath}/js/js_admin/divide-page.js"></script>
		<!-- Menu Toggle Script -->
		<script>
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
			});
		</script>


		<!-- tooltip -->
		<script>
		function closeModal() {
			document.getElementById("successModal5").style.display = "none";
			
		}
		</script>
		<!-- block -->
		<%--  <script
			src="${pageContext.request.contextPath}/js/js_admin/user-confirmed.js"></script>
 --%>
		<!-- search -->
		<script> 
			$(document)
					.ready(
							function() {
								$("#myInput")
										.on(
												"keyup",
												function() {
													var value = $(this).val()
															.toLowerCase();
													$("#content-table tr")
															.filter(
																	function() {
																		$(this)
																				.toggle(
																						$(
																								this)
																								.text()
																								.toLowerCase()
																								.indexOf(
																										value) > -1)
																	});
												});
							});
		</script>


		<script>
			$(document).ready(function() {
				$('[data-toggle="tooltip"]').tooltip();
			});
		</script>
</body>

</html>