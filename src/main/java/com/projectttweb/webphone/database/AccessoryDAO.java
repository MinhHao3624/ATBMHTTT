package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.projectttweb.webphone.database.DAOInterface;
import com.projectttweb.webphone.database.JDBCUtil;
import com.projectttweb.webphone.model.Accessory;

public class AccessoryDAO implements DAOInterface<Accessory> {

    @Override
    public ArrayList<Accessory> selectAll() {
        ArrayList<Accessory> listAccessories = new ArrayList<>();
        try {
            Connection con = JDBCUtil.getConnection();
            if (con == null) {
                throw new SQLException("Không thể kết nối tới cơ sở dữ liệu");
            }

            String sql = "SELECT * FROM Accessories";
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Accessory accessory = new Accessory();
                accessory.setAccessoryID(rs.getInt("accessoryID"));
                accessory.setName(rs.getString("name"));
                accessory.setPrice(rs.getDouble("price"));
                accessory.setOriginalPrice(rs.getDouble("originalPrice") != 0 ? rs.getDouble("originalPrice") : rs.getDouble("price"));
                accessory.setDiscount(rs.getInt("discount"));
                accessory.setType(rs.getString("type"));
                accessory.setBrand(rs.getString("brand"));
                accessory.setImage(rs.getString("image"));
                accessory.setDescription(rs.getString("description"));
                accessory.setStock(rs.getInt("stock"));
                accessory.setCreatedAt(rs.getTimestamp("createdAt"));
                listAccessories.add(accessory);
            }

            JDBCUtil.closeConnection(con);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listAccessories;
    }

    @Override
    public Accessory selectById(Accessory t) {
        Accessory accessory = null;
        try {
            Connection conn = JDBCUtil.getConnection();
            if (conn == null) {
                throw new SQLException("Không thể kết nối tới cơ sở dữ liệu");
            }

            String sql = "SELECT * FROM Accessories WHERE accessoryID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, t.getAccessoryID());
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                accessory = new Accessory();
                accessory.setAccessoryID(rs.getInt("accessoryID"));
                accessory.setName(rs.getString("name"));
                accessory.setPrice(rs.getDouble("price"));
                accessory.setOriginalPrice(rs.getDouble("originalPrice") != 0 ? rs.getDouble("originalPrice") : rs.getDouble("price"));
                accessory.setDiscount(rs.getInt("discount"));
                accessory.setType(rs.getString("type"));
                accessory.setBrand(rs.getString("brand"));
                accessory.setImage(rs.getString("image"));
                accessory.setDescription(rs.getString("description"));
                accessory.setStock(rs.getInt("stock"));
                accessory.setCreatedAt(rs.getTimestamp("createdAt"));
            }

            JDBCUtil.closeConnection(conn);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return accessory;
    }

    @Override
    public int insert(Accessory t) {
        int result = 0;
        try {
            Connection conn = JDBCUtil.getConnection();
            if (conn == null) {
                throw new SQLException("Không thể kết nối tới cơ sở dữ liệu");
            }

            String sql = "INSERT INTO Accessories (accessoryID, name, price, originalPrice, discount, type, brand, image, description, stock, createdAt) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, t.getAccessoryID());
            pstmt.setString(2, t.getName());
            pstmt.setDouble(3, t.getPrice());
            pstmt.setDouble(4, t.getOriginalPrice());
            pstmt.setInt(5, t.getDiscount());
            pstmt.setString(6, t.getType());
            pstmt.setString(7, t.getBrand());
            pstmt.setString(8, t.getImage());
            pstmt.setString(9, t.getDescription());
            pstmt.setInt(10, t.getStock());
            pstmt.setTimestamp(11, t.getCreatedAt());

            result = pstmt.executeUpdate();
            System.out.println("Đã thực thi: " + sql);
            System.out.println("Có " + result + " dòng được thêm");

            JDBCUtil.closeConnection(conn);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int insertAll(ArrayList<Accessory> arr) {
        int result = 0;
        try {
            Connection conn = JDBCUtil.getConnection();
            if (conn == null) {
                throw new SQLException("Không thể kết nối tới cơ sở dữ liệu");
            }

            String sql = "INSERT INTO Accessories (accessoryID, name, price, originalPrice, discount, type, brand, image, description, stock, createdAt) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            for (Accessory t : arr) {
                pstmt.setInt(1, t.getAccessoryID());
                pstmt.setString(2, t.getName());
                pstmt.setDouble(3, t.getPrice());
                pstmt.setDouble(4, t.getOriginalPrice());
                pstmt.setInt(5, t.getDiscount());
                pstmt.setString(6, t.getType());
                pstmt.setString(7, t.getBrand());
                pstmt.setString(8, t.getImage());
                pstmt.setString(9, t.getDescription());
                pstmt.setInt(10, t.getStock());
                pstmt.setTimestamp(11, t.getCreatedAt());

                result += pstmt.executeUpdate();
            }

            System.out.println("Đã thêm " + result + " phụ kiện");
            JDBCUtil.closeConnection(conn);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int delete(Accessory t) {
        int result = 0;
        try {
            Connection conn = JDBCUtil.getConnection();
            if (conn == null) {
                throw new SQLException("Không thể kết nối tới cơ sở dữ liệu");
            }

            String sql = "DELETE FROM Accessories WHERE accessoryID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, t.getAccessoryID());

            result = pstmt.executeUpdate();
            System.out.println("Đã xóa " + result + " phụ kiện với ID: " + t.getAccessoryID());

            JDBCUtil.closeConnection(conn);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int deleteAll(ArrayList<Accessory> arr) {
        int result = 0;
        try {
            Connection conn = JDBCUtil.getConnection();
            if (conn == null) {
                throw new SQLException("Không thể kết nối tới cơ sở dữ liệu");
            }

            String sql = "DELETE FROM Accessories WHERE accessoryID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            for (Accessory t : arr) {
                pstmt.setInt(1, t.getAccessoryID());
                result += pstmt.executeUpdate();
            }

            System.out.println("Đã xóa " + result + " phụ kiện");
            JDBCUtil.closeConnection(conn);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int update(Accessory t) {
        int result = 0;
        try {
            Connection conn = JDBCUtil.getConnection();
            if (conn == null) {
                throw new SQLException("Không thể kết nối tới cơ sở dữ liệu");
            }

            String sql = "UPDATE Accessories SET name = ?, price = ?, originalPrice = ?, discount = ?, type = ?, brand = ?, image = ?, description = ?, stock = ?, createdAt = ? " +
                    "WHERE accessoryID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, t.getName());
            pstmt.setDouble(2, t.getPrice());
            pstmt.setDouble(3, t.getOriginalPrice());
            pstmt.setInt(4, t.getDiscount());
            pstmt.setString(5, t.getType());
            pstmt.setString(6, t.getBrand());
            pstmt.setString(7, t.getImage());
            pstmt.setString(8, t.getDescription());
            pstmt.setInt(9, t.getStock());
            pstmt.setTimestamp(10, t.getCreatedAt());
            pstmt.setInt(11, t.getAccessoryID());

            result = pstmt.executeUpdate();
            System.out.println("Đã cập nhật " + result + " phụ kiện với ID: " + t.getAccessoryID());

            JDBCUtil.closeConnection(conn);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Phương thức bổ sung từ phiên bản trước để tương thích với LoadAccessoriesServlet
    public ArrayList<Accessory> getAccessories(String type, String brand, String price, int offset, int limit) {
        ArrayList<Accessory> listAccessories = new ArrayList<>();
        try {
            Connection conn = JDBCUtil.getConnection();
            if (conn == null) {
                throw new SQLException("Không thể kết nối tới cơ sở dữ liệu");
            }

            StringBuilder sql = new StringBuilder("SELECT * FROM Accessories WHERE 1=1");
            ArrayList<String> params = new ArrayList<>();

            if (!type.equals("Tatca")) {
                sql.append(" AND type = ?");
                params.add(type);
            }
            if (!brand.equals("Tatca")) {
                sql.append(" AND brand = ?");
                params.add(brand);
            }
            if (!price.equals("Tatca")) {
                if (price.equals("duoi500ngan")) {
                    sql.append(" AND price < 500000");
                } else if (price.equals("tu500nganden1trieu")) {
                    sql.append(" AND price BETWEEN 500000 AND 1000000");
                } else if (price.equals("tren1trieu")) {
                    sql.append(" AND price > 1000000");
                }
            }
            sql.append(" LIMIT ?, ?");

            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            for (int i = 0; i < params.size(); i++) {
                pstmt.setString(i + 1, params.get(i));
            }
            pstmt.setInt(params.size() + 1, offset);
            pstmt.setInt(params.size() + 2, limit);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Accessory accessory = new Accessory();
                accessory.setAccessoryID(rs.getInt("accessoryID"));
                accessory.setName(rs.getString("name"));
                accessory.setPrice(rs.getDouble("price"));
                accessory.setOriginalPrice(rs.getDouble("originalPrice") != 0 ? rs.getDouble("originalPrice") : rs.getDouble("price"));
                accessory.setDiscount(rs.getInt("discount"));
                accessory.setType(rs.getString("type"));
                accessory.setBrand(rs.getString("brand"));
                accessory.setImage(rs.getString("image"));
                accessory.setDescription(rs.getString("description"));
                accessory.setStock(rs.getInt("stock"));
                accessory.setCreatedAt(rs.getTimestamp("createdAt"));
                listAccessories.add(accessory);
            }

            JDBCUtil.closeConnection(conn);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listAccessories;
    }

    // Phương thức bổ sung để tính tổng số phụ kiện
    public int getTotalAccessories(String type, String brand, String price) {
        int total = 0;
        try {
            Connection conn = JDBCUtil.getConnection();
            if (conn == null) {
                throw new SQLException("Không thể kết nối tới cơ sở dữ liệu");
            }

            StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM Accessories WHERE 1=1");
            ArrayList<String> params = new ArrayList<>();

            if (!type.equals("Tatca")) {
                sql.append(" AND type = ?");
                params.add(type);
            }
            if (!brand.equals("Tatca")) {
                sql.append(" AND brand = ?");
                params.add(brand);
            }
            if (!price.equals("Tatca")) {
                if (price.equals("duoi500ngan")) {
                    sql.append(" AND price < 500000");
                } else if (price.equals("tu500nganden1trieu")) {
                    sql.append(" AND price BETWEEN 500000 AND 1000000");
                } else if (price.equals("tren1trieu")) {
                    sql.append(" AND price > 1000000");
                }
            }

            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            for (int i = 0; i < params.size(); i++) {
                pstmt.setString(i + 1, params.get(i));
            }

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }

            JDBCUtil.closeConnection(conn);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return total;
    }
}