package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.ProductFavorite;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class AccountLoginController
 */
@WebServlet("/account-login")
public class AccountLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountLoginController() {
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
		HttpSession session = request.getSession(false);
		if (session != null) {
			User userT = (User) session.getAttribute("khachHang");
			if (userT != null) {
				String userID = request.getParameter("userID");
				User user = new User();
				user.setUserID(userID);
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				UserDao userDao = new UserDao();
				User us = userDao.selectById2(user);
				String url = "";
				if (us != null) {
					String hoVaTen = us.getFullName();
					String email = us.getEmail();
					String phone = us.getPhoneNumber();
					String addRess = us.getAddress();
					String date = String.valueOf(us.getDateOfBirth());
					String sex = us.getSex();
					String img = us.getImageAvatar();
					ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
					int lstProductFavoriteDao = productFaDao.getSoLuong2(user.getUserID());
					ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
					String slSP = "";
					if (li != null) {
						slSP = li.getList().size() + "";
						slSP = (slSP == "0") ? "0" : slSP;
					} else {
						slSP = "0";
					}
					request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao);
					request.setAttribute("soLuongSP", slSP);
					request.setAttribute("hoVaTen", hoVaTen);
					request.setAttribute("email", email);
					request.setAttribute("phone", phone);
					request.setAttribute("addRess", addRess);
					request.setAttribute("date", date);
					request.setAttribute("sex", sex);
					request.setAttribute("image", img);
					request.setAttribute("sourceServlet", "accountLogin");
					url = "/account.jsp";
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
