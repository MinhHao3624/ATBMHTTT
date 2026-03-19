package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import com.projectttweb.webphone.model.OrderDetails;
import com.projectttweb.webphone.model.Orders;
import com.projectttweb.webphone.model.Product;

public class OrderDetailsDAO implements DAOInterface<OrderDetails> {

	@Override
	public ArrayList<OrderDetails> selectAll() {
		// TODO Auto-generated method stub
		ArrayList<OrderDetails> lst = new ArrayList<OrderDetails>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM orderdetails";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			OrdersDAO orderDAO = new OrdersDAO();
			ProductDao proDao = new ProductDao();
			while (rs.next()) {
				String orderDetailsID = rs.getString("orderDetailsID");
				int quantity = rs.getInt("quantity");
				String orderID = rs.getString("orderID");
				String productID = rs.getString("productID");
				double unitPrice = rs.getDouble("unitPrice");
				OrderDetails orderDetails = new OrderDetails(orderDetailsID, quantity, proDao.selectProByID(productID),
						orderDAO.selectOrderByID(orderID), unitPrice);
				lst.add(orderDetails);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public OrderDetails selectById(OrderDetails t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(OrderDetails t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAll(ArrayList<OrderDetails> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(OrderDetails t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<OrderDetails> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(OrderDetails t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public String getOrderDetailsIDCurrent() {
		// TODO Auto-generated method stub
		String ans = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM orderdetails ORDER BY orderDetailsID DESC LIMIT 1";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			// ProductDao proDAO = new ProductDao();
			// OrdersDAO orderDAO = new OrdersDAO();
			while (rs.next()) {
				String orderDetailsID = rs.getString("orderDetailsID");
//				int quantity = rs.getInt("quantity");
//				String orderID = rs.getString("orderID");
//				String productID = rs.getString("productID");
//				double unitPrice = rs.getDouble("unitPrice");
//				OrderDetails orderDetails = new OrderDetails(orderDetailsID, quantity, proDAO.selectProByID(productID), orderDAO.selectOrderByID(orderID), unitPrice);
				ans = orderDetailsID;
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;

	}

	public int insertOrderDetailsInDB(OrderDetails orderDetails) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO orderdetails (orderDetailsID, quantity, orderID, productID, unitPrice) VALUES (?,?,?,?,?)";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, orderDetails.getOrderDetailsID().trim());
			stm.setInt(2, orderDetails.getQuantity());
			stm.setString(3, orderDetails.getOrder().getOrderID().trim());
			stm.setString(4, orderDetails.getProduct().getProductID().trim());
			stm.setDouble(5, orderDetails.getUnitPrice());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public List<OrderDetails> getListOrderDetails(String orderID) {
		// TODO Auto-generated method stub
		List<OrderDetails> lstAns = new ArrayList<OrderDetails>();
		try {
			ArrayList<OrderDetails> lst = selectAll();
			for (OrderDetails orderDetails : lst) {
				if (orderDetails.getOrder().getOrderID().equalsIgnoreCase(orderID.trim())) {
					lstAns.add(orderDetails);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lstAns;
	}

	public List<OrderDetails> getListOrderDetails2(String orderID2) {
		List<OrderDetails> lst = new ArrayList<OrderDetails>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM orderdetails WHERE orderID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, orderID2);
			OrdersDAO orderDAO = new OrdersDAO();
			ProductDao proDao = new ProductDao();
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				String orderDetailsID = rs.getString("orderDetailsID");
				int quantity = rs.getInt("quantity");
				String orderID = rs.getString("orderID");
				String productID = rs.getString("productID");
				double unitPrice = rs.getDouble("unitPrice");
				OrderDetails orderDetails = new OrderDetails(orderDetailsID, quantity, proDao.selectProByID2(productID),
						orderDAO.selectOrderByID(orderID), unitPrice);
				lst.add(orderDetails);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	public List<Product> selectSoSPDaBanTrongThang(String userID, Date todaysDate) {
		// TODO Auto-generated method stub
		List<Product> li = new ArrayList<Product>();
		List<OrderDetails> list = new ArrayList<OrderDetails>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM orderdetails";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			OrdersDAO ordersDAO = new OrdersDAO();
			ProductDao productDAO = new ProductDao();
			while (rs.next()) {
				String orderDetailsID = rs.getString("orderDetailsID");
				int quantity = rs.getInt("quantity");
				String orderID = rs.getString("orderID");
				String productID = rs.getString("productID");
				double unitPrice = rs.getDouble("unitPrice");
				OrderDetails orderDetails = new OrderDetails(orderDetailsID, quantity,
						productDAO.selectProByID2(productID), ordersDAO.selectOrderByID2(orderID), unitPrice);
				list.add(orderDetails);
			}
			int count = 0;
			Calendar cal = Calendar.getInstance();
			cal.setTime(todaysDate);
			cal.add(Calendar.MONTH, -1); // Trừ 1 tháng

			// Lấy ngày tháng năm mới
			Date previousMonthDate = new Date(cal.getTimeInMillis());
			for (OrderDetails orderDetails : list) {
				if (orderDetails.getOrder().getUser().getUserID().equalsIgnoreCase(userID)) {
					if(orderDetails.getOrder().getOrdersDate().getTime() >= previousMonthDate.getTime() && orderDetails.getOrder().getOrdersDate().getTime() <= todaysDate.getTime()) {
						li.add(orderDetails.getProduct());
					}
				}
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return li;
	}

}
