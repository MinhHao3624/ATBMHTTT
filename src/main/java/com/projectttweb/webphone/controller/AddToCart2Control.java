package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import com.projectttweb.webphone.controller.DeleteFeedBackInLstControl.JsonResponse;
import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.model.ListOrderDetails;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.OrderDetails;
import com.projectttweb.webphone.model.Orders;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class AddToCart2Control
 */
@WebServlet("/add-to-cart2")
public class AddToCart2Control extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCart2Control() {
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
			boolean success = false;
			int slsp = 0;
			if (user != null) {
				ListOrderDetailsItem listItem = (ListOrderDetailsItem) session.getAttribute("listItem");
				ListOrderDetails listOrder = (ListOrderDetails) session.getAttribute("cart");
				ProductDao proDAO = new ProductDao();
				String id = request.getParameter("productID");
				String soLuong = request.getParameter("soLuong");
				System.out.println(soLuong +" ok let go");
				Product pro = proDAO.selectProByID(id);
				if(!checkProductExist(pro, listItem)) {
					String orderDetailsID = getOrderDetailsIDCur(listItem);
					String next = xuLy(orderDetailsID);
					System.out.println("Đã vào đây");
					Orders order = listOrder.getMap().keySet().iterator().next();
					OrderDetails orderDetails = new OrderDetails(next, Integer.valueOf(soLuong), pro, order,
							Double.valueOf(xuLyChuoi(pro.getPrice())));
					listItem.addItem(orderDetails);
					listOrder.getMap().replace(order, listItem);
					session.setAttribute("listItem", listItem);
					session.setAttribute("cart", listOrder);
					success = true;
					slsp = listItem.getList().size();
					JsonResponse jsonResponse = new JsonResponse(success, slsp);
					PrintWriter out = response.getWriter();
					Gson gson = new Gson();
					out.print(gson.toJson(jsonResponse));
					out.flush();
				}else {
					slsp = listItem.getList().size();
					JsonResponse jsonResponse = new JsonResponse(success, slsp);
					PrintWriter out = response.getWriter();
					Gson gson = new Gson();
					out.print(gson.toJson(jsonResponse));
					out.flush();
				}
				
			} 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private boolean checkProductExist(Product pro, ListOrderDetailsItem listItem) {
		// TODO Auto-generated method stub
		for (int i = 0; i < listItem.getList().size(); i++) {
			if(pro.getProductID().equalsIgnoreCase(listItem.getList().get(i).getProduct().getProductID())) {
				return true;
			}
		}
		return false;
	}

	public class JsonResponse {
		public boolean success;
		public int soluongSP;

		public JsonResponse(boolean success, int soLg) {
			this.success = success;
			this.soluongSP = soLg;
		}

		// Getters và Setters
		public boolean isSuccess() {
			return success;
		}

		public void setSuccess(boolean success) {
			this.success = success;
		}

		public int getSoluongSP() {
			return soluongSP;
		}

		public void setSoluongSP(int soluongSP) {
			this.soluongSP = soluongSP;
		}

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
		System.out.println(ans + "số là số");
		int ansInt = Integer.parseInt(ans);
		System.out.println(ansInt + "labubu");
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
