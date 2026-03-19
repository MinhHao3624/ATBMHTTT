package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class XemSoSanPhamDangBan
 */
@WebServlet("/so-san-pham-dang-ban")
public class XemSoSanPhamDangBan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XemSoSanPhamDangBan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String userID = request.getParameter("userID");
			UserDao userDAO = new UserDao();
			User us = userDAO.selectById3(userID);
			ProductDao productDAO = new ProductDao();
			List<Product> soSPDaDangBan = productDAO.selectSoSPDaDangBan(us.getUserID());
			
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
