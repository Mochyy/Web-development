package controller;

import Model.Account;
import beans.Product;
import db.ConnectionDB;
import tools.MaHoa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ListAccount {
    public boolean kiemtrataikhoan(String email) throws SQLException {
        Connection conn = ConnectionDB.getConn();
        String sql = "select email from user where email =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
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

    public void themTaiKhoan(Account account) {
        Connection conn = ConnectionDB.getConn();
        String sql = "insert into user value (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, account.getMaTaiKhoan());
            ps.setString(2, account.getTenDangNhap());
            ps.setString(3, account.getMatkhau());
            ps.setString(4, account.getEmail());
            ps.setString(5, "user");
            ps.setString(6, account.getTen());
            ps.setString(7, account.getHo());
            ps.setString(8, account.getPhone());
            ps.executeUpdate();
            ps.close();

        } catch (Exception e) {
            Logger.getLogger(ListAccount.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public boolean kiemtradangnhap(String email, String matkhau) {
        Connection conn = ConnectionDB.getConn();
        String sql = "select ten_tai_khoan, mat_khau from user where email =? and mat_khau =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, matkhau);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(ListAccount.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public boolean kiemtraadmin(String email, String matkhau) {
        Connection conn = ConnectionDB.getConn();
        String sql = "select ten_tai_khoan, mat_khau from user where email =? and mat_khau =? and vai_tro=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, matkhau);
            ps.setString(3, "admin");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            Logger.getLogger(ListAccount.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public boolean updateTaiKhoan(String email, String ten, String ho, String tenDangNhap, String newemail, String newpass) {
        try (Connection con = ConnectionDB.open()) {

            String sql = "SELECT * FROM user WHERE email=?";

            PreparedStatement ps1 = con.prepareStatement(sql);
            ps1.setString(1, email);
            ResultSet rs1 = ps1.executeQuery();

            String up;
            int result = 0;
//            int so_luong = 1;
            // chứng tỏ có sản phẩm đó trong giỏ
            if (rs1.next()) {
                up = "UPDATE user set ten = ?, ho = ?, ten_tai_khoan=?,email=?, mat_khau=? WHERE email=?";
                PreparedStatement ps2 = con.prepareStatement(up);
                ps2.setString(1, ten);
                ps2.setString(2, ho);
                ps2.setString(3, tenDangNhap);
                ps2.setString(4, newemail);
                ps2.setString(5,newpass);
                ps2.setString(6, email);
                result = ps2.executeUpdate();

                ps2.close();

            }
            rs1.close();
            ps1.close();
            if (result != 0) {
                return true;
            } else return false;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }

    }

    public boolean checkPass(String pass, String email) {
        try (Connection con = ConnectionDB.open()) {

            String sql = "SELECT * FROM user WHERE mat_khau=? and email=?";
            PreparedStatement ps1 = con.prepareStatement(sql);
            ps1.setString(1, pass);
            ps1.setString(2,email);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                System.out.println("true");
                return true;
            }
            con.close();
            ps1.close();
            rs1.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;

        }
        return false;
    }

    public List<Account> getByID(String id) {
        List<Account> arr = new ArrayList<>();
        try (Connection connection = ConnectionDB.open()) {
            String sql = "select * from user where email=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                arr.add(new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
            rs.close();
            ps.close();
            return arr;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return arr;
    }

    public static void main(String[] args) throws SQLException {
        ListAccount l = new ListAccount();
//        System.out.println(l.kiemtrataikhoan("lediemmy12.hm@gmail.com"));
//        l.themTaiKhoan(new Account("1","lediemmy","123","lediemmy.hm@gmail.com","admin","","",""));
//        l.kiemtradangnhap("lediemmy.hm@gmail.com","12345");
//        l.updateTaiKhoan("124", "a", "b", "gd1", "gd1@gmail.com");
//        l.checkPass(MaHoa.maHoaMD5("hy"), "hy1@gmail.com");
    }

}
