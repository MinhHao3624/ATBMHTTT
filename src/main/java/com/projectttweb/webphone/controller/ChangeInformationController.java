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

import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class ChangeInformationController
 */
@WebServlet("/cap-nhat-thong-tin")
public class ChangeInformationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeInformationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    try {
	    	request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String hoVaTen = request.getParameter("hoVaTen");
			String email = request.getParameter("email");
			String phone = request.getParameter("soDienThoai");
			String diaChi = request.getParameter("diaChiGiaoHang");
			String date = request.getParameter("ngaySinh");
			String sex = request.getParameter("gender");
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("khachHang");
			User user = null;
			String msg = "";
			String url = "";
			boolean kiemTra = false;
			String hd = "";
			if(obj != null) {
				user = (User) obj;
				String name = user.getFullName();
				String mail = user.getEmail();
				String sdt = user.getPhoneNumber();
				String addRess = user.getAddress();
				String ngaySinh = String.valueOf(user.getDateOfBirth());
				String gioiTinh = user.getSex();
				if(hoVaTen.trim().equals(name) && email.trim().equals(mail) && phone.trim().equals(sdt) && diaChi.trim().equals(addRess) && date.trim().equals(ngaySinh) && sex.trim().equals(gioiTinh)) {
					// không có gì thay đổi 
					System.out.println("đúng vậy");
					msg = "Cập nhật thông tin không thành công vì không có gì thay đổi";
					url = "/account.jsp";
					kiemTra = true;
					hd = "nosuccess";
					request.setAttribute("tinNhan", msg);
					request.setAttribute("check", kiemTra);
					request.setAttribute("hanhDong", hd);
					request.setAttribute("sourceServlet", "changeInformation");
					request.setAttribute("image", user.getImageAvatar());
					// thông tin cũ
					request.setAttribute("hoVaTenNew", hoVaTen);
					request.setAttribute("emailNew", email);
					request.setAttribute("phoneNew", phone);
					request.setAttribute("diaChiNew", diaChi);
					request.setAttribute("dateNew", date);
					request.setAttribute("gioiTinhNew", sex);
					RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
					rd.forward(request, response);
				}else {
					user.setFullName(hoVaTen);
					user.setEmail(email);
					user.setPhoneNumber(phone);
					user.setAddress(diaChi);
					user.setDateOfBirth(Date.valueOf(date));
					user.setSex(sex);
					UserDao userDao = new UserDao();
					if(userDao.updateCusInformation(user) > 0) {
						msg = "Chúc mừng bạn đã cập nhật thông tin thành công";
						url = "/account.jsp";
						kiemTra = true;
						hd = "success";
						request.setAttribute("tinNhan", msg);
						request.setAttribute("check", kiemTra);
						request.setAttribute("hanhDong", hd);
						request.setAttribute("sourceServlet", "changeInformation");
						request.setAttribute("image", user.getImageAvatar());
						// thông tin mới
						request.setAttribute("hoVaTenNew", hoVaTen);
						request.setAttribute("emailNew", email);
						request.setAttribute("phoneNew", phone);
						request.setAttribute("diaChiNew", diaChi);
						request.setAttribute("dateNew", date);
						request.setAttribute("gioiTinhNew", sex);
						RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
						rd.forward(request, response);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
