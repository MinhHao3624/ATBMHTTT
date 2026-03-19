package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projectttweb.webphone.database.InformationproductDAO;
import com.projectttweb.webphone.database.ProductDao;
import com.projectttweb.webphone.model.Product;
import com.google.gson.Gson;

/**
 * Servlet implementation class DeleteProductInListControl
 */
@WebServlet("/deleteProductInList")
public class DeleteProductInListControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductInListControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");

	        String productID = request.getParameter("productID");
	        System.out.println(productID+"áaadadad");
	        boolean success = false;
	        String message = "";
	        ProductDao proDAO = new ProductDao();
	        Product pro = proDAO.selectProByID(productID);
	        String infoID = pro.getInformationPro().getInfo_ID();
	        success = proDAO.deleteProductByID(productID);
	        InformationproductDAO infoDAO = new InformationproductDAO();
	        int ans = infoDAO.deleteInfoById(infoID);
	        
	        if (success && ans > 0) {
                message = "Xóa sản phẩm thành công!";
            } else {
                message = "Xóa sản phẩm thất bại!";
            }
	        
	     // Chuyển kết quả thành JSON
	        JsonResponse jsonResponse = new JsonResponse(success, message);
	        PrintWriter out = response.getWriter();
	        Gson gson = new Gson();
	        out.print(gson.toJson(jsonResponse));
	        out.flush();
	        
	        
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public class JsonResponse {
	    public boolean success;
	    public String message;

	    public JsonResponse(boolean success, String message) {
	        this.success = success;
	        this.message = message;
	    }

	    // Getters và Setters
	    public boolean isSuccess() {
	        return success;
	    }

	    public void setSuccess(boolean success) {
	        this.success = success;
	    }

	    public String getMessage() {
	        return message;
	    }

	    public void setMessage(String message) {
	        this.message = message;
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
