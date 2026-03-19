<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Quản lí đơn hàng</title>

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
					<li><a
						href="${pageContext.request.contextPath}/load-product-data"
						class="list-group-item list-group-item-action "> Thông tin sản
							phẩm <i class="menu-icon fas fa-mobile-alt font-list"></i>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/load-recipt-data"
						class="list-group-item list-group-item-action active "> Quản
							lí đơn hàng <i class="menu-icon fas fa-shopping-cart font-list"></i>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/load-product-categories"
						class="list-group-item list-group-item-action "> Thông tin
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
									<a href="dang-xuat"><button type="button"
											class="btn btn-primary">Đăng xuất</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav>

			<c:if test="${sourceServlet == 'loadOrders'}">
				<div class="container-fluid">
					<div class="border mt-3">
						<h4 class="text-center mt-3 mb-4">Quản lí đơn hàng</h4>
						<div class="row">
							<div class="show-page mb-3 ml-3">
								Hiển thị <span> <select id="show" onclick="select_page()">
										<option value="10">10</option>
										<option value="20">20</option>
										<option value="50">50</option>
								</select></span> cột
							</div>
							<div class="show-page " style="margin-left: 50px;">

								Tìm kiếm <span> <input id="myInput"
									style="padding-left: 15px; border: 0.5px solid grey;"
									type="text" placeholder="Search.."></span>
							</div>
						</div>
						<table class="table table-hover table-text-center"
							id="receipt-table">
							<thead class="thead-light">
								<tr>
									<th scope="col">Mã đơn hàng</th>
									<th scope="col">Mã khách hàng</th>

									<th scope="col">Tổng giá trị</th>
									<th scope="col">Ngày lập</th>
									<th scope="col">Chi tiết đơn hàng</th>
									<th scope="col">Xác nhận đơn hàng</th>

								</tr>
							</thead>
							<tbody id="content-table">
								<c:forEach var="orders" items="${listOrders}">
									<tr id="orders-${orders.orderID}">
										<td>${orders.orderID}</td>
										<td>${orders.user.userID}</td>

										<td><fmt:formatNumber value="${orders.totalAmount}"
												type="currency" /></td>
										<td>${orders.ordersDate}</td>

										<td class="detail"><a
											href="${pageContext.request.contextPath}/go-to-ordersDetails?orderID=${orders.orderID}">
												Chi tiết <i class="fa fa-external-link-alt"></i>
										</a> <!-- Modal --></td>
										<td class="confirm"><span> <input
												class="confirm-check" type="checkbox" value="confirm-check"
												name="confirm-check"> <label
												title="Xác nhận đơn hàng" class="label-check active"
												data-toggle="modal"><a
													href="kiem-tra-don-hang?ordersID=${orders.orderID}"><i
														class="fas fa-check-square"
														style="${!orders.status.equals('đang chờ') ? 'color: green;' : ''}"></i></a></label>
										</span>
											<button class="btn btn-danger sizeTh1 delete-product"
												data-toggle="tooltip" data-placement="top" title="Xóa"
												data-id="${orders.orderID}">
												<i class="fa-sharp fa-solid fa-trash-arrow-up"></i>
											</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="page-navigation">
						<div class="beta">
							<button onclick="previous_page()">Trước</button>
							<span id="page-number"> </span>
							<button onclick="next_page()">Sau</button>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${sourceServlet == 'orderDetails'}">
				<div>
					<div class="modal-dialog  detail-modal">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Chi tiết đơn
									hàng</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true"></span>
								</button>
							</div>
							<div class="modal-body">
								<h5>Đơn hàng: ${orders.orderID}</h5>
								<table width="100%"
									class="text-center  table content-detail  table-hover">
									<thead class="thead-light">
										<tr>
											<th>Mã khách hàng</th>
											<th>Tên khách hàng</th>
											<th><span title="Số điện thoại"> Số điện thoại</span></th>
											<!-- <th>Hình thức thanh toán</th> -->
											<th style="min-width: 300px;">Địa chỉ</th>

										</tr>
									</thead>
									<tr>
										<td>${orders.user.userID}</td>
										<td>${orders.user.fullName}</td>
										<td><span title="Số điện thoại">${orders.phone}</span></td>
										<!-- <td>Thanh toán khi nhận hàng</td> -->
										<td style="min-width: 300px;">${orders.shippingAddress}</td>
									</tr>
								</table>
								<table width="100%"
									class="text-center  table content-detail  table-hover">
									<thead class="thead-light">
										<tr>
											<th>Hình ảnh</th>
											<th>Mã sản phẩm</th>
											<th>Tên sản phẩm</th>
											<th>Màu sắc</th>
											<th>Số lượng</th>
											<th>Giá</th>

										</tr>
									</thead>
									<c:forEach var="orderDetails" items="${listOrderDetails}">
										<tr>
											<td style="max-width: 140px;"><img
												src="${pageContext.request.contextPath}/imagesphone//${orderDetails.product.image}"
												width="100px" height="100px" alt=""></td>
											<td>${orderDetails.product.productID}</td>
											<td>${orderDetails.product.name}</td>
											<td><span title="Số điện thoại">${orderDetails.product.informationPro.color}
											</span></td>
											<td style="min-width: 300px;">${orderDetails.quantity}</th>
											<td style="min-width: 300px;">${orderDetails.product.price}<span
												style="text-decoration: underline;">đ</span>
											
											</th>
										</tr>
									</c:forEach>
								</table>

							</div>
							<div class="modal-footer">
								<a href="${pageContext.request.contextPath}/load-recipt-data"><button
										type="button" class="btn btn-secondary">Quay lại</button></a>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->
	<c:if test="${xacThuc == true}">
		<div class="modal5" id="successModal5">
			<div class="modal-content5">
				<img
					src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
					alt="Notify Icon" style="width: 100px; height: 50px" />
				<h3>${msg}</h3>
				<button class="btn-close5" onclick="closeModal()" name="action"
					value="xacThuc">Close</button>
				<a href="xac-thuc-don-hang?orderID=${orderID}"><button
						class="btn-close5" name="action" value="xacThuc">Xác thực</button></a>
			</div>
		</div>
	</c:if>

	<c:if test="${huyXacThuc == true}">
		<div class="modal5" id="successModal5">
			<div class="modal-content5">
				<img
					src="https://tse1.mm.bing.net/th?id=OIP.jZnEX7kzfh_5H-lln_XraAHaDt&pid=Api&P=0&h=180"
					alt="Notify Icon" style="width: 100px; height: 50px" />
				<h3>${msg}</h3>
				<button class="btn-close5" onclick="closeModal()" name="action"
					value="xacThuc">Close</button>
				<a href="huy-xac-thuc-don-hang?orderID=${orderID}"><button
						class="btn-close5" name="action" value="xacThuc">Hủy Xác Thực
						</button></a>
			</div>
		</div>
	</c:if>

	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/Admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script>
		function closeModal() {
			document.getElementById("successModal5").style.display = "none";

		}
	</script>
	<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function () {
        // Gắn sự kiện click cho các nút xóa
        document.querySelectorAll('.delete-product').forEach(button => {
            button.addEventListener('click', function () {
                const ordersId = this.getAttribute('data-id'); // Lấy ID sản phẩm
                console.log(ordersId);
                const row = document.getElementById(`orders-`+ordersId); // Dòng sản phẩm cần xóa

                // Hiển thị hộp thoại xác nhận
                const isConfirmed = confirm("Bạn có chắc muốn xóa sản phẩm này không?");
                
                if (isConfirmed) { // Nếu chọn "Có"
                    // Gửi AJAX request đến Servlet để xóa sản phẩm
                    fetch(`deleteOrdersInList?ordersID=`+ordersId, {
                        method: "GET"
                    })
                    .then(response => response.json()) // Chuyển đổi kết quả thành JSON
                    .then(data => {
                        if (data.success) {
                            // Xóa dòng sản phẩm trên giao diện nếu xóa thành công
                            row.remove();
                            alert("Xóa sản phẩm thành công!");
                        } else {
                            alert("Xóa sản phẩm thất bại: " + data.message);
                        }
                    })
                    .catch(error => {
                        console.error("Error:", error);
                        alert("Đã xảy ra lỗi khi xóa sản phẩm.");
                    });
                } else {
                    // Nếu chọn "Không", không làm gì cả
                    console.log("Hủy xóa sản phẩm.");
                }
            });
        });
    });
    
</script> <!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
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
	<script
													src="${pageContext.request.contextPath}/js/js_admin/divide-page.js"></script>
	<script
													src="${pageContext.request.contextPath}/js/js_admin/confirmed.js"></script>

											</body>

</html>