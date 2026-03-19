package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.time.Year;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.SoTaiKhoanDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.SoTaiKhoan;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class DangKiCTVControl
 */
@WebServlet("/dang-ki-ctv")
public class DangKiCTVControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangKiCTVControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession(false);
			String userID = request.getParameter("userID");
			UserDao userDAO = new UserDao();
			User us = userDAO.selectById3(userID);
			String baoLoi = "";
			boolean check5 = false;
			boolean check4 = false;
			SoTaiKhoanDAO stkDAO = new SoTaiKhoanDAO();
			if(us.getRole().getRoleID() != 3) {
				String name = request.getParameter("hoten");
				String age = request.getParameter("age");
				String cccd = request.getParameter("cccd");
				String gender = request.getParameter("gender");
				String degree = request.getParameter("trinhdo");
				String stk = request.getParameter("soTaiKhoan");
				String stk2 = xuLyStK(stk);
				String nganHang = xuLy(stk);
				if(userDAO.kiemTraHoTen(name, us.getUserID())) {
					if(kiemTraCCCD(cccd)) {
						String iD = stkDAO.selectIDLast();
						String iDNext = xuLyIDNext(iD);
						SoTaiKhoan stk3 = new SoTaiKhoan(iDNext, stk2, 0, randomPin(), nganHang);
						if(stkDAO.insertSoTaiKhoan(stk3) > 0) {
						if(userDAO.updateCTV(age, cccd, gender, degree, stk2,nganHang, us.getUserID())) {
							check5 = true;
							request.setAttribute("check5", check5);
							request.setAttribute("soTaiKhoan", stk);
							request.setAttribute("nganHang", nganHang);
						}
						}
					}else {
						baoLoi += "Bạn chưa đủ tuổi";
						check4 = true;
						request.setAttribute("baoLoi", baoLoi);
						request.setAttribute("check4", check4);
					}
				}else {
					baoLoi += "Sai họ và tên";
					check4 = true;
					request.setAttribute("baoLoi", baoLoi);
					request.setAttribute("check4", check4);
				}
			}else {
				baoLoi = "Bạn đang giữ vị trí là ctv của web";
				check4 = true;
				request.setAttribute("baoLoi", baoLoi);
				request.setAttribute("check4", check4);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/nangcap.jsp");
		rd.forward(request, response);
	}

	private String randomPin() {
		// TODO Auto-generated method stub
		Random rd = new Random();
		String ans = "";
		int a = rd.nextInt(10);
		int b = rd.nextInt(10);
		int c = rd.nextInt(10);
		int d = rd.nextInt(10);
		ans = a + b + c + d +"";
		return ans;
		
	}

	private String xuLyIDNext(String iD) {
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

	private String xuLyStK(String stk) {
		// TODO Auto-generated method stub
	   String mess = "";
	   for (int i = 0; i < stk.length(); i++) {
		if(Character.isDigit(stk.charAt(i))) {
			mess += stk.charAt(i);
		}
	}
	   return mess;
	}

	private String xuLy(String stk) {
		// TODO Auto-generated method stub
		String mess = "";
		for (int i = 0; i < stk.length(); i++) {
			if(Character.isLetter(stk.charAt(i))) {
				mess += stk.charAt(i);
			}
		}
		return mess;
	}

	private boolean kiemTraCCCD(String cccd) {
		// TODO Auto-generated method stub
		 if (cccd.length() != 12) {
	            System.out.println("CCCD không hợp lệ!");
	            return false;
	        }

	        try {
	            int genderCode = Character.getNumericValue(cccd.charAt(3)); // Lấy mã giới tính (số thứ 4)
	            int yearShort = Integer.parseInt(cccd.substring(4, 6)); // Lấy 2 số cuối của năm sinh
	            int birthYear;

	            // Xác định năm sinh dựa trên mã giới tính
	            if (genderCode == 0 || genderCode == 1) {
	                birthYear = 1900 + yearShort; // 19XX
	            } else if (genderCode == 2 || genderCode == 3) {
	                birthYear = 2000 + yearShort; // 20XX
	            } else if (genderCode == 4 || genderCode == 5) {
	                birthYear = 2100 + yearShort; // 21XX
	            } else {
	                System.out.println("CCCD không hợp lệ!");
	                return false;
	            }

	            // Lấy năm hiện tại
	            int currentYear = Year.now().getValue();
	            int age = currentYear - birthYear;

	            // Kiểm tra nếu trên 18 tuổi
	            return age >= 18;
	        } catch (NumberFormatException e) {
	            System.out.println("Lỗi: CCCD không đúng định dạng!");
	            return false;
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
