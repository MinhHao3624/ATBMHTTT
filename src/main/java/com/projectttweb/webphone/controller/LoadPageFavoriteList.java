package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.ProductReviewDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.ProductFavorite;
import com.projectttweb.webphone.model.ProductReview;

/**
 * Servlet implementation class LoadPageFavoriteList
 */
@WebServlet("/load-page-favorite-list")
public class LoadPageFavoriteList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadPageFavoriteList() {
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
		String userID = request.getParameter("userID") + "";
		System.out.println("userID là: "+userID);
		ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
		List<ProductFavorite> lstProductFavoriteDao = productFaDao.getLstProFavorite(userID);
		int lstInt = productFaDao.getSoLuong2(userID);
//		for (ProductFavorite productFavorite : lstProductFavoriteDao) {
//			System.out.println(productFavorite.getProduct().getName());
//		}
		   ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
	        String slSP = "";
			if (li != null) {
				slSP = li.getList().size() + "";
				slSP = (slSP == "0") ? "0" : slSP;
			} else {
				slSP = "0";
			}
			request.setAttribute("soLuongSP", slSP);
		String baoLoi = "";
		if (lstProductFavoriteDao.size() == 0) {
			baoLoi = "Bạn chưa có sản phẩm yêu thích nào";
			request.setAttribute("baoLoi", baoLoi);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/noProductFavorite.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("soLuongSanPhamLike", lstInt);
		    request.setAttribute("danhSach", lstProductFavoriteDao);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/favorite-list.jsp");
			rd.forward(request, response);
		}

	}

	private double customRound(double number) {
		// TODO Auto-generated method stub
		if (number % 1 == 0) { // Nếu là số nguyên
			return number;
		} else if (number < Math.ceil(number) - 0.5) { // Nếu < x.5, làm tròn xuống
			return Math.floor(number);
		} else { // Nếu >= x.5, làm tròn lên
			return Math.ceil(number);
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
