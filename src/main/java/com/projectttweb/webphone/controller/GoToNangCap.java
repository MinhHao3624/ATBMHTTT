package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.AtmRechargeHistoryDAO;
import com.projectttweb.webphone.database.CardRechargeDAO;
import com.projectttweb.webphone.database.OrderDetailsDAO;
import com.projectttweb.webphone.database.OrdersDAO;
import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.TypeUserDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.AtmRechargeHistory;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class GoToNangCap
 */
@WebServlet("/go-to-nang-cap")
public class GoToNangCap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoToNangCap() {
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
			User us = (User) session.getAttribute("khachHang");
			String userID = request.getParameter("userID");
			UserDao userDAO = new UserDao();
			User user = userDAO.selectById3(us.getUserID());
			TypeUserDAO typeUserDAO = new TypeUserDAO();
			//
			String typeUser = typeUserDAO.selectNameTypeUs(user.getTypeUser());
			//
			Date todaysDate = new Date(new java.util.Date().getTime());
			AtmRechargeHistoryDAO atmDAO = new AtmRechargeHistoryDAO();
			CardRechargeDAO cardDAO = new CardRechargeDAO();
			
			String soTienAtm = atmDAO.getSoTienAtm(user.getUserID(), todaysDate);
			String soTienCard = cardDAO.getSoTienCard(user.getUserID(), todaysDate);
			
			int tongSoTien = Integer.valueOf(soTienAtm) + Integer.valueOf(soTienCard);
			
			String checkCTV = userDAO.isCTV(user.getUserID());
			String ctv = "";
			if(checkCTV.equals("ok")) {
				ctv = "Cộng tác viên bán hàng";
			}else {
				ctv = "không phải";
			}
			ProductDao productDao = new ProductDao();
			// so sp đã bán 
			List<Product> soSPDaDangBan = productDao.selectSoSPDaDangBan(user.getUserID());
			int size = soSPDaDangBan.size();
			// so sp đã thu hồi
			List<Product> soSPDaThuHoi = productDao.selectSoSPDaThuHoi(user.getUserID());
			int size2 = soSPDaThuHoi.size();
			int size3 = 0;
			List<Product> li4 = null;
			if(ctv.equalsIgnoreCase("Cộng tác viên bán hàng")) {
				OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
				li4 = orderDetailsDAO.selectSoSPDaBanTrongThang(user.getUserID(), todaysDate);
				size3 = li4.size();
			}else {
				size3 = 0;
			}
			// số tiền kiếm được
			double soTienKiemDuoc = 0;
			OrdersDAO ordersDAO = new OrdersDAO();
			if(ctv.equalsIgnoreCase("Cộng tác viên bán hàng")) {
				soTienKiemDuoc = ordersDAO.getTongSoTienBanDuoc(user.getUserID());
			}else {
				soTienKiemDuoc = 0;
			}
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
			request.setAttribute("soLuongSanPhamLike", soLuongSanPhamLike);
			request.setAttribute("soLuongSP", slSP);
			request.setAttribute("loaiTaiKhoan", typeUser);
			request.setAttribute("soTienDaNop", tongSoTien);
			request.setAttribute("ctv", ctv);
			request.setAttribute("soSPDaDangBan", size);
			request.setAttribute("soSPDaThuHoi", size2);
			request.setAttribute("soSPDaBanTrongThangGanNhat", size3);
			request.setAttribute("soTienKiemDuoc", soTienKiemDuoc);
			
			request.setAttribute("dsSoSPDaDangBan", soSPDaDangBan);
			request.setAttribute("dsSoSPDaThuHoi", soSPDaThuHoi);
			request.setAttribute("soSPDaBanTrongThang", li4);
			String check3 =  request.getAttribute("check3")+"";
			check3 = (check3.equals("null")) ? "false" : "true";
			
			request.setAttribute("check3", check3);
			
			String check4 = request.getAttribute("check4") +"";
			check4 = (check4.equals("null")) ? "false" : "true";
			
			request.setAttribute("check4", check4);
			
			String check5 = request.getAttribute("check5") + "";
			check5 = (check5.equals("null")) ? "false" : "true";
			
			request.setAttribute("check5", check5);
			
			
			
			
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/nangcap.jsp");
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
