package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.projectttweb.webphone.model.Transaction;

public class TransactionDAO implements DAOInterface<Transaction> {

	@Override
	public ArrayList<Transaction> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Transaction selectById(Transaction t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Transaction t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAll(ArrayList<Transaction> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Transaction t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<Transaction> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Transaction t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public String getTranIDCur() {
		// TODO Auto-generated method stub
		String iD = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT transactionID FROM transactions ORDER BY transactionID DESC LIMIT 1";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				iD = rs.getString("transactionID");
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return iD;
	}

	public int capNhatGiaoDichisSuccess(Transaction trans) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO transactions (transactionID, orderID, paymentMethods, paymentStatus, tracsactionDate) VALUES (?,?,?,?,?)";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, trans.getTransactionID());
			stm.setString(2, trans.getOrder().getOrderID());
			stm.setString(3, trans.getPaymentMethods());
			stm.setString(4, trans.getPaymentStatus());
			stm.setDate(5, trans.getTransactionDate());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public Transaction selectTranByOrderID(String orderID) {
		// TODO Auto-generated method stub
		Transaction trans = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM transactions WHERE orderID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, orderID);
			ResultSet rs = stm.executeQuery();
			OrdersDAO odDAO = new OrdersDAO();
			while(rs.next()) {
				String tranID = rs.getString("transactionID");
				String orderID2 = rs.getString("orderID");
				String payMethods = rs.getString("paymentMethods");
				String payStatus = rs.getString("paymentStatus");
				Date date = rs.getDate("tracsactionDate");
				Transaction trans2 = new Transaction(tranID, odDAO.selectOrderByID2(orderID), payMethods, payStatus, date);
				trans = trans2;
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return trans;
	}

}
