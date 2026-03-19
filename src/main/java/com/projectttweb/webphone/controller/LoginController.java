package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.User;
import com.projectttweb.webphone.util.MaHoa;
import com.projectttweb.webphone.util.NgonNguDAO;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login-Servlet")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int MAX_ATTEMPTS = 5;
	private static int COUNT = 0;
	private static List<String> LIST_NAME = new ArrayList<String>();
	private static String USER_NAME = "";
	private static int COUNT2 = 0;


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("password");
		String url = "";
		String notify = "";
		String error = "";
		String passWordMaHoa = MaHoa.toSHA1(passWord);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println(passWordMaHoa);
		User user = new User();
		user.setUserName(userName);
		user.setPassWord(passWordMaHoa);
		UserDao userDao = new UserDao();
		ProductFavoriteDAO proFaDao = new ProductFavoriteDAO();
		User us = userDao.selectByUserNameAndPassWord(user);
		Map<String, String> m = new NgonNguDAO().vietnameseLanguage();
		request.setAttribute("map", m);
		if (us != null) {
			COUNT2 = 0;
			COUNT = 0;
			if (us.getRole().getRoleID() == 2) {
				if (us.getStatus() == 1) {
					if (us.getIsKey().equalsIgnoreCase("Hoạt động")) {
						HttpSession session = request.getSession();
						session.setAttribute("khachHang", us);
						User user2 = (User) session.getAttribute("khachHang");
						url = "/index.jsp";
						int soLuongSanPhamLike = proFaDao.getSoLuong2(user2.getUserID().trim());
						ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
						String slSP = "";
						if (li != null) {
							slSP = li.getList().size() + "";
							slSP = (slSP == "0") ? "0" : slSP;
						} else {
							slSP = "0";
						}
						ProductDao proDao = new ProductDao();
						List<Product> lstPro1 = proDao.getProductMain();
						List<Product> lstPro2 = proDao.getProductMain();
						List<Product> lstPro3 = proDao.getProductMain();
						request.setAttribute("uri", "/LoadDataMain");
						request.setAttribute("soLuongSP", slSP);
						request.setAttribute("danhSachMain1", lstPro1);
						request.setAttribute("danhSachMain2", lstPro2);
						request.setAttribute("danhSachMain3", lstPro3);
						System.out.println("ok");
						request.setAttribute("sourceServlet", "loginController");
						request.setAttribute("soLuongSanPhamLike", soLuongSanPhamLike);
						RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
						rd.forward(request, response);
					} else {
						url = "/login-form.jsp";
						notify = "Tài khoản của bạn đang bị khóa.Liên hệ Admin để biết thêm chi tiết";
						error = "taikhoanbikhoa";
						request.setAttribute("sourceServlet", "loginController");
						request.setAttribute("error", error);
						request.setAttribute("thongBao", notify);
						RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
						rd.forward(request, response);
					}
				} else {
					url = "/login-form.jsp";
					error = "taiKhoanChuaXacNhan";
					notify = "Bạn chưa xác thực tài khoản. Vui lòng xác thực tài khoản qua email đế tiếp tục đăng nhập";
					request.setAttribute("sourceServlet", "loginController");
					request.setAttribute("error", error);
					request.setAttribute("thongBao", notify);
					RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
					rd.forward(request, response);
				}
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("admin", us);
				url = "/Admin/admin.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}
		} else {
			if(userDao.checkUserNameIsTrue(userName)) {
			COUNT2++;
			if(!USER_NAME.equalsIgnoreCase(userName) && COUNT2 != 1) {
				COUNT2 = 0;
			}
			System.out.println(COUNT2+" số là số");
			USER_NAME = userName;
			if(COUNT2 > 5 && COUNT2 <= 10) {
				notify = "Bạn đã nhập sai tk mk 5 lần. Vui lòng thử lại sau 30s";
				error = "errorAccountEqualsFive";
				url = "/login-form.jsp";
				request.setAttribute("sourceServlet", "loginController");
				request.setAttribute("error", error);
				request.setAttribute("thongBao", notify);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
				
			}else if(COUNT2 > 10) {
				notify = "Bạn đã nhập sai tk mk hơn 10 lần. Nên tài khoản của bạn tạm thời bị khóa";
				error = "errorAccountEqualsTen";
				url = "/login-form.jsp";
				if(!userDao.kiemTraNameUserHasBlock(userName)) {
					int ans = userDao.khoaTaiKhoanViNhapSaiHonMuoiLan(userName);
				}
				request.setAttribute("sourceServlet", "loginController");
				request.setAttribute("error", error);
				request.setAttribute("thongBao", notify);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}else {
				url = "/login-form.jsp";
				notify = "Tên đăng nhập hoặc mật khẩu không chính xác";
				error = "errorUserNameOrPass";
				request.setAttribute("sourceServlet", "loginController");
				request.setAttribute("error", error);
				request.setAttribute("thongBao", notify);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}
		}else {
			COUNT++;
			if(COUNT > 5) {
				notify = "Bạn đã nhập sai tk mk 5 lần. Vui lòng thử lại sau 30s";
				error = "errorAccountEqualsFive";
				url = "/login-form.jsp";
				request.setAttribute("sourceServlet", "loginController");
				request.setAttribute("error", error);
				request.setAttribute("thongBao", notify);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}else {
				url = "/login-form.jsp";
				notify = "Tên đăng nhập hoặc mật khẩu không chính xác";
				error = "errorUserNameOrPass";
				request.setAttribute("sourceServlet", "loginController");
				request.setAttribute("error", error);
				request.setAttribute("thongBao", notify);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}
		}
		}
	}


	public static void main(String[] args) {
		List<String> li = new ArrayList<String>();
		li.add("anhduy");
		li.add("thudung");
		li.add("badao");
		li.remove(li.size() -2);
		for (String string : li) {
			System.out.println(string);
			
		}
	}

}
