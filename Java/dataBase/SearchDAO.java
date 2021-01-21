package dataBase;

import beans.Product;
import db.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SearchDAO {
    public SearchDAO() {
    }
    public List<Product> search(String name){
        List<Product> list = new ArrayList<>();
        try(Connection connection = ConnectionDB.open()) {
            String sql ="select * from product where name like ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,"%"+name+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9)
                ));
            }
            rs.close();
            ps.close();
            return list;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        SearchDAO s = new SearchDAO();
        System.out.println(s.search("sg").size());
    }
}
