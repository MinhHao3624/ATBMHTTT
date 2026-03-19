package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.projectttweb.webphone.model.InformationProduct;
import com.projectttweb.webphone.model.Product;
import com.projectttweb.webphone.model.ProductCategories;

public class ProductDao implements DAOInterface<Product> {

	@Override
	public ArrayList<Product> selectAll() {
		// TODO Auto-generated method stub
		ArrayList<Product> lst = new ArrayList<Product>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM product";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			ProductCategoriesDAO proCateDao = new ProductCategoriesDAO();
			InformationproductDAO inforDao = new InformationproductDAO();
			while (rs.next()) {
				String proID = rs.getString("productID");
				String name = rs.getString("name");
				String price = rs.getString("price");
				int stock = rs.getInt("stockQuantity");
				String des = rs.getString("description");
				String img = rs.getString("image");
				Date date = rs.getDate("createAt");
				if (date == null) {
					date = null;
				}

				String proCateID = rs.getString("productCategoriesID");
				ProductCategories proMD = new ProductCategories();
				proMD.setProductCategoriesID(proCateID);
				ProductCategories proCate = proCateDao.selectById(proMD);

				String inforPro = rs.getString("informationProductID");
				InformationProduct infor = new InformationProduct();
				infor.setInfo_ID(inforPro);
				InformationProduct inforDB = inforDao.selectById(infor);

				Product product = new Product(proID, name, price, stock, des, img, date, proCate, inforDB);
				lst.add(product);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public Product selectById(Product t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Product t) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO product (productID, name, price, stockQuantity, description, image, createAt, productCategoriesID, informationProductID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, t.getProductID());
			stm.setString(2, t.getName());
			stm.setString(3, t.getPrice());
			stm.setInt(4, t.getStockQuantity());
			stm.setString(5, t.getDescription());
			stm.setString(6, null);
			stm.setDate(7, t.getCreateAt());
			stm.setString(8, t.getCategories().getProductCategoriesID());
			stm.setString(9, t.getInformationPro().getInfo_ID());
			res = stm.executeUpdate();
			System.out.println("bạn đã thực thi " + sql);
			System.out.println("có kq " + res + " dòng change");
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertAll(ArrayList<Product> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Product t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<Product> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Product t) {
		return 0;
	}

	public int update(Product t, String productID) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE product SET name = ?, price = ?, stockQuantity = ?, description = ?, productCategoriesID = ?, informationProductID = ? WHERE productID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, t.getName());
			stm.setString(2, t.getPrice());
			stm.setInt(3, t.getStockQuantity());
			stm.setString(4, t.getDescription());
			stm.setString(5, t.getCategories().getProductCategoriesID());
			stm.setString(6, t.getInformationPro().getInfo_ID());
			stm.setString(7, productID.trim());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public ArrayList<Product> selectAllByPage(int pageInt) {
		// TODO Auto-generated method stub
		ArrayList<Product> lst = new ArrayList<Product>();
		int tongSoSP = tongSoSanPham();
		//System.out.println(tongSoSP);
		try {
			int tongSoTrang = tongSoSP / 9;
			tongSoTrang++;
			if (pageInt == tongSoTrang) {
				int start = (tongSoTrang - 1) * 9;
				int pD = tongSoSP % 9;
				int end = start + pD;
				ArrayList<Product> lstAll = selectAll();
				for (Product product : lstAll) {
					String proID = product.getProductID();
					int proIDNum = xuLi(proID);
					if (proIDNum > start) {
						lst.add(product);
					} else {
						continue;
					}
				}
			} else {
				int start = (pageInt - 1) * 9;
				int end = start + 9;
				ArrayList<Product> lstAll = selectAll();
				for (Product product : lstAll) {
					String proID = product.getProductID();
					int proIDNum = xuLi(proID);
					if (proIDNum > start && proIDNum <= end) {
						lst.add(product);
					} else {
						continue;
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lst;
	}

	private int xuLi(String proID) {
		// TODO Auto-generated method stub
		String res = "";
		boolean mo = false;
		for (int i = 0; i < proID.length(); i++) {
			if (proID.charAt(i) != '0' || mo) {
				res += proID.charAt(i);
				mo = true;
			}
		}
		return Integer.valueOf(res);
	}

	public int tongSoSanPham() {
		int total = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM product";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				total++;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return total;
	}

	public ArrayList<Product> getProductByOs(String os, int page) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		ArrayList<Product> ans = new ArrayList<Product>();
		try {
			if (os.equals("Tatca")) {
				ArrayList<Product> lst = selectAll();
				int tongSoTrang = lst.size() / 9;
				tongSoTrang++;
				if (page == tongSoTrang) {
					int start = (page - 1) * 9;
					int count = 0;
					for (Product product : lst) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (page - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : lst) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (os.equals("Android")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProduct(product.getInformationPro().getOs(), os)) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (page == tongSoTrang) {
					int start = (page - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (page - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (os.equals("IOS")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProduct(product.getInformationPro().getOs(), os)) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (page == tongSoTrang) {
					int start = (page - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (page - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	private boolean checkProduct(String os, String os2) {
		// TODO Auto-generated method stub
		String[] arrStr = os.split(" ");
		for (String string : arrStr) {
			if (string.equalsIgnoreCase(os2)) {
				return true;
			}
		}

		return false;
	}

	public int getTogSoSanPhamByOs(String os) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		int count = 0;
		try {
			if (os.equals("Tatca")) {
				ArrayList<Product> lst = selectAll();
				res = lst;
			} else if (os.equals("Android")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProduct(product.getInformationPro().getOs(), os)) {
						res.add(product);
					}
				}
			} else if (os.equals("IOS")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProduct(product.getInformationPro().getOs(), os)) {
						res.add(product);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res.size();
	}

	public ArrayList<Product> selectProductByCategories(String categories, int pageInt) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		ArrayList<Product> ans = new ArrayList<Product>();
		try {
			if (categories.equals("Tatca")) {
				ArrayList<Product> lst = selectAll();
				res = lst;
				int tongSoTrang = lst.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : lst) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : lst) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (categories.equals("Samsung")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}

			} else if (categories.equals("Apple")) {
				ArrayList<Product> lst = selectAll();
				categories = "IPhone";
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (categories.equals("Xiaomi")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}

			} else if (categories.equals("Vsmart")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (categories.equals("OPPO")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (categories.equals("Vivo")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (categories.equals("Nokia")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (categories.equals("Huawei")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	public int getTongSoTrangByCategories(String categories) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		try {
			if (categories.equals("Tatca")) {
				ArrayList<Product> lst = selectAll();
				res = lst;
			} else if (categories.equals("Samsung")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
			} else if (categories.equals("Apple")) {
				ArrayList<Product> lst = selectAll();
				categories = "IPhone";
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
			} else if (categories.equals("Xiaomi")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
			} else if (categories.equals("Vsmart")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
			} else if (categories.equals("OPPO")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
			} else if (categories.equals("Vivo")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
			} else if (categories.equals("Nokia")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
			} else if (categories.equals("Huawei")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (product.getCategories().getNameCategories().equals(categories)) {
						res.add(product);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res.size();
	}

	public ArrayList<Product> getProductByPrice(String priceStr, int pageInt) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		ArrayList<Product> ans = new ArrayList<Product>();
		try {
			if (priceStr.equals("Tatca")) {
				ArrayList<Product> lst = selectAll();
				res = lst;
				int tongSoTrang = lst.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : lst) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : lst) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (priceStr.equals("duoihaitrieu")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkPriceProduct(product.getPrice(), 2000000)) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (priceStr.equals("tuhaidennamtrieu")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkPriceProduct2(product.getPrice())) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (priceStr.equals("tunamdenmuoitrieu")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkPriceProduct3(product.getPrice())) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (priceStr.equals("tumuoidenmuoilamtrieu")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkPriceProduct4(product.getPrice())) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (priceStr.equals("trenmuoilamtrieu")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkPriceProduct5(product.getPrice())) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	private boolean checkPriceProduct5(String price) {
		// TODO Auto-generated method stub
		String priceReal = "";
		for (int j = 0; j < price.length(); j++) {
			if (price.charAt(j) != '.') {
				priceReal += price.charAt(j);
			} else {
				continue;
			}
		}
		int priceRealInt = Integer.valueOf(priceReal);
		if (priceRealInt > 15000000) {
			return true;
		} else {
			return false;
		}
	}

	private boolean checkPriceProduct4(String price) {
		// TODO Auto-generated method stub
		String priceReal = "";
		for (int j = 0; j < price.length(); j++) {
			if (price.charAt(j) != '.') {
				priceReal += price.charAt(j);
			} else {
				continue;
			}
		}
		int priceRealInt = Integer.valueOf(priceReal);
		if (priceRealInt <= 15000000 && priceRealInt >= 10000000) {
			return true;
		} else {
			return false;
		}
	}

	private boolean checkPriceProduct3(String price) {
		// TODO Auto-generated method stub
		String priceReal = "";
		for (int j = 0; j < price.length(); j++) {
			if (price.charAt(j) != '.') {
				priceReal += price.charAt(j);
			} else {
				continue;
			}
		}
		int priceRealInt = Integer.valueOf(priceReal);
		if (priceRealInt <= 10000000 && priceRealInt >= 5000000) {
			return true;
		} else {
			return false;
		}
	}

	private boolean checkPriceProduct2(String price) {
		// TODO Auto-generated method stub
		String priceReal = "";
		for (int j = 0; j < price.length(); j++) {
			if (price.charAt(j) != '.') {
				priceReal += price.charAt(j);
			} else {
				continue;
			}
		}
		int priceRealInt = Integer.valueOf(priceReal);
		if (priceRealInt <= 5000000 && priceRealInt >= 2000000) {
			return true;
		} else {
			return false;
		}
	}

	private boolean checkPriceProduct(String price, int i) {
		// TODO Auto-generated method stub
		String priceReal = "";
		for (int j = 0; j < price.length(); j++) {
			if (price.charAt(j) != '.') {
				priceReal += price.charAt(j);
			} else {
				continue;
			}
		}
		int priceRealInt = Integer.valueOf(priceReal);
		if (priceRealInt < i) {
			return true;
		} else {
			return false;
		}
	}

	public int getTongSoTrangByPrice(String priceStr) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		try {
			if (priceStr.equals("Tatca")) {
				ArrayList<Product> lst = selectAll();
				res = lst;
			} else if (priceStr.equals("duoihaitrieu")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkPriceProduct(product.getPrice(), 2000000)) {
						res.add(product);
					}
				}
			} else if (priceStr.equals("tuhaidennamtrieu")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkPriceProduct2(product.getPrice())) {
						res.add(product);
					}
				}
			} else if (priceStr.equals("tunamdenmuoitrieu")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkPriceProduct3(product.getPrice())) {
						res.add(product);
					}
				}

			} else if (priceStr.equals("tumuoidenmuoilamtrieu")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkPriceProduct4(product.getPrice())) {
						res.add(product);
					}
				}
			} else if (priceStr.equals("trenmuoilamtrieu")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkPriceProduct5(product.getPrice())) {
						res.add(product);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res.size();

	}

	public ArrayList<Product> getProductByScreen(String screen, int pageInt) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		ArrayList<Product> ans = new ArrayList<Product>();
		try {
			if (screen.equals("Tatca")) {
				ArrayList<Product> lst = selectAll();
				res = lst;
				int tongSoTrang = lst.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : lst) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : lst) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (screen.equals("duoi5.0inch")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByScreen(product.getInformationPro().getScreenSize())) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (screen.equals("tren6.0inch")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByScreen2(product.getInformationPro().getScreenSize())) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	private boolean checkProductByScreen2(String screenSize) {
		// TODO Auto-generated method stub
		String screenSizeVal = "";
		for (int i = 0; i < screenSize.length(); i++) {
			if (screenSize.charAt(i) == ' ') {
				break;
			} else {
				screenSizeVal += screenSize.charAt(i);
			}
		}
		double screenSizeInt = Double.parseDouble(screenSizeVal);
		if (screenSizeInt > 6.0) {
			return true;
		} else {
			return false;
		}
	}

	private boolean checkProductByScreen(String screenSize) {
		// TODO Auto-generated method stub
		String screenSizeVal = "";
		for (int i = 0; i < screenSize.length(); i++) {
			if (screenSize.charAt(i) == ' ') {
				break;
			} else {
				screenSizeVal += screenSize.charAt(i);
			}
		}
		double screenSizeInt = Double.parseDouble(screenSizeVal);
		if (screenSizeInt < 5.0) {
			return true;
		} else {
			return false;
		}
	}

	public int getTotalProductByScreen(String screen) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		try {
			if (screen.equals("Tatca")) {
				ArrayList<Product> lst = selectAll();
				res = lst;
			} else if (screen.equals("duoi5.0inch")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByScreen(product.getInformationPro().getScreenSize())) {
						res.add(product);
					}
				}
			} else if (screen.equals("tren6.0inch")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByScreen2(product.getInformationPro().getScreenSize())) {
						res.add(product);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res.size();
	}

	public ArrayList<Product> getProductByMemory(String memory, int pageInt) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		ArrayList<Product> ans = new ArrayList<Product>();
		try {
			if (memory.equals("Tatca")) {
				ArrayList<Product> lst = selectAll();
				res = lst;
				int tongSoTrang = lst.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : lst) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : lst) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (memory.equals("duoi32GB")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByMemory(product.getInformationPro().getMemory())) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (memory.equals("64GB128GB")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByMemory2(product.getInformationPro().getMemory())) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}

			} else if (memory.equals("256GB512GB")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByMemory3(product.getInformationPro().getMemory())) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}
			} else if (memory.equals("tren512GB")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByMemory4(product.getInformationPro().getMemory())) {
						res.add(product);
					}
				}
				int tongSoTrang = res.size() / 9;
				tongSoTrang++;
				if (pageInt == tongSoTrang) {
					int start = (pageInt - 1) * 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start) {
							ans.add(product);
						}
					}
				} else {
					int start = (pageInt - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : res) {
						count++;
						if (count > start && count <= end) {
							ans.add(product);
						}
					}
				}

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	private boolean checkProductByMemory4(String memory) {
		// TODO Auto-generated method stub
		String memoryStr = "";
		for (int i = 0; i < memory.length(); i++) {
			if (Character.isDigit(memory.charAt(i))) {
				memoryStr += memory.charAt(i);
			} else {
				continue;
			}
		}
		int memoryInt = Integer.valueOf(memoryStr.trim());
		if (memoryInt > 512) {
			return true;
		} else {
			return false;
		}
	}

	private boolean checkProductByMemory3(String memory) {
		// TODO Auto-generated method stub
		String memoryStr = "";
		for (int i = 0; i < memory.length(); i++) {
			if (Character.isDigit(memory.charAt(i))) {
				memoryStr += memory.charAt(i);
			} else {
				break;
			}
		}
		int memoryInt = Integer.valueOf(memoryStr.trim());
		if (memoryInt == 256 || memoryInt == 512) {
			return true;
		} else {
			return false;
		}
	}

	private boolean checkProductByMemory2(String memory) {
		// TODO Auto-generated method stub
		String memoryStr = "";
		for (int i = 0; i < memory.length(); i++) {
			if (Character.isDigit(memory.charAt(i))) {
				memoryStr += memory.charAt(i);
			} else {
				break;
			}
		}
		int memoryInt = Integer.valueOf(memoryStr.trim());
		if (memoryInt == 64 || memoryInt == 128) {
			return true;
		} else {
			return false;
		}
	}

	private boolean checkProductByMemory(String memory) {
		// TODO Auto-generated method stub
		String memoryStr = "";
		for (int i = 0; i < memory.length(); i++) {
			if (Character.isDigit(memory.charAt(i))) {
				memoryStr += memory.charAt(i);
			} else {
				break;
			}
		}
		int memoryInt = Integer.valueOf(memoryStr.trim());
		if (memoryInt < 32) {
			return true;
		} else {
			return false;
		}
	}

	public int getTotalProductByMemory(String memory) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		try {
			if (memory.equals("Tatca")) {
				ArrayList<Product> lst = selectAll();
				res = lst;
			} else if (memory.equals("duoi32GB")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByMemory(product.getInformationPro().getMemory())) {
						res.add(product);
					}
				}
			} else if (memory.equals("64GB128GB")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByMemory2(product.getInformationPro().getMemory())) {
						res.add(product);
					}
				}
			} else if (memory.equals("256GB512GB")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByMemory3(product.getInformationPro().getMemory())) {
						res.add(product);
					}
				}
			} else if (memory.equals("tren512GB")) {
				ArrayList<Product> lst = selectAll();
				for (Product product : lst) {
					if (checkProductByMemory4(product.getInformationPro().getMemory())) {
						res.add(product);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res.size();
	}

	public ArrayList<Product> selectListProBuyHury(int pageInt) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		ArrayList<Product> ans = new ArrayList<Product>();
		try {
			ArrayList<Product> lst = selectAll();
			Product[] arr = new Product[lst.size()];
			for (int i = 0; i < arr.length; i++) {
				arr[i] = lst.get(i);
			}
			for (int i = 0; i < arr.length; i++) {
				for (int j = 0; j < arr.length - 1; j++) {
					if (arr[j].getStockQuantity() > arr[j + 1].getStockQuantity()) {
						Product tmp = arr[j];
						arr[j] = arr[j + 1];
						arr[j + 1] = tmp;
					}
				}
			}
			for (int i = 0; i < arr.length; i++) {
				res.add(arr[i]);
			}
			int tongSoTrang = res.size() / 9;
			tongSoTrang++;
			if (pageInt == tongSoTrang) {
				int start = (pageInt - 1) * 9;
				int count = 0;
				for (Product product : res) {
					count++;
					if (count > start) {
						ans.add(product);
					}
				}
			} else {
				int start = (pageInt - 1) * 9;
				int end = start + 9;
				int count = 0;
				for (Product product : res) {
					count++;
					if (count > start && count <= end) {
						ans.add(product);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	public ArrayList<Product> selectListProPriceLow(int pageInt) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		ArrayList<Product> ans = new ArrayList<Product>();
		try {
			ArrayList<Product> lst = selectAll();
			Product[] arr = new Product[lst.size()];
			for (int i = 0; i < arr.length; i++) {
				arr[i] = lst.get(i);
			}
			for (int i = 0; i < arr.length; i++) {
				for (int j = 0; j < arr.length - 1; j++) {
					int price_J = xuLiPrice(arr[j].getPrice());
					int price_J_next = xuLiPrice(arr[j + 1].getPrice());
					if (price_J > price_J_next) {
						Product tmp = arr[j];
						arr[j] = arr[j + 1];
						arr[j + 1] = tmp;
					}
				}
			}
			for (int i = 0; i < arr.length; i++) {
				res.add(arr[i]);
			}
			int tongSoTrang = res.size() / 9;
			tongSoTrang++;
			if (pageInt == tongSoTrang) {
				int start = (pageInt - 1) * 9;
				int count = 0;
				for (Product product : res) {
					count++;
					if (count > start) {
						ans.add(product);
					}
				}
			} else {
				int start = (pageInt - 1) * 9;
				int end = start + 9;
				int count = 0;
				for (Product product : res) {
					count++;
					if (count > start && count <= end) {
						ans.add(product);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	private int xuLiPrice(String price) {
		// TODO Auto-generated method stub
		String priceStr = "";
		for (int i = 0; i < price.trim().length(); i++) {
			if (price.charAt(i) == '.') {
				continue;
			} else {
				priceStr += price.charAt(i);
			}
		}
		return Integer.valueOf(priceStr.trim());
	}

	public ArrayList<Product> selectListProPriceHigh(int pageInt) {
		// TODO Auto-generated method stub
		ArrayList<Product> res = new ArrayList<Product>();
		ArrayList<Product> ans = new ArrayList<Product>();
		try {
			ArrayList<Product> lst = selectAll();
			Product[] arr = new Product[lst.size()];
			for (int i = 0; i < arr.length; i++) {
				arr[i] = lst.get(i);
			}
			for (int i = 0; i < arr.length; i++) {
				for (int j = 0; j < arr.length - 1; j++) {
					int price_J = xuLiPrice(arr[j].getPrice());
					int price_J_next = xuLiPrice(arr[j + 1].getPrice());
					if (price_J < price_J_next) {
						Product tmp = arr[j];
						arr[j] = arr[j + 1];
						arr[j + 1] = tmp;
					}
				}
			}
			for (int i = 0; i < arr.length; i++) {
				res.add(arr[i]);
			}
			int tongSoTrang = res.size() / 9;
			tongSoTrang++;
			if (pageInt == tongSoTrang) {
				int start = (pageInt - 1) * 9;
				int count = 0;
				for (Product product : res) {
					count++;
					if (count > start) {
						ans.add(product);
					}
				}
			} else {
				int start = (pageInt - 1) * 9;
				int end = start + 9;
				int count = 0;
				for (Product product : res) {
					count++;
					if (count > start && count <= end) {
						ans.add(product);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	public List<Product> getProductSuggestions(String keyword) {
		// TODO Auto-generated method stub
		ArrayList<Product> list = selectAll();
		List<Product> res = new ArrayList<Product>();
		String[] data = { "Điện thoại giá thấp", "Điện thoại giá cao" };
		// tìm theo tên
		for (Product pro : list) {
			if (pro.getName().toLowerCase().contains(keyword.toLowerCase())) {
				res.add(pro);
			}
		}
		// tìm theo hệ điều hành
		for (Product product : list) {
			String mess = "Hệ điều hành " + product.getInformationPro().getOs();
			if (mess.toLowerCase().contains(keyword.toLowerCase())) {
				res.add(product);
			}
		}
		for (String string : data) {
			if (keyword.toLowerCase().contains(string.toLowerCase())) {
				Product pro = new Product();
				pro.setName(string);
				res.add(pro);
			}
		}

		return res;
	}

//	public static void main(String[] args) {
//		String s = "Điện thoại Samsung Galaxy S5";
//		String s1 = "ĐiệnthoạiSamsung";
//		String s2 = "SamsungS5";
//		String s3 = "Samsung";
//		String s4 = "Điện thoại giá rẻ IPhone";
//		String s5 = "Điện thoại giá rẻ";
//
//		System.out.println(s5.toLowerCase().contains(s4.toLowerCase()));
//	}

	public ArrayList<Product> selectProductByNameSearchBox(String required, int page) {
		// TODO Auto-generated method stub
		ArrayList<Product> lstPro = new ArrayList<Product>();
		ArrayList<Product> ans1 = new ArrayList<Product>();
		try {
			ArrayList<Product> lstDB = selectAll();
			// tìm theo tên
			for (Product product : lstDB) {
				if (product.getName().toLowerCase().contains(required.toLowerCase())) {
					lstPro.add(product);
				}
			}
			// tìm theo os
			for (Product product : lstDB) {
				String mess = "Hệ điều hành " + product.getInformationPro().getOs();
				if (mess.toLowerCase().contains(required.toLowerCase())) {
					lstPro.add(product);
				}
			}
			// tìm theo giá
			String data[] = { "Điện thoại giá rẻ", "Điện thoại giá cao", "Điện thoại giá thấp" };
			for (String string : data) {
				if (required.trim().toLowerCase().contains(string.toLowerCase())
						&& required.length() == string.length()) {
					String ans = string;
					if (ans.equalsIgnoreCase("Điện thoại giá rẻ") || ans.equalsIgnoreCase("Điện thoại giá thấp")) {
						Product[] arrPro = new Product[lstDB.size()];
						for (int i = 0; i < lstDB.size(); i++) {
							arrPro[i] = lstDB.get(i);
						}
						for (int i = 0; i < arrPro.length; i++) {
							for (int j = 0; j < arrPro.length - 1; j++) {
								int price_J = xuLiPrice(arrPro[j].getPrice());
								int price_JNext = xuLiPrice(arrPro[j + 1].getPrice());
								if (price_J > price_JNext) {
									Product tmp = arrPro[j];
									arrPro[j] = arrPro[j + 1];
									arrPro[j + 1] = tmp;
								}
							}
						}
						for (int i = 0; i < arrPro.length; i++) {
							lstPro.add(arrPro[i]);
						}

						break;
					} else if (ans.equalsIgnoreCase("Điện thoại giá cao")) {
						Product[] arrPro = new Product[lstDB.size()];
						for (int i = 0; i < lstDB.size(); i++) {
							arrPro[i] = lstDB.get(i);
						}
						for (int i = 0; i < arrPro.length; i++) {
							for (int j = 0; j < arrPro.length - 1; j++) {
								int price_J = xuLiPrice(arrPro[j].getPrice());
								int price_JNext = xuLiPrice(arrPro[j + 1].getPrice());
								if (price_J < price_JNext) {
									Product tmp = arrPro[j];
									arrPro[j] = arrPro[j + 1];
									arrPro[j + 1] = tmp;
								}
							}
						}
						for (int i = 0; i < arrPro.length; i++) {
							lstPro.add(arrPro[i]);
						}
						break;
					}
				}
			}
			String[] nhanHieu = { "Iphone", "Samsung", "Xiaomi", "Vsmart", "OPPO", "Vivo", "Nokia", "Huawei" };
			String[] arrStr = required.trim().split("\\s+");
			boolean check = false;
			for (String string : nhanHieu) {
				if (string.equalsIgnoreCase(arrStr[2])) {
					check = true;
					break;
				}
			}
			String mess = "";
			if (check) {
				for (int i = 0; i < arrStr.length; i++) {
					if (i == 2) {
						continue;
					} else {
						mess += arrStr[i] + "\t";
					}
				}
				for (String string : data) {
					if (mess.trim().toLowerCase().contains(string.trim().toLowerCase())
							&& mess.length() == string.length()) {
						String ans = string;
						if (ans.equalsIgnoreCase("Điện thoại giá rẻ") || ans.equalsIgnoreCase("Điện thoại giá thấp")) {
							for (int i = 0; i < lstDB.size(); i++) {
								if (lstDB.get(i).getName().toLowerCase().contains(arrStr[2].toLowerCase())) {
									lstPro.add(lstDB.get(i));
								}
							}
							Product[] proArr = new Product[lstPro.size()];
							for (int i = 0; i < proArr.length; i++) {
								proArr[i] = lstPro.get(i);
							}
							for (int i = 0; i < proArr.length; i++) {
								for (int j = 0; j < proArr.length - 1; j++) {
									int priceJ = xuLiPrice(proArr[j].getPrice());
									int priceJNext = xuLiPrice(proArr[j + 1].getPrice());
									if (priceJ > priceJNext) {
										Product tmp = proArr[j];
										proArr[j] = proArr[j + 1];
										proArr[j + 1] = tmp;
									}
								}
							}
							lstPro.clear();
							for (int i = 0; i < proArr.length; i++) {
								lstPro.add(proArr[i]);
							}
							break;
						} else if (ans.equalsIgnoreCase("Điện thoại giá cao")) {
							for (int i = 0; i < lstDB.size(); i++) {
								if (lstDB.get(i).getName().toLowerCase().contains(arrStr[2].toLowerCase())) {
									lstPro.add(lstDB.get(i));
								}
							}
							Product[] proArr = new Product[lstPro.size()];
							for (int i = 0; i < proArr.length; i++) {
								proArr[i] = lstPro.get(i);
							}
							for (int i = 0; i < proArr.length; i++) {
								for (int j = 0; j < proArr.length - 1; j++) {
									int priceJ = xuLiPrice(proArr[j].getPrice());
									int priceJNext = xuLiPrice(proArr[j + 1].getPrice());
									if (priceJ < priceJNext) {
										Product tmp = proArr[j];
										proArr[j] = proArr[j + 1];
										proArr[j + 1] = tmp;
									}
								}
							}
							lstPro.clear();
							for (int i = 0; i < arrStr.length; i++) {
								lstPro.add(proArr[i]);
							}
							break;
						}
					}
				}
			}
			int totalProductInLst = lstPro.size();
			if (totalProductInLst > 0) {
				int totalPage = totalProductInLst / 9;
				if (totalProductInLst % 9 != 0) {
					totalPage++;
				}
				if (page == totalPage) {
					int start = (page - 1) * 9;
					int count = 0;
					for (Product product : lstPro) {
						count++;
						if (count > start) {
							ans1.add(product);
						}
					}
				} else {
					int start = (page - 1) * 9;
					int end = start + 9;
					int count = 0;
					for (Product product : lstPro) {
						count++;
						if (count > start && count <= end) {
							ans1.add(product);
						}
					}
				}
			}

//			String[] ans = { "Điện", "thoại", "giá", "rẻ thấp nhỏ" };
//
//			if (check_Lan_Mot(ans, required)) {
//				String[] arrRequired = required.trim().split(" ");
//				if (ans.length == arrRequired.length) {
//					if (checkString_1(ans, arrRequired)) {
//						for (Product pro : lstDB) {
//							if (pro.getName().toLowerCase().contains("Điện thoại")) {
//								lstPro.add(pro);
//							}
//						}
//						Product[] arrPro = new Product[lstPro.size()];
//						for (int i = 0; i < lstPro.size(); i++) {
//							arrPro[i] = lstPro.get(i);
//						}
//						for (int i = 0; i < arrPro.length; i++) {
//							for (int j = 0; j < arrPro.length-1; j++) {
//								int soTien1 = xuLiPrice(arrPro[j].getPrice());
//								int soTien2 = xuLiPrice(arrPro[j+1].getPrice());
//								if(soTien1 >  soTien2) {
//									Product tmp = arrPro[j];
//									arrPro[j] = arrPro[j+1];
//									arrPro[j+1] = tmp;
//								}
//							}
//						}
//						for (Product product : arrPro) {
//							res.add(product);
//						}
//						return res;
//					} else {
//						String mess = "";
//						kiemTra = true;
//						String[] tmp = ans[ans.length-1].split(" ");
//					aa:	for (String string : tmp) {
//							for (String string2 : arrRequired) {
//								if(string.equalsIgnoreCase(string2)) {
//									mess = string2;
//									break aa;
//								}
//							}
//						}
//					    ans[ans.length-1] = mess;
//						int[] arrResNum = new int[ans.length];
//						int index = 0;
//					aa:	for (int i = 0; i < ans.length; i++) {
//							for (int j = 0; j < arrRequired.length; j++) {
//								if(ans[i].equalsIgnoreCase(arrRequired[j])) {
//									arrResNum[index] = j;
//									index++;
//									continue aa;
//								}
//							}
//						}
//					for (int i = 0; i < ans.length; i++) {
//						baoLoi += arrRequired[arrResNum[i]];
//					}
//					}
//				} else {
//					
//
//				}
//			}
			return ans1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans1;
	}

	private boolean checkString_1(String[] ans, String[] required) {
		// TODO Auto-generated method stub
		String mess = "";
		for (int i = 0; i < required.length; i++) {
			if (required[i].equalsIgnoreCase("rẻ")) {
				mess = "rẻ";
				break;
			} else if (required[i].equalsIgnoreCase("thấp")) {
				mess = "thấp";
				break;
			} else if (required[i].equalsIgnoreCase("nhỏ")) {
				mess = "nhỏ";
				break;
			}
		}
		String ans1 = "";
		String ans2 = "";
		for (int i = 0; i < ans.length; i++) {
			if (i == ans.length - 1) {
				ans1 += mess;
			} else {
				ans1 += ans[i] + "\t";
			}
		}
		for (int i = 0; i < required.length; i++) {
			ans2 += required[i] + "\t";
		}
		if (ans1.trim().equalsIgnoreCase(ans2.trim())) {
			return true;
		} else {
			return false;
		}
	}

	private boolean check_Lan_Mot(String[] ans, String required) {
		// TODO Auto-generated method stub
		String[] arrRequired = required.trim().split("\\s+");
		int count = 0;
		int check = 0;
		aa: for (int i = 0; i < ans.length; i++) {
			bb: for (int j = 0; j < arrRequired.length; j++) {
				if (i == ans.length - 1) {
					String[] last = ans[i].trim().split(" ");
					cc: for (int k = 0; k < last.length; k++) {
						if (ans[k].toLowerCase().equalsIgnoreCase(arrRequired[j])) {
							count++;
							break aa;
						} else {
							continue cc;
						}
					}
				} else {
					if (ans[i].toLowerCase().equalsIgnoreCase(arrRequired[j])) {
						count++;
						continue aa;
					} else {
						check++;
						continue bb;
					}
				}
			}
			if (check == arrRequired.length) {
				return false;
			} else {
				check = 0;
				continue aa;
			}
		}
		if (count == ans.length) {
			return true;
		} else {
			return false;
		}
	}

	public int getTongSoTrangSearchBox(String required) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		ArrayList<Product> lstPro = new ArrayList<Product>();
		int totalPage = 0;
		try {
			ArrayList<Product> lstDB = selectAll();
			// tìm theo tên
			for (Product product : lstDB) {
				if (product.getName().toLowerCase().contains(required.toLowerCase())) {
					lstPro.add(product);
				}
			}
			// tìm theo os
			for (Product product : lstDB) {
				String mess = "Hệ điều hành " + product.getInformationPro().getOs();
				if (mess.toLowerCase().contains(required.toLowerCase())) {
					lstPro.add(product);
				}
			}
			// tìm theo giá
			String data[] = { "Điện thoại giá rẻ", "Điện thoại giá cao", "Điện thoại giá thấp" };
			for (String string : data) {
				if (required.trim().toLowerCase().contains(string.toLowerCase())
						&& required.length() == string.length()) {
					String ans = string;
					if (ans.equalsIgnoreCase("Điện thoại giá rẻ") || ans.equalsIgnoreCase("Điện thoại giá thấp")) {
						Product[] arrPro = new Product[lstDB.size()];
						for (int i = 0; i < lstDB.size(); i++) {
							arrPro[i] = lstDB.get(i);
						}
						for (int i = 0; i < arrPro.length; i++) {
							for (int j = 0; j < arrPro.length - 1; j++) {
								int price_J = xuLiPrice(arrPro[j].getPrice());
								int price_JNext = xuLiPrice(arrPro[j + 1].getPrice());
								if (price_J > price_JNext) {
									Product tmp = arrPro[j];
									arrPro[j] = arrPro[j + 1];
									arrPro[j + 1] = tmp;
								}
							}
						}
						for (int i = 0; i < arrPro.length; i++) {
							lstPro.add(arrPro[i]);
						}

						break;
					} else if (ans.equalsIgnoreCase("Điện thoại giá cao")) {
						Product[] arrPro = new Product[lstDB.size()];
						for (int i = 0; i < lstDB.size(); i++) {
							arrPro[i] = lstDB.get(i);
						}
						for (int i = 0; i < arrPro.length; i++) {
							for (int j = 0; j < arrPro.length - 1; j++) {
								int price_J = xuLiPrice(arrPro[j].getPrice());
								int price_JNext = xuLiPrice(arrPro[j + 1].getPrice());
								if (price_J < price_JNext) {
									Product tmp = arrPro[j];
									arrPro[j] = arrPro[j + 1];
									arrPro[j + 1] = tmp;
								}
							}
						}
						for (int i = 0; i < arrPro.length; i++) {
							lstPro.add(arrPro[i]);
						}
						break;
					}
				}
			}
			String[] nhanHieu = { "Iphone", "Samsung", "Xiaomi", "Vsmart", "OPPO", "Vivo", "Nokia", "Huawei" };
			String[] arrStr = required.trim().split("\\s+");
			boolean check = false;
			for (String string : nhanHieu) {
				if (string.equalsIgnoreCase(arrStr[2])) {
					check = true;
					break;
				}
			}
			String mess = "";
			if (check) {
				for (int i = 0; i < arrStr.length; i++) {
					if (i == 2) {
						continue;
					} else {
						mess += arrStr[i] + "\t";
					}
				}
				for (String string : data) {
					if (mess.trim().toLowerCase().contains(string.trim().toLowerCase())
							&& mess.length() == string.length()) {
						String ans = string;
						if (ans.equalsIgnoreCase("Điện thoại giá rẻ") || ans.equalsIgnoreCase("Điện thoại giá thấp")) {
							for (int i = 0; i < lstDB.size(); i++) {
								if (lstDB.get(i).getName().toLowerCase().contains(arrStr[2].toLowerCase())) {
									lstPro.add(lstDB.get(i));
								}
							}
							Product[] proArr = new Product[lstPro.size()];
							for (int i = 0; i < proArr.length; i++) {
								proArr[i] = lstPro.get(i);
							}
							for (int i = 0; i < proArr.length; i++) {
								for (int j = 0; j < proArr.length - 1; j++) {
									int priceJ = xuLiPrice(proArr[j].getPrice());
									int priceJNext = xuLiPrice(proArr[j + 1].getPrice());
									if (priceJ > priceJNext) {
										Product tmp = proArr[j];
										proArr[j] = proArr[j + 1];
										proArr[j + 1] = tmp;
									}
								}
							}
							lstPro.clear();
							for (int i = 0; i < proArr.length; i++) {
								lstPro.add(proArr[i]);
							}
							break;
						} else if (ans.equalsIgnoreCase("Điện thoại giá cao")) {
							for (int i = 0; i < lstDB.size(); i++) {
								if (lstDB.get(i).getName().toLowerCase().contains(arrStr[2].toLowerCase())) {
									lstPro.add(lstDB.get(i));
								}
							}
							Product[] proArr = new Product[lstPro.size()];
							for (int i = 0; i < proArr.length; i++) {
								proArr[i] = lstPro.get(i);
							}
							for (int i = 0; i < proArr.length; i++) {
								for (int j = 0; j < proArr.length - 1; j++) {
									int priceJ = xuLiPrice(proArr[j].getPrice());
									int priceJNext = xuLiPrice(proArr[j + 1].getPrice());
									if (priceJ < priceJNext) {
										Product tmp = proArr[j];
										proArr[j] = proArr[j + 1];
										proArr[j + 1] = tmp;
									}
								}
							}
							lstPro.clear();
							for (int i = 0; i < arrStr.length; i++) {
								lstPro.add(proArr[i]);
							}
							break;
						}
					}
				}
			}
			int totalProductInLst = lstPro.size();
			if (totalProductInLst > 0) {
				totalPage = totalProductInLst / 9;
				if (totalProductInLst % 9 != 0) {
					totalPage++;
				}
				return totalPage;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return totalPage;

	}

	public Product getProductByID(String productID) {
		// TODO Auto-generated method stub
		Product product = null;
		try {
			ArrayList<Product> lstAll = selectAll();
			for (Product product2 : lstAll) {
				if (product2.getProductID().equalsIgnoreCase(productID)) {
					product = product2;
					break;
				}
			}

			return product;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return product;
	}

	public List<Product> getDsProLienQuan(Product proTmp) {
		// TODO Auto-generated method stub
		List<Product> lstRes = new ArrayList<Product>();
		try {
			ArrayList<Product> lstAll = selectAll();
			String ans = "";
			if (proTmp.getName().toLowerCase().contains("iphone")) {
				int ipNum = getNumIP(proTmp.getName().toLowerCase());
				boolean check_One = kiemTraExistPro(proTmp.getName().toLowerCase());
				boolean check_Two = kiemTraExistMax(proTmp.getName().toLowerCase());
				boolean check_Three = kiemTraExistCu(proTmp.getName().toLowerCase());
				ans += "Điện thoại iphone " + ipNum;
				System.out.println(check_One);
				System.out.println(check_Two);
				for (Product product : lstAll) {
					if (product.getName().toLowerCase().contains(ans.toLowerCase())) {
						if (!check_Three) {
							if (check_One && check_Two) {
								if (product.getName().toLowerCase().contains("pro")
										&& product.getName().toLowerCase().contains("max")
										&& !product.getName().toLowerCase().contains("cũ")) {
									lstRes.add(product);
								}
							} else if (check_One == false && check_Two == false) {
								if (!product.getName().toLowerCase().contains("pro")
										&& !product.getName().toLowerCase().contains("max")
										&& !product.getName().toLowerCase().contains("cũ")) {
									lstRes.add(product);
								}
							} else if (check_One && check_Two == false) {
								if (product.getName().toLowerCase().contains("pro")
										&& !product.getName().toLowerCase().contains("max")
										&& !product.getName().toLowerCase().contains("cũ")) {
									lstRes.add(product);
								}
							}
						} else {
							if (check_One && check_Two) {
								if (product.getName().toLowerCase().contains("pro")
										&& product.getName().toLowerCase().contains("max")
										&& product.getName().toLowerCase().contains("cũ")) {
									lstRes.add(product);
								}
							} else if (check_One == false && check_Two == false) {
								if (!product.getName().toLowerCase().contains("pro")
										&& !product.getName().toLowerCase().contains("max")
										&& product.getName().toLowerCase().contains("cũ")) {
									lstRes.add(product);
								}
							} else if (check_One && check_Two == false) {
								if (product.getName().toLowerCase().contains("pro")
										&& !product.getName().toLowerCase().contains("max")
										&& product.getName().toLowerCase().contains("cũ")) {
									lstRes.add(product);
								}
							}
						}
					}
				}
			} else {
				// dưới đây sẽ xử lý cho các điện thoại khác iphone , e xử lý cho iphone các điện thoại khác tương tự

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lstRes;
	}

	private boolean kiemTraExistCu(String lowerCase) {
		// TODO Auto-generated method stub
		return lowerCase.contains("cũ");
	}

	private boolean kiemTraExistMax(String lowerCase) {
		// TODO Auto-generated method stub
		return lowerCase.contains("max");
	}

	private boolean kiemTraExistPro(String lowerCase) {
		// TODO Auto-generated method stub
		return lowerCase.contains("pro");
	}

	private int getNumIP(String lowerCase) {
		// TODO Auto-generated method stub
		String[] p = lowerCase.trim().split("\\s+");
		return Integer.valueOf(p[3].trim());
	}

	public Product selectProByID(String productID) {
		// TODO Auto-generated method stub
		Product pro = null;
		try {
			ArrayList<Product> lstpro = selectAll();
			for (Product product : lstpro) {
				if (product.getProductID().equalsIgnoreCase(productID)) {
					pro = product;
					break;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pro;
	}
	public Product selectProByID2(String productID) {
		Product pro = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM product WHERE productID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, productID);
			ResultSet rs = stm.executeQuery();
			ProductCategoriesDAO proCateDao = new ProductCategoriesDAO();
			InformationproductDAO inforDao = new InformationproductDAO();
			while(rs.next()) {
				String proID = rs.getString("productID");
				String name = rs.getString("name");
				String price = rs.getString("price");
				int stock = rs.getInt("stockQuantity");
				String des = rs.getString("description");
				String img = rs.getString("image");
				Date date = rs.getDate("createAt");
				if (date == null) {
					date = null;
				}

				String proCateID = rs.getString("productCategoriesID");
				ProductCategories proMD = new ProductCategories();
				proMD.setProductCategoriesID(proCateID);
				ProductCategories proCate = proCateDao.selectById(proMD);

				String inforPro = rs.getString("informationProductID");
				InformationProduct infor = new InformationProduct();
				infor.setInfo_ID(inforPro);
				InformationProduct inforDB = inforDao.selectById(infor);

				Product product = new Product(proID, name, price, stock, des, img, date, proCate, inforDB);
				pro = product;
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pro;
	}

	public List<Product> getDanhSachSanPhamLQNgauNhien(Product proTmp) {
		// TODO Auto-generated method stub
		List<Product> lstRes = new ArrayList<Product>();
		Random rd = new Random();
		Map<Integer, Product> mapLQ = new LinkedHashMap<Integer, Product>();
		try {
			int index = 0;
			String getNameProduct = proTmp.getName();
			String[] splitName = getNameProduct.trim().split("\\s+");
			String categories = splitName[2];
			List<Product> lst = selectAll();
			for (Product product : lst) {
				if (product.getName().toLowerCase().contains(categories.toLowerCase())) {
					mapLQ.put(index, product);
					index++;
				}
			}
			int sumPro = 0;
			while (true) {
				int number = rd.nextInt(mapLQ.size());
				Product pro = mapLQ.get(number);
				if (lstRes.contains(pro)) {
					continue;
				} else {
					lstRes.add(pro);
					sumPro++;
					if (sumPro == 4) {
						break;
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lstRes;
	}

	public static void main(String[] args) {
		Random rd = new Random();
		System.out.println(rd.nextInt(5));
	}

	public List<Product> getProductMain() {
		// TODO Auto-generated method stub
		List<Product> lstRes = new ArrayList<Product>();
		Random rd = new Random();
		Map<Integer, Product> mapLQ = new LinkedHashMap<Integer, Product>();
		try {
			int index = 0;
			ArrayList<Product> lst = selectAll();
			for (Product product : lst) {
				mapLQ.put(index, product);
				index++;
			}
			int sumPro = 0;
			while (true) {
				int number = rd.nextInt(mapLQ.size());
				Product pro = mapLQ.get(number);
				if (lstRes.contains(pro)) {
					continue;
				} else {
					lstRes.add(pro);
					sumPro++;
					if (sumPro == 4) {
						break;
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lstRes;
	}

	public int capNhatStockQuantity(String productID, int i) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE product SET stockQuantity = ? WHERE productID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, i);
			stm.setString(2, productID.trim());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public String getInfoIDCur() {
		// TODO Auto-generated method stub
		String ans = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM product ORDER BY productID DESC LIMIT 1";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				String proID = rs.getString("productID");
				ans = proID;
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans;
	}

	public int insertImagePhone(Product product) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE product SET image = ? WHERE productID = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, product.getImage());
			stm.setString(2, product.getProductID());
			res = stm.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	public boolean deleteProductByID(String productID) {
		// TODO Auto-generated method stub
		boolean res = false;
		int resInt = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM product WHERE productID=?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, productID);
			resInt = stm.executeUpdate();
			if(resInt > 0) {
				res = true;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return res;
	}

	public int getNumPhoneByCate(String nameCategories) {
		// TODO Auto-generated method stub
		ArrayList<Product> ans = new ArrayList<Product>();
		try {
			ArrayList<Product> all = selectAll();
			for (Product product : all) {
				if(product.getCategories().getNameCategories().equalsIgnoreCase(nameCategories)) {
					ans.add(product);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ans.size();
	}

	public List<Product> selectSoSPDaDangBan(String userID) {
		// TODO Auto-generated method stub
		List<Product> liPro = new ArrayList<Product>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM product WHERE userID = ? AND status = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, userID.trim());
			stm.setString(2, "còn hàng");
			ResultSet rs = stm.executeQuery();
			InformationproductDAO inforDAO = new InformationproductDAO();
			ProductCategoriesDAO proCateDAO = new ProductCategoriesDAO();
			UserDao userDAO = new UserDao();
			while(rs.next()) {
				String productID = rs.getString("productID");
				String name = rs.getString("name");
				String price = rs.getString("price");
				int stock = rs.getInt("stockQuantity");
				String des = rs.getString("description");
				String img = rs.getString("image");
				Date createAt = rs.getDate("createAt");
				String proCateID = rs.getString("productCategoriesID");
				String infoProID = rs.getString("informationProductID");
				String usID = rs.getString("userID");
				String status = rs.getString("status");
				Product pro = new Product(productID, name, price, price, stock, des, img, createAt, proCateDAO.getProCateByID(proCateID), inforDAO.selectByIDNew(infoProID), userDAO.selectById3(userID), status);
				liPro.add(pro);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return liPro;
	}

	public List<Product> selectSoSPDaThuHoi(String userID) {
		// TODO Auto-generated method stub
		List<Product> liPro = new ArrayList<Product>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM product WHERE userID = ? AND status = ?";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, userID.trim());
			stm.setString(2, "thu hồi");
			ResultSet rs = stm.executeQuery();
			InformationproductDAO inforDAO = new InformationproductDAO();
			ProductCategoriesDAO proCateDAO = new ProductCategoriesDAO();
			UserDao userDAO = new UserDao();
			while(rs.next()) {
				String productID = rs.getString("productID");
				String name = rs.getString("name");
				String price = rs.getString("price");
				int stock = rs.getInt("stockQuantity");
				String des = rs.getString("description");
				String img = rs.getString("image");
				Date createAt = rs.getDate("createAt");
				String proCateID = rs.getString("productCategoriesID");
				String infoProID = rs.getString("informationProductID");
				String usID = rs.getString("userID");
				String status = rs.getString("status");
				Product pro = new Product(productID, name, price, price, stock, des, img, createAt, proCateDAO.getProCateByID(proCateID), inforDAO.selectByIDNew(infoProID), userDAO.selectById3(userID), status);
				liPro.add(pro);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return liPro;
	}
}
