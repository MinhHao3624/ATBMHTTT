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
 * Servlet implementation class VertifyController
 */
@WebServlet("/VerifyServlet")
public class VertifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VertifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		String msg = "";
		boolean isXacThuc = false;
		String url = "";
		String hd = "";
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if("confirm".equals(action)) {
			hd = "confirm";
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("user");
			User user = null;
			if(obj != null) {
				user = (User) obj;
				String maXacNhan = request.getParameter("maXacNhan");
				UserDao userDao = new UserDao();
				User us = userDao.selectById2(user);
				if(us.getStatus() == 0) {
				if(us.getAuthenticationCode().equals(maXacNhan)) {
					us.setStatus(1);
					if(userDao.updateVertifyInformation2(us) > 0) {
						msg = "Chúc mừng bạn đã xác thực tài khoản thành công";
						isXacThuc = true;
					}
				}else {
					msg = "Mã xác nhận không chính xác. Hãy điền lại";
				}
			}else {
				msg = "Bạn đã xác thực qua email rồi!!!";
				isXacThuc = true;
			}
			}
			url = "/signup-form.jsp";
			request.setAttribute("sourceServlet", "VertifyController");
			request.setAttribute("isXacThuc", isXacThuc);
			request.setAttribute("thongBao", msg);
			request.setAttribute("hanhDong", hd);
			System.out.println(isXacThuc);
			System.out.println(msg);
			System.out.println(hd);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			System.out.println("ok");
		}else {
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("user");
			User user = null;
			if(obj != null) {
				user = (User) obj;
				UserDao userDao = new UserDao();
				User us = userDao.selectById2(user);
				if(us.getStatus() == 0) {
					hd = "close";
					msg = "Bạn chưa xác nhận tài khoản. Nếu muốn hãy xác nhận qua mail";
					request.setAttribute("hanhDong", hd);
					request.setAttribute("thongBao", msg);
					request.setAttribute("sourceServlet", "VertifyController");
					url = "/signup-form.jsp";
					System.out.println(hd);
					System.out.println(msg);
					RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
					rd.forward(request, response);
					
				}else {
					hd = "close";
					msg = "Bạn đã xác thực tài khoản qua email rồi nha!!";
					request.setAttribute("hanhDong", hd);
					request.setAttribute("thongBao", msg);
					request.setAttribute("sourceServlet", "VertifyController");
					url = "/signup-form.jsp";
					System.out.println(hd);
					System.out.println(msg);
					RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
					rd.forward(request, response);
				}
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
