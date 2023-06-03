/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huyparody
 */
public class DBUtility {

    public static Connection openConnection() {
        Connection con = null;
        String url = "jdbc:sqlserver://DESKTOP-8N3U7OO\\SQLEXPRESS:1433;databasename=db_ql_quancafe;"+ "username=sa;password=123; encrypt=true;trustServerCertificate=true;" ;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url);
            System.out.println("ket noi thanh cong");
        } catch (ClassNotFoundException | SQLException e) {
        }
        return con;
    }

    public static void closeAll(Connection con, PreparedStatement pstmt, ResultSet rs) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBUtility.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
