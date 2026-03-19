<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>Phản hồi khách hàng</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!---->
<!--Font Awesome-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Admin/assets/css/admin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Admin/vendor/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/fonts/fontawesome-free-5.15.4-web/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/css_admin/admin1.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/css_admin/admin.css">
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
}

/* Form phản hồi */
.feedback-modal {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	width: 500px;
	max-width: 90%;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
	z-index: 1000;
	overflow: hidden;
}

.feedback-modal-header {
	padding: 10px 15px;
	background-color: #007bff;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.feedback-modal-header h3 {
	margin: 0;
}

.feedback-modal-body {
	padding: 20px;
}

.feedback-modal-body p {
	margin: 0 0 10px;
	font-weight: bold;
}

.feedback-modal-body textarea {
	width: 100%;
	height: 100px;
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 10px;
	resize: none;
	font-size: 14px;
}

.feedback-modal-footer {
	padding: 10px 15px;
	display: flex;
	justify-content: flex-end;
	gap: 10px;
}

.feedback-modal-footer button {
	padding: 8px 15px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	cursor: pointer;
}

.feedback-modal-footer .btn-close {
	background-color: #6c757d;
	color: white;
}

.feedback-modal-footer .btn-send {
	background-color: #007bff;
	color: white;
}

.feedback-modal-footer .btn-close:hover {
	background-color: #5a6268;
}

.feedback-modal-footer .btn-send:hover {
	background-color: #0056b3;
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
					<li><a
						href="${pageContext.request.contextPath}/Admin/admin.jsp"
						class="list-group-item list-group-item-action  "> Trang chủ <i
							class="menu-icon fa fa-laptop"></i></a></li>
					<li><a
						href="${pageContext.request.contextPath}/load-user-data"
						class="list-group-item list-group-item-action "> Thông tin
							người dùng<i class="menu-icon fas fa-users font-list"></i>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/load-product-data"
						class="list-group-item list-group-item-action active"> Thông
							tin sản phẩm <i class="menu-icon fas fa-mobile-alt font-list"></i>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/load-recipt-data"
						class="list-group-item list-group-item-action "> Quản lí đơn
							hàng <i class="menu-icon fas fa-shopping-cart font-list"></i>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/load-product-categories"
						class="list-group-item list-group-item-action  "> Thông tin
							thương hiệu <i class="menu-icon fas fa-archway"></i>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/load-cancel-receipt"
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
			<div class="container-fluid">
				<div class="mb-5 mt-3 ">
					<div class="content">
						<div class="animated fadeIn">
							<div class="row">

								<div class="col-md-12">
									<div class="card">
										<div class="card-body">
											<div class=" mb-2">
												<h4 class="text-center mt-3 mb-4">Phản hồi của khách
													hàng</h4>
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

														Tìm kiếm <span> <input id="myInput"
															style="padding-left: 15px; border: 0.5px solid grey;"
															text" placeholder="Search.."></span>
													</div>

												</div>

												<table id="bootstrap-data-table"
													class="table table-hover text-left">
													<thead class="thead-light">
														<tr>
															<th>Họ tên</th>
															<th>Email</th>
															<th>Số điện thoại</th>
															<th>Thời gian</th>
															<th>Lời nhắn</th>
															<th></th>
														</tr>
													</thead>
													<tbody id="content-table">
														<c:forEach var="feedback" items="${danhSachFB}">
															<tr id="feedback-${feedback.feedID}">
																<td>${feedback.user.fullName}</td>
																<td>${feedback.user.email}</td>
																<td>${feedback.user.phoneNumber}</td>
																<td>${feedback.createAt}</td>
																<td class="feedback">${feedback.messageUser}.</td>
																<td class="row" style="border: none;">
																	<div style="margin: auto;">
																		<a
																			href="phan-hoi-khach-hang?feedbackID=${feedback.feedID}"><button
																				type="button" class="btn btn-primary">
																				<i class="text-center fas fa-paper-plane"></i>
																			</button></a>
																		<button class="btn btn-danger sizeTh1 delete-feedback"
																			data-placement="top" title="Xóa"
																			data-id="${feedback.feedID}">
																			<i class="txt-center menu-icon fas fa-trash-alt"></i>
																		</button>
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
						<!--Modal add-->

						<!--/Modal add-->

					</div>
					<!-- /#right-panel -->
				</div>
			</div>
			<!-- /#page-content-wrapper -->
		</div>
		<!-- feedback -->
		<!-- Overlay -->

		<!-- Form phản hồi -->
		<c:if test="${kiemTra == true}">
			<div class="feedback-modal" id="feedbackModal">
				<form action="gui-phan-hoi-khach-hang" method="POST">
					<input type="hidden" name="feedbackID" value="${feedback.feedID}">
					<div class="feedback-modal-header">
						<h3>Phản hồi</h3>
					</div>
					<div class="feedback-modal-body">
						<p>
							Gửi tới: <strong>${feedback.user.email}</strong>
						</p>
						<textarea placeholder="Nhập phản hồi tại đây..." name="feedback"
							required></textarea>
					</div>
					<div class="feedback-modal-footer">
						<button type="button" class="btn-close" id="btnClose">Đóng</button>
						<button type="submit" class="btn-send">Gửi phản hồi</button>
					</div>
				</form>
			</div>
		</c:if>
		<!-- Modal -->
		<!-- Right Panel -->
		<script>
			// Đóng hộp thoại phản hồi
			function closeFeedbackModal() {
				document.getElementById('feedbackModal').style.display = 'none';
			}

			// Gán sự kiện cho nút Đóng
			document.getElementById('btnClose').addEventListener('click',
					closeFeedbackModal);
		</script>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function () {
        // Gắn sự kiện click cho các nút xóa
        document.querySelectorAll('.delete-feedback').forEach(button => {
            button.addEventListener('click', function () {
                const fbId = this.getAttribute('data-id'); // Lấy ID sản phẩm
                const row = document.getElementById(`feedback-`+fbId); // Dòng sản phẩm cần xóa

                // Hiển thị hộp thoại xác nhận
                const isConfirmed = confirm("Bạn có chắc muốn xóa feedback này không?");
                
                if (isConfirmed) { // Nếu chọn "Có"
                    // Gửi AJAX request đến Servlet để xóa sản phẩm
                    fetch(`deleteFeedbackInList?fbID=`+fbId, {
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
    </script>
		<script
			src="${pageContext.request.contextPath}/Admin/vendor/jquery/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<script
			src="${pageContext.request.contextPath}/js/js_admin/divide-page.js"></script>
		<script>
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
			});
		</script>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#bootstrap-data-table-export').DataTable();
			});
		</script>


		<script>
			$(document).ready(function() {
				$('[data-toggle="tooltip"]').tooltip();
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
</body>

</html>