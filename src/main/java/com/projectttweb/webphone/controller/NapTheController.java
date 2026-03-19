package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.CardRechargeDAO;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.UserDao;
import com.projectttweb.webphone.model.CardRechargeHistory;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.NganHangTheCao;
import com.projectttweb.webphone.model.TheCao;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class NapTheController
 */
@WebServlet("/NapTheServlet")
public class NapTheController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NapTheController() {
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
			HttpSession session = request.getSession(false);
			User user1 = (User) session.getAttribute("khachHang");
			String nhaMang = request.getParameter("network");
			String seri = request.getParameter("seri");
			String maThe = request.getParameter("maThe");
			String menhGia = request.getParameter("menhgia");
			String baoLoi = "";
			boolean check1 = false;
			boolean check2 = false;
			CardRechargeDAO cardRechargeDAO = new CardRechargeDAO();
			NganHangTheCao nganHangTheCao = new NganHangTheCao();
			UserDao userDAO = new UserDao();
			User user = userDAO.selectById3(user1.getUserID());
			Date todaysDate = new Date(new java.util.Date().getTime());
			if (nhaMang.equalsIgnoreCase("viettel")) {
				if (!cardRechargeDAO.kiemTraTheDaSuDungHayChua(nhaMang, seri, maThe)) {
					List<TheCao> li = nganHangTheCao.listCardVietThel();
					if (checkCardIsExist(li, seri, maThe)) {
						for (TheCao theCao : li) {
							if (theCao.getSoSeri().equalsIgnoreCase(seri.trim())
									&& theCao.getMaThe().equalsIgnoreCase(maThe.trim())) {
								String iD = cardRechargeDAO.getIDCardLast();
								if (theCao.getMenhGia().equalsIgnoreCase(menhGia)) {
									if (!iD.equals("")) {
										String iDNext = xuLyID(iD);
										CardRechargeHistory cardRechargeHistory = new CardRechargeHistory(iDNext, user,
												seri, maThe, menhGia, "thành công", menhGia, nhaMang, todaysDate);
										if (cardRechargeDAO.update(cardRechargeHistory) > 0) {
											if (userDAO.capNhatSoDuMoi(user, menhGia) > 0) {
												baoLoi = "Chúc mừng bạn đã nạp tiền thành công. Số tiền đã được cộng vào tài khoản của bạn";
												check2 = true;
												request.setAttribute("baoLoi", baoLoi);
												request.setAttribute("kiemTra2", check2);
												break;
											}
										}
									} else {
										iD = "0001";
										CardRechargeHistory cardRechargeHistory = new CardRechargeHistory(iD, user,
												seri, maThe, menhGia, "thành công", menhGia, nhaMang, todaysDate);
										if (cardRechargeDAO.update(cardRechargeHistory) > 0) {
											if (userDAO.capNhatSoDuMoi(user, menhGia) > 0) {
												baoLoi = "Chúc mừng bạn đã nạp tiền thành công. Số tiền đã được cộng vào tài khoản của bạn";
												check2 = true;
												request.setAttribute("baoLoi", baoLoi);
												request.setAttribute("kiemTra2", check2);
												break;
											}
										}
									}
								} else {
									String iDNext = xuLyID(iD);
									int soTien = Integer.valueOf(theCao.getMenhGia());
									int soTienConLai = soTien / 2;
									CardRechargeHistory cardRechargeHistory = new CardRechargeHistory(iDNext, user,
											seri, maThe, menhGia, "Sai mệnh giá", String.valueOf(soTienConLai),
											nhaMang, todaysDate);
									if (cardRechargeDAO.update(cardRechargeHistory) > 0) {
										if (userDAO.capNhatSoDuMoi(user, String.valueOf(soTienConLai)) > 0) {
											baoLoi = "Bạn đã nhập sai mệnh giá thẻ. Nên chỉ nhận được 1 nữa số tiền của thẻ";
											check2 = true;
											request.setAttribute("baoLoi", baoLoi);
											request.setAttribute("kiemTra2", check2);
											break;
										}
									}
								}

							} else {
							    continue;
							}
						}
					}else {
						baoLoi = "Thẻ của bạn không đúng. Vui Lòng kiểm tra lại";
						check1 = true;
						request.setAttribute("baoLoi", baoLoi);
						request.setAttribute("kiemTra1", check1);
					}
				} else {
					baoLoi = "Thẻ bạn vừa nhập đã được sử dụng rồi. Vui lòng kiểm tra lại";
					check1 = true;
					request.setAttribute("baoLoi", baoLoi);
					request.setAttribute("kiemTra1", check1);

				}
			} else if (nhaMang.equalsIgnoreCase("MobiPhone")) {
				if (!cardRechargeDAO.kiemTraTheDaSuDungHayChua(nhaMang, seri, maThe)) {
					List<TheCao> li = nganHangTheCao.listCardMobiPhone();
					if (checkCardIsExist(li, seri, maThe)) {
					for (TheCao theCao : li) {
						if (theCao.getSoSeri().equalsIgnoreCase(seri) && theCao.getMaThe().equalsIgnoreCase(maThe)) {
							String iD = cardRechargeDAO.getIDCardLast();
							if (theCao.getMenhGia().equalsIgnoreCase(menhGia)) {
								if (!iD.equals("")) {
									String iDNext = xuLyID(iD);
									CardRechargeHistory cardRechargeHistory = new CardRechargeHistory(iDNext, user,
											seri, maThe, menhGia, "thành công", menhGia, nhaMang, todaysDate);
									if (cardRechargeDAO.update(cardRechargeHistory) > 0) {
										if (userDAO.capNhatSoDuMoi(user, menhGia) > 0) {
											baoLoi = "Chúc mừng bạn đã nạp tiền thành công. Số tiền đã được cộng vào tài khoản của bạn";
											check2 = true;
											request.setAttribute("baoLoi", baoLoi);
											request.setAttribute("kiemTra2", check2);
											break;
										}
									}
								} else {
									iD = "0001";
									CardRechargeHistory cardRechargeHistory = new CardRechargeHistory(iD, user, seri,
											maThe, menhGia, "thành công", menhGia, nhaMang, todaysDate);
									if (cardRechargeDAO.update(cardRechargeHistory) > 0) {
										if (userDAO.capNhatSoDuMoi(user, menhGia) > 0) {
											baoLoi = "Chúc mừng bạn đã nạp tiền thành công. Số tiền đã được cộng vào tài khoản của bạn";
											check2 = true;
											request.setAttribute("baoLoi", baoLoi);
											request.setAttribute("kiemTra2", check2);
											break;
										}
									}
								}
							} else {
								String iDNext = xuLyID(iD);
								int soTien = Integer.valueOf(theCao.getMenhGia());
								int soTienConLai = soTien / 2;
								CardRechargeHistory cardRechargeHistory = new CardRechargeHistory(iDNext, user, seri,
										maThe, menhGia, "Sai mệnh giá", String.valueOf(soTienConLai), nhaMang, todaysDate);
								if (cardRechargeDAO.update(cardRechargeHistory) > 0) {
									if (userDAO.capNhatSoDuMoi(user, String.valueOf(soTienConLai)) > 0) {
										baoLoi = "Bạn đã nhập sai mệnh giá thẻ. Nên chỉ nhận được 1 nữa số tiền của thẻ";
										check2 = true;
										request.setAttribute("baoLoi", baoLoi);
										request.setAttribute("kiemTra2", check2);
										break;
									}
								}
							}
						} else {
						continue;
						}
					}
					}else {
						baoLoi = "Thẻ không hợp lệ. Vui lòng kiểm tra lại";
						check1 = true;
						request.setAttribute("baoLoi", baoLoi);
						request.setAttribute("kiemTra1", check1);
					}
				} else {
					baoLoi = "Thẻ bạn vừa nhập đã được sử dụng rồi. Vui lòng kiểm tra lại";
					check1 = true;
					request.setAttribute("baoLoi", baoLoi);
					request.setAttribute("kiemTra1", check1);

				}
			} else if (nhaMang.equalsIgnoreCase("VinaPhone")) {
				if (!cardRechargeDAO.kiemTraTheDaSuDungHayChua(nhaMang, seri, maThe)) {
					List<TheCao> li = nganHangTheCao.listCardVinaPhone();
					if (checkCardIsExist(li, seri, maThe)) {
					for (TheCao theCao : li) {
						if (theCao.getSoSeri().equalsIgnoreCase(seri) && theCao.getMaThe().equalsIgnoreCase(maThe)) {
							String iD = cardRechargeDAO.getIDCardLast();
							if (theCao.getMenhGia().equalsIgnoreCase(menhGia)) {
								if (!iD.equals("")) {
									String iDNext = xuLyID(iD);
									CardRechargeHistory cardRechargeHistory = new CardRechargeHistory(iDNext, user,
											seri, maThe, menhGia, "thành công", menhGia, nhaMang, todaysDate);
									if (cardRechargeDAO.update(cardRechargeHistory) > 0) {
										if (userDAO.capNhatSoDuMoi(user, menhGia) > 0) {
											baoLoi = "Chúc mừng bạn đã nạp tiền thành công. Số tiền đã được cộng vào tài khoản của bạn";
											check2 = true;
											request.setAttribute("baoLoi", baoLoi);
											request.setAttribute("kiemTra2", check2);
											break;
										}
									}
								} else {
									iD = "0001";
									CardRechargeHistory cardRechargeHistory = new CardRechargeHistory(iD, user, seri,
											maThe, menhGia, "thành công", menhGia, nhaMang, todaysDate);
									if (cardRechargeDAO.update(cardRechargeHistory) > 0) {
										if (userDAO.capNhatSoDuMoi(user, menhGia) > 0) {
											baoLoi = "Chúc mừng bạn đã nạp tiền thành công. Số tiền đã được cộng vào tài khoản của bạn";
											check2 = true;
											request.setAttribute("baoLoi", baoLoi);
											request.setAttribute("kiemTra2", check2);
											break;
										}
									}
								}
							} else {
								String iDNext = xuLyID(iD);
								int soTien = Integer.valueOf(theCao.getMenhGia());
								int soTienConLai = soTien / 2;
								CardRechargeHistory cardRechargeHistory = new CardRechargeHistory(iDNext, user, seri,
										maThe, menhGia, "Sai mệnh giá", String.valueOf(soTienConLai), nhaMang, todaysDate);
								if (cardRechargeDAO.update(cardRechargeHistory) > 0) {
									if (userDAO.capNhatSoDuMoi(user, String.valueOf(soTienConLai)) > 0) {
										baoLoi = "Bạn đã nhập sai mệnh giá thẻ. Nên chỉ nhận được 1 nữa số tiền của thẻ";
										check2 = true;
										request.setAttribute("baoLoi", baoLoi);
										request.setAttribute("kiemTra2", check2);
										break;
									}
								}
							}
						} else {
							continue;
						}
					}
					}else {
						baoLoi = "Thẻ không hợp lệ. Vui lòng kiểm tra lại";
						check1 = true;
						request.setAttribute("baoLoi", baoLoi);
						request.setAttribute("kiemTra1", check1);
					}
				} else {
					baoLoi = "Thẻ bạn vừa nhập đã được sử dụng rồi. Vui lòng kiểm tra lại";
					check1 = true;
					request.setAttribute("baoLoi", baoLoi);
					request.setAttribute("kiemTra1", check1);
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

	private boolean checkCardIsExist(List<TheCao> li, String seri, String maThe) {
		// TODO Auto-generated method stub
		for (TheCao theCao : li) {
			if(theCao.getSoSeri().equalsIgnoreCase(seri) && theCao.getMaThe().equalsIgnoreCase(maThe)) {
				return true;
			}
		}
		return false;
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
