package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectttweb.webphone.util.NgonNguDAO;

/**
 * Servlet implementation class DaNgonNguControl
 */
@WebServlet("/da-ngon-ngu")
public class DaNgonNguControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DaNgonNguControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String lang = request.getParameter("lang");
		Map<String, String> map = null;
		if(lang.equalsIgnoreCase("vi")) {
			map = new NgonNguDAO().vietnameseLanguage();
		}else if(lang.equalsIgnoreCase("en")) {
			map = new NgonNguDAO().englishLanguage();
		}
		request.setAttribute("map", map);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/login-form.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
