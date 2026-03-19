package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.ProductReview;

public class ProductReviewDAO implements DAOInterface<ProductReview> {

	@Override
	public ArrayList<ProductReview> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductReview selectById(ProductReview t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(ProductReview t) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO productreview (reviewID, userID, productID, rating, comment, createAt) VALUES (?,?,?,?,?,?)";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, t.getReviewID());
			stm.setString(2, t.getUser().getUserID());
			stm.setString(3, t.getProduct().getProductID());
			stm.setInt(4, t.getRating());
			stm.setString(5, t.getComment());
			stm.setDate(6, t.getCreateAt());
			// thực thi câu lệnh
			res = stm.executeUpdate();
			// đóng kết nối
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertAll(ArrayList<ProductReview> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(ProductReview t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<ProductReview> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ProductReview t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getTongDanhGiaByID(String productID) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String query = "SELECT * FROM productreview WHERE productID=?";
			PreparedStatement stm = con.prepareStatement(query);
			stm.setString(1, productID);
			ResultSet result = stm.executeQuery();
			while (result.next()) {
				res++;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public int getTongSoDanhGiaTheoSao(String productID, int i) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String query = "SELECT * FROM productreview WHERE productID=? AND rating=?";
			PreparedStatement stm = con.prepareStatement(query);
			stm.setString(1, productID);
			stm.setInt(2, i);
			ResultSet result = stm.executeQuery();
			while (result.next()) {
				res++;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public List<ProductReview> getTongBinhLuanById(String productID) {
		// TODO Auto-generated method stub
		List<ProductReview> lst = new ArrayList<ProductReview>();

		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM productreview WHERE productID=?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, productID);
			ResultSet result = stm.executeQuery();
			UserDao userDao = new UserDao();
			ProductDao proDao = new ProductDao();
			while (result.next()) {
				String reviewID = result.getString("reviewID");
				String userID = result.getString("userID");
				String proID = result.getString("productID");
				int rating = result.getInt("rating");
				String comment = result.getString("comment");
				Date date = result.getDate("createAt");
				if (date == null) {
					ProductReview proReviewNew = new ProductReview(reviewID, userDao.selectById3(userID),
							proDao.selectProByID2(productID), rating, comment, null);
					lst.add(proReviewNew);
				} else {
					ProductReview proReviewNew = new ProductReview(reviewID, userDao.selectById3(userID),
							proDao.selectProByID2(productID), rating, comment, date);
					lst.add(proReviewNew);
				}

			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	public String selectProductReviewIDLastNext() {
		// TODO Auto-generated method stub
		String mess = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM productreview ORDER BY reviewID DESC LIMIT 1";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet result = stm.executeQuery();
			while (result.next()) {
				mess = result.getString("reviewID");
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return mess;
	}

	public int getSao(int i, String str) {
		// TODO Auto-generated method stub
		int count = 0;
		try {
		    ArrayList<ProductReview> proAll = selectAll();
		    for (ProductReview productReview : proAll) {
				if(productReview.getProduct().getProductID().equalsIgnoreCase(str) && productReview.getRating() == i) {
					count++;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return count;
		
	}

}
