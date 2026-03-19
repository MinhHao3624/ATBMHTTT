package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.net.URLEncoder;
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
 * Servlet implementation class LoadProductByOption
 */
@WebServlet("/load-product-by-option")
public class LoadProductByOption extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadProductByOption() {
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
			if (user == null) {
				String option = request.getParameter("list-option");
				String page = request.getParameter("page");
				int pageInt = Integer.valueOf(page);
				System.out.println(request.getRequestURI());
				System.out.println(request.getQueryString());
				if (option.equals(""))
					return;
				ProductDao proDao = new ProductDao();
				if (option.equals("Bán chạy")) {
					ArrayList<Product> lst_Pro = proDao.selectListProBuyHury(pageInt);
					int tongSoSp = proDao.selectAll().size();
					int tongSoTrang = tongSoSp / 9;
					if (tongSoTrang % 9 != 0) {
						tongSoTrang++;
					}
					request.setAttribute("currentPage", pageInt);
					request.setAttribute("listPro", lst_Pro);
					request.setAttribute("nameOption", option);
					request.setAttribute("tongSoTrang", tongSoTrang);
					request.setAttribute("sourceServlet", "loadProductByOption");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/product-list.jsp");
					rd.forward(request, response);
				} else if (option.equals("Giá thấp")) {
					ArrayList<Product> lst_Pro = proDao.selectListProPriceLow(pageInt);
					int tongSoSp = proDao.selectAll().size();
					int tongSoTrang = tongSoSp / 9;
					if (tongSoTrang % 9 != 0) {
						tongSoTrang++;
					}
					request.setAttribute("currentPage", pageInt);
					request.setAttribute("listPro", lst_Pro);
					request.setAttribute("nameOption", option);
					request.setAttribute("tongSoTrang", tongSoTrang);
					request.setAttribute("sourceServlet", "loadProductByOption");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/product-list.jsp");
					rd.forward(request, response);
				} else if (option.equals("Giá cao")) {
					ArrayList<Product> lst_Pro = proDao.selectListProPriceHigh(pageInt);
					int tongSoSp = proDao.selectAll().size();
					int tongSoTrang = tongSoSp / 9;
					if (tongSoTrang % 9 != 0) {
						tongSoTrang++;
					}
					request.setAttribute("currentPage", pageInt);
					request.setAttribute("listPro", lst_Pro);
					request.setAttribute("nameOption", option);
					request.setAttribute("tongSoTrang", tongSoTrang);
					request.setAttribute("sourceServlet", "loadProductByOption");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/product-list.jsp");
					rd.forward(request, response);
				}
			} else {
				String option = request.getParameter("list-option");
				String page = request.getParameter("page");
				int pageInt = Integer.valueOf(page);
				if (option.equals(""))
					return;
				ProductDao proDao = new ProductDao();
				System.out.println(request.getRequestURI());
				System.out.println(request.getQueryString());
				if (option.equals("Bán chạy")) {
					ArrayList<Product> lst_Pro = proDao.selectListProBuyHury(pageInt);
					int tongSoSp = proDao.selectAll().size();
					int tongSoTrang = tongSoSp / 9;
					if (tongSoTrang % 9 != 0) {
						tongSoTrang++;
					}
					ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
					int lstProductFavoriteDao = productFaDao.getSoLuong2(user.getUserID());
					String uri = request.getRequestURI();
					String ans = xuLy(uri);
					ListOrderDetailsItem lst = (ListOrderDetailsItem) session.getAttribute("listItem");
					String sl = "";
					if (lst != null) {
						sl = lst.getList().size() + "";
					} else {
						sl = "0";
					}
					String sourceServlet = (String) request.getParameter("sourceServlet");
					boolean checkVar = false;
					boolean checkVar1 = false;
					if(sourceServlet != null) {
					if (sourceServlet.equalsIgnoreCase("addToCart")) {
						 checkVar = true;
					}else if(sourceServlet.equalsIgnoreCase("hetHang")) {
						checkVar1 = true;
					}
					}
					String thamSo2 = "list-option="+URLEncoder.encode(option,"UTF-8")+"&page="+page;
					String thamSo = URLEncoder.encode(thamSo2, "UTF-8");
					System.out.println(thamSo);
					request.setAttribute("checkNoInput", checkVar);
					request.setAttribute("checkHetHang", checkVar1);
					request.setAttribute("soLuongSP", sl);
					request.setAttribute("uri", ans);
					request.setAttribute("thamSo", thamSo);
					request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao);
					request.setAttribute("currentPage", pageInt);
					request.setAttribute("listPro", lst_Pro);
					request.setAttribute("nameOption", option);
					request.setAttribute("tongSoTrang", tongSoTrang);
					request.setAttribute("sourceServlet", "loadProductByOption");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/product-list.jsp");
					rd.forward(request, response);
				} else if (option.equals("Giá thấp")) {
					ArrayList<Product> lst_Pro = proDao.selectListProPriceLow(pageInt);
					int tongSoSp = proDao.selectAll().size();
					int tongSoTrang = tongSoSp / 9;
					if (tongSoTrang % 9 != 0) {
						tongSoTrang++;
					}
					ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
					int lstProductFavoriteDao = productFaDao.getSoLuong2(user.getUserID());
					String uri = request.getRequestURI();
					String ans = xuLy(uri);
					ListOrderDetailsItem lst = (ListOrderDetailsItem) session.getAttribute("listItem");
					String sl = "";
					if (lst != null) {
						sl = lst.getList().size() + "";
					} else {
						sl = "0";
					}
					String sourceServlet = (String) request.getParameter("sourceServlet");
					boolean checkVar = false;
					boolean checkVar1 = false;
					if(sourceServlet != null) {
					if (sourceServlet.equalsIgnoreCase("addToCart")) {
						 checkVar = true;
					}else if(sourceServlet.equalsIgnoreCase("hetHang")) {
						checkVar1 = true;
					}
					}
					String thamSo2 = "list-option="+option+"&page="+page;
					String thamSo = URLEncoder.encode(thamSo2, "UTF-8");
					request.setAttribute("checkNoInput", checkVar);
					request.setAttribute("checkHetHang", checkVar1);
					request.setAttribute("soLuongSP", sl);
					request.setAttribute("uri", ans);
					request.setAttribute("thamSo", thamSo);
					request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao);
					request.setAttribute("currentPage", pageInt);
					request.setAttribute("listPro", lst_Pro);
					request.setAttribute("nameOption", option);
					request.setAttribute("tongSoTrang", tongSoTrang);
					request.setAttribute("sourceServlet", "loadProductByOption");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/product-list.jsp");
					rd.forward(request, response);
				} else if (option.equals("Giá cao")) {
					ArrayList<Product> lst_Pro = proDao.selectListProPriceHigh(pageInt);
					int tongSoSp = proDao.selectAll().size();
					int tongSoTrang = tongSoSp / 9;
					if (tongSoTrang % 9 != 0) {
						tongSoTrang++;
					}
					ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
					int lstProductFavoriteDao = productFaDao.getSoLuong2(user.getUserID());
					String uri = request.getRequestURI();
					String ans = xuLy(uri);
					ListOrderDetailsItem lst = (ListOrderDetailsItem) session.getAttribute("listItem");
					String sl = "";
					if (lst != null) {
						sl = lst.getList().size() + "";
					} else {
						sl = "0";
					}
					String sourceServlet = (String) request.getParameter("sourceServlet");
					boolean checkVar = false;
					boolean checkVar1 = false;
					if(sourceServlet != null) {
					if (sourceServlet.equalsIgnoreCase("addToCart")) {
						 checkVar = true;
					}else if(sourceServlet.equalsIgnoreCase("hetHang")) {
						checkVar1 = true;
					}
					}
					String thamSo2 = "list-option="+option+"&page="+page;
					String thamSo = URLEncoder.encode(thamSo2, "UTF-8");
					request.setAttribute("checkNoInput", checkVar);
					request.setAttribute("checkHetHang", checkVar1);
					request.setAttribute("soLuongSP", sl);
					request.setAttribute("uri", ans);
					request.setAttribute("thamSo", thamSo);
					request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao);
					request.setAttribute("currentPage", pageInt);
					request.setAttribute("listPro", lst_Pro);
					request.setAttribute("nameOption", option);
					request.setAttribute("tongSoTrang", tongSoTrang);
					request.setAttribute("sourceServlet", "loadProductByOption");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/product-list.jsp");
					rd.forward(request, response);
				}
			}
		}
	}

	private String xuLy(String requestURI) {
		// TODO Auto-generated method stub
		return requestURI.substring(13);
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
