package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectttweb.webphone.database.OrdersDAO;

@WebServlet("/confirm-signature")
public class ConfirmSignatureController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String orderID = request.getParameter("orderID");
		String digitalSignature = request.getParameter("digitalSignature");
		String publicKey = request.getParameter("publicKey");
		
		if (orderID != null && digitalSignature != null && publicKey != null) {
			OrdersDAO dao = new OrdersDAO();
			int res = dao.updateSignatureData(orderID, digitalSignature, publicKey);
			if (res > 0) {
				response.setStatus(200);
				response.getWriter().write("OK");
			} else {
				response.setStatus(400);
				response.getWriter().write("Không tìm thấy đơn hàng hoặc cập nhật thất bại");
			}
		} else {
			response.setStatus(400);
			response.getWriter().write("Thiếu dữ liệu");
		}
	}
}
