package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.CustomerFeedBackDAO;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.model.CustomerFeedback;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.ProductFavorite;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class CreateUserFeedBackControl
 */
@WebServlet("/create-user-feedback")
public class CreateUserFeedBackControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateUserFeedBackControl() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession(false);
			User us = (User) session.getAttribute("khachHang");
			if (us != null) {
				String name = request.getParameter("hoTen");
				String sdt = request.getParameter("phone");
				String email = request.getParameter("email");
				String title = request.getParameter("title");
				String chiTiet = request.getParameter("textarea");
				String baoLoi = "";
				if (!us.getPhoneNumber().equalsIgnoreCase(sdt)) {
					baoLoi += "Số điện thoại không chính xác\n";
				}
				if (!us.getEmail().equalsIgnoreCase(email)) {
					baoLoi += "Email không chính xác";
				}
				ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
				int lstProductFavoriteDao = productFaDao.getSoLuong2(us.getUserID());
				request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao);
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
				String msg = "";
				if (baoLoi.length() == 0) {
					CustomerFeedBackDAO cusFB = new CustomerFeedBackDAO();
					String feedBackIDCur = cusFB.getfeedBackIDCur();
					Date todaysDate = new Date(new java.util.Date().getTime());
					if (feedBackIDCur.length() == 0) {
						CustomerFeedback cusFeedBackNew = new CustomerFeedback("0001", us, todaysDate, title, chiTiet,
								null);
						if (cusFB.insert(cusFeedBackNew) > 0) {
						    msg = "Chúc mừng bạn đã gửi liên hệ thành công. Chúng tôi sẽ phản hồi lại bạn sớm nhất";
							boolean check = true;
							request.setAttribute("mess", msg);
							request.setAttribute("check", check);

							RequestDispatcher rd = getServletContext().getRequestDispatcher("/contact-us.jsp");
							rd.forward(request, response);
						}
					} else {
						String feedBackNext = xuLyID(feedBackIDCur);
						CustomerFeedback cusFeedBackNew = new CustomerFeedback(feedBackNext, us, todaysDate, title,
								chiTiet, null);
						if (cusFB.insert(cusFeedBackNew) > 0) {
							msg = "Chúc mừng bạn đã gửi liên hệ thành công. Chúng tôi sẽ phản hồi lại bạn sớm nhất";
							boolean check = true;
							request.setAttribute("mess", msg);
							request.setAttribute("check", check);
							RequestDispatcher rd = getServletContext().getRequestDispatcher("/contact-us.jsp");
							rd.forward(request, response);
						}
					}
				} else {
					boolean check = true;
					msg = baoLoi;
					request.setAttribute("mess", msg);
					request.setAttribute("check", check);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/contact-us.jsp");
					rd.forward(request, response);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private String xuLyID(String feedBackIDCur) {
		// TODO Auto-generated method stub
		String ans = "";
		boolean mo = false;
		for (int i = 0; i < feedBackIDCur.length(); i++) {
			if (feedBackIDCur.charAt(i) != '0' || mo) {
				ans += feedBackIDCur.charAt(i);
				mo = true;
			}
		}
		int ansInt = Integer.valueOf(ans);
		int ansIntNext = ansInt + 1;
		String res = "";
		if (ansIntNext < 10) {
			res = "000" + ansIntNext;
		} else if (ansIntNext < 100) {
			res = "00" + ansIntNext;
		} else if (ansIntNext < 1000) {
			res = "0" + ansIntNext;
		} else {
			res = "" + ansIntNext;
		}
		return res;
	}

}
