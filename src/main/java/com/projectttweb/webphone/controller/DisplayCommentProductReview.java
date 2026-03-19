package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.database.ProductReviewDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.ProductReview;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class DisplayCommentProductReview
 */
@WebServlet("/comment-product-review")
public class DisplayCommentProductReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayCommentProductReview() {
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
		HttpSession session = request.getSession(false);
		if(session != null) {
			User user = (User) session.getAttribute("khachHang");
			Product product = (Product) session.getAttribute("productCurrent");
			if(user != null) {
				try {
					String rating = request.getParameter("rating");
					String comment = request.getParameter("textarea");
					String baoLoi = "";
					if(rating.length() > 0 && comment.length() > 0) {
						ProductReviewDAO proReview = new ProductReviewDAO();
						UserDao userDao = new UserDao();
						ProductDao proDao = new ProductDao();
						String proIDLastNext = proReview.selectProductReviewIDLastNext();
						int soNext = xuLySoNext(proIDLastNext);
						String soNextStr = xuLySoNextStr(soNext);
						String userID = user.getUserID();
						String productID = product.getProductID();
						Date todaysDate = new Date(new java.util.Date().getTime());
						ProductReview productReview = new ProductReview(soNextStr, userDao.selectUserById(userID), proDao.selectProByID(productID), Integer.valueOf(rating), comment, todaysDate);
						if(proReview.insert(productReview) > 0) {
							baoLoi = "Chúc mừng bạn "+user.getFullName()+" đã thêm bình luận mới thành công";
							request.setAttribute("baoLoi", baoLoi);
							request.setAttribute("productID", productID);
							request.setAttribute("sourceServlet", "DisplayCommentProduct");
							RequestDispatcher rd = getServletContext().getRequestDispatcher("/load-page-product-single");
							rd.forward(request, response);
							//response.sendRedirect("load-page-product-single?productID="+productID);
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}else {
				try {
					String rating = request.getParameter("rating");
					String comment = request.getParameter("textarea");
					String hoTen = request.getParameter("hoTen");
					String email = request.getParameter("email");
					if(rating.length() > 0 && comment.length() > 0 && hoTen.length() > 0 && email.length() > 0) {
						UserDao userDao = new UserDao();
						boolean kiemTraEmail = userDao.kiemTraByEmail(email);
						String baoLoi = "";
						if(kiemTraEmail) {
							if(email.trim().equalsIgnoreCase("andanhhhhhhhhhhhhhhh@gmail.com")) {
								User userMail = userDao.getUserByEmail(email);
								ProductReviewDAO proViewDao = new ProductReviewDAO();
								String proIDLastNext = proViewDao.selectProductReviewIDLastNext();
								int soNext = xuLySoNext(proIDLastNext);
								String soNextStr = xuLySoNextStr(soNext);
								Date todaysDate = new Date(new java.util.Date().getTime());
								ProductReview productReview = new ProductReview(soNextStr, userMail, product, Integer.valueOf(rating), comment, todaysDate);
								if(proViewDao.insert(productReview) > 0) {
									baoLoi = "Chúc mừng bạn "+userMail.getFullName()+" đã thêm bình luận mới thành công";
									request.setAttribute("baoLoi", baoLoi);
									request.setAttribute("productID", product.getProductID());
									request.setAttribute("sourceServlet", "DisplayCommentProduct");
									RequestDispatcher rd = getServletContext().getRequestDispatcher("/load-page-product-single");
									rd.forward(request, response);
								}
							}else {
								User userMail = userDao.getUserByEmail(email);
								String userName = userMail.getFullName();
								String productID = product.getProductID();
								baoLoi = "Xin chào khách hàng " + userName +" bạn chưa đăng nhập vào hệ thống của chúng tôi. Vui lòng đăng nhập trước khi bình luận";
								request.setAttribute("sourceServlet", "DisplayCommentProductNotUser");
								request.setAttribute("baoLoi", baoLoi);
								request.setAttribute("productID", productID);
								RequestDispatcher rd = getServletContext().getRequestDispatcher("/load-page-product-single");
								rd.forward(request, response);
							}
						}else {
							baoLoi = "Email bạn vừa nhập không tồn tại trong hệ thống. Bạn vui lòng đăng kí tài khoản hoặc dùng mail ẩn danh là\nandanhhhhhhhhhhhhhhh@gmail.com";
							request.setAttribute("baoLoi", baoLoi);
							request.setAttribute("sourceServlet", "DisplayCommentProductEmailError");
							request.setAttribute("productID", product.getProductID());
							RequestDispatcher rd = getServletContext().getRequestDispatcher("/load-page-product-single");
							rd.forward(request, response);
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		
	}

	private static String xuLySoNextStr(int soNext) {
		// TODO Auto-generated method stub
		String ans = "";
		if(soNext < 10) {
			ans = "000"+soNext;
		}else if(soNext < 100) {
			ans = "00"+soNext;
		}else if(soNext < 1000) {
			ans = "0" +soNext;
		}else {
			ans = String.valueOf(soNext);
		}
		return ans;
	}

	private int xuLySoNext(String proIDLastNext) {
		// TODO Auto-generated method stub
		String ans = "";
		boolean check = false;
		for (int i = 0; i < proIDLastNext.length(); i++) {
			if(proIDLastNext.charAt(i) != '0' || check) {
				ans += proIDLastNext.charAt(i);
				check = true;
			}
		}
		int res = Integer.parseInt(ans);
		return res +1;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public static void main(String[] args) {
		//System.out.println(xuLySoNextStr(1000));
		Date todaysDate = new Date(new java.util.Date().getTime());
		System.out.println(todaysDate.getDate()+"\t"+todaysDate.getMonth()+"\t"+todaysDate.getYear());
	}

}
