package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.OrderDetailsDAO;
import com.projectttweb.webphone.database.OrdersDAO;
import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.model.ListOrderDetails;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.OrderDetails;
import com.projectttweb.webphone.model.Orders;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class AddToCartController
 */
@WebServlet("/add-to-cart")
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ListOrderDetails list = new ListOrderDetails();
	ListOrderDetailsItem listItem = new ListOrderDetailsItem();
	String orderIDCurrent = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCartController() {
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
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		if (session != null) {
			User user = (User) session.getAttribute("khachHang");
			if (user != null) {
				String productID = request.getParameter("productID");
				String uri = request.getParameter("uri");
				System.out.println("ppppppppp");
				String thamSo = request.getParameter("thamSo");
				thamSo = (thamSo == null) ? "" : thamSo;
				System.out.println(thamSo);
				System.out.println(productID);
				ProductDao proDao = new ProductDao();
				OrdersDAO orderDAO = new OrdersDAO();
				if (listItem.getList().size() == 0) {
					orderIDCurrent = orderDAO.getOrderIDCurrent();
					System.out.println("pppp"+orderIDCurrent);
				}
				if (orderIDCurrent.length() == 0) {
					Product product = proDao.selectProByID(productID);
					if (!checkProExist(product, listItem)) {
						Date todaysDate = new Date(new java.util.Date().getTime());
						Orders order = new Orders("0001", todaysDate, user, "đang chờ", 0, null, null);
						if (list.getMap().size() == 0) {
							OrderDetails orderDetails = new OrderDetails("0001", 1, product, order,
									Double.valueOf(xuLyChuoi(product.getPrice())));
							listItem.addItem(orderDetails);
							list.addPhanTu(order, listItem);
							session.setAttribute("cart", list);
							session.setAttribute("listItem", listItem);
							System.out.println(listItem.getList().size() + "số lượng sp giỏ hàng");
							if (uri == null || uri.isEmpty()) {
								throw new IllegalArgumentException("URI không được để trống");
							}

							if (thamSo == null || thamSo.isEmpty()) {
								response.sendRedirect(request.getContextPath() + uri);
							} else {
								System.out.println(request.getContextPath() + uri + "?" + thamSo);
								response.sendRedirect(request.getContextPath() + uri + "?" + thamSo);
							}

						} else {
							String orderDetailsID = getOrderDetailsIDCur(listItem);
							String orderDetailsIDNext = xuLy(orderDetailsID);
							OrderDetails orderDetails = new OrderDetails(orderDetailsIDNext, 1, product, order,
									Double.valueOf(xuLyChuoi(product.getPrice())));
							listItem.addItem(orderDetails);
							list.getMap().replace(order, listItem);
							session.setAttribute("listItem", listItem);
							session.setAttribute("cart", list);
							if (uri == null || uri.isEmpty()) {
								throw new IllegalArgumentException("URI không được để trống");
							}

							if (thamSo == null || thamSo.isEmpty()) {
								response.sendRedirect(request.getContextPath() + uri);
							} else {
								System.out.println(request.getContextPath() + uri + "?" + thamSo);
								response.sendRedirect(request.getContextPath() + uri + "?" + thamSo);
							}

						}
					} else {
						System.out.println("sản phẩm k tồn tại");
						if (uri == null || uri.isEmpty()) {
							throw new IllegalArgumentException("URI không được để trống");
						}
						if (thamSo == null || thamSo.isEmpty()) {
							response.sendRedirect(request.getContextPath() + uri + "?sourceServlet=addToCart");
						} else {
							response.sendRedirect(
									request.getContextPath() + uri + "?" + thamSo + "&sourceServlet=addToCart");
						}
					}
				} else {
					String ans = xuLy(orderIDCurrent.trim());
					Product product = proDao.selectProByID2(productID);
					if (!checkProExist(product, listItem)) {
						if(kiemTraConHang(product)) {
						Date todaysDate = new Date(new java.util.Date().getTime());
						OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
						Orders order = new Orders(ans, todaysDate, user, "đang chờ", 0, null, null);
						if (list.getMap().size() == 0) {
							String orderDetailsID = orderDetailsDAO.getOrderDetailsIDCurrent();
							String next = xuLy(orderDetailsID);
							OrderDetails orderDetails = new OrderDetails(next, 1, product, order,
									Double.valueOf(xuLyChuoi(product.getPrice())));
							listItem.addItem(orderDetails);
							list.addPhanTu(order, listItem);
							session.setAttribute("listItem", listItem);
							session.setAttribute("cart", list);
							if (uri == null || uri.isEmpty()) {
								throw new IllegalArgumentException("URI không được để trống");
							}

							if (thamSo == null || thamSo.isEmpty()) {
								response.sendRedirect(request.getContextPath() + uri);
							} else {
								System.out.println(request.getContextPath() + uri + "?" + thamSo);
								response.sendRedirect(request.getContextPath() + uri + "?" + thamSo);
							}
						} else {
							String orderDetailsID = getOrderDetailsIDCur(listItem);
							String next = xuLy(orderDetailsID);
							OrderDetails orderDetails = new OrderDetails(next, 1, product, order,
									Double.valueOf(xuLyChuoi(product.getPrice())));
							listItem.addItem(orderDetails);
							list.getMap().replace(order, listItem);
							session.setAttribute("listItem", listItem);
							session.setAttribute("cart", list);
							if (uri == null || uri.isEmpty()) {
								throw new IllegalArgumentException("URI không được để trống");
							}

							if (thamSo == null || thamSo.isEmpty()) {
								response.sendRedirect(request.getContextPath() + uri);
							} else {
								System.out.println(request.getContextPath() + uri + "?" + thamSo);
								response.sendRedirect(request.getContextPath() + uri + "?" + thamSo);
							}
						}
						}else {
							if (uri == null || uri.isEmpty()) {
								throw new IllegalArgumentException("URI không được để trống");
							}
							if (thamSo == null || thamSo.isEmpty()) {
								response.sendRedirect(request.getContextPath() + uri + "?sourceServlet=hetHang");
							} else {
								response.sendRedirect(
										request.getContextPath() + uri + "?" + thamSo + "&sourceServlet=hetHang");
							}
						}
					} else {
						System.out.println("sản phẩm k tồn tại");
						if (uri == null || uri.isEmpty()) {
							throw new IllegalArgumentException("URI không được để trống");
						}
						if (thamSo == null || thamSo.isEmpty()) {
							response.sendRedirect(request.getContextPath() + uri + "?sourceServlet=addToCart");
						} else {
							response.sendRedirect(
									request.getContextPath() + uri + "?" + thamSo + "&sourceServlet=addToCart");
						}
					}
				}
			} else {
				System.out.println("ok fine");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/noAccount.jsp");
				rd.forward(request, response);

			}
		}
	}

	private boolean kiemTraConHang(Product product) {
		// TODO Auto-generated method stub
		return product.getStockQuantity() > 0;
	}

	private boolean checkProExist(Product product, ListOrderDetailsItem listItem2) {
		// TODO Auto-generated method stub
		if (listItem2.getList().size() == 0)
			return false;
		for (OrderDetails ode : listItem2.getList()) {
			if (ode.getProduct().getProductID().equalsIgnoreCase(product.getProductID())) {
				return true;
			}
		}
		return false;
	}

	private String xuLyChuoi(String price) {
		// TODO Auto-generated method stub
		String ans = "";
		for (int i = 0; i < price.length(); i++) {
			if (price.charAt(i) != '.') {
				ans += price.charAt(i);
			}
		}
		return ans;
	}

	private String getOrderDetailsIDCur(ListOrderDetailsItem listItem2) {
		// TODO Auto-generated method stub
		return listItem2.getList().get(listItem2.getList().size() - 1).getOrderDetailsID();
	}

	private String xuLy(String orderIDCurrent) {
		// TODO Auto-generated method stub
		String ans = "";
		boolean mo = false;
		for (int i = 0; i < orderIDCurrent.length(); i++) {
			if (orderIDCurrent.charAt(i) != '0' || mo) {
				ans += orderIDCurrent.charAt(i);
				mo = true;
			}
		}
	//	System.out.println(ans+"số là số");
		int ansInt = Integer.parseInt(ans);
	//	System.out.println(ansInt+"labubu");
		int ansIntNext = ansInt + 1;
		String result = "";
		if (ansIntNext < 10) {
			result = "000" + ansIntNext;
		} else if (ansIntNext < 100) {
			result = "00" + ansIntNext;
		} else if (ansIntNext < 1000) {
			result = "0" + ansIntNext;
		} else {
			result = String.valueOf(ansIntNext);
		}
		return result;
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

	public static void main(String[] args) {
		String ans = "";
		char t = '1';
		ans += t;
		int n = Integer.valueOf(ans);
		System.out.println(n);
	}

}
