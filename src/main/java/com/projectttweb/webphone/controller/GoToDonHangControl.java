package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.OrdersDAO;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.Orders;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class GoToDonHangControl
 */
@WebServlet("/go-to-don-hang")
public class GoToDonHangControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GoToDonHangControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("khachHang");
			if (user != null) {
				OrdersDAO orderDAO = new OrdersDAO();
				boolean kiemTra = false;
				ProductFavoriteDAO proFaDao = new ProductFavoriteDAO();
				if (orderDAO.kiemTraUserIsOrder(user.getUserID())) {
					kiemTra = true;
					String page = request.getParameter("page");
					ArrayList<Orders> lstOrdersByPage = orderDAO.getListOrdersByPage(user.getUserID(), page);
					
					// TAMPERING DETECTION AND EXPIRATION CHECK
					boolean hasTampered = false;
					for (Orders order : lstOrdersByPage) {
						if ("Chưa ký xác nhận".equals(order.getSignatureStatus())) {
							if (order.getSignatureDeadline() != null && order.getSignatureDeadline().before(new java.util.Date())) {
								if (!"Đã hủy".equals(order.getStatus())) {
									orderDAO.updateOrderStatus(order.getOrderID(), "Đã hủy");
									order.setStatus("Đã hủy");
								}
							}
						} else if ("Đã ký xác nhận".equals(order.getSignatureStatus())) {
							String expectedData = "OrderID: " + order.getOrderID() + "|Total: " + order.getTotalAmount() + "|Address: " + order.getShippingAddress() + "|Phone: " + order.getPhone() + "|Date: " + order.getOrdersDate() + "|Status: " + order.getStatus();
							boolean isValid = verifySignatureViaCA(expectedData, order.getDigitalSignature(), user.getUserName());
							if (!isValid) {
								orderDAO.resetSignatureStatus(order.getOrderID());
								order.setSignatureStatus("Chưa ký xác nhận");
								order.setDigitalSignature(null);
								order.setPublicKeyUsed(null);
								hasTampered = true;
							}
						}
					}
					if (hasTampered) {
						request.setAttribute("notify", "Phát hiện đơn hàng bị thay đổi dữ liệu, chữ ký không còn hợp lệ. Vui lòng ký lại đơn hàng trong vòng 2 ngày!");
						request.setAttribute("kiemTra", false); // trick to show modal if kiemTra is false it might show modal, let's keep kiemTra true but notify. Wait, in checkout.jsp kiemTra=true shows modal. But this is profile-receipt.jsp.
					}

					int tongSoSP = orderDAO.getTongSoOrder(user.getUserID());
					int tongSoTrang = tongSoSP / 4;
					if(tongSoSP % 4 != 0) {
						tongSoTrang++;
					}
					int soLuongSanPhamLike = proFaDao.getSoLuong2(user.getUserID().trim());
					ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
					String slSP = "";
					if (li != null) {
						slSP = li.getList().size() + "";
						slSP = (slSP == "0") ? "0" : slSP;
					} else {
						slSP = "0";
					}
					request.setAttribute("currentPage", page);
					request.setAttribute("soLuongSanPhamLike", soLuongSanPhamLike);
					request.setAttribute("soLuongSP", slSP);
					request.setAttribute("listOrder", lstOrdersByPage);
					request.setAttribute("tongSoTrang", tongSoTrang);
					request.setAttribute("kiemTra", kiemTra);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/profile-receipt.jsp");
					rd.forward(request, response);
				}else {
					int soLuongSanPhamLike = proFaDao.getSoLuong2(user.getUserID().trim());
					ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
					String slSP = "";
					if (li != null) {
						slSP = li.getList().size() + "";
						slSP = (slSP == "0") ? "0" : slSP;
					} else {
						slSP = "0";
					}
					request.setAttribute("soLuongSanPhamLike", soLuongSanPhamLike);
					request.setAttribute("soLuongSP", slSP);
					request.setAttribute("kiemTra", kiemTra);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/profile-receipt.jsp");
					rd.forward(request, response);
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private boolean verifySignatureViaCA(String data, String signature, String owner) {
		if (signature == null || signature.isEmpty()) return false;
		try {
			java.net.http.HttpClient client = java.net.http.HttpClient.newBuilder().version(java.net.http.HttpClient.Version.HTTP_1_1).build();
			
			// Escape cho JSON
			String escapedData = data.replace("\\", "\\\\").replace("\"", "\\\"");

			// Thu voi PSS
			String jsonPSS = String.format("{\"data\":\"%s\",\"signature\":\"%s\",\"owner\":\"%s\",\"padding\":\"PSS\"}",
				escapedData, signature, owner);
			System.out.println("VERIFY PSS PAYLOAD: " + jsonPSS);
			java.net.http.HttpRequest reqPSS = java.net.http.HttpRequest.newBuilder()
				.uri(java.net.URI.create("http://localhost:8081/api/v1/ca/verify"))
				.header("Content-Type", "application/json; charset=UTF-8")
				.POST(java.net.http.HttpRequest.BodyPublishers.ofString(jsonPSS))
				.build();
			java.net.http.HttpResponse<String> resPSS = client.send(reqPSS, java.net.http.HttpResponse.BodyHandlers.ofString());
			System.out.println("VERIFY PSS RESPONSE: " + resPSS.statusCode() + " " + resPSS.body());
			if (resPSS.statusCode() == 200 && resPSS.body().contains("true")) return true;

			// Thu voi PKCS1
			String jsonPKCS1 = String.format("{\"data\":\"%s\",\"signature\":\"%s\",\"owner\":\"%s\",\"padding\":\"PKCS1\"}",
				escapedData, signature, owner);
			System.out.println("VERIFY PKCS1 PAYLOAD: " + jsonPKCS1);
			java.net.http.HttpRequest reqPKCS1 = java.net.http.HttpRequest.newBuilder()
				.uri(java.net.URI.create("http://localhost:8081/api/v1/ca/verify"))
				.header("Content-Type", "application/json; charset=UTF-8")
				.POST(java.net.http.HttpRequest.BodyPublishers.ofString(jsonPKCS1))
				.build();
			java.net.http.HttpResponse<String> resPKCS1 = client.send(reqPKCS1, java.net.http.HttpResponse.BodyHandlers.ofString());
			System.out.println("VERIFY PKCS1 RESPONSE: " + resPKCS1.statusCode() + " " + resPKCS1.body());
			if (resPKCS1.statusCode() == 200 && resPKCS1.body().contains("true")) return true;

			return false;
		} catch (Exception e) {
			System.out.println("VERIFY EXCEPTION: " + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

}
