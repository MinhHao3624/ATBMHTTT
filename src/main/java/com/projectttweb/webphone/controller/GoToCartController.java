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

import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.OrderDetails;
import com.projectttweb.webphone.model.ProductFavorite;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class GoToCartController
 */
@WebServlet("/go-to-cart")
public class GoToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoToCartController() {
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
			if(session != null) {
				User user = (User) session.getAttribute("khachHang");
				if(user != null) {
					ListOrderDetailsItem list = (ListOrderDetailsItem) session.getAttribute("listItem");
					if(list != null) {
						int soLuongSanPham = list.getList().size();
						double tongTien = 0;
						for (OrderDetails oder : list.getList()) {
						   double price = oder.getUnitPrice() * oder.getQuantity();
						   System.out.println(price+"giá là đây nhá");
						   tongTien += price;
						}
						ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
				        int lstProductFavoriteDao = productFaDao.getSoLuong2(user.getUserID());
				        request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao);
				        String slSP = "";
						if (list != null) {
							slSP = list.getList().size() + "";
							slSP = (slSP == "0") ? "0" : slSP;
						} else {
							slSP = "0";
						}
						request.setAttribute("soLuongSP", slSP);
						request.setAttribute("size", soLuongSanPham);
						request.setAttribute("totalAmount", tongTien);
						RequestDispatcher rd = getServletContext().getRequestDispatcher("/cart.jsp");
						rd.forward(request, response);
					}else {
						 ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
					        int lstProductFavoriteDao = productFaDao.getSoLuong2(user.getUserID());
					        request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao);
					        String slSP = "";
							if (list != null) {
								slSP = list.getList().size() + "";
								slSP = (slSP == "0") ? "0" : slSP;
							} else {
								slSP = "0";
							}
							request.setAttribute("soLuongSP", slSP);
						RequestDispatcher rd = getServletContext().getRequestDispatcher("/noProductInCart.jsp");
						rd.forward(request, response);
					}
				}
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
