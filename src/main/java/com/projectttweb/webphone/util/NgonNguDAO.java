package com.projectttweb.webphone.util;

import java.util.LinkedHashMap;
import java.util.Map;

public class NgonNguDAO {
public Map<String, String> englishLanguage() {
	Map<String, String> map = new LinkedHashMap<String, String>();
	map.put("Login.Search", "Search Products");
	map.put("Login.TaiKhoan", "Account");
	map.put("Login.DangNhap", "Login");
	map.put("Login.TrangChu", "Home");
	map.put("Login.DienThoai", "Phone");
	map.put("Login.ThongTin", "Information");
	map.put("Login.BaiViet", "Article");
	map.put("Login.LienHe", "Contact,Support");
	
	map.put("Login.TenDangNhap", "Username");
	map.put("Login.MatKhau", "Password");
	
	map.put("Login.DangKy", "Sign up");
	map.put("Login.QuenMK", "Forgot password");
	
	map.put("Login.Other1", "Or Login with");
	
	
	map.put("Login.MucDoUyTin", "level of prestige");
	map.put("Login.text1", "Rated as the safest and most reliable in Vietnam with many customer care support policies.");
	
	map.put("Login.Other2", "Instant Payment!");
	map.put("Login.text2", "Pay anytime, anywhere, fast, secure, safe transactions, with links to 90% of banks, wallets, and VISA nationwide!");
	
	map.put("Login.Other3", "attractive offer");
	map.put("Login.text3", "With the desire to satisfy customers, Mobistore always brings extremely good deals with high quality.");
	
	return map;
}
public Map<String, String> vietnameseLanguage() {
	Map<String, String> map2 = new LinkedHashMap<String, String>();
	map2.put("Login.Search", "Tìm kiếm sản phẩm");
	map2.put("Login.TaiKhoan", "Tài khoản");
	map2.put("Login.DangNhap", "Đăng nhập");
	map2.put("Login.TrangChu", "Trang chủ");
	map2.put("Login.DienThoai", "Điện thoại");
	map2.put("Login.ThongTin", "Thông tin");
	map2.put("Login.BaiViet", "Bài viết");
	map2.put("Login.LienHe", "Liên hệ,Hỗ trợ");
	
	map2.put("Login.TenDangNhap", "Tên đăng nhập");
	map2.put("Login.MatKhau", "Mật khẩu");
	
	map2.put("Login.DangKy", "Đăng ký");
	map2.put("Login.QuenMK", "Quên mật khẩu");
	
	map2.put("Login.Other1", "Hoặc đăng nhập với");
	
	
	map2.put("Login.MucDoUyTin", "Mức độ uy tín!");
	map2.put("Login.text1", "Được đánh giá an toàn, tin cậy hàng đầu Việt Nam với nhiều chính sách hỗ trợ chăm sóc khách hàng.");
	
	map2.put("Login.Other2", "Thanh toán tức thì!");
	map2.put("Login.text2", "Thanh toán mọi nơi mọi lúc, giao dịch nhanh gọn, bảo đảm, an toàn, với liên kết 90% ngân hàng, ví tiền, VISA trong toàn quốc!");
	
	map2.put("Login.Other3", "Ưu đãi hấp dẫn!");
	map2.put("Login.text3", "Với mong muốn làm hài lòng khách hàng, Mobistore luôn mang đến những ưu đãi cực kỳ tốt với chất lượng cao");
	return map2;
}

}
