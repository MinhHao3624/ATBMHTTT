package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.projectttweb.webphone.model.CustomerFeedback;

public class CustomerFeedBackDAO implements DAOInterface<CustomerFeedback>{

	@Override
	public ArrayList<CustomerFeedback> selectAll() {
		// TODO Auto-generated method stub
		ArrayList<CustomerFeedback> ans = new ArrayList<CustomerFeedback>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM customerfeedback";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			UserDao usDAO = new UserDao();
			while(rs.next()) {
				String fBID = rs.getString("feedbackID");
				String usID = rs.getString("userID");
				Date date = rs.getDate("createAt");
				String title = rs.getString("titlemessage");
				String messageUser = rs.getString("messageUser");
				String messageAdmin = rs.getString("messageAdmin");
				CustomerFeedback cusFB = new CustomerFeedback(fBID, usDAO.selectUserById(usID), date, title, messageUser, messageAdmin);
				ans.add(cusFB);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	@Override
	public CustomerFeedback selectById(CustomerFeedback t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(CustomerFeedback t) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO customerfeedback (feedbackID, userID, createAt, titlemessage, messageUser, messageAdmin) VALUES (?,?,?,?,?,?)";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, t.getFeedID());
			stm.setString(2, t.getUser().getUserID());
			stm.setDate(3, t.getCreateAt());
			stm.setString(4, t.getTitleMessage());
			stm.setString(5, t.getMessageUser());
			stm.setString(6, t.getMessageAdmin());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertAll(ArrayList<CustomerFeedback> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(CustomerFeedback t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<CustomerFeedback> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(CustomerFeedback t) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE customerfeedback SET messageAdmin = ? WHERE feedbackID=?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, t.getMessageAdmin());
			stm.setString(2, t.getFeedID());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exceptione
			e.printStackTrace();
		}
		return res;
	}

	public String getfeedBackIDCur() {
		// TODO Auto-generated method stub
		String ans = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM customerfeedback ORDER BY feedbackID DESC LIMIT 1";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				String feedID = rs.getString("feedbackID");
				ans = feedID;
				break;
			}
			JDBCUtil.closeConnection(con);;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	public boolean kiemTraIsFB(String userID) {
		// TODO Auto-generated method stub
		boolean res = false;
		try {
			ArrayList<CustomerFeedback> ans = selectAll();
			for (CustomerFeedback customerFeedback : ans) {
				if(customerFeedback.getUser().getUserID().equalsIgnoreCase(userID)) {
					res = true;
					break;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public ArrayList<CustomerFeedback> selectByIDAndPage(String userID, String page) {
		// TODO Auto-generated method stub
		ArrayList<CustomerFeedback> ans = new ArrayList<CustomerFeedback>();
			try {
				ArrayList<CustomerFeedback> lst = selectAll();
				ArrayList<CustomerFeedback> lstRevert = new ArrayList<CustomerFeedback>();
				ArrayList<CustomerFeedback> lstReal = new ArrayList<CustomerFeedback>();
				for (int i = lst.size() - 1; i >= 0; i--) {
					lstRevert.add(lst.get(i));
				}
				for (CustomerFeedback fb : lstRevert) {
					if(fb.getUser().getUserID().equalsIgnoreCase(userID.trim())) {
						lstReal.add(fb);
					}
				}
				int end = Integer.parseInt(page) * 4;
				int start = end - 4;
				int count = 0;
				for (int i = start; i < lstReal.size(); i++) {
					ans.add(lstReal.get(i));
					count++;
					if(count == 4) {
						break;
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return ans;
		
	}

	public int getTongSoFB(String userID) {
		// TODO Auto-generated method stub
		int ans = 0;
		try {
			ArrayList<CustomerFeedback> lst = selectAll();
			for (CustomerFeedback fb : lst) {
				if(fb.getUser().getUserID().equalsIgnoreCase(userID.trim())) {
					ans++;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	public CustomerFeedback selectByIDFB(String fbID) {
		// TODO Auto-generated method stub
		CustomerFeedback fb = null;
		try {
			ArrayList<CustomerFeedback> all = selectAll();
			for (CustomerFeedback customerFeedback : all) {
				if(customerFeedback.getFeedID().equalsIgnoreCase(fbID)) {
					fb = customerFeedback;
					break;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return fb;
	}

	public int removeFeedBack(String fbID) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM customerfeedback WHERE feedbackID=?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, fbID.trim());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

}
