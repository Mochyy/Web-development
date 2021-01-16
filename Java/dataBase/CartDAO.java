package dataBase;

import db.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDAO {

    public CartDAO() {
    }
    public boolean addCart(String ma_kh,String ma_sp){

        try(Connection con = ConnectionDB.open()) {

            String sql = "SELECT * FROM gio_hang WHERE ma_kh = ? and ma_sp = ?";

            PreparedStatement ps1 = con.prepareStatement(sql);
            ps1.setString(1,ma_kh);
            ps1.setString(2,ma_sp);

            ResultSet rs1 = ps1.executeQuery();

           String up;
            int so_luong = 1;
            // chứng tỏ có sản phẩm đó trong giỏ
            if (rs1.next()){
                String exe = " SELECT so_luong FROM gio_hang WHERE ma_kh = ? and ma_sp = ?";
                PreparedStatement ps2 = con.prepareStatement(exe);
                ps2.setString(1,ma_kh);
                ps2.setString(2,ma_sp);

                ResultSet rs2 = ps2.executeQuery();
                rs2.next();

                so_luong = rs2.getInt(1) + 1;

                up = "UPDATE gio_hang set so_luong = ? WHERE ma_kh = ? and ma_sp = ?";

                rs2.close();
                ps2.close();

            }else{
                up = "INSERT INTO gio_hang(so_luong,ma_kh,ma_sp) VALUES (?,?,?)";
            }
            rs1.close();
            ps1.close();

            PreparedStatement ps3 = con.prepareStatement(up);
            ps3.setInt(1,so_luong);
            ps3.setString(2,ma_kh);
            ps3.setString(3,ma_sp);

            int result = ps3.executeUpdate();

            ps3.close();

            if (result != 0){
                return true;
            }else return false;


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

    }

    public static void main(String[] args) {
        CartDAO cartDAO = new CartDAO();
        System.out.println(cartDAO.addCart("kh001","B07YD4HQLY"));
    }
}
