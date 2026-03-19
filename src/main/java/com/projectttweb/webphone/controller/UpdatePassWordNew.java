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
import com.projectttweb.webphone.util.MaHoa;

/**
 * Servlet implementation class UpdatePassWordNew
 */
@WebServlet("/update-password-new")
public class UpdatePassWordNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassWordNew() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String passWordNew = request.getParameter("passWordNew");
		String againPassWordNew = request.getParameter("againPassWordNew");
		String baoLoi = "";
		boolean trangThai = false;
		if(passWordNew.equals(againPassWordNew)) {
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("khachHang");
			User user = null;
			UserDao userDao = new UserDao();
			if(obj != null) {
				user = (User) obj;
				String passWordNewReal = MaHoa.toSHA1(passWordNew);
				user.setPassWord(passWordNewReal);
				if(userDao.updatePassWordNewReal(user) > 0) {
					baoLoi = "Chúc mừng bạn đã cập nhật mật khẩu mới thành công\nVui lòng đăng nhập lại";
					trangThai = true;
					request.setAttribute("error", baoLoi);
					request.setAttribute("trangThai", trangThai);
					request.setAttribute("sourceServlet", "updatePassWordNew");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/get-password.jsp");
					rd.forward(request, response);
				}
			}
		}else {
			baoLoi = "Mật khẩu nhập lại không đúng";
			request.setAttribute("error", baoLoi);
			request.setAttribute("trangThai", trangThai);
			request.setAttribute("sourceServlet", "updatePassWordNew");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/get-password.jsp");
			rd.forward(request, response);
		}
	}

}
