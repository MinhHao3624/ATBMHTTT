package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.Roles;
import com.projectttweb.webphone.model.User;
import com.projectttweb.webphone.util.MaHoa;

public class UserDao implements DAOInterface<User> {

	@Override
	public ArrayList<User> selectAll() {
		// TODO Auto-generated method stub
		ArrayList<User> answer = new ArrayList<User>();
		try {
			// B1: Tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			// B2: Tạo ra đổi tượng Statment
			String sql = "SELECT * FROM user";
			PreparedStatement st = con.prepareStatement(sql);
			// B3: Thực thi câu lênh sql
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			// B4:
			while (rs.next()) {
				String userID = rs.getString("userID");
				String userName = rs.getString("userName");
				String passWord = rs.getString("passWord");
				String fullName = rs.getString("fullName");
				String email = rs.getString("email");
				String phone = rs.getString("phoneNumber");
				int roleID = rs.getInt("roleID");
				Roles role = new Roles();
				role.setRoleID(roleID);
				Roles roles = new RolesDao().selectById(role);
				Date date = rs.getDate("createAt");
				String image = rs.getString("image");
				String key = rs.getString("isKey");
				User user = new User(userID, userName, passWord, fullName, email, phone, roles, date, userName, phone,
						date, image, key);
				answer.add(user);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return answer;
	}

	@Override
	public User selectById(User t) {
		// TODO Auto-generated method stub
		User ansWer = null;
		try {
			Connection con = JDBCUtil.getConnection();
			// Tạo đối tg statment
			String sql = "SELECT * FROM user " + " WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getUserID());
			// B3: Thuc thi câu lệnh sql
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String userID = rs.getString("userID");
				String userName = rs.getString("userName");
				String passWord = rs.getString("passWord");
				String email = rs.getString("email");
				String phoneNum = rs.getString("phoneNumber");
				int roleID = rs.getInt("roleID");
				Roles roles = new Roles();
				roles.setRoleID(roleID);
				Roles role = new RolesDao().selectById(roles);
				Date date = rs.getDate("createAt");
				String image = rs.getString("image");
				ansWer = new User(userID, userName, passWord, email, phoneNum, role, date, image);
				break;
			}
			// B5 : đóng kết nối
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ansWer;
	}

	@Override
	public int insert(User t) {
		// TODO Auto-generated method stub
		int ketQua = 0;
		try {
			// B1: Tạo kết nối đến Csdl
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO User (userID, userName, passWord, email, phoneNumber, roleID, createAt, authenticationCode, confirmationTime, status, image)"
					+ " VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getUserID());
			st.setString(2, t.getUserName());
			st.setString(3, t.getPassWord());
			st.setString(4, t.getEmail());
			st.setString(5, t.getPhoneNumber());
			st.setInt(6, t.getRole().getRoleID());
			st.setDate(7, t.getCreateAt());
			st.setString(8, t.getAuthenticationCode());
			st.setDate(9, t.getConfirmationTime());
			st.setInt(10, t.getStatus());
			st.setString(11, t.getImageAvatar());
			// thực thi câu lệnh
			ketQua = st.executeUpdate();
			// đóng kết nối
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<User> arr) {
		// TODO Auto-generated method stub
		int count = 0;
		for (User user : arr) {
			count += this.insert(user);
		}
		return count;
	}

	@Override
	public int delete(User t) {
		// TODO Auto-generated method stub
		// mở kết nối
		int ans = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM user " + " WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getUserID());
			// B3 thực thi câu lệnh
			ans = st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	@Override
	public int deleteAll(ArrayList<User> arr) {
		// TODO Auto-generated method stub
		int count = 0;
		for (User user : arr) {
			count += this.delete(user);
		}
		return count;

	}

	@Override
	public int update(User t) {
		// TODO Auto-generated method stub
		int ans = 0;
		try {

		} catch (Exception e) {
			// TODO: handle exception
		}
		return ans;
	}

	public boolean kiemTraTenDangNhap(String userName) {
		// TODO Auto-generated method stub
		boolean res = false;
		// kết nối
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM user WHERE userName=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, userName);
			ResultSet rs = st.executeQuery();
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

	public int insert2(User user) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO user (userID, userName, passWord, fullName, email, phoneNumber, roleID, dateofbirth, sex, address, createAt, authenticationCode, confirmationTime, status, image, isKey)"
					+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, user.getUserID());
			st.setString(2, user.getUserName());
			st.setString(3, user.getPassWord());
			st.setString(4, user.getFullName());
			st.setString(5, user.getEmail());
			st.setString(6, user.getPhoneNumber());
			st.setInt(7, user.getRole().getRoleID());
			st.setDate(8, user.getDateOfBirth());
			st.setString(9, user.getSex());
			st.setString(10, user.getAddress());
			st.setDate(11, user.getCreateAt());
			st.setString(12, null);
			st.setDate(13, null);
			st.setInt(14, 0);
			st.setString(15, "");
			st.setString(16, user.getIsKey());
			res = st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public int updateVertifyInformation(User user) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE user SET authenticationCode=?, confirmationTime=?, status=? WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, user.getAuthenticationCode());
			st.setDate(2, user.getConfirmationTime());
			st.setInt(3, 0);
			st.setString(4, user.getUserID());
			// thục thi câu lệnh sql
			res = st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exceptione
			e.printStackTrace();
		}
		return res;
	}

	public int deleteByEmail(String email) {
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM user WHERE email=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			res = st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public static void main(String[] args) {
//		User user = new User();
//		user.setUserID("1730035481024");
		UserDao userDao = new UserDao();
//		System.out.println(userDao.delete(user));
//		User user = new User();
//		user.setUserName("trang55");
//		String pass = "123456";
//		String passMH = MaHoa.toSHA1(pass);
//		user.setPassWord(passMH);
//		User us = userDao.selectByUserNameAndPassWord(user);
//		System.out.println(us.getFullName());
//		System.out.println(us.getPassWord());
		System.out.println(userDao.deleteByEmail("soul362004@gmail.com"));

	}

	public User selectById2(User user) {
		// TODO Auto-generated method stub
		User us = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM user WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, user.getUserID());
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String userID = rs.getString("userID");
				String userName = rs.getString("userName");
				String passWord = rs.getString("passWord");
				String fullName = rs.getString("fullName");
				String email = rs.getString("email");
				String phoneNum = rs.getString("phoneNumber");
				int roleID = rs.getInt("roleID");
				Roles roles = new Roles();
				roles.setRoleID(roleID);
				Roles role = new RolesDao().selectById(roles);
				Date dateOfBirth = rs.getDate("dateofbirth");
				String sex = rs.getString("sex");
				String addRess = rs.getString("address");
				Date date = rs.getDate("createAt");
				String maXacNhan = rs.getString("authenticationCode");
				Date thoiGianXacNhan = rs.getDate("confirmationTime");
				int status = rs.getInt("status");
				String image = rs.getString("image");
				String key = rs.getString("isKey");
				String soDu = rs.getString("soDu");
				String typeUser = rs.getString("typeuser");
				us = new User(userID, userName, passWord, fullName, email, phoneNum, role, dateOfBirth, sex, addRess,
						date, maXacNhan, thoiGianXacNhan, status, image, key, soDu, typeUser);
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return us;

	}
	public User selectById3(String  userID1) {
		// TODO Auto-generated method stub
		User us = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM user WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, userID1.trim());
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String userID = rs.getString("userID");
				String userName = rs.getString("userName");
				String passWord = rs.getString("passWord");
				String fullName = rs.getString("fullName");
				String email = rs.getString("email");
				String phoneNum = rs.getString("phoneNumber");
				int roleID = rs.getInt("roleID");
				Roles roles = new Roles();
				roles.setRoleID(roleID);
				Roles role = new RolesDao().selectById(roles);
				Date dateOfBirth = rs.getDate("dateofbirth");
				String sex = rs.getString("sex");
				String addRess = rs.getString("address");
				Date date = rs.getDate("createAt");
				String maXacNhan = rs.getString("authenticationCode");
				Date thoiGianXacNhan = rs.getDate("confirmationTime");
				int status = rs.getInt("status");
				String image = rs.getString("image");
				String key = rs.getString("isKey");
				String soDu = rs.getString("soDu");
				String typeUser = rs.getString("typeuser");
				us = new User(userID, userName, passWord, fullName, email, phoneNum, role, dateOfBirth, sex, addRess,
						date, maXacNhan, thoiGianXacNhan, status, image, key, soDu, typeUser);
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return us;

	}

	public int updateVertifyInformation2(User us) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE user SET status=? WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, us.getStatus());
			st.setString(2, us.getUserID());
			res = st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;

	}

	public User selectByUserNameAndPassWord(User user) {
		// TODO Auto-generated method stub
		User us = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM user WHERE userName=? and passWord=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, user.getUserName());
			st.setString(2, user.getPassWord());
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				System.out.println("okok");
				String userID = rs.getString("userID");
				String userName = rs.getString("userName");
				String passWord = rs.getString("passWord");
				String fullName = rs.getString("fullName");
				String email = rs.getString("email");
				String phone = rs.getString("phoneNumber");
				int roleID = rs.getInt("roleID");
				Date dateOfBir = rs.getDate("dateofbirth");
				String sex = rs.getString("sex");
				String addRess = rs.getString("address");
				Date createAt = rs.getDate("createAt");
				String maXacNhan = rs.getString("authenticationCode");
				Date thoiGianXacNhan = rs.getDate("confirmationTime");
				int status = rs.getInt("status");
				String img = rs.getString("image");
				String key = rs.getString("isKey");
				String soDu = rs.getString("soDu");
				String typeUser = rs.getString("typeuser");
				us = new User(userID, userName, passWord, fullName, email, phone, new Roles(roleID, "Khách Hàng"),
						dateOfBir, sex, addRess, createAt, maXacNhan, thoiGianXacNhan, status, img, key, soDu, typeUser);
				System.out.println("okok");
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return us;
	}

	public int updateImgUser(User user) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE user SET image=? WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, user.getImageAvatar());
			st.setString(2, user.getUserID());
			res = st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public int updateCusInformation(User user) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE user SET fullName=?, email=?, phoneNumber=?, address=?, dateofbirth=?, sex=? WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, user.getFullName());
			st.setString(2, user.getEmail());
			st.setString(3, user.getPhoneNumber());
			st.setString(4, user.getAddress());
			st.setDate(5, user.getDateOfBirth());
			st.setString(6, user.getSex());
			st.setString(7, user.getUserID());
			res = st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public int updateImgAvatar(User user) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE user SET image=? WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, user.getImageAvatar());
			st.setString(2, user.getUserID());
			res = st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;

	}

	public int upDatePassWordNew(User user) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE user SET passWord=? WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, user.getPassWord());
			st.setString(2, user.getUserID());
			res = st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public boolean kiemTraByEmail(String email) {
		// TODO Auto-generated method stub
		boolean res = false;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM user WHERE email=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
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

	public boolean kiemTraSoDienThoai(String phone) {
		// TODO Auto-generated method stub
		boolean res = false;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM user WHERE phoneNumber=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, phone);
			ResultSet rs = st.executeQuery();
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

	public User getUserByEmail(String email) {
		// TODO Auto-generated method stub
		User user = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM user WHERE email=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				System.out.println("okok");
				String userID = rs.getString("userID");
				String userName = rs.getString("userName");
				String passWord = rs.getString("passWord");
				String fullName = rs.getString("fullName");
				String gmail = rs.getString("email");
				String phone = rs.getString("phoneNumber");
				int roleID = rs.getInt("roleID");
				Date dateOfBir = rs.getDate("dateofbirth");
				String sex = rs.getString("sex");
				String addRess = rs.getString("address");
				Date createAt = rs.getDate("createAt");
				String maXacNhan = rs.getString("authenticationCode");
				Date thoiGianXacNhan = rs.getDate("confirmationTime");
				int status = rs.getInt("status");
				String img = rs.getString("image");
				String key = rs.getString("isKey");
				String soDu = rs.getString("soDu");
				String typeUser = rs.getString("typeuser");
				user = new User(userID, userName, passWord, fullName, gmail, phone, new Roles(roleID, "Khách Hàng"),
						dateOfBir, sex, addRess, createAt, maXacNhan, thoiGianXacNhan, status, img, key, soDu, typeUser);
				System.out.println("okok");
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}

	public int updatePassWordNewReal(User user) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE user SET passWord=? WHERE userID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, user.getPassWord());
			st.setString(2, user.getUserID());
			res = st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public User selectUserById(String userID) {
		// TODO Auto-generated method stub
		User user = null;
		try {
			ArrayList<User> lst = selectAll();
			for (User user2 : lst) {
				if (user2.getUserID().equalsIgnoreCase(userID)) {
					user = user2;
					break;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;

	}

	public ArrayList<User> selectUserNotAdmin() {
		// TODO Auto-generated method stub
		ArrayList<User> ans = new ArrayList<User>();
		try {
			ArrayList<User> lst = selectAll();
			for (User user : lst) {
				if (user.getRole().getRoleID() == 2) {
					ans.add(user);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	public int updateUserIsKey(String userID, String string) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE user SET isKey = ? WHERE userID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, string);
			stm.setString(2, userID.trim());
			res = stm.executeUpdate();
			System.out.println("Bạn đã tt " + sql);
			System.out.println("có kq " + res);
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public boolean checkUserNameIsTrue(String userName) {
		// TODO Auto-generated method stub
		boolean res = false;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM user WHERE userName = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, userName.trim());
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				res = true;
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return res;

	}

	public int khoaTaiKhoanViNhapSaiHonMuoiLan(String userName) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE user SET isKey = ? WHERE userName = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, "Bị khóa");
			stm.setString(2, userName.trim());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;

	}

	public boolean kiemTraNameUserHasBlock(String userName) {
		// TODO Auto-generated method stub
		boolean res = false;
		String mess = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM user WHERE userName = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, userName);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				mess = rs.getString("isKey");
				if(mess.equalsIgnoreCase("Bị khóa")) {
					res = true;
				}
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public int capNhatSoDuMoi(User user, String menhGia) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE user SET soDu = ? WHERE userID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			int soDuMoi = Integer.valueOf(user.getSoDu().trim()) + Integer.valueOf(menhGia.trim());
			System.out.println(soDuMoi+"tktktk");
			stm.setString(1, String.valueOf(soDuMoi));
			stm.setString(2, user.getUserID());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public String isCTV(String userID) {
		// TODO Auto-generated method stub
		String res = "";
		User user = selectById3(userID);
		if(user.getRole().getRoleID() == 3) {
			res = "ok";
		}else {
			res = "notok";
		}
		return res;
	}

	public boolean kiemTraHoTen(String name, String userID) {
		// TODO Auto-generated method stub
		boolean check = false;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM user WHERE userID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, userID);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				String name2 = rs.getString("fullName");
				if(name.equalsIgnoreCase(name2)) {
					check = true;
					break;
				}else {
					break;
				}
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return check;
	}

	public boolean updateCTV(String age, String cccd, String gender, String degree, String stk,String nh, String userID) {
		// TODO Auto-generated method stub
		boolean res = false;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE user SET age = ?, cccd = ?, degree = ?, numbank = ? WHERE userID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, Integer.valueOf(age));
			stm.setString(2, cccd);
			stm.setString(3, degree);
			stm.setString(4, stk);
			stm.setString(5, userID);
			int res2 = stm.executeUpdate();
			if(res2 > 0) {
				res = true;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public String getSoDu(String userID) {
		// TODO Auto-generated method stub
		String ans = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM user WHERE userID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, userID.trim());
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				ans = rs.getString("soDu");
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