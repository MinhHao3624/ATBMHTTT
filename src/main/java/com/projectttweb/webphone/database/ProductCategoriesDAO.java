package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.projectttweb.webphone.model.ProductCategories;

public class ProductCategoriesDAO implements DAOInterface<ProductCategories> {

	@Override
	public ArrayList<ProductCategories> selectAll() {
		// TODO Auto-generated method stub
		ArrayList<ProductCategories> lst = new ArrayList<ProductCategories>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM productcategories";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				String proCateID = rs.getString("productCategoriesID");
				String nameProCate = rs.getString("nameCategories");
				ProductCategories pro = new ProductCategories(proCateID, nameProCate);
				lst.add(pro);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public ProductCategories selectById(ProductCategories t) {
		// TODO Auto-generated method stub
		ProductCategories proCate = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM productcategories WHERE productCategoriesID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getProductCategoriesID());
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String proCateID = rs.getString("productCategoriesID");
				String nameProCate = rs.getString("nameCategories");
				proCate = new ProductCategories(proCateID, nameProCate);
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return proCate;
	}

	@Override
	public int insert(ProductCategories t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAll(ArrayList<ProductCategories> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(ProductCategories t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<ProductCategories> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ProductCategories t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public String getIDCate(String nameCate) {
		// TODO Auto-generated method stub
		String ans = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM productcategories WHERE nameCategories = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, nameCate.trim());
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				String productCateID = rs.getString("productCategoriesID");
				ans = productCateID;
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	public ProductCategories getProCateByID(String trim) {
		// TODO Auto-generated method stub
		ProductCategories proCate = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM productcategories WHERE productCategoriesID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, trim.trim());
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				String proCateID = rs.getString("productCategoriesID");
				String nameProCate = rs.getString("nameCategories");
				proCate = new ProductCategories(proCateID, nameProCate);
				break;
			}
			JDBCUtil.closeConnection(con);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return proCate;
	}
	

}
