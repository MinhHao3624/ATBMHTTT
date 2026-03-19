package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class InsertImagePhoneControl
 */
@WebServlet("/insert-image-phone")
public class InsertImagePhoneControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertImagePhoneControl() {
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
			User user = (User) session.getAttribute("admin");
			if(user != null) {
				String duongDan = (String) request.getAttribute("duongDan");
				Product product = (Product) session.getAttribute("sanPham");
				ProductDao proDAO = new ProductDao();
				product.setImage(duongDan);
				boolean complete = false;
				if(proDAO.insertImagePhone(product) > 0) {
				    complete = true;
					String msg = "Chúc mừng bạn đã cập nhật ảnh điện thoại thành công";
					session.removeAttribute("sanPham");
					request.setAttribute("complete", complete);
					request.setAttribute("message", msg);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/formAddProduct.jsp");
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
