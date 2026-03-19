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

import com.projectttweb.webphone.database.AtmRechargeHistoryDAO;
import com.projectttweb.webphone.database.CardRechargeDAO;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.AtmRechargeHistory;
import com.projectttweb.webphone.model.CardRechargeHistory;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class XemLichSuNapController
 */
@WebServlet("/xem-lich-su-nap")
public class XemLichSuNapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XemLichSuNapController() {
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
			AtmRechargeHistoryDAO atmRechargeHistoryDAO = new AtmRechargeHistoryDAO();
			CardRechargeDAO cardRechargeDAO = new CardRechargeDAO();
			List<AtmRechargeHistory> li1 = atmRechargeHistoryDAO.selectListAtmByID(userID);
			List<CardRechargeHistory> li2 = cardRechargeDAO.selectListCardByID(userID);
			ProductFavoriteDAO proFaDao = new ProductFavoriteDAO();
			int soLuongSanPhamLike = proFaDao.getSoLuong2(userID);
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
			request.setAttribute("kiemTra1", true);
			request.setAttribute("list1", li1);
			request.setAttribute("list2", li2);
			
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
