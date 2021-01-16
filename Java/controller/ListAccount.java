package controller;

import Model.Account;
import db.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ListAccount {
    public boolean kiemtrataikhoan(String email) throws SQLException {
        Connection conn = ConnectionDB.getConn();
        String sql = "select email from user where email ='" + email+"'" ;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet re = ps.executeQuery();
            while (re.next()) {
                return true;
            }
            conn.close();
        } catch (SQLException e) {
            Logger.getLogger(ListAccount.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    public void themTaiKhoan(Account account){
        Connection conn = ConnectionDB.getConn();
        String sql="insert into user value (?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,account.getTenDangNhap());
            ps.setString(2,account.getMaTaiKhoan());
            ps.setString(3,account.getMatkhau());
            ps.setString(4,account.getEmail());
            ps.setString(5,account.getTrangThai());
            ps.executeUpdate();
            ps.close();

        }catch (Exception e){
            Logger.getLogger(ListAccount.class.getName()).log(Level.SEVERE,null,e);
        }
    }
    public boolean kiemtradangnhap(String email, String matkhau){
        Connection conn = ConnectionDB.getConn();
        String sql = "select ten_dang_nhap, mat_khau from user where email = '"+email+"'and mat_khau='" +matkhau+"'";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                return true;
            }
        }catch (SQLException e){
            Logger.getLogger(ListAccount.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        ListAccount l =  new ListAccount();
        System.out.println(l.kiemtrataikhoan("lediemmy12.hm@gmail.com"));
        l.themTaiKhoan(new Account("an","124","an@ytu","123","hgd"));
    }

}
