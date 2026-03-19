package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.Map;

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
import com.projectttweb.webphone.model.NganHang;
import com.projectttweb.webphone.model.SoTaiKhoan;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class NapTienBankController
 */
@WebServlet("/NapTienBankServlet")
public class NapTienBankController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NapTienBankController() {
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
			HttpSession session = request.getSession(false);
			User us = (User) session.getAttribute("khachHang");
			String bank = request.getParameter("bank");
			String stk = request.getParameter("accountNumber");
			String amount = request.getParameter("amount");
			double amountDB = Double.parseDouble(amount);
			System.out.println(bank);
			System.out.println(stk);
			System.out.println(amount);
			NganHang nganHang = new NganHang();
			String error = "";
			boolean check1 = false;
			boolean check2 = false;
			UserDao userDAO = new UserDao();
			for (Map.Entry<String, SoTaiKhoan> m : nganHang.getMap().entrySet()) {
				System.out.println(m.getKey());
				if(m.getKey().equalsIgnoreCase(bank)) {
					if(m.getValue().getStk().equalsIgnoreCase(stk)) {
						if(m.getValue().getSoDu() >= amountDB) {
							check2 = true;
							error = "Mời bạn nhập mã pin";
							request.setAttribute("soTien", String.valueOf(amountDB));
							request.setAttribute("bank", bank);
							request.setAttribute("stk", stk);
							request.setAttribute("error", error);
							request.setAttribute("check2", check2);
							break;
						}else {
							error = "Thẻ không đủ số dư";
							check1 = true;
							request.setAttribute("check1", check1);
							request.setAttribute("error", error);
							break;
						}
					}else {
						error = "số tài khoản không hợp lệ";
						check1 = true;
						request.setAttribute("check1", check1);
						request.setAttribute("error", error);
						break;
					}
				}else {
					continue;
				}
			}
			String soDuCurrent = userDAO.getSoDu(us.getUserID());
			ProductFavoriteDAO proFaDao = new ProductFavoriteDAO();
			int soLuongSanPhamLike = proFaDao.getSoLuong2(us.getUserID().trim());
			ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
			String slSP = "";
			if (li != null) {
				slSP = li.getList().size() + "";
				slSP = (slSP == "0") ? "0" : slSP;
			} else {
				slSP = "0";
			}
			request.setAttribute("soLuongSanPhamLike", soLuongSanPhamLike);
			request.setAttribute("soLuongSP", slSP);
			request.setAttribute("soDu", soDuCurrent);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/money.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	
	}

}
