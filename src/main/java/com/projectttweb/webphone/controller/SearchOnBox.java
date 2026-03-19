package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.ProductFavorite;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class SearchOnBox
 */
@WebServlet("/SearchOnBox")
public class SearchOnBox extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchOnBox() {
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
		HttpSession session = request.getSession(false);
		if (session != null) {
			User user = (User) session.getAttribute("khachHang");
			if (user != null) {
				String required = request.getParameter("searchOnBox") + "";
				required = request.equals("null") ? "" : required;
				if (required.trim().equals("")) {
					String message = "Bạn chưa nhập vào searchBox nha";
					boolean checkNoInput = true;
					ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
					int lstProductFavoriteDao = productFaDao.getSoLuong2(user.getUserID());
					request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao);
					request.setAttribute("message", message);
					request.setAttribute("checkNoInput", checkNoInput);
					request.setAttribute("sourceServlet", "searchOnBox");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/product-list.jsp");
					rd.forward(request, response);
				} else {
					ProductDao proDao = new ProductDao();
					String page = request.getParameter("page");
					ArrayList<Product> lst_Pro = proDao.selectProductByNameSearchBox(required, Integer.valueOf(page));
					int tongSoTrang = proDao.getTongSoTrangSearchBox(required);
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
					String sourceServlet = (String) request.getParameter("sourceServlet");
					boolean checkVar = false;
					if(sourceServlet != null) {
					if (sourceServlet.equalsIgnoreCase("addToCart")) {
						 checkVar = true;
					}
					}
					String uri = request.getRequestURI();
					String uriReal = xuLyURI(uri);
					String thamSo = request.getQueryString();
					request.setAttribute("soLuongSP", slSP);
					request.setAttribute("checkNoInput", checkVar);
					request.setAttribute("uri", uriReal);
					request.setAttribute("thamSo", thamSo);
					request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao);
					System.out.println(tongSoTrang);
					request.setAttribute("tongSoTrang", tongSoTrang);
					request.setAttribute("listPro", lst_Pro);
					request.setAttribute("currentPage", page);
					request.setAttribute("sourceServlet", "searchOnBox");
					request.setAttribute("required", required);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/product-list.jsp");
					rd.forward(request, response);
				}
			} else {
				System.out.println(request.getRequestURI());
				String required = request.getParameter("searchOnBox") + "";
				required = request.equals("null") ? "" : required;
				if (required.trim().equals("")) {
					String message = "Bạn chưa nhập vào searchBox nha";
					boolean checkNoInput = true;
					request.setAttribute("message", message);
					request.setAttribute("checkNoInput", checkNoInput);
					request.setAttribute("sourceServlet", "searchOnBox");
				
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/product-list.jsp");
					rd.forward(request, response);
				} else {
					ProductDao proDao = new ProductDao();
					String page = request.getParameter("page");
					ArrayList<Product> lst_Pro = proDao.selectProductByNameSearchBox(required, Integer.valueOf(page));
					int tongSoTrang = proDao.getTongSoTrangSearchBox(required);
					System.out.println(tongSoTrang);
					request.setAttribute("tongSoTrang", tongSoTrang);
					request.setAttribute("listPro", lst_Pro);
					request.setAttribute("currentPage", page);
					request.setAttribute("sourceServlet", "searchOnBox");
					request.setAttribute("required", required);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/product-list.jsp");
					rd.forward(request, response);
				}

			}
		}
	}

	private String xuLyURI(String uri) {
		// TODO Auto-generated method stub
		return uri.substring(13);
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
