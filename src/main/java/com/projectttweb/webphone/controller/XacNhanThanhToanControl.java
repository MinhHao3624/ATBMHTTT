package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.OrderDetailsDAO;
import com.projectttweb.webphone.database.OrdersDAO;
import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.ListOrderDetails;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.OrderDetails;
import com.projectttweb.webphone.model.Orders;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class XacNhanThanhToanControl
 */
@WebServlet("/xac-nhan-thanh-toan")
public class XacNhanThanhToanControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XacNhanThanhToanControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			String ho = request.getParameter("ho");
			String ten = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String diaChi = request.getParameter("diaChi");
			String ghiChu = request.getParameter("textarea");
			String baoLoi = "";
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("khachHang");
			String name = ho.trim()+" "+ten.trim();
			if(!user.getFullName().equalsIgnoreCase(name)) {
				baoLoi += "Họ và tên bạn nhập không chính xác. Vui lòng kiểm tra lại\n";
			}
			if(!user.getEmail().equalsIgnoreCase(email)) {
				baoLoi += "Email bạn nhập không chính xác. Vui lòng kiểm tra lại\n";		
			}
			if(!user.getPhoneNumber().equalsIgnoreCase(phone)) {
				baoLoi += "Số điện thoại bạn nhập không chính xác. Vui lòng kiểm tra lại";
			}
			boolean check = false;
			ProductFavoriteDAO proFaDao = new ProductFavoriteDAO();
			if(baoLoi.length() == 0) {
				OrdersDAO orderDAO = new OrdersDAO();
				OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
 				ListOrderDetails list = (ListOrderDetails) session.getAttribute("cart");
				ListOrderDetailsItem lst = (ListOrderDetailsItem) session.getAttribute("listItem");
				ProductDao productDAO = new ProductDao();
				for (Map.Entry<Orders, ListOrderDetailsItem> m2 : list.getMap().entrySet()) {
					Orders order = m2.getKey();
					double totalAmount = lst.getTotalAmount();
					if(orderDAO.insertOrderInDB(order, totalAmount, phone, diaChi) > 0) {
					aa:	for (OrderDetails  orderDetails: m2.getValue().getList()) {
							if(orderDetailsDAO.insertOrderDetailsInDB(orderDetails) > 0) {
								if(productDAO.capNhatStockQuantity(orderDetails.getProduct().getProductID(), xuLyConLai(orderDetails.getProduct().getProductID(), orderDetails.getQuantity())) > 0) {
									continue aa;
								}
							}
						}
					}
					break;
				}
				list.getMap().clear();
				lst.getList().clear();
				session.removeAttribute("cart");
				session.removeAttribute("listItem");
				check = true;
				int soLuongSanPhamLike = proFaDao.getSoLuong2(user.getUserID().trim());
				ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
				String slSP = "";
				if (li != null) {
					slSP = li.getList().size() + "";
					slSP = (slSP == "0") ? "0" : slSP;
				} else {
					slSP = "0";
				}
				String message = "Chúc mừng bạn đã đặt hàng thành công.\nĐơn hàng của bạn đang được xử lý";
				request.setAttribute("kiemTra", check);
				request.setAttribute("notify", message);
				request.setAttribute("soLuongSanPhamLike", soLuongSanPhamLike);
				request.setAttribute("soLuongSP", slSP);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkout.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("Ho", ho);
				request.setAttribute("Ten", ten);
				request.setAttribute("Mail", email);
				request.setAttribute("Phone", phone);
				request.setAttribute("diaChi", diaChi);
				request.setAttribute("note", ghiChu);
				request.setAttribute("kiemTra", check);
				request.setAttribute("notify", baoLoi);
				int soLuongSanPhamLike = proFaDao.getSoLuong2(user.getUserID().trim());
				ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
				String slSP = "";
				if (li != null) {
					slSP = li.getList().size() + "";
					slSP = (slSP == "0") ? "0" : slSP;
				} else {
					slSP = "0";
				}
				request.setAttribute("soLuongSanPhamLike", soLuongSanPhamLike);
				request.setAttribute("soLuongSP", slSP);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkout.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	private int xuLyConLai(String productID, int quantity) {
		// TODO Auto-generated method stub
		ProductDao proDao = new ProductDao();
		Product pro = proDao.selectProByID2(productID);
		int res = pro.getStockQuantity() - quantity;
		return res;
	}

	public static void main(String[] args) {
		String s ="Trần Anh Duy";
		String s1 = "Trần"+" "+"Anh Duy";
		System.out.println(s.equalsIgnoreCase(s1));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
