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
 * Servlet implementation class InsertImage
 */
@WebServlet("/insert-img")
public class InsertImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String msg = "";
		boolean check = false;
		String url = "";
		User us = null;
		if(obj != null) {
			us = (User) obj;
			UserDao userDao = new UserDao();
			User user = userDao.selectById2(us);
			String img = request.getAttribute("duongDan")+"";
			img = img.equals("null")?"":img;
			user.setImageAvatar(img);
			if(userDao.updateImgUser(user) > 0) {
				msg = "Chúc mừng bạn đã cập nhật ảnh đại diện thành công";
				check = true;
				session.invalidate();
				url = "/signup-form.jsp";
				request.setAttribute("thongTin", msg);
				request.setAttribute("check", check);
				request.setAttribute("sourceServlet", "InsertImage");
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
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
