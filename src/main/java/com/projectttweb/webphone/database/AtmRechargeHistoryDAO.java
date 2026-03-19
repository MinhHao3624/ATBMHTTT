package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.projectttweb.webphone.model.AtmRechargeHistory;

public class AtmRechargeHistoryDAO implements DAOInterface<AtmRechargeHistory>{

	@Override
	public ArrayList<AtmRechargeHistory> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AtmRechargeHistory selectById(AtmRechargeHistory t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(AtmRechargeHistory t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAll(ArrayList<AtmRechargeHistory> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(AtmRechargeHistory t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<AtmRechargeHistory> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(AtmRechargeHistory t) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO atmrechargehistory (id, userID, amountbeforedesposit, amountdesposit, amountafterdesposit, date, status, bank, numaccount, pincode) VALUES (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, t.getiD());
			stm.setString(2, t.getUserID().getUserID());
			stm.setString(3, t.getAmountBeforeDesposit());
			stm.setString(4, t.getAmountDesposit());
			stm.setString(5, t.getAmountAfterDesposit());
			stm.setDate(6, t.getDate());
			stm.setString(7, t.getStatus());
			stm.setString(8, t.getBank());
			stm.setString(9, t.getNumAccount());
			stm.setString(10, t.getPinCode());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public String selectIDCur() {
		// TODO Auto-generated method stub
		String res = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM atmrechargehistory ORDER BY id DESC LIMIT 1";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				res = rs.getString("id");
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public String getSoTienAtm(String userID, Date todaysDate) {
		// TODO Auto-generated method stub
		String ans = "";
		List<AtmRechargeHistory> listAll = new ArrayList<AtmRechargeHistory>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM atmrechargehistory WHERE userID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, userID.trim());
			ResultSet rs = stm.executeQuery();
			UserDao userDao = new UserDao();
			while(rs.next()) {
				String iD = rs.getString("id");
				String userId = rs.getString("userID");
				String amountBefore = rs.getString("amountbeforedesposit");
				String amount = rs.getString("amountdesposit");
				String amountAfter = rs.getString("amountafterdesposit");
				Date date = rs.getDate("date");
				String status = rs.getString("status");
				String bank = rs.getString("bank");
				String numAccount = rs.getString("numaccount");
				String pinCode = rs.getString("pincode");
				AtmRechargeHistory atmRechargeHistory = new AtmRechargeHistory(iD, userDao.selectById3(userId), amountBefore, amount, amountAfter, date, status, bank, numAccount, pinCode);
				listAll.add(atmRechargeHistory);
			}
			int soTienNap = 0;
			 // Sử dụng Calendar để trừ đi 1 tháng
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(todaysDate);
	        cal.add(Calendar.MONTH, -1); // Trừ 1 tháng

	        // Lấy ngày tháng năm mới
	        Date previousMonthDate = new Date(cal.getTimeInMillis());
			for (AtmRechargeHistory atmRechargeHistory : listAll) {
				if(atmRechargeHistory.getDate().getTime() <= todaysDate.getTime() && atmRechargeHistory.getDate().getTime() >= previousMonthDate.getTime()) {
					soTienNap += Integer.parseInt(atmRechargeHistory.getAmountDesposit());
				}
			}
			ans = String.valueOf(soTienNap);
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	public List<AtmRechargeHistory> selectListAtmByID(String userID) {
		// TODO Auto-generated method stub
		List<AtmRechargeHistory> lst = new ArrayList<AtmRechargeHistory>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM atmrechargehistory WHERE userID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, userID);
			ResultSet rs = stm.executeQuery();
			UserDao userDao = new UserDao();
			while(rs.next()) {
				String iD = rs.getString("id");
				String userID2 = rs.getString("userID");
				String amountBefore = rs.getString("amountbeforedesposit");
				String amount = rs.getString("amountdesposit");
				String amountAfter = rs.getString("amountafterdesposit");
				Date date = rs.getDate("date");
				String status = rs.getString("status");
				String bank = rs.getString("bank");
				String numAccount = rs.getString("numaccount");
				String pinCode = rs.getString("pincode");
				AtmRechargeHistory atmRechargeHistory = new AtmRechargeHistory(iD, userDao.selectById3(userID2), amountBefore, amount, amountAfter, date, status, bank, numAccount, pinCode);
				lst.add(atmRechargeHistory);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

}
