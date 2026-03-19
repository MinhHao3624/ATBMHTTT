package com.projectttweb.webphone.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.Roles;
import com.projectttweb.webphone.model.User;
import com.projectttweb.webphone.util.Email;
import com.projectttweb.webphone.util.MaHoa;
import com.projectttweb.webphone.util.SoNgauNhien;

/**
 * Servlet implementation class SignUpController
 */
@WebServlet("/sign-up")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String userName = request.getParameter("username");
			String passWord = request.getParameter("password");
			String re_PassWord = request.getParameter("again-password");
			String fullName = request.getParameter("fullName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String dateOfBitrh = request.getParameter("dateOfBirth");
			String addRess = request.getParameter("address");
			String sex = request.getParameter("gioiTinh");
			//String image = request.getParameter("avatar");
			int roleID = 2; // đây là khách hàng
			LocalDate today = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String formattedDate = today.format(formatter);
			String createAt = formattedDate;
			request.setAttribute("username", userName);
			request.setAttribute("fullName", fullName);
			request.setAttribute("email", email);
			request.setAttribute("phone", phone);
			request.setAttribute("dateofbirth", dateOfBitrh);
			request.setAttribute("addRess", addRess);
			request.setAttribute("sex", sex);
			
			String url = "";
			String error = "";
			boolean check = false;
			UserDao userDao = new UserDao();
			if(userDao.kiemTraTenDangNhap(userName)) {
				error += "Tên đăng nhập đã tồn tại.</br>";
			}
			if(!passWord.equals(re_PassWord)) {
				error += "Mật khâủ nhập lại không khớp.</br>";
			}else {
				passWord = MaHoa.toSHA1(passWord);
			}
			if(userDao.kiemTraByEmail(email)) {
				error += "Email đã tồn tại. Vui lòng chọn email khác!!!</br>";
			}
			if(userDao.kiemTraSoDienThoai(phone)) {
				error += "Số điện thoại đã tồn tại. Vui lòng chọn số điện thoại khác!!!</br>";
			}
			request.setAttribute("baoLoi", error);
			if(error.length() > 0) {
				url = "/signup-form.jsp";
			}else {
				Random rd = new Random();
				String userID = System.currentTimeMillis() + rd.nextInt(1000) + "";
				User user = new User(userID, userName, passWord, fullName, email, phone, new Roles(2, "Khách hàng"), Date.valueOf(dateOfBitrh), sex, addRess, Date.valueOf(createAt), "");
				if(userDao.insert2(user) > 0) {
					// tạo dẫy số xác thực
					String maXacThuc = SoNgauNhien.getSoNgauNhien();
					//Quy định thời gian hiệu lực
					Date todaysDate = new Date(new java.util.Date().getTime());
					Calendar c = Calendar.getInstance();
					c.setTime(todaysDate);
					c.add(Calendar.DATE, 1);
					Date thoiGianHieuLucXacThuc = new Date(c.getTimeInMillis());
					// trạng thái xác thực
					int status = 0;
					user.setAuthenticationCode(maXacThuc);
					user.setConfirmationTime(thoiGianHieuLucXacThuc);
					user.setStatus(status);
					if(userDao.updateVertifyInformation(user)>0) {
						// Gửi email
						Email.sendEmail(user.getEmail(), "Xác thực tài khoản tại Duy Shop", getNoiDung(user));
						check = true;
						HttpSession session = request.getSession();
						session.setAttribute("user", user);
					}
				}
				url = "/signup-form.jsp";
			}
			request.setAttribute("baoLoi", error);
			request.setAttribute("kiemTra", check);
			request.setAttribute("sourceServlet", "signUpController");
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private String getNoiDung(User user) {
		// TODO Auto-generated method stub
		String link = "http://localhost:8080/MobileWebApp/xac-thuc?userID="+user.getUserID()+"&authenticationCode="+user.getAuthenticationCode();
		String noiDung = "<p>DuyIt xin ch&agrave;o bạn <strong>"+user.getUserName()+"</strong>,</p>\r\n"
				+ "<p>Vui l&ograve;ng x&aacute;c thực t&agrave;i khoản của bạn bằng c&aacute;ch nhập m&atilde; <strong>"+user.getAuthenticationCode()+"</strong>, hoặc click trực tiếp v&agrave;o đường link sau đ&acirc;y:</p>\r\n"
				+ "<p><a href=\""+link+"\">"+link+"</a></p>\r\n"
				+ "<p>Đ&acirc;y l&agrave; email tự động, vui l&ograve;ng kh&ocirc;ng phản hồi email n&agrave;y.</p>\r\n"
				+ "<p>Tr&acirc;n trọng cảm ơn.</p>";
		return noiDung;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
