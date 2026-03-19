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
 * Servlet implementation class DeleteOrderDetailsControl
 */
@WebServlet("/delete-orderDetails-in-cart")
public class DeleteOrderDetailsControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOrderDetailsControl() {
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
			String orderDetailsID = request.getParameter("orderDetailsID");
			System.out.println(orderDetailsID+" hello say");
			ListOrderDetailsItem list = (ListOrderDetailsItem) session.getAttribute("listItem");
			for (OrderDetails order : list.getList()) {
				if(order.getOrderDetailsID().equalsIgnoreCase(orderDetailsID)) {
					list.getList().remove(order);
					break;
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
