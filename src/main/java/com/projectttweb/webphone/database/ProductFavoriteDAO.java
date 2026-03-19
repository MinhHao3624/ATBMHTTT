package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.projectttweb.webphone.model.ProductFavorite;
import com.projectttweb.webphone.model.ProductReview;

public class ProductFavoriteDAO implements DAOInterface<ProductFavorite> {

	@Override
	public ArrayList<ProductFavorite> selectAll() {
		// TODO Auto-generated method stub
		ArrayList<ProductFavorite> lst = new ArrayList<ProductFavorite>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM productfavorite";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet res = st.executeQuery();
			while (res.next()) {
				ProductDao proDao = new ProductDao();
				UserDao userDao = new UserDao();
				String productFavoriteID = res.getString("productfavoriteID");
				String productID = res.getString("productID");
				String userID = res.getString("userID");
				ProductFavorite proFavorite = new ProductFavorite(productFavoriteID, proDao.getProductByID(productID),
						userDao.selectUserById(userID));
				lst.add(proFavorite);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public ProductFavorite selectById(ProductFavorite t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(ProductFavorite t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAll(ArrayList<ProductFavorite> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(ProductFavorite t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<ProductFavorite> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ProductFavorite t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<ProductFavorite> getLstProFavorite(String userID) {
		// TODO Auto-generated method stub
		List<ProductFavorite> lstAns = new ArrayList<ProductFavorite>();
		try {
			ArrayList<ProductFavorite> li = selectAll();
			for (ProductFavorite productFavorite : li) {
				if (productFavorite.getUser().getUserID().equalsIgnoreCase(userID.trim())) {
					lstAns.add(productFavorite);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lstAns;
	}

	public static void main(String[] args) {
		ProductFavoriteDAO proDao = new ProductFavoriteDAO();
		List<ProductFavorite> li = proDao.getLstProFavorite("1733249055174");
		for (ProductFavorite productFavorite : li) {
			System.out.println(productFavorite.getProduct().getName());
		}
	}

	public boolean selectProductFavorite2(String productID, String userID) {
		// TODO Auto-generated method stub
		boolean res = false;
		try {
			ArrayList<ProductFavorite> lstAll = selectAll();
			for (ProductFavorite productFavorite : lstAll) {
				if (productFavorite.getProduct().getProductID().equalsIgnoreCase(productID)
						&& productFavorite.getUser().getUserID().equalsIgnoreCase(userID)) {
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

	public boolean selectProductFavorite(String productID, String userID) {
		boolean res = false;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM productfavorite WHERE productID = ? AND userID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, productID);
			stm.setString(2, userID);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				res = true;
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public int insertProduct(String productID, String userID, String proFAID) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO productfavorite (productfavoriteID, productID, userID) VALUES (?,?,?)";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, proFAID);
			stm.setString(2, productID);
			stm.setString(3, userID);
			res = stm.executeUpdate();
			System.out.println("Bạn đã thực thi câu lệnh " + sql);
			System.out.println("Có kết quả dòng change " + res);
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public String selectSttLastNext() {
		// TODO Auto-generated method stub
		String res = "";
		String mess = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM productfavorite ORDER BY productfavoriteID DESC LIMIT 1";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet result = stm.executeQuery();
			while (result.next()) {
				ProductDao proDao = new ProductDao();
				UserDao userDao = new UserDao();
				String productfavoriteID = result.getString("productfavoriteID");
				String productID = result.getString("productID");
				String userID = result.getString("userID");
				ProductFavorite pro = new ProductFavorite(productfavoriteID, proDao.selectProByID(productID),
						userDao.selectUserById(userID));
				res = pro.getProductFavoriteID();
				break;
			}
			String res2 = "";
			boolean mo = false;
			for (int i = 0; i < res.length(); i++) {
				if (res.charAt(i) != '0' || mo) {
					res2 += res.charAt(i);
					mo = true;
				}
			}
			int num = Integer.valueOf(res2);
			num++;
			if (num < 10) {
				mess = "000" + num;
			} else if (num < 100) {
				mess = "00" + num;
			} else if (num < 1000) {
				mess = "0" + num;
			} else {
				mess = "" + num;
			}

			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return mess;
	}

	public int getSoLuong(String userID) {
		// TODO Auto-generated method stub
		int count = 0;
		try {
			ArrayList<ProductFavorite> res = selectAll();
			for (ProductFavorite productFavorite : res) {
				if (productFavorite.getUser().getUserID().equalsIgnoreCase(userID)) {
					count++;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return count;
	}

	public int getSoLuong2(String userID) {
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM productfavorite WHERE userID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, userID);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				res++;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public int deleteProFavoriteInList(String productID, String userID) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM productfavorite WHERE productID = ? AND userID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, productID.trim());
			stm.setString(2, userID.trim());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

}
