package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectttweb.webphone.database.OrdersDAO;
import com.projectttweb.webphone.model.Orders;

/**
 * Servlet implementation class XacThucDonHangControl
 */
@WebServlet("/xac-thuc-don-hang")
public class XacThucDonHangControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XacThucDonHangControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String orderID = request.getParameter("orderID");
			OrdersDAO orderDAO= new OrdersDAO();
			Orders order = orderDAO.selectOrderByID(orderID);
			order.setStatus("Đã xác nhận");
			if(orderDAO.updateStatus(order) > 0) {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/load-recipt-data");
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
