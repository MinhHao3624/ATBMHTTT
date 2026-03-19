package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.OrderDetails;

/**
 * Servlet implementation class DecreaseQuantityController
 */
@WebServlet("/giam-so-luong")
public class DecreaseQuantityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DecreaseQuantityController() {
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
			String productID = request.getParameter("productID");
			ListOrderDetailsItem list = (ListOrderDetailsItem) session.getAttribute("listItem");
			for (OrderDetails orderDetails : list.getList()) {
				if(orderDetails.getProduct().getProductID().equalsIgnoreCase(productID)) {
					if(orderDetails.getQuantity() > 1) {
						orderDetails.setQuantity(orderDetails.getQuantity()-1);
						break;
					}
				}
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/go-to-cart");
			rd.forward(request, response);
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
