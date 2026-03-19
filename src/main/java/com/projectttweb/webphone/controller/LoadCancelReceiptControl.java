package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectttweb.webphone.database.OrdersDAO;
import com.projectttweb.webphone.model.Orders;

/**
 * Servlet implementation class LoadCancelReceiptControl
 */
@WebServlet("/load-cancel-receipt")
public class LoadCancelReceiptControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadCancelReceiptControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			OrdersDAO dao = new OrdersDAO();
			ArrayList<Orders> lstCancel = dao.getListOrdersCancel();
			request.setAttribute("listOrdersCancel", lstCancel);
			request.setAttribute("sourceServlet", "loadCancelReceipt");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/admin-cancel-receipt.jsp");
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
