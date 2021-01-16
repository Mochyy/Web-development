package db;

import entity.ProductEntity;
//import filter.Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import java.sql.*;

public class ConnectionDB {
    static Connection conn;
    private static String DB_URL = "jdbc:mysql://localhost:3306/test";
    private static String USER_NAME = "root";
    private static String PASSWORD = "";
    public static Statement connect() throws ClassNotFoundException, SQLException {
        if (conn == null) {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);




            return conn.createStatement();
        }else {

            return conn.createStatement();
        }
    }

    // tạo một connection đẻ kết nối cho dễ nếu tạo nagy luôn 1 cái statement lỡ có cái nó dùng prepament thì phải tạo lại
    public static Connection open(){
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8", "root", "");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    public static PreparedStatement connect(String sql) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);

            return conn.prepareStatement(sql);
        }else {

            return conn.prepareStatement(sql);
        }
    }

    public static int checkUser() throws SQLException, ClassNotFoundException {
        // cái này nó tự mở r tự đóng luôn khỏi gọi con.close();
        try(Connection con = open()){
            Statement sta = connect();
            int count = 0;
            ResultSet rs = sta.executeQuery("SELECT * FROM USER");
            while (rs.next()){
                count++;
            }
            rs.close();
            sta.close();
            return count;
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }
    public static Connection getConn(){
        conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);

        }catch (Exception e){
            e.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
       // ProductEntity pe = new ProductEntity();
//        pe.innerAll(Data.data.values());

      //  open();
getConn();
      System.out.println( checkUser());
    }
}
