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
import com.projectttweb.webphone.model.Orders;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class LoadReciptDataControl
 */
@WebServlet("/load-recipt-data")
public class LoadReciptDataControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadReciptDataControl() {
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
				OrdersDAO ordersDAO = new OrdersDAO();
				ArrayList<Orders> listAll1 = ordersDAO.selectAll();
				ArrayList<Orders> listAll = new ArrayList<Orders>();
				for (Orders orders : listAll1) {
					if(orders.getStatus().equalsIgnoreCase("đang chờ") || orders.getStatus().equalsIgnoreCase("đã xác nhận")) {
						listAll.add(orders);
					}
				}
				request.setAttribute("listOrders", listAll);
				request.setAttribute("sourceServlet", "loadOrders");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/admin-manager-recipt.jsp");
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
