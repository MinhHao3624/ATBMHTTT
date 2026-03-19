package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectttweb.webphone.database.ProductCategoriesDAO;
import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.database.ProductFavoriteDAO;
import com.projectttweb.webphone.database.ProductReviewDAO;
import com.projectttweb.webphone.model.ListOrderDetailsItem;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.ProductFavorite;
import com.projectttweb.webphone.model.ProductReview;
import com.projectttweb.webphone.model.User;

/**
 * Servlet implementation class LoadPageProSingleController
 */
@WebServlet("/load-page-product-single")
public class LoadPageProSingleController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadPageProSingleController() {
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
		HttpSession session = request.getSession(false);
		if (session == null) {
			session = request.getSession();
		} else {
			User user = (User) session.getAttribute("khachHang");
			if (user != null) {
				List<Product> lstPro = (List<Product>) session.getAttribute("dsLienQuan");
				Product pro = (Product) session.getAttribute("productCurrent");
				if (lstPro != null && pro != null) {
					session.removeAttribute("dsLienQuan");
					session.removeAttribute("productCurrent");
				} else {

				}
			} else {
				List<Product> lstPro = (List<Product>) session.getAttribute("dsLienQuan");
				Product pro = (Product) session.getAttribute("productCurrent");
				if (lstPro != null && pro != null) {
					session.removeAttribute("dsLienQuan");
					session.removeAttribute("productCurrent");
				}
			}
		}
		try {
			// phần đầu
			String sourceServlet = request.getAttribute("sourceServlet") + "";
			sourceServlet = sourceServlet.equals("null") ? "" : sourceServlet;
			String productID = "";
			String baoLoi = "";
			boolean checkComment = false;
			boolean checkComment1 = false;
			boolean checkComment2 = false;
			boolean checkMemoryColor = false;
			boolean checkBinhLuan = false;
			if (sourceServlet.equalsIgnoreCase("DisplayCommentProduct")) {
				productID = (String) request.getAttribute("productID");
				baoLoi = (String) request.getAttribute("baoLoi");
				checkComment = true;
			} else if (sourceServlet.equalsIgnoreCase("DisplayCommentProductNotUser")) {
				productID = (String) request.getAttribute("productID");
				baoLoi = (String) request.getAttribute("baoLoi");
				checkComment1 = true;
			} else if (sourceServlet.equalsIgnoreCase("DisplayCommentProductEmailError")) {
				productID = (String) request.getAttribute("productID");
				baoLoi = (String) request.getAttribute("baoLoi");
				checkComment2 = true;
			} else if (sourceServlet.equalsIgnoreCase("LoadPageProSingleMemoryColor")) {
				baoLoi = (String) request.getAttribute("baoLoi");
				if (baoLoi.length() > 1) {
					productID = (String) request.getAttribute("productID");
					System.out.println("meo meo meo meo ");
					checkMemoryColor = true;
				} else {
					productID = (String) request.getAttribute("productID");
				}
			} else {
				productID = (String) request.getParameter("productID");
			}
			ProductDao proDao = new ProductDao();
			Product proTmp = proDao.getProductByID(productID);
			String link = proTmp.getImage();
			System.out.println("image hiện tại: " + link);
			System.out.println("iD hiện tại" + proTmp.getProductID());
			String colorCurrentTmp = proTmp.getInformationPro().getColor();
			String memoryCurrentTmp = proTmp.getInformationPro().getMemory();
			List<Product> dsProLienQuan = proDao.getDsProLienQuan(proTmp);
			for (Product product : dsProLienQuan) {
				System.out.println(product.getName());
			}
			System.out.println();
			List<String> memory = getStringMemory(dsProLienQuan);
			for (String string : memory) {
				System.out.println(string);
			}
			List<String> lstColor = getStringColor(dsProLienQuan);
			for (String string : lstColor) {
				System.out.println(string);
			}
			ProductReviewDAO proReviewDao = new ProductReviewDAO();
			int totalComment = proReviewDao.getTongDanhGiaByID(productID);
			int soSaoLoai1 = proReviewDao.getTongSoDanhGiaTheoSao(productID, 1);
			int soSaoLoai2 = proReviewDao.getTongSoDanhGiaTheoSao(productID, 2);
			int soSaoLoai3 = proReviewDao.getTongSoDanhGiaTheoSao(productID, 3);
			int soSaoLoai4 = proReviewDao.getTongSoDanhGiaTheoSao(productID, 4);
			int soSaoLoai5 = proReviewDao.getTongSoDanhGiaTheoSao(productID, 5);
			int starAvg = 0;
			if (totalComment != 0) {
				double avg = ((soSaoLoai1 * 1) + (soSaoLoai2 * 2) + (soSaoLoai3 * 3) + (soSaoLoai4 * 4)
						+ (soSaoLoai5 * 5)) / totalComment;
				double lamTron = customRound(avg);
				starAvg = (int) lamTron;
			} else {
				starAvg = 0;
				checkBinhLuan = true;
			}
//			System.out.println(avg);
//			System.out.println(lamTron);
			System.out.println(starAvg);
			List<String> imageStr = getStringImage(dsProLienQuan);
			for (String string : imageStr) {
				System.out.println(string);
			}
			int stockQuantity = proTmp.getStockQuantity();
			System.out.println("số lương" + stockQuantity);
			String pricePro = proTmp.getPrice();
			session.setAttribute("productCurrent", proTmp);
			session.setAttribute("dsLienQuan", dsProLienQuan);

			// phần mô tả
			String[] arrStrDescription = proTmp.getDescription().trim().split("/");
			String[] header = { "Thiết kế cao cấp sang trọng", "Màn hình hiển thị chất lượng",
					"Cấu hình " + proTmp.getName() + " vượt trội" };
			int soPT = arrStrDescription.length;
			System.out.println(soPT);
			// thông số kĩ thuật
			String heDieuHanh = proTmp.getInformationPro().getOs();
			String manHinh = proTmp.getInformationPro().getScreen();
			String matKichCamUng = proTmp.getInformationPro().getGlass();
			String manHinhRong = proTmp.getInformationPro().getScreenSize();
			String doPhanGiai = proTmp.getInformationPro().getResolution();
			String ram = proTmp.getInformationPro().getRam();
			String memoryStr = proTmp.getInformationPro().getMemory();
			String CPU = proTmp.getInformationPro().getCpu();
			String gpu = proTmp.getInformationPro().getGpu();
			String camera = proTmp.getInformationPro().getCamera();
			String cameraSefies = proTmp.getInformationPro().getCameraSelfies();
			String sim = proTmp.getInformationPro().getSim();
			String theNhoNgoai = proTmp.getInformationPro().getMemoryCard();
			String dungLuongPin = proTmp.getInformationPro().getBattery();
			String color = proTmp.getInformationPro().getColor();
			// Đánh giá và nhận xét
			// Danh sách các productreview
			List<ProductReview> lst = new ArrayList<ProductReview>();
			if (totalComment != 0) {
				lst = proReviewDao.getTongBinhLuanById(productID);
			}
			// sản phẩm liên quan
			List<Product> dsSanPhamLQ = proDao.getDanhSachSanPhamLQNgauNhien(proTmp);
			User user2 = (User) session.getAttribute("khachHang");
			if (user2 != null) {
				ProductFavoriteDAO productFaDao = new ProductFavoriteDAO();
				int lstProductFavoriteDao = productFaDao.getSoLuong2(user2.getUserID());
				request.setAttribute("soLuongSanPhamLike", lstProductFavoriteDao);
				ListOrderDetailsItem li = (ListOrderDetailsItem) session.getAttribute("listItem");
				if (li != null) {
					String slSP = li.getList().size() + "";
					slSP = (slSP == "0") ? "0" : slSP;
					request.setAttribute("soLuongSP", slSP);
				} else {
					request.setAttribute("soLuongSP", "0");
				}
			}

			// setAttributes
			// phần đầu
			request.setAttribute("productTmp", proTmp);
			request.setAttribute("linkImg", link);
			request.setAttribute("colorCurrent", colorCurrentTmp);
			request.setAttribute("memoryCurrent", memoryCurrentTmp);
			request.setAttribute("memoryStr", memory);
			request.setAttribute("lstColor", lstColor);
			request.setAttribute("stockQuantity", stockQuantity);
			request.setAttribute("tongSoDanhGia", totalComment);
			request.setAttribute("startAvg", starAvg);
			request.setAttribute("imgString", imageStr);
			request.setAttribute("checkBinhLuan", checkBinhLuan);
			request.setAttribute("soSaoLoai1", soSaoLoai1);
			request.setAttribute("soSaoLoai2", soSaoLoai2);
			request.setAttribute("soSaoLoai3", soSaoLoai3);
			request.setAttribute("soSaoLoai4", soSaoLoai4);
			request.setAttribute("soSaoLoai5", soSaoLoai5);
			request.setAttribute("imageAnh", proTmp.getImage());
			// mô tả
			request.setAttribute("arrDescription", arrStrDescription);
			request.setAttribute("soPhanTuDes", Integer.valueOf(soPT - 1));
			request.setAttribute("header", header);
			// thông số kĩ thuật
			request.setAttribute("heDieuHanh", heDieuHanh);
			request.setAttribute("manHinh", manHinh);
			request.setAttribute("matKichCamUng", matKichCamUng);
			request.setAttribute("manHinhRong", manHinhRong);
			request.setAttribute("doPhanGiai", doPhanGiai);
			request.setAttribute("ram", ram);
			request.setAttribute("memoryStr2", memoryStr);
			request.setAttribute("CPU", CPU);
			request.setAttribute("GPU", gpu);
			request.setAttribute("camera", camera);
			request.setAttribute("cameraSefies", cameraSefies);
			request.setAttribute("sim", sim);
			request.setAttribute("theNhoNgoai", theNhoNgoai);
			request.setAttribute("dungLuongPin", dungLuongPin);
			request.setAttribute("color", color);

			// đánh giá nhận xét
			request.setAttribute("danhSachDanhGia", lst);

			// danh sách sản phẩm liên quan
			request.setAttribute("danhSachSanPhamLienQuan", dsSanPhamLQ);

			// dữ liệu từ servlet khác
			if (sourceServlet.equalsIgnoreCase("DisplayCommentProduct")) {
				request.setAttribute("kiemTraComment", checkComment);
				request.setAttribute("thongBao", baoLoi);
				request.setAttribute("sourceServlet", "DisplayCommentProduct");
			} else if (sourceServlet.equalsIgnoreCase("DisplayCommentProductNotUser")) {
				request.setAttribute("kiemTraComment", checkComment1);
				request.setAttribute("thongBao", baoLoi);
				request.setAttribute("sourceServlet", "DisplayCommentProductNotUser");
			} else if (sourceServlet.equalsIgnoreCase("DisplayCommentProductEmailError")) {
				request.setAttribute("kiemTraComment", checkComment2);
				request.setAttribute("thongBao", baoLoi);
				request.setAttribute("sourceServlet", "DisplayCommentProductEmailError");
			} else if (sourceServlet.equalsIgnoreCase("LoadPageProSingleMemoryColor")) {
				request.setAttribute("kiemTraComment", checkMemoryColor);
				System.out.println("gâu gâu gâu gâu ");
				request.setAttribute("thongBao", baoLoi);
				System.out.println(checkMemoryColor);
				System.out.println(baoLoi);
				request.setAttribute("sourceServlet", "LoadPageProSingleMemoryColor");
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/product-single.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private List<String> getStringImage(List<Product> dsProLienQuan) {
		// TODO Auto-generated method stub
		List<String> lst = new ArrayList<String>();
		for (Product pro : dsProLienQuan) {
			String img = pro.getImage();
			if (lst.contains(img)) {
				continue;
			} else {
				lst.add(img);
			}
		}
		return lst;
	}

	private List<String> getStringColor(List<Product> dsProLienQuan) {
		// TODO Auto-generated method stub
		List<String> lst = new ArrayList<String>();
		for (Product pro : dsProLienQuan) {
			String ans = pro.getInformationPro().getColor();
			if (lst.contains(ans)) {
				continue;
			} else {
				lst.add(ans);
			}
		}
		return lst;
	}

	private List<String> getStringMemory(List<Product> dsProLienQuan) {
		// TODO Auto-generated method stub
		List<String> lst = new ArrayList<String>();
		for (Product product : dsProLienQuan) {
			String ans = product.getInformationPro().getMemory();
			if (lst.contains(ans)) {
				continue;
			} else {
				lst.add(ans);
			}
		}
		return lst;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public static double customRound(double number) {
		if (number % 1 == 0) { // Nếu là số nguyên
			return number;
		} else if (number < Math.ceil(number) - 0.5) { // Nếu < x.5, làm tròn xuống
			return Math.floor(number);
		} else { // Nếu >= x.5, làm tròn lên
			return Math.ceil(number);
		}
	}

	public static void main(String[] args) {
		// System.out.println(customRound(3.5));
		List<String> li = new ArrayList<String>();
		li.add("adasd");
		li.add("sdds");
		long m = 1;
		// System.out.println(li.get(m));
	}

}
