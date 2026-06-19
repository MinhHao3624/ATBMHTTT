package com.projectttweb.webphone.database;

import java.sql.Connection;
import java.sql.Statement;

public class DBUpdater {
    public static void main(String[] args) {
        try {
            Connection con = JDBCUtil.getConnection();
            if (con != null) {
                Statement stmt = con.createStatement();
                try { stmt.execute("ALTER TABLE orders ADD COLUMN signatureStatus VARCHAR(50) DEFAULT 'Chưa ký xác nhận'"); } catch(Exception e){ System.out.println(e.getMessage()); }
                try { stmt.execute("ALTER TABLE orders ADD COLUMN digitalSignature TEXT"); } catch(Exception e){}
                try { stmt.execute("ALTER TABLE orders ADD COLUMN publicKeyUsed TEXT"); } catch(Exception e){}
                try { stmt.execute("ALTER TABLE orders ADD COLUMN signatureDeadline DATETIME"); } catch(Exception e){}
                System.out.println("DB Updated successfully!");
                JDBCUtil.closeConnection(con);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
