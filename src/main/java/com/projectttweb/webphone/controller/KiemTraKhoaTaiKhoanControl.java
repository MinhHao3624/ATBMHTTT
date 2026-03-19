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

import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class KiemTraKhoaTaiKhoanControl
 */
@WebServlet("/kiem-tra-khoa-tai-khoan")
public class KiemTraKhoaTaiKhoanControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KiemTraKhoaTaiKhoanControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("admin");
			if(user != null) {
				String userID = request.getParameter("userID");
				UserDao userDAO = new UserDao();
				User us = userDAO.selectUserById(userID);
				boolean kiemTra = false;
				String msg = "";
				ArrayList<User> lstUser = userDAO.selectUserNotAdmin();
				request.setAttribute("listUser", lstUser);
				request.setAttribute("userID", userID);
				if(us.getIsKey().equalsIgnoreCase("Hoạt động")) {
					kiemTra = true;
					msg = "Bạn có muốn khóa tài khoản này không?";
					request.setAttribute("kiemTra", kiemTra);
					request.setAttribute("msg", msg);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/dataUser.jsp");
					rd.forward(request, response);
				}else {
					msg = "Bạn có muốn mở khóa cho tài khoản này không?";
					request.setAttribute("kiemTra", kiemTra);
					request.setAttribute("msg", msg);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/dataUser.jsp");
					rd.forward(request, response);
				}
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
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
