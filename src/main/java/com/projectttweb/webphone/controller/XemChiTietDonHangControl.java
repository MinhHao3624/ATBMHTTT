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
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.OrderDetails;
import com.projectttweb.webphone.model.Orders;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class XemChiTietDonHangControl
 */
@WebServlet("/xem-chi-tiet-don-hang")
public class XemChiTietDonHangControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XemChiTietDonHangControl() {
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
			User user = (User) session.getAttribute("khachHang");
			if(user != null) {
				
				OrdersDAO orderDAO = new OrdersDAO();
				OrderDetailsDAO orderDetailDAO = new OrderDetailsDAO();
				String orderID = request.getParameter("ordersID")+"";
				
				if(orderID.equalsIgnoreCase("null")) {
					orderID = (String) request.getAttribute("ordersID");
					System.out.println(orderID);
				}
				Orders order = orderDAO.selectOrderByID2(orderID);
				List<OrderDetails> lst = orderDetailDAO.getListOrderDetails2(orderID);
				double tongTien = 0;
				for (OrderDetails orderDetails : lst) {
					tongTien += orderDetails.getUnitPrice();
				}
			    double tongThanhToan = tongTien + 50000;
			    ProductFavoriteDAO proFaDao = new ProductFavoriteDAO();
			    int soLuongSanPhamLike = proFaDao.getSoLuong2(user.getUserID().trim());
				ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
				String slSP = "";
				if (li != null) {
					slSP = li.getList().size() + "";
					slSP = (slSP == "0") ? "0" : slSP;
				} else {
					slSP = "0";
				}
				boolean baoLoi2 = false;
				String mess =(String) request.getAttribute("mess")+"";
				if(!mess.equalsIgnoreCase("null")) {
				    baoLoi2 = true;
					request.setAttribute("mess", mess);
					request.setAttribute("baoLoi2", baoLoi2);
				}
				request.setAttribute("baoLoi2", baoLoi2);
				request.setAttribute("orders", order);
				request.setAttribute("listOrderDetails", lst);
				request.setAttribute("tongTien", tongTien);
				request.setAttribute("tongThanhToan", tongThanhToan);
				request.setAttribute("soLuongSanPhamLike", soLuongSanPhamLike);
				request.setAttribute("soLuongSP", slSP);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/profile-receipt-details.jsp");
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
