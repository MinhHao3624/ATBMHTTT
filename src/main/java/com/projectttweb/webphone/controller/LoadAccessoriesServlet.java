package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectttweb.webphone.database.AccessoryDAO;
import com.projectttweb.webphone.model.Accessory;

@WebServlet("/load-accessories")
public class LoadAccessoriesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int ITEMS_PER_PAGE = 6;
    private AccessoryDAO accessoryDAO;

    @Override
    public void init() throws ServletException {
        accessoryDAO = new AccessoryDAO(); // Khởi tạo DAO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy các tham số từ request
        String category = request.getParameter("category") != null ? request.getParameter("category") : "Tatca";
        String type = request.getParameter("type") != null ? request.getParameter("type") : "Tatca";
        String brand = request.getParameter("brand") != null ? request.getParameter("brand") : "Tatca";
        String price = request.getParameter("price") != null ? request.getParameter("price") : "Tatca";
        int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        int offset = (page - 1) * ITEMS_PER_PAGE;

        try {
            // Gọi DAO để lấy danh sách phụ kiện
            List<Accessory> listAccessories = accessoryDAO.getAccessories(type, brand, price, offset, ITEMS_PER_PAGE);

            // Tính tổng số trang
            int totalItems = accessoryDAO.getTotalAccessories(type, brand, price);
            int totalPages = (int) Math.ceil((double) totalItems / ITEMS_PER_PAGE);

            // Đặt các thuộc tính để gửi đến JSP
            request.setAttribute("listAccessories", listAccessories);
            request.setAttribute("accessoryCategory", category);
            request.setAttribute("accessoryType", type);
            request.setAttribute("accessoryBrand", brand);
            request.setAttribute("accessoryPrice", price);
            request.setAttribute("currentPage", page);
            request.setAttribute("tongSoTrang", totalPages);

            // Chuyển tiếp đến JSP
            request.getRequestDispatcher("accessories-list.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}