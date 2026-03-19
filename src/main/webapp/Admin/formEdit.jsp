<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Thêm sản phẩm</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/Admin/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/all.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/fonts/fontawesome-free-5.15.4-web/css/all.min.css">
</link>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/css_admin/admin.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/css_admin/admin1.css">
<!-- (1): Khai báo sử dụng thư viện CKEditor -->
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

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
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<!--Nav-->
		<div class="side-bar bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading text-center">
				<b>Mobile Shop</b>
			</div>
			<div class="profile">
				<div class="profile-pic">
					<img
						src="${pageContext.request.contextPath}/Admin/images/admin.jpg"
						alt="">
				</div>
				<div class="profile-info">
					<span>Welcome</span>
					<h5>Administrator</h5>
				</div>
			</div>
			<div class="list-group list-group-flush">
				<ul>
					<li><a href="Admin/admin.jsp"
						class="list-group-item list-group-item-action  "> Trang chủ <i
							class="menu-icon fa fa-laptop"></i></a></li>
					<li><a
						href="${pageContext.request.contextPath}/load-user-data"
						class="list-group-item list-group-item-action "> Thông tin
							người dùng<i class="menu-icon fas fa-users font-list"></i>
					</a></li>
					<li><a href="load-product-data"
						class="list-group-item list-group-item-action active"> Thông
							tin sản phẩm <i class="menu-icon fas fa-mobile-alt font-list"></i>
					</a></li>
					<li><a href="admin-manager-recipt.html"
						class="list-group-item list-group-item-action "> Quản lí đơn
							hàng <i class="menu-icon fas fa-shopping-cart font-list"></i>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/load-product-categories"
						class="list-group-item list-group-item-action  "> Thông tin
							thương hiệu <i class="menu-icon fas fa-archway"></i>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/load-cancel-receipt"
						class="list-group-item list-group-item-action "> Đơn hàng bị
							hủy <i class="menu-icon fas fa-phone-slash"></i>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/load-feedback"
						class="list-group-item list-group-item-action"> Phản hồi khách
							hàng <i class="menu-icon far fa-paper-plane"></i>
					</a></li>

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
									<a href="dang-xuat"><button type="button"
											class="btn btn-primary">Đăng xuất</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav>
			<div class="container-fluid">
				<div class="container mt-4 ">
					<h2 style="text-align: center;">Chỉnh sữa sản phẩm</h2>
					<form action="/MobileWebApp/edit-product-real" method="post">
						<!-- Thẻ input hidden để gửi productID -->
						<input type="hidden" name="productID" value="${productID}" />
						<div class="row">
							<div class="col-6 space-top">
								<h5 class="spacing_form">Tên sản phẩm</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-mobile-alt"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4"
										value="${tenSanPham}" placeholder="Nhập tên sản phẩm"
										name="tenSanPham">
								</div>
							</div>
							<div class="col-6 space-top">
								<h5 class="spacing_form">Giá bán(VND)</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-dollar-sign"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4" value="${price}"
										placeholder="20.000.000" name="priceDis">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-6 space-top">
								<h5 class="spacing_form">Tên Thương hiệu</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-mobile-alt"></i>
										</div>
									</div>
									<select name="categories" class="form-control w">
										<option value="IPhone" ${cate == 'IPhone' ? 'selected' : ''}>IPhone</option>
										<option value="Samsung" ${cate == 'Samsung' ? 'selected' : ''}>Samsung</option>
										<option value="Xiaomi" ${cate == 'Xiaomi' ? 'selected' : ''}>Xiaomi</option>
										<option value="Vsmart" ${cate == 'Vsmart' ? 'selected' : ''}>Vsmart</option>
										<option value="OPPO" ${cate == 'OPPO' ? 'selected' : ''}>OPPO</option>
										<option value="Vivo" ${cate == 'Vivo' ? 'selected' : ''}>Vivo</option>
										<option value="Nokia" ${cate == 'Nokia' ? 'selected' : ''}>Nokia</option>
										<option value="Huawei" ${cate == 'Huawei' ? 'selected' : ''}>Huawei</option>
									</select>
								</div>
							</div>

						</div>

						<!-- color -->
						<div id="color">
							<div class="boder-color">
								<div class="row boder-color1">
									<div class="col-4 space-top " id="chooseColor" name="1">
										<h5 class="spacing_form">Màu sắc</h5>
										<div class="input-group mb-2">
											<div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fas fa-mobile-alt"></i>
												</div>
											</div>
											<input type="text" class="form-control py-4" value="${color}"
												placeholder="Nhập màu sắc" name="color">
										</div>
									</div>

									<!--  <div class="col-4 space-top">
                    <h5 class="spacing_form ">URL hình ảnh nền</h5>
                    <input class="mt-2" type="file" accept=".jpg,.png,.jpge">
                  </div> -->

									<div class="col-4 space-top">
										<h5 class="spacing_form">Số lượng</h5>
										<div class="input-group mb-2">
											<div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fas fa-tag "></i>
												</div>
											</div>
											<input type="number" class="form-control py-4"
												value="${size}" placeholder="Nhập số lượng" name="soLuong">
										</div>
									</div>
								</div>



							</div>
						</div>

						<!-- add color -->



						<div class="form-group space-top" style="margin-top: 70px;">
							<h5 class="spacing_form">Giới thiệu sản phẩm</h5>
							<!-- (2): textarea sẽ được thay thế bởi CKEditor -->
							<textarea id="edit" cols="150" rows="15" name="description">${descrip}

                    </textarea>

							<!-- (3): Code Javascript thay thế textarea có id='editor1' bởi CKEditor -->
							<!-- <script>
                  CKEDITOR.replace('edit');
                </script> -->
						</div>
						<hr>
						<!-- thong so ki thuat -->
						<h3 class="text-center">Thông số kĩ thuật</h3>
						<div class="row">
							<div class="col-6 space-top">
								<h5 class="spacing_form">Màn hình</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-mobile-alt"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4" value="${manHinh}"
										placeholder="Nhập thông số màn hình" name="manHinh">
								</div>
							</div>
							<div class="col-6 space-top">
								<h5 class="spacing_form">Hệ điều hành</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-cogs"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4"
										value="${heDieuHanh}" placeholder="Nhập tên hệ điều hành"
										name="heDieuHanh">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-6 space-top">
								<h5 class="spacing_form">Camera sau</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-camera"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4"
										value="${cameraSau}" placeholder="Nhập thông số camera sau"
										name="cameraSau">
								</div>
							</div>
							<div class="col-6 space-top">
								<h5 class="spacing_form">Camera trước</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-camera"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4"
										value="${cameraTruoc}"
										placeholder="Nhập thông số camera trước" name="cameraTruoc">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-6 space-top">
								<h5 class="spacing_form">CPU</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-hdd"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4" value="${cpu}"
										placeholder="Nhập thông số CPU" name="cpu">
								</div>
							</div>
							<div class="col-6 space-top">
								<h5 class="spacing_form">Bộ nhớ</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-sd-card"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4" value="${boNho}"
										placeholder="Nhập thông số bộ nhớ" name="boNho">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 space-top">
								<h5 class="spacing_form">Kích thước màn hình</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-mobile-alt"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4"
										value="${kichThuocManHinh}"
										placeholder="Nhập thông số màn hình" name="screenSize">
								</div>
							</div>
							<div class="col-6 space-top">
								<h5 class="spacing_form">Glass</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-cogs"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4" value="${glass}"
										placeholder="Nhập Glass của máy" name="glass">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 space-top">
								<h5 class="spacing_form">Resolution</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-hdd"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4"
										value="${resolution}" placeholder="Nhập resolution của máy"
										name="resolution">
								</div>
							</div>
							<div class="col-6 space-top">
								<h5 class="spacing_form">Ram</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-sd-card"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4" value="${ram}"
										placeholder="Nhập thông số ram" name="ram">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 space-top">
								<h5 class="spacing_form">GPU</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-hdd"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4" value="${gpu}"
										placeholder="Nhập thông số gpu" name="gpu">
								</div>
							</div>
							<div class="col-6 space-top">
								<h5 class="spacing_form">SIM</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-sd-card"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4" value="${sim}"
										placeholder="Nhập thông số sim" name="sim">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 space-top">
								<h5 class="spacing_form">Baterry</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-hdd"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4" value="${baterry}"
										placeholder="Nhập thông số baterry" name="baterry">
								</div>
							</div>
							<div class="col-6 space-top">
								<h5 class="spacing_form">Memory Card</h5>
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">
											<i class="fas fa-sd-card"></i>
										</div>
									</div>
									<input type="text" class="form-control py-4"
										value="${memoryCard}" placeholder="Nhập thông số thẻ nhớ"
										name="memoryCard">
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 60px;">
							<input
								class="btn btn-primary col-sm-3 row space-top space-bottom "
								type="submit" value="Chỉnh sửa sản phẩm">
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- Modal -->
	<c:if test="${kiemTra == true}">
		<div class="modal5" id="successModal5">
			<div class="modal-content5">
				<img
					src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
					alt="Notify Icon" style="width: 100px; height: 50px" />
				<h3>${msg}</h3>
				<button class="btn-close5" onclick="closeModal()" name="action"
					value="xacThuc">Đóng</button>
			</div>
		</div>
	</c:if>
	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/Admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script type="text/javascript">
		function closeModal() {
			document.getElementById("successModal5").style.display = "none";

		}
	</script>
	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
	<script src="../js/js_admin/divide-page.js"></script>

	<!-- chkeditor -->
	<script src="../ckeditor/ckeditor.js"></script>
	<script>
		CKEDITOR.replace('ten');
	</script>
	<!-- /chkeditor -->

	<!-- add color -->

</body>

</html>