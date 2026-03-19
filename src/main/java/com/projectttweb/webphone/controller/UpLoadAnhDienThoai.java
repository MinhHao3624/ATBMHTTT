package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class UpLoadAnhDienThoai
 */
@WebServlet("/upload-anh-dien-thoai")
public class UpLoadAnhDienThoai extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpLoadAnhDienThoai() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("admin");
		if(user != null) {
			boolean moUpLoad = true;
			request.setAttribute("moUpLoad", moUpLoad);
			System.out.println("đã vào mở upload");
			request.setAttribute("message", "Mời bạn upload ảnh điện thoại");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/formAddProduct.jsp");
			rd.forward(request, response);
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
