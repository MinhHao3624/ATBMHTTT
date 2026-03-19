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

import com.projectttweb.webphone.model.Product;

/**
 * Servlet implementation class LoadPageProSingleMemoryAndColor
 */
@WebServlet("/load-page-product-single-memory-color")
public class LoadPageProSingleMemoryAndColor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadPageProSingleMemoryAndColor() {
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
			String memory = request.getParameter("memory");
			String color = request.getParameter("color");
			HttpSession session = request.getSession(false);
			String baoLoi = "";
			if (session != null) {
				List<Product> lstLQ = (List<Product>) session.getAttribute("dsLienQuan");
				Product proRes = null;
				for (Product product : lstLQ) {
					if (product.getInformationPro().getMemory().equalsIgnoreCase(memory)
							&& product.getInformationPro().getColor().equalsIgnoreCase(color)) {
						proRes = product;
						break;
					}
				}
				if (proRes != null) {
					String productID = proRes.getProductID();
					request.setAttribute("productID", productID);
					request.setAttribute("baoLoi", baoLoi);
					request.setAttribute("sourceServlet", "LoadPageProSingleMemoryColor");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/load-page-product-single");
					rd.forward(request, response);
				} else {
				    Product proCur = (Product) session.getAttribute("productCurrent");
				    String productID = proCur.getProductID();
				    System.out.println("okokokokokoklll");
				    baoLoi = proCur.getName() + "\nThông tin: " + memory +" | "+ color+" đã hết hàng. Vui lòng quay lại sau";
				    request.setAttribute("baoLoi", baoLoi);
				    request.setAttribute("productID", productID);
				    request.setAttribute("sourceServlet", "LoadPageProSingleMemoryColor");
				    RequestDispatcher rd = getServletContext().getRequestDispatcher("/load-page-product-single");
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
