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
import com.projectttweb.webphone.model.ProductFavorite;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class GotoContactUs
 */
@WebServlet("/go-to-contactus")
public class GotoContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GotoContactUs() {
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
				ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
				List<ProductFavorite> lstProductFavoriteDao = productFaDao.getLstProFavorite(us.getUserID());
				request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao.size());
				ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
				String slSP = "";
				if (li != null) {
					slSP = li.getList().size() + "";
					slSP = (slSP == "0") ? "0" : slSP;
				} else {
					slSP = "0";
				}
				request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao.size());
				request.setAttribute("soLuongSP", slSP);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/contact-us.jsp");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/noAccount.jsp");
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
