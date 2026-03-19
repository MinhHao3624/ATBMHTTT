package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import com.projectttweb.webphone.controller.DeleteProductInListControl.JsonResponse;
import com.projectttweb.webphone.database.OrdersDAO;
import com.projectttweb.webphone.model.Orders;

/**
 * Servlet implementation class DeleteOrderInListControl
 */
@WebServlet("/deleteOrdersInList")
public class DeleteOrderInListControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOrderInListControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String orderID = request.getParameter("ordersID");
			OrdersDAO odDAO = new OrdersDAO();
			Orders order = odDAO.selectOrderByID(orderID);
			order.setStatus("Đã hủy");
			String mess = "";
			boolean success = false;
			if(odDAO.updateStatus(order) > 0) {
				mess = "Hủy đơn hàng thành công";
				success = true;
			}else {
				mess = "Hủy đơn hàng không thành công";
			}
			
			// Chuyển kết quả thành JSON
	        JsonResponse jsonResponse = new JsonResponse(success, mess);
	        PrintWriter out = response.getWriter();
	        Gson gson = new Gson();
	        out.print(gson.toJson(jsonResponse));
	        out.flush();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public class JsonResponse {
	    public boolean success;
	    public String message;

	    public JsonResponse(boolean success, String message) {
	        this.success = success;
	        this.message = message;
	    }

	    // Getters và Setters
	    public boolean isSuccess() {
	        return success;
	    }

	    public void setSuccess(boolean success) {
	        this.success = success;
	    }

	    public String getMessage() {
	        return message;
	    }

	    public void setMessage(String message) {
	        this.message = message;
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
