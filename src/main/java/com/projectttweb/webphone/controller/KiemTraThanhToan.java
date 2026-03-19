package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.OrdersDAO;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.Orders;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class KiemTraThanhToan
 */
@WebServlet("/kiemTraThanhToan")
public class KiemTraThanhToan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KiemTraThanhToan() {
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
			String orderID = request.getParameter("orderID");
			OrdersDAO oDAO = new OrdersDAO();
			Orders od = oDAO.selectOrderByID2(orderID);
			if(od.getStatus().equalsIgnoreCase("Đã xác nhận")) {
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
					String hoTen = user.getFullName();
					String gioiTinh = user.getSex();
					String diaChi = user.getAddress();
					String dienThoai = user.getPhoneNumber();
					String email = user.getEmail();
					String soTienCanThanhToan = String.valueOf(od.getTotalAmount());
					
					request.setAttribute("hoTen", hoTen);
					request.setAttribute("gioiTinh", gioiTinh);
					request.setAttribute("diaChi", diaChi);
					request.setAttribute("dienThoai", dienThoai);
					request.setAttribute("email", email);
					request.setAttribute("soTienCanThanhToan", soTienCanThanhToan);
					
					request.setAttribute("soLuongSanPhamLike", soLuongSanPhamLike);
					request.setAttribute("soLuongSP", slSP);
					request.setAttribute("ordersID", orderID);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/thanhtoan-form.jsp");
					rd.forward(request, response);
			}else if(od.getStatus().equalsIgnoreCase("đang chờ")) {
				String mess = "Đơn hàng của bạn chưa được Admin xác nhận. Vui lòng chờ";
				request.setAttribute("mess", mess);
				request.setAttribute("ordersID", orderID);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/xem-chi-tiet-don-hang");
				rd.forward(request, response);
			}else if(od.getStatus().equalsIgnoreCase("Đã hủy")) {
				String mess = "Đơn hàng của đã bị Admin hủy rồi. Vui lòng liên hệ Admin để giải quyết";
				request.setAttribute("mess", mess);
				request.setAttribute("ordersID", orderID);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/xem-chi-tiet-don-hang");
				rd.forward(request, response);
			}else if(od.getStatus().equalsIgnoreCase("Đã thanh toán")) {
				String mess = "Đơn hàng của bạn đã được thanh toán rồi. Vui lòng thanh toán đơn hàng khác hoặc mua thêm";
				request.setAttribute("mess", mess);
				request.setAttribute("ordersID", orderID);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/xem-chi-tiet-don-hang");
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
