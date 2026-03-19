package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectttweb.webphone.database.ProductCategoriesDAO;
import com.projectttweb.webphone.model.ProductCategories;

/**
 * Servlet implementation class LoadProductCategoriesControl
 */
@WebServlet("/load-product-categories")
public class LoadProductCategoriesControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadProductCategoriesControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			ProductCategoriesDAO proCateDAO = new ProductCategoriesDAO();
			ArrayList<ProductCategories> lstALL = proCateDAO.selectAll();
			request.setAttribute("listCategories", lstALL);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/admin-branch.jsp");
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
