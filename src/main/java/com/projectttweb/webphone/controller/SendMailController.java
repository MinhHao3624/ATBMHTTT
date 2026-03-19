package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.User;
import com.projectttweb.webphone.util.Email;
import com.projectttweb.webphone.util.SoNgauNhien;

/**
 * Servlet implementation class SendMailController
 */
@WebServlet("/send-mail")
public class SendMailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailController() {
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
				String email = request.getParameter("email");
				System.out.println("ok");
				UserDao userDao = new UserDao();
				String error = "";
			    boolean success = false;
				if(userDao.kiemTraByEmail(email.trim())) {
					System.out.println("ok");
					User user = userDao.getUserByEmail(email.trim());
					String soNgauNhien = SoNgauNhien.getSoNgauNhien();
					if(Email.sendEmail(user.getEmail(), "Duy Shop gửi mã OTP cho bạn "+user.getUserName(), getNoiDung(user, soNgauNhien))) {
						HttpSession session = request.getSession();
						session.setAttribute("khachHang", user);
						request.setAttribute("maXacNhan", soNgauNhien);
						request.setAttribute("sourceServlet", "sendEmailPass");
						RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkOTP.jsp");
						rd.forward(request, response);
					}
				}else {
					System.out.println("ok");
					error = "Email bạn nhập không đúng. Hãy nhập lại";
					request.setAttribute("success", success);
					request.setAttribute("tinNhan", error);
					request.setAttribute("sourceServlet", "sendEmailPass");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/forgot-password.jsp");
					rd.forward(request, response);
				}
			}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("UTF-8");
//		String email = request.getParameter("email");
//		System.out.println("ok");
//		UserDao userDao = new UserDao();
//		String error = "";
//	    boolean success = false;
//		if(userDao.kiemTraByEmail(email.trim())) {
//			System.out.println("ok");
//			User user = userDao.getUserByEmail(email.trim());
//			String soNgauNhien = SoNgauNhien.getSoNgauNhien();
//			if(Email.sendEmail(user.getEmail(), "Duy Shop gửi mã OTP cho bạn "+user.getUserName(), getNoiDung(user, soNgauNhien))) {
//				HttpSession session = request.getSession();
//				session.setAttribute("khachHang", user);
//				request.setAttribute("maXacNhan", soNgauNhien);
//				request.setAttribute("sourceServlet", "sendEmailPass");
//				RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkOTP.jsp");
//				rd.forward(request, response);
//			}
//		}else {
//			error = "Email bạn nhập không đúng. Hãy nhập lại";
//			request.setAttribute("success", success);
//			request.setAttribute("tinNhan", error);
//			request.setAttribute("sourceServlet", "sendEmailPass");
//			RequestDispatcher rd = getServletContext().getRequestDispatcher("/forgot-password.jsp");
//			rd.forward(request, response);
//		}
		doGet(request, response);
		
	}

	private String getNoiDung(User user, String soNgauNhien) {
		// TODO Auto-generated method stub
		String noiDung = "<p>Duy Shop xin chào bạn <span>"+user.getUserName()+"</span> đây là mã OTP của bạn: "+soNgauNhien+"</p>\r\n";
		return noiDung;
	}

}
