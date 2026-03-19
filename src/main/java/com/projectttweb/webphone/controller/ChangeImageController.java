package com.projectttweb.webphone.controller;

import java.io.File;
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
 * Servlet implementation class ChangeImageController
 */
@WebServlet("/change-image")
public class ChangeImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangeImageController() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("khachHang");
		User user = null;
		String msg = "";
		String url = "";
		if (obj != null) {
			user = (User) obj;
			String img = request.getAttribute("duongDan") + "";
			img = img.equals("null") ? "" : img;
			String old_Img = user.getImageAvatar();
			if (!old_Img.equals("")) {
				File file = new File("E:\\LaptrinhWeb\\MobileWebApp\\src\\main\\webapp\\avatar\\" + old_Img);
				file.delete();
				user.setImageAvatar(img);
				UserDao userDao = new UserDao();
				if (userDao.updateImgAvatar(user) > 0) {
					msg = "Chúc mừng bạn đã cập nhật ảnh đại diện thành công";
					url = "/account.jsp";
					request.setAttribute("sourceServlet", "changeImg");
					request.setAttribute("tinNhan", msg);
					request.setAttribute("imageNew", img);
					RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
					rd.forward(request, response);
				}
			} else {
				user.setImageAvatar(img);
				UserDao userDao = new UserDao();
				if (userDao.updateImgAvatar(user) > 0) {
					msg = "Chúc mừng bạn đã cập nhật ảnh đại diện thành công";
					url = "/account.jsp";
					request.setAttribute("sourceServlet", "changeImg");
					request.setAttribute("tinNhan", msg);
					request.setAttribute("imageNew", img);
					RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
					rd.forward(request, response);
				}
			}
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
