package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.AtmRechargeHistoryDAO;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.AtmRechargeHistory;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.NganHang;
import com.projectttweb.webphone.model.SoTaiKhoan;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class XacNhanPinController
 */
@WebServlet("/XacNhanPinServlet")
public class XacNhanPinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XacNhanPinController() {
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
			String stk = request.getParameter("account");
			String soTien = request.getParameter("amount");
			String maPin = request.getParameter("pin");
			NganHang nganHang = new NganHang();
			UserDao userDAO = new UserDao();
			User user = userDAO.selectById3(us.getUserID());
			boolean kiemTraPin = false;
			String baoLoiPin = "";
			boolean check2 = false;
			boolean check3 = false;
			String baoLoi = "";
			Date todaysDate = new Date(new java.util.Date().getTime());
			AtmRechargeHistoryDAO atmDAO = new AtmRechargeHistoryDAO();
			for (Map.Entry<String, SoTaiKhoan> m : nganHang.getMap().entrySet()) {
				if(m.getKey().equalsIgnoreCase(bank)) {
					if(m.getValue().getStk().equalsIgnoreCase(stk)) {
					if(m.getValue().getMaPin().equalsIgnoreCase(maPin)) {
						double soDuCur = m.getValue().getSoDu();
						double soTienDb = Double.parseDouble(soTien);
						m.getValue().setSoDu(soDuCur - soTienDb);
						String iD = "";
						String iDCur = atmDAO.selectIDCur();
						String soTienTrcKhiChuyen = user.getSoDu();
						double value = Double.parseDouble(soTien);
						int intValue = (int) value;
						int soTienSauKhiChuyen = Integer.valueOf(soTienTrcKhiChuyen) + Integer.valueOf(intValue);
						if(!iDCur.equals("")) {
							String iDNext = xuLyID(iDCur);
							AtmRechargeHistory atmRechargeHistory = new AtmRechargeHistory(iDNext, user, soTienTrcKhiChuyen, String.valueOf(intValue), String.valueOf(soTienSauKhiChuyen), todaysDate, "thành công", bank, stk, maPin);
							if(atmDAO.update(atmRechargeHistory) > 0) {
								if(userDAO.capNhatSoDuMoi(user, String.valueOf(intValue)) > 0) {
									check3 = true;
									baoLoi = "Chúc mừng bạn đã nạp tiền thành công. Số tiền đã được cộng vào tài khoản của bạn";
									request.setAttribute("check3", check3);
									request.setAttribute("baoLoi", baoLoi);
								}
							}
						}else {
							iD = "0001";
							AtmRechargeHistory atmRechargeHistory = new AtmRechargeHistory(iD, user, user.getSoDu(), String.valueOf(intValue), String.valueOf(soTienSauKhiChuyen), todaysDate, "thành công", bank, stk, maPin);
							if(atmDAO.update(atmRechargeHistory) > 0) {
								if(userDAO.capNhatSoDuMoi(user, String.valueOf(intValue)) > 0) {
									check3 = true;
									baoLoi = "Chúc mừng bạn đã nạp tiền thành công. Số tiền đã được cộng vào tài khoản của bạn";
									request.setAttribute("check3", check3);
									request.setAttribute("baoLoi", baoLoi);
								}
							}
						}
					}else {
						check2 = true;
						kiemTraPin = true;
						baoLoiPin = "Sai mã pin. Vui lòng kiểm tra lại";
						request.setAttribute("check2", check2);
						request.setAttribute("kiemTraPin", kiemTraPin);
						request.setAttribute("baoLoiPin", baoLoiPin);
					}
					}
					
				}else {
					continue;
				}
			}
			String soDuCurrent = userDAO.getSoDu(user.getUserID());
			ProductFavoriteDAO proFaDao = new ProductFavoriteDAO();
			int soLuongSanPhamLike = proFaDao.getSoLuong2(user.getUserID().trim());
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

	private String xuLyID(String iD) {
		// TODO Auto-generated method stub
		String num = "";
		boolean mo = false;
		for (int i = 0; i < iD.length(); i++) {
			if (iD.charAt(i) != '0' || mo) {
				num += iD.charAt(i);
				mo = true;
			}
		}
		int n = Integer.valueOf(num);
		n = n+1;
		String ans = "";
		if (n < 10) {
			ans = "000" + n;
		} else if (n < 100) {
			ans = "00" + n;
		} else if (n < 1000) {
			ans = "0" + n;
		} else {
			ans = String.valueOf(n);
		}
		return ans;
	}

}
