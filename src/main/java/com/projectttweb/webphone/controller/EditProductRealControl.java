package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.InformationproductDAO;
import com.projectttweb.webphone.database.ProductCategoriesDAO;
import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.model.InformationProduct;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.ProductCategories;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class EditProductRealControl
 */
@WebServlet("/edit-product-real")
public class EditProductRealControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProductRealControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("admin");
			if (user != null) {
				String productID = request.getParameter("productID");
				ProductDao proDAO = new ProductDao();
				Product pro = proDAO.selectProByID(productID);
				String os = request.getParameter("heDieuHanh");
				String screen = request.getParameter("manHinh");
				String glass = request.getParameter("glass");
				String screenSize = request.getParameter("screenSize");
				String resolution = request.getParameter("resolution");
				String ram = request.getParameter("ram");
				String memory = request.getParameter("boNho");
				String cpu = request.getParameter("cpu");
				String gpu = request.getParameter("gpu");
				String cameraSau = request.getParameter("cameraSau");
				String cameraTruoc = request.getParameter("cameraTruoc");
				String sim = request.getParameter("sim");
				String memoryCard = request.getParameter("memoryCard");
				String batery = request.getParameter("baterry");
				String color = request.getParameter("color");
				InformationproductDAO inforDAO = new InformationproductDAO();
				String inforID = pro.getInformationPro().getInfo_ID();
				InformationProduct infoNew = new InformationProduct(inforID, os, screen, glass, screenSize,
						resolution, ram, memory, cpu, gpu, cameraSau, cameraTruoc, sim, memoryCard, batery, color);
				if (inforDAO.update(infoNew) > 0) {
					ProductCategoriesDAO cateDAO = new ProductCategoriesDAO();
					InformationproductDAO infoDAO = new InformationproductDAO();
					String name = request.getParameter("tenSanPham");
					String price = request.getParameter("price");
					String stockQuantity = request.getParameter("soLuong");
					int stockInt = Integer.valueOf(stockQuantity);
					String description = request.getParameter("description");
					String nameCate = request.getParameter("categories");
					String idCate = cateDAO.getIDCate(nameCate);
					ProductCategories proCate = cateDAO.getProCateByID(idCate.trim());

					InformationProduct info2 = infoDAO.selectByIDNew(infoNew.getInfo_ID());

					Product proChange = new Product(name, price, stockInt, description, proCate, info2);
					boolean check = false;
					if (proDAO.update(proChange, productID) > 0) {
						String mess = "Chúc mừng bạn đã cập nhật sản phẩm thành công";
						check = true;
						request.setAttribute("msg", mess);
						request.setAttribute("kiemTra", check);
						RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/formEdit.jsp");
						rd.forward(request, response);
					}

				}

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
