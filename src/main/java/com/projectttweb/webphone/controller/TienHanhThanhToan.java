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

import com.projectttweb.webphone.database.OrdersDAO;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.TransactionDAO;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.NganHang;
import com.projectttweb.webphone.model.SoTaiKhoan;
import com.projectttweb.webphone.model.Transaction;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class TienHanhThanhToan
 */
@WebServlet("/tien-hanh-thanh-toan")
public class TienHanhThanhToan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TienHanhThanhToan() {
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
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("khachHang");
			String hinhThucThanhToan = request.getParameter("payment");
			String stk = request.getParameter("soTaiKhoan");
			String orderID = request.getParameter("orderID");
			OrdersDAO oDAO = new OrdersDAO();
			TransactionDAO transDAO = new TransactionDAO();
			boolean check = false;
			String hoTen = request.getParameter("hoTen");
			String gioiTinh = request.getParameter("gioiTinh");
			String diaChi = request.getParameter("diaChi");
			String dienThoai = request.getParameter("dienThoai");
			String email = request.getParameter("email");
			String soTienThanhToan = request.getParameter("soTienThanhToan");

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
			if (hinhThucThanhToan.equalsIgnoreCase("cash")) {
				if (stk.equalsIgnoreCase("")) {
					if (oDAO.capNhatDaThanhToan(orderID) > 0) {
						String tranIDCur = transDAO.getTranIDCur();
						if (tranIDCur.equalsIgnoreCase("")) {
							String tranID = "0001";
							String trangThaiThanhToan = "thành công";
							Date todaysDate = new Date(new java.util.Date().getTime());
							Transaction trans = new Transaction(tranID, oDAO.selectOrderByID(orderID),
									hinhThucThanhToan, trangThaiThanhToan, todaysDate);
							if (transDAO.capNhatGiaoDichisSuccess(trans) > 0) {
								String mess = "Chúc mừng bạn đã thực hiện thanh toán bằng hình thức tiền mặt thành công";
								check = true;
								request.setAttribute("check", check);
								request.setAttribute("thongBao", mess);
								RequestDispatcher rd = getServletContext().getRequestDispatcher("/thanhtoan-form.jsp");
								rd.forward(request, response);
							}
						} else {
							String tranIDNext = xuLyTransId(tranIDCur);
							String trangThaiThanhToan = "thành công";
							Date todaysDate = new Date(new java.util.Date().getTime());
							Transaction trans = new Transaction(tranIDNext, oDAO.selectOrderByID(orderID),
									hinhThucThanhToan, trangThaiThanhToan, todaysDate);
							if (transDAO.capNhatGiaoDichisSuccess(trans) > 0) {
								String mess = "Chúc mừng bạn đã thực hiện thanh toán bằng hình thức tiền mặt thành công";
								check = true;
								request.setAttribute("check", check);
								request.setAttribute("thongBao", mess);
								RequestDispatcher rd = getServletContext().getRequestDispatcher("/thanhtoan-form.jsp");
								rd.forward(request, response);
							}
						}
					}
				} else {
					String mess = "Nếu chọn tiền mặt thì không cần nhập số tài khoản tránh rủi ro";
					check = true;

					request.setAttribute("hoTen", hoTen);
					request.setAttribute("gioiTinh", gioiTinh);
					request.setAttribute("diaChi", diaChi);
					request.setAttribute("dienThoai", dienThoai);
					request.setAttribute("email", email);
					request.setAttribute("soTienCanThanhToan", soTienThanhToan);

					request.setAttribute("check", check);
					request.setAttribute("thongBao", mess);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/thanhtoan-form.jsp");
					rd.forward(request, response);
				}
			} else {
				if (!stk.equalsIgnoreCase("")) {
					NganHang nganHang = new NganHang();
					Map<String, SoTaiKhoan> map = nganHang.getMap();
					for (Map.Entry<String, SoTaiKhoan> entry : map.entrySet()) {
						if (entry.getKey().equalsIgnoreCase(hinhThucThanhToan)) {
							if (entry.getValue().getStk().equalsIgnoreCase(stk)) {
								double soTienThanhToanReal = Double.parseDouble(soTienThanhToan);
								double soTienConLai = entry.getValue().getSoDu() - soTienThanhToanReal;
								if (soTienConLai > 0) {
									if (oDAO.capNhatDaThanhToan(orderID) > 0) {
										String tranIDCur = transDAO.getTranIDCur();
										String tranIDNext = xuLyTransId(tranIDCur);
										String trangThaiThanhToan = "thành công";
										Date todaysDate = new Date(new java.util.Date().getTime());
										Transaction trans = new Transaction(tranIDNext, oDAO.selectOrderByID2(orderID),
												hinhThucThanhToan, trangThaiThanhToan, todaysDate);
										if (transDAO.capNhatGiaoDichisSuccess(trans) > 0) {
											String mess = "Chúc mừng bạn đã thanh toán đơn hàng thành công qua ngân hàng "
													+ hinhThucThanhToan;
											check = true;
											request.setAttribute("check", check);
											request.setAttribute("thongBao", mess);
											
											break;
										}
									}
								} else {
									String mess = "Thanh toán không thành công do số dư của thẻ " + hinhThucThanhToan
											+ " không đủ";
									check = true;
									request.setAttribute("hoTen", hoTen);
									request.setAttribute("gioiTinh", gioiTinh);
									request.setAttribute("diaChi", diaChi);
									request.setAttribute("dienThoai", dienThoai);
									request.setAttribute("email", email);
									request.setAttribute("check", check);
									request.setAttribute("thongBao", mess);
									request.setAttribute("soTienCanThanhToan", soTienThanhToan);
									break;
								}
							} else {
								String mess = "Thanh toán không thành công do số tài khoản không đúng với ngân hàng đã chọn";
								check = true;
								request.setAttribute("hoTen", hoTen);
								request.setAttribute("gioiTinh", gioiTinh);
								request.setAttribute("diaChi", diaChi);
								request.setAttribute("dienThoai", dienThoai);
								request.setAttribute("email", email);
								request.setAttribute("check", check);
								request.setAttribute("thongBao", mess);
								request.setAttribute("soTienCanThanhToan", soTienThanhToan);
								
								break;

							}

						}else {
							continue;
						}
					}
				} else {
					String mess = "Bạn chưa nhập số tài khoản cho ngân hàng thanh toán";
					check = true;
					request.setAttribute("hoTen", hoTen);
					request.setAttribute("gioiTinh", gioiTinh);
					request.setAttribute("diaChi", diaChi);
					request.setAttribute("dienThoai", dienThoai);
					request.setAttribute("email", email);
					request.setAttribute("check", check);
					request.setAttribute("thongBao", mess);
					request.setAttribute("soTienCanThanhToan", soTienThanhToan);
					
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/thanhtoan-form.jsp");
				rd.forward(request, response);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private String xuLyTransId(String tranIDCur) {
		// TODO Auto-generated method stub
		String ans = "";
		boolean mo = false;
		for (int i = 0; i < tranIDCur.length(); i++) {
			if (tranIDCur.charAt(i) != '0' || mo) {
				ans += tranIDCur.charAt(i);
				mo = true;
			} else {
				continue;
			}
		}
		int res = Integer.parseInt(ans);
		res = res + 1;
		String result = "";
		if (res < 10) {
			result = "000" + res;
		} else if (res < 100) {
			result = "00" + res;
		} else if (res < 1000) {
			result = "0" + res;
		} else {
			result = res + "";
		}
		return result;
	}

}
