package com.projectttweb.webphone.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.User;
import com.projectttweb.webphone.util.MaHoa;

/**
 * Servlet implementation class ChangePassWordController
 */
@WebServlet("/change-password")
public class ChangePassWordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassWordController() {
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
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("khachHang");
		User user = null;
		String baoLoi = "";
		String url = "";
		boolean ans = false;
		String hd = "";
		System.out.println("đổi mk");
		if(obj != null) {
			user = (User) obj;
			String matKhauHienTai = request.getParameter("passWord");
			String matKhauHienTaiMaHoa = MaHoa.toSHA1(matKhauHienTai);
			String matKhau = user.getPassWord();
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
			if(matKhau.equals(matKhauHienTaiMaHoa)) {
				String matKhauMoi = request.getParameter("passWordNew");
				String matKhauMoiNhapLai = request.getParameter("passWordNewAgain");
				if(matKhauMoi.equals(matKhauMoiNhapLai)) {
					String matKhauMoiMaHoa = MaHoa.toSHA1(matKhauMoi);
					user.setPassWord(matKhauMoiMaHoa);
					UserDao userDao = new UserDao();
					if(userDao.upDatePassWordNew(user) > 0) {
						baoLoi = "Chúc mừng bạn đã cập nhật khẩu mới thành công";
						url = "/profile-reset-password.jsp";
						ans = true;
						request.setAttribute("hopThu", baoLoi);
						request.setAttribute("answer", ans);
						request.setAttribute("sourceServlet", "changePassWord");
						RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
						rd.forward(request, response);
					}
				}else {
					baoLoi = "Mật khẩu nhập lại không đúng";
					url = "/profile-reset-password.jsp";
					hd = "resetPassWordisFalse";
					request.setAttribute("hanhDong", hd);
					request.setAttribute("hopThu", baoLoi);
					request.setAttribute("answer", ans);
					request.setAttribute("sourceServlet", "changePassWord");
					RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
					rd.forward(request, response);
				}
			}else {
				System.out.println("đổi mk");
				baoLoi = "Mật khẩu hiện tại nhập không đúng";
				url = "/profile-reset-password.jsp";
				hd = "passWordisFalse";
				request.setAttribute("hanhDong", hd);
				request.setAttribute("hopThu", baoLoi);
				request.setAttribute("answer", ans);
				request.setAttribute("sourceServlet", "changePassWord");
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}
			
			
		}
		 
		
	}

}
