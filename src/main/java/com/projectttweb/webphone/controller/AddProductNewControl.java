package com.projectttweb.webphone.controller;

import java.io.IOException;
//import java.lang.module.ModuleDescriptor.Requires;
import java.sql.Date;

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
 * Servlet implementation class AddProductNewControl
 */
@WebServlet("/them-san-pham-moi")
public class AddProductNewControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductNewControl() {
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
				InformationproductDAO infoDAO = new InformationproductDAO();
				String infoIDCur = infoDAO.getInforIDCur();
				String inforNext = xuLyInfoID(infoIDCur);
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

				InformationProduct infoNew = new InformationProduct(inforNext, os, screen, glass, screenSize,
						resolution, ram, memory, cpu, gpu, cameraSau, cameraTruoc, sim, memoryCard, batery, color);
				if (infoDAO.insertInforNew(infoNew) > 0) {
					ProductDao proDAO = new ProductDao();
					ProductCategoriesDAO cateDAO = new ProductCategoriesDAO();
					String proIDCur = proDAO.getInfoIDCur();
					String proIDNext = xuLyProIDNext(proIDCur);
					String name = request.getParameter("tenSanPham");
					String price = request.getParameter("price");
					String priceDis = request.getParameter("priceDis");
					String stockQuantity = request.getParameter("soLuong");
					String description = request.getParameter("description");
					Date todaysDate = new Date(new java.util.Date().getTime());

					String nameCate = request.getParameter("categories");
					String idCate = cateDAO.getIDCate(nameCate);
					ProductCategories proCate = cateDAO.getProCateByID(idCate.trim());

					InformationProduct info = infoDAO.selectByIDNew(inforNext);

					Product proNew = new Product(proIDNext, name, price, priceDis, Integer.valueOf(stockQuantity),
							description, null, todaysDate, proCate, info);
					boolean check = false;
					if (proDAO.insert(proNew) > 0) {
						String mess = "Chúc mừng bạn đã thêm sản phẩm mới thành công";
						check = true;
						request.setAttribute("msg", mess);
						request.setAttribute("kiemTra", check);
						session.setAttribute("sanPham", proNew);
						RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/formAddProduct.jsp");
						rd.forward(request, response);
					}
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private String xuLyProIDNext(String proIDCur) {
		// TODO Auto-generated method stub
		String ans = "";
		boolean mo = false;
		for (int i = 0; i < proIDCur.length(); i++) {
			if (proIDCur.charAt(i) != '0' || mo) {
				ans += proIDCur.charAt(i);
				mo = true;
			}
		}
		int numInt = Integer.parseInt(ans);
		int numIntNext = numInt + 1;
		String res = "";
		if (numIntNext < 10) {
			res = "000" + numIntNext;
		} else if (numIntNext < 100) {
			res = "00" + numIntNext;
		} else if (numIntNext < 1000) {
			res = "0" + numIntNext;
		} else {
			res = "" + numIntNext;
		}
		return res;
	}

	private String xuLyInfoID(String infoIDCur) {
		// TODO Auto-generated method stub
		String ans = "";
		boolean mo = false;
		for (int i = 0; i < infoIDCur.length(); i++) {
			if (infoIDCur.charAt(i) != '0' || mo) {
				ans += infoIDCur.charAt(i);
				mo = true;
			}
		}
		int numInt = Integer.parseInt(ans);
		int numIntNext = numInt + 1;
		String res = "";
		if (numIntNext < 10) {
			res = "00" + numIntNext;
		} else if (numIntNext < 100) {
			res = "0" + numIntNext;
		} else {
			res = "" + numIntNext;
		}
		return res;
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
