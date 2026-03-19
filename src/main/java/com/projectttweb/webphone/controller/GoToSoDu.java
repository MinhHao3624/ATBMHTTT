package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class GoToSoDu
 */
@WebServlet("/go-to-so-du")
public class GoToSoDu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoToSoDu() {
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
			String userID = request.getParameter("userID");
			UserDao userDAO = new UserDao();
			User us = userDAO.selectById3(userID);
			String soDu = us.getSoDu();
			ProductFavoriteDAO proFaDao = new ProductFavoriteDAO();
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
			request.setAttribute("soDu", soDu);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/money.jsp");
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
