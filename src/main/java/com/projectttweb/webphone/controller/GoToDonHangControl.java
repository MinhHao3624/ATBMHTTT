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

}
