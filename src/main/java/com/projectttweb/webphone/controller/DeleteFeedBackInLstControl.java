package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import com.projectttweb.webphone.database.CustomerFeedBackDAO;

/**
 * Servlet implementation class DeleteFeedBackInLstControl
 */
@WebServlet("/deleteFeedbackInList")
public class DeleteFeedBackInLstControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFeedBackInLstControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String fbID = request.getParameter("fbID");
			CustomerFeedBackDAO dao = new CustomerFeedBackDAO();
			boolean success = false;
			String mess = "";
            if(dao.removeFeedBack(fbID) > 0) {
            	success = true;
            	mess = "Xóa sản phẩm thành công";
            }
            JsonResponse jsonResponse = new JsonResponse(success, mess);
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
		doGet(request, response);
	}

}
