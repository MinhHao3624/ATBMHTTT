package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.projectttweb.webphone.model.InformationProduct;

public class InformationproductDAO implements DAOInterface<InformationProduct>{

	@Override
	public ArrayList<InformationProduct> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public InformationProduct selectById(InformationProduct t) {
		// TODO Auto-generated method stub
		InformationProduct infor = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM informationproduct WHERE informationProductID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getInfo_ID());
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String proID = rs.getString("informationProductID");
				String os = rs.getString("os");
				String screen = rs.getString("screen");
				String glass = rs.getString("glass");
				String screenSize = rs.getString("screenSize");
				String resolution = rs.getString("resolution");
				String ram = rs.getString("ram");
				String memory = rs.getString("memory");
				String cpu = rs.getString("cpu");
				String gpu = rs.getString("gpu");
				String camera = rs.getString("camera");
				String cameraSef = rs.getString("cameraSelfies");
				String sim = rs.getString("sim");
				String memoryCard = rs.getString("memoryCard");
				String battery = rs.getString("battery");
				String color = rs.getString("color");
				infor = new InformationProduct(proID, os, screen, glass, screenSize, resolution, ram, memory, cpu, gpu, camera, cameraSef, sim, memoryCard, battery, color);
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return infor;
	}

	@Override
	public int insert(InformationProduct t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAll(ArrayList<InformationProduct> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(InformationProduct t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<InformationProduct> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(InformationProduct infoNew) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE informationProduct SET os = ?, screen = ?, glass= ?, screenSize = ?, resolution = ?, ram = ?, memory = ?, cpu = ?, gpu = ?, camera = ?, cameraSelfies = ?, sim = ?, memoryCard = ?, battery = ?, color = ? WHERE informationProductID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, infoNew.getOs());
			stm.setString(2, infoNew.getScreen());
			stm.setString(3, infoNew.getGlass());
			stm.setString(4, infoNew.getScreenSize());
			stm.setString(5, infoNew.getResolution());
			stm.setString(6, infoNew.getRam());
			stm.setString(7, infoNew.getMemory());
			stm.setString(8, infoNew.getCpu());
			stm.setString(9, infoNew.getGpu());
			stm.setString(10, infoNew.getCamera());
			stm.setString(11, infoNew.getCameraSelfies());
			stm.setString(12, infoNew.getSim());
			stm.setString(13, infoNew.getMemoryCard());
			stm.setString(14, infoNew.getBattery());
			stm.setString(15, infoNew.getColor());
			stm.setString(16, infoNew.getInfo_ID());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public String getInforIDCur() {
		// TODO Auto-generated method stub
		String ans = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM informationproduct ORDER BY informationProductID DESC LIMIT 1";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				String inforID = rs.getString("informationProductID");
				ans = inforID;
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	public int insertInforNew(InformationProduct infoNew) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO informationproduct (informationProductID, os, screen, glass, screenSize, resolution, ram, memory, cpu, gpu, camera, cameraSelfies, sim, memoryCard, battery, color) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, infoNew.getInfo_ID());
			stm.setString(2, infoNew.getOs());
			stm.setString(3, infoNew.getScreen());
			stm.setString(4, infoNew.getGlass());
			stm.setString(5, infoNew.getScreenSize());
			stm.setString(6, infoNew.getResolution());
			stm.setString(7, infoNew.getRam());
			stm.setString(8, infoNew.getMemory());
			stm.setString(9, infoNew.getCpu());
			stm.setString(10, infoNew.getGpu());
			stm.setString(11, infoNew.getCamera());
			stm.setString(12, infoNew.getCameraSelfies());
			stm.setString(13, infoNew.getSim());
			stm.setString(14, infoNew.getMemoryCard());
			stm.setString(15, infoNew.getBattery());
			stm.setString(16, infoNew.getColor());
			res = stm.executeUpdate();
			System.out.println("Bạn đã tt "+sql);
			System.out.println("Có kq "+res+ "change");
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public InformationProduct selectByIDNew(String inforNext) {
		// TODO Auto-generated method stub
		InformationProduct info = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM informationproduct WHERE informationProductID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, inforNext.trim());
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				String proID = rs.getString("informationProductID");
				String os = rs.getString("os");
				String screen = rs.getString("screen");
				String glass = rs.getString("glass");
				String screenSize = rs.getString("screenSize");
				String resolution = rs.getString("resolution");
				String ram = rs.getString("ram");
				String memory = rs.getString("memory");
				String cpu = rs.getString("cpu");
				String gpu = rs.getString("gpu");
				String camera = rs.getString("camera");
				String cameraSef = rs.getString("cameraSelfies");
				String sim = rs.getString("sim");
				String memoryCard = rs.getString("memoryCard");
				String battery = rs.getString("battery");
				String color = rs.getString("color");
				info = new InformationProduct(proID, os, screen, glass, screenSize, resolution, ram, memory, cpu, gpu, camera, cameraSef, sim, memoryCard, battery, color);
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return info;
		
	}

	public int deleteInfoById(String infoID) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM informationproduct WHERE informationProductID=?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, infoID);
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

}
