package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectttweb.webphone.database.CustomerFeedBackDAO;
import com.projectttweb.webphone.model.CustomerFeedback;

/**
 * Servlet implementation class PhanHoiCusControl
 */
@WebServlet("/phan-hoi-khach-hang")
public class PhanHoiCusControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhanHoiCusControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			CustomerFeedBackDAO dao = new CustomerFeedBackDAO();
			String feedID = request.getParameter("feedbackID");
			CustomerFeedback cusFB = dao.selectByIDFB(feedID);
			ArrayList<CustomerFeedback> lstALL = dao.selectAll();
			request.setAttribute("danhSachFB", lstALL);
			request.setAttribute("kiemTra", true);
			request.setAttribute("feedback", cusFB);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/feedback.jsp");
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
