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

import com.projectttweb.webphone.database.OrderDetailsDAO;
import com.projectttweb.webphone.database.OrdersDAO;
import com.projectttweb.webphone.model.OrderDetails;
import com.projectttweb.webphone.model.Orders;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class GoToOrdersDetailsCancel
 */
@WebServlet("/go-to-ordersDetailsCancel")
public class GoToOrdersDetailsCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoToOrdersDetailsCancel() {
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
			User user = (User) session.getAttribute("admin");
			if(user != null) {
				String orderID = request.getParameter("orderID");
				OrdersDAO orderDAO = new OrdersDAO();
				Orders order = orderDAO.selectOrderByID(orderID);
				OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
				List<OrderDetails> lstByID = orderDetailsDAO.getListOrderDetails(orderID);
				request.setAttribute("orders", order);
				request.setAttribute("listOrderDetails", lstByID);
				request.setAttribute("sourceServlet", "orderDetails");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/admin-cancel-receipt.jsp");
				rd.forward(request, response);
				
			}
			
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
