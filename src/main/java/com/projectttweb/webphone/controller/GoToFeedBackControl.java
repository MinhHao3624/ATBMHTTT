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

import com.projectttweb.webphone.database.CustomerFeedBackDAO;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.model.CustomerFeedback;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class GoToFeedBackControl
 */
@WebServlet("/go-to-phan-hoi")
public class GoToFeedBackControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoToFeedBackControl() {
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
			if(us != null) {
				CustomerFeedBackDAO cusDAO = new CustomerFeedBackDAO();
				boolean kiemTra = false;
				ProductFavoriteDAO proFaDao = new ProductFavoriteDAO();
				if(cusDAO.kiemTraIsFB(us.getUserID())) {
					kiemTra = true;
					String page = request.getParameter("page");
					ArrayList<CustomerFeedback> lst = cusDAO.selectByIDAndPage(us.getUserID(), page);
					for (CustomerFeedback customerFeedback : lst) {
						System.out.println(customerFeedback.getFeedID());
					}
					int tongSoSP = cusDAO.getTongSoFB(us.getUserID());
					int tongSoTrang = tongSoSP / 4;
					if(tongSoSP % 4 != 0) {
						tongSoTrang++;
					}
					int soLuongSanPhamLike = proFaDao.getSoLuong2(us.getUserID().trim());
					ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
					String slSP = "";
					if (li != null) {
						slSP = li.getList().size() + "";
						slSP = (slSP == "0") ? "0" : slSP;
					} else {
						slSP = "0";
					}
					request.setAttribute("currentPage", page);
					request.setAttribute("soLuongSanPhamLike", soLuongSanPhamLike);
					request.setAttribute("soLuongSP", slSP);
					request.setAttribute("listFb", lst);
					request.setAttribute("tongSoTrang", tongSoTrang);
					request.setAttribute("kiemTra", kiemTra);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/profile-feedback.jsp");
					rd.forward(request, response);
				}else {
					int soLuongSanPhamLike = proFaDao.getSoLuong2(us.getUserID().trim());
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
					request.setAttribute("kiemTra", kiemTra);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/profile-feedback.jsp");
					rd.forward(request, response);
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
