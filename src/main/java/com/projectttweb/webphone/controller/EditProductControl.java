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
 * Servlet implementation class EditProductControl
 */
@WebServlet("/edit-product")
public class EditProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("admin");
			if(user != null) {
				String productID = request.getParameter("productID");
				ProductDao proDAO = new ProductDao();
				Product proCur = proDAO.selectProByID(productID);
				String tenSP = proCur.getName();
				String price = proCur.getPrice();
				String cate = proCur.getCategories().getNameCategories();
				String color = proCur.getInformationPro().getColor();
				int size = proCur.getStockQuantity();
				String des = proCur.getDescription();
				String manHinh = proCur.getInformationPro().getScreen();
				String os = proCur.getInformationPro().getOs();
				String cameraSau = proCur.getInformationPro().getCamera();
				String cameraTruoc = proCur.getInformationPro().getCameraSelfies();
				String cpu = proCur.getInformationPro().getCpu();
				String boNho = proCur.getInformationPro().getMemory();
				String kichThucManHinh = proCur.getInformationPro().getScreenSize();
				String glass = proCur.getInformationPro().getGlass();
				String resolution = proCur.getInformationPro().getResolution();
				String ram = proCur.getInformationPro().getRam();
				String gpu = proCur.getInformationPro().getGpu();
				String sim = proCur.getInformationPro().getSim();
				String baterry = proCur.getInformationPro().getBattery();
				String memoryCard = proCur.getInformationPro().getMemoryCard();
				
				request.setAttribute("productID", productID);
				request.setAttribute("tenSanPham", tenSP);
				request.setAttribute("price", price);
				request.setAttribute("cate", cate);
				request.setAttribute("color", color);
				request.setAttribute("size", size);
				request.setAttribute("descrip", des);
				request.setAttribute("manHinh", manHinh);
				request.setAttribute("heDieuHanh", os);
				request.setAttribute("cameraSau", cameraSau);
				request.setAttribute("cameraTruoc", cameraTruoc);
				request.setAttribute("cpu", cpu);
				request.setAttribute("boNho", boNho);
				request.setAttribute("kichThuocManHinh", kichThucManHinh);
				request.setAttribute("glass", glass);
				request.setAttribute("resolution", resolution);
				request.setAttribute("ram", ram);
				request.setAttribute("gpu", gpu);
				request.setAttribute("sim", sim);
				request.setAttribute("baterry", baterry);
				request.setAttribute("memoryCard", memoryCard);
				
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/formEdit.jsp");
				rd.forward(request, response);
				
				
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
