package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.model.Product;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 // Lấy từ khóa tìm kiếm từ client
		System.out.println("Request URI: " + request.getRequestURI());
		System.out.println("Query string: " + request.getQueryString());
		System.out.println("Parameter q: " + request.getParameter("q"));

        String keyword = request.getParameter("ans");
        System.out.println(keyword);
        ProductDao proDao = new ProductDao();
        // Tạo danh sách sản phẩm giả lập
        List<com.projectttweb.webphone.model.Product> products = proDao.getProductSuggestions(keyword);

        // Cấu hình phản hồi trả về JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Sử dụng Gson để chuyển đối tượng Java thành JSON
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        out.print(gson.toJson(products));
        out.flush();
    }

   //  Hàm giả lập để tìm sản phẩm theo từ khóa
    private List<Product> getProductSuggestions(String keyword) {
        List<Product> allProducts = new ArrayList<>();
        
        // Thêm sản phẩm vào danh sách giả lập
        allProducts.add(new Product("Chuột không dây Logitech MX Master 2S"));
        allProducts.add(new Product("Chuột gaming Logitech G304 Lightspeed"));
        allProducts.add(new Product("Chuột có dây Logitech G102 Lightsync"));
        allProducts.add(new Product("Điện thoại iPhone 13"));
        allProducts.add(new Product("Điện thoại Samsung Galaxy A52"));

        // Danh sách kết quả tìm kiếm
        List<Product> results = new ArrayList<>();
        
        // Kiểm tra sản phẩm có chứa từ khóa hay không
        for (Product product : allProducts) {
            if (product.getName().toLowerCase().contains(keyword.toLowerCase())) {
                results.add(product);
            }
        }

        return results;
    }

    // Định nghĩa lớp sản phẩm
    class Product {
        private String name;

        public Product(String name) {
            this.name = name;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
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
