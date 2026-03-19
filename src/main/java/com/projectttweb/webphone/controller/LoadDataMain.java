package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.ProductFavorite;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class LoadDataMain
 */
@WebServlet("/LoadDataMain")
public class LoadDataMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadDataMain() {
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
		    HttpSession session = request.getSession(false); // Lấy session hiện tại, không tạo mới

		    // Kiểm tra session và xử lý cho lần đầu truy cập
		    if (session == null) {
		        session = request.getSession(true); // Tạo session mới nếu không tồn tại
		        session.setAttribute("firstVisit", false); // Đặt cờ lần đầu truy cập
		    } else {
		        Boolean firstVisit = (Boolean) session.getAttribute("firstVisit");
		        if (firstVisit == null || firstVisit) {
		        	System.out.println("doraemon kkkk");
		            session.invalidate(); // Xóa session cũ
		            session = request.getSession(true); // Tạo session mới
		            session.setAttribute("firstVisit", false); // Đặt lại cờ
		        }
		    }

		    // Lấy thông tin user từ session
		    User user = (User) session.getAttribute("khachHang");
		    ProductDao proDao = new ProductDao();
		    List<Product> lstPro1 = proDao.getProductMain();
		    List<Product> lstPro2 = proDao.getProductMain();
		    List<Product> lstPro3 = proDao.getProductMain();

		    if (user != null) {
		        // Nếu user tồn tại trong session, lấy danh sách sản phẩm yêu thích
		        ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
		        int lstProductFavoriteDao = productFaDao.getSoLuong2(user.getUserID());
		        request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao);
		        ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
		        String slSP = "";
				if (li != null) {
					slSP = li.getList().size() + "";
					slSP = (slSP == "0") ? "0" : slSP;
				} else {
					slSP = "0";
				}
				request.setAttribute("soLuongSP", slSP);
				String uri = request.getRequestURI();
				String uriReal = xuLyURI(uri);
				request.setAttribute("uri", uriReal);
				String sourceServlet = (String) request.getParameter("sourceServlet");
				System.out.println("sourceServlet là: "+sourceServlet);
				boolean checkVar = false;
				boolean checkVar1 = false;
				if(sourceServlet != null) {
				if (sourceServlet.equalsIgnoreCase("addToCart")) {
					checkVar = true;
					request.setAttribute("checkNoInput", checkVar);
				}else if(sourceServlet.equalsIgnoreCase("hetHang")) {
					checkVar1 = true;
					request.setAttribute("checkHetHang", checkVar1);
				}
				}
		    } else {
		        System.out.println("User không tồn tại trong session.");
		    }

		    // Set danh sách sản phẩm cho view
		    request.setAttribute("danhSachMain1", lstPro1);
		    request.setAttribute("danhSachMain2", lstPro2);
		    request.setAttribute("danhSachMain3", lstPro3);

		    // Chuyển tiếp đến trang index.jsp
		    RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
		    rd.forward(request, response);
		}


	private String xuLyURI(String uri) {
		// TODO Auto-generated method stub
		return uri.substring(13);
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

	public static void main(String[] args) {
		String mess = "65.990.000";
		String ans = "";
		for (int i = 0; i < mess.length(); i++) {
			if (mess.charAt(i) == '.') {
				continue;
			} else {
				ans += mess.charAt(i);
			}
		}
		int ansInt = Integer.valueOf(ans);
		double priceDis = ansInt * 0.1;
		double res = ansInt + priceDis;
		DecimalFormat df = new DecimalFormat("#");
		System.out.println(df.format(res));
		System.out.println(ansInt);
		System.out.println(priceDis);
	}

}
