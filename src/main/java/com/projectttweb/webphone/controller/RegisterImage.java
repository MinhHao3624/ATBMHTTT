package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterImage
 */
@WebServlet("/register-img")
public class RegisterImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    String action = request.getParameter("action");
	    String url = "";
	    boolean kiemTra = false;
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    String msg = "";
	    if(action.equals("xacThuc")) {
	    	kiemTra = true;
	    	msg = "Mời bạn chọn ảnh đại diện để upload";
	    	url = "/signup-form.jsp";
	    }
	    request.setAttribute("kiemTra", kiemTra);
	    request.setAttribute("thongBao", msg);
	    request.setAttribute("sourceServlet", "RegisterImage");
	    RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
	    rd.forward(request, response);
	}

}
