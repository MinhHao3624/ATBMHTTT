package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class XacThucController
 */
@WebServlet("/xac-thuc")
public class XacThucController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XacThucController() {
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
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String maKhachHang = request.getParameter("userID");
			String maXacThuc = request.getParameter("authenticationCode");
			UserDao userDao = new UserDao();
			HttpSession session = request.getSession();
			User user = new User();
			user.setUserID(maKhachHang);
			User us = userDao.selectById2(user);
			String msg = "";
			boolean xacThuc = false;
			String hd = "";
			if (us != null) {
				if(us.getStatus() == 0) {
				// kiểm tra xem mã xác thực có giống nhau hay không
				if (us.getAuthenticationCode().equals(maXacThuc)) {
					// Thành công
					us.setStatus(1);
					if (userDao.updateVertifyInformation2(us) > 0) {
						msg = "Chúc mừng bạn đã xác thực tài khoản thành công!";
						xacThuc = true;
						hd = "confirm";
					}
				} else {
					msg = "Xác thực không thành công";
					xacThuc = false;
				}
				}else {
					msg = "Bạn đã xác thực tài khoản này rồi";
					xacThuc = true;
				}
			} else {
				msg = "Tài khoản không tồn tại";
			}
			String url = "/success-signupmail.jsp";
			request.setAttribute("thongBao", msg);
			request.setAttribute("isXacThuc", xacThuc);
			request.setAttribute("sourceServlet", "VertifyController");
			request.setAttribute("hanhDong", hd);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
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

}
