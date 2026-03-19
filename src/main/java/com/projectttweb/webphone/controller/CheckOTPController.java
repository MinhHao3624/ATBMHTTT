package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/check-OTP")
public class CheckOTPController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String soNgauNhien = request.getParameter("soNgauNhien");
		String maOTP = request.getParameter("maOTP");
		String captchaInput = request.getParameter("captcha");
		String generatedCaptcha = (String) session.getAttribute("captcha");
		String baoLoi = "";

		// Kiểm tra số lần nhập sai
		Integer attemptCount = (Integer) session.getAttribute("otpAttemptCount");
		if (attemptCount == null) {
			attemptCount = 0;
		}

		// Kiểm tra thời gian chờ
		Long lastAttemptTime = (Long) session.getAttribute("lastAttemptTime");
		long currentTime = System.currentTimeMillis();

		if (lastAttemptTime != null && (currentTime - lastAttemptTime) < 10000) { // 10 giây
			baoLoi = "Vui lòng đợi 10 giây trước khi thử lại.";
			request.setAttribute("soNgauNhien", soNgauNhien);
			request.setAttribute("sourceServlet", "checkOTPController");
			request.setAttribute("baoLoi", baoLoi);
			request.setAttribute("showCaptcha", attemptCount >= 1);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkOTP.jsp");
			rd.forward(request, response);
			return;
		}

		// Kiểm tra OTP
		if (maOTP.trim().equals(soNgauNhien.trim())) {
			// Kiểm tra captcha nếu đã nhập sai ít nhất 1 lần
			if (attemptCount >= 1) {
				if (captchaInput == null || !captchaInput.equals(generatedCaptcha)) {
					baoLoi = "Mã captcha không chính xác.";
					request.setAttribute("soNgauNhien", soNgauNhien);
					request.setAttribute("sourceServlet", "checkOTPController");
					request.setAttribute("baoLoi", baoLoi);
					request.setAttribute("showCaptcha", true);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkOTP.jsp");
					rd.forward(request, response);
					return;
				}
			}

			// Xác thực thành công
			session.removeAttribute("otpAttemptCount");
			session.removeAttribute("lastAttemptTime");
			session.removeAttribute("captcha");
			request.setAttribute("sourceServlet", "checkOTPController");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/get-password.jsp");
			rd.forward(request, response);
		} else {
			// Tăng số lần nhập sai
			attemptCount++;
			session.setAttribute("otpAttemptCount", attemptCount);
			session.setAttribute("lastAttemptTime", currentTime);

			// Tạo captcha nếu đây là lần nhập sai thứ 2 trở đi
			if (attemptCount >= 1) {
				String captcha = generateCaptcha();
				session.setAttribute("captcha", captcha);
			}

			baoLoi = "Mã OTP không chính xác. " + (attemptCount >= 1 ? "Vui lòng đợi 10 giây trước khi thử lại." : "");
			request.setAttribute("soNgauNhien", soNgauNhien);
			request.setAttribute("sourceServlet", "checkOTPController");
			request.setAttribute("baoLoi", baoLoi);
			request.setAttribute("showCaptcha", attemptCount >= 1);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkOTP.jsp");
			rd.forward(request, response);
		}
	}

	private String generateCaptcha() {
		// Tạo captcha ngẫu nhiên 6 ký tự
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder captcha = new StringBuilder();
		for (int i = 0; i < 6; i++) {
			int index = (int) (Math.random() * chars.length());
			captcha.append(chars.charAt(index));
		}
		return captcha.toString();
	}
}