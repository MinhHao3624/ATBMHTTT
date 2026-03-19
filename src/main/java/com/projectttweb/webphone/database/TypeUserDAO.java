package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.projectttweb.webphone.model.TypeUser;

public class TypeUserDAO implements DAOInterface<TypeUser>{

	@Override
	public ArrayList<TypeUser> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TypeUser selectById(TypeUser t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(TypeUser t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAll(ArrayList<TypeUser> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(TypeUser t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<TypeUser> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(TypeUser t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public String selectNameTypeUs(String type) {
		// TODO Auto-generated method stub
		String ans = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM typeuser WHERE id = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, type.trim());
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				ans = rs.getString("typename");
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

}
