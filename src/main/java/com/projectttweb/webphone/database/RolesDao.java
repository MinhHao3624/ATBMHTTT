package com.projectttweb.webphone.database;

import java.awt.image.Kernel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.projectttweb.webphone.model.Roles;

public class RolesDao implements DAOInterface<Roles> {

	@Override
	public ArrayList<Roles> selectAll() {
		// TODO Auto-generated method stub
		ArrayList<Roles> answer = new ArrayList<Roles>();
		try {
			// b1: Tạo kết nối đến cơ sở dữ liệu
			Connection con = JDBCUtil.getConnection();
			// b2: Tạo đối tượng reparetedStament
			String sql = "SELECT * FROM roles";
			PreparedStatement st = con.prepareStatement(sql);
			// b3: thực thi câu lệnh sql
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			// b4: đọc dữ liệu lên
			while(rs.next()) {
				int roleID = rs.getInt("roleID");
				String roleName = rs.getString("roleName");
				Roles role = new Roles(roleID, roleName);
				answer.add(role);
			}
			//b5: đóng kết nối
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return answer;
	}

	@Override
	public Roles selectById(Roles t) {
		// TODO Auto-generated method stub
		Roles role = null;
		try {
			//b1: Tạo kết nối đến CSDl
			Connection con = JDBCUtil.getConnection();
			//B2: Tạo ra đối tượng statment
			String sql = "SELECT * FROM roles WHERE roleID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getRoleID());
			
			//B3: thực thi câu lệnh sql
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//Bước 4:
			while(rs.next()) {
				int roleID = rs.getInt("roleID");
				String roleName = rs.getString("roleName");
				role = new Roles(roleID, roleName);
				break;
			}
			JDBCUtil.closeConnection(con);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return role;
	}

	@Override
	public int insert(Roles t) {
		// TODO Auto-generated method stub
		int answer = 0;
		try {
			//B1: Tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			//B2: Tạo ra đối tượng statement
			String sql = "INSERT INTO roles (roleID, roleName)" + "VALUES (?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getRoleID());
			st.setString(2, t.getRoleName());
			//B3: thực thi câu lệnh SQL
			answer = st.executeUpdate();
			//B5
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return answer;
	}

	@Override
	public int insertAll(ArrayList<Roles> arr) {
		// TODO Auto-generated method stub
		int dem = 0;
		for (Roles roles : arr) {
			dem += this.insert(roles);
		}
		return dem;
	}

	@Override
	public int delete(Roles t) {
		// TODO Auto-generated method stub
		int ansWer = 0;
		try {
			//B1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			//B2: tạo ra đối tượng statement
			String sql = "DELETE from roles" + "WHERE roleID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getRoleID());
			//B3: thực thi câu lệnh SQL
			System.out.println(sql);
			ansWer = st.executeUpdate();
			//B4:
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ansWer;
	}

	@Override
	public int deleteAll(ArrayList<Roles> arr) {
		// TODO Auto-generated method stub
		int dem = 0;
		for (Roles roles : arr) {
			dem += this.delete(roles);
		}
		return dem;
	}

	@Override
	public int update(Roles t) {
		// TODO Auto-generated method stub
		int ansWer = 0;
		try {
			// Tạo kết nối
			Connection con = JDBCUtil.getConnection();
			//Tạo đối tg statment
			String sql = "UPDATE roles "+" SET "+" roleName=?"+" WHERE roleID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getRoleName());
			st.setInt(2, t.getRoleID());
			// Thực thi câu lệnh
			System.out.println(sql);
			ansWer = st.executeUpdate();
			//B4:
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ansWer;
	}
	public static void main(String[] args) {
		RolesDao roleDao = new RolesDao();
		ArrayList<Roles> list = roleDao.selectAll();
		for (Roles roles : list) {
			System.out.println(roles.toString());
		}
	}

}
