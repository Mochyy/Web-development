package entity;

import Model.Category;
import beans.Product;
import db.ConnectionDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductEntity {

    private int numberPage;

    public List<Product> getAll(int nowpage, String sort, int sosp1trang) {
        ArrayList<Product> result = new ArrayList<Product>();
        try (Connection con = ConnectionDB.open()) {

//đổi giá thành 0 - 200 thôi m ý là nó chạy giá thấp hơn á 0 20 30 đồ

            // dung limit ngắn k,
            String sql = "SELECT * FROM product  ORDER BY product." + sort + " asc LIMIT ?,?";
            //String sql = "SELECT * FROM product1  ORDER BY product1.Price asc LIMIT 0,10";


            // chỗ này là đếm số sản phẩm, k có limit
            String sql1 = "SELECT * FROM product  ORDER BY ? asc";

            PreparedStatement sm = con.prepareStatement(sql1);
            sm.setString(1, sort);
            ResultSet rs1 = sm.executeQuery();
            // chuyển tới last r đếm
            rs1.last();
            int num = rs1.getRow();


            // số trang hiện thị  = số sp/sôsp1trang
            if (num % sosp1trang == 0) {
                numberPage = num / sosp1trang;
            } else {
                // lẻ thì qua trang khác
                numberPage = num / sosp1trang + 1;
            }


            rs1.close();
            sm.close();


            PreparedStatement ps = con.prepareStatement(sql);

            // có làm cái giá k
            //làm đi :v
            // cái mục bên cạch có mỗi cái giá k ak k lm size vs màu
            //ừa đúng rồi, làm mỗi giá thôi thâu cái giá bữa nào t lm chỉ cho h mò cái kia ,
            // giá thì chác thêm 1 tham số nữa

//            String sql2 = "SELECT  *  from product p "

            int start = (nowpage - 1) * sosp1trang;

            // ok hỉu

            // cái limit(start,end) nó bắt đàu lấy từ start, rồi lấy bao nhiêu (end)
            System.out.println(start);
            System.out.println(sosp1trang);

            // mé k biết s nó load tầm bậy
            // thôi có gi tham khảo cái limit á gọn hơn nhiều
            // t làm cách này xog hôm sau thầy ns sài cái limit ::((

//            ps.setString(1,sort);
            ps.setInt(1, start);
            ps.setInt(2, sosp1trang);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                result.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        getImg(rs.getString(1)),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8)

                ));

            }
            rs.close();
            ps.close();
            // lú
            return result;

        } catch (Exception e) {
            e.printStackTrace();
            return result;
        }

    }

    public String getImg(String id) {
        String resutl = "";
        try (Connection con = ConnectionDB.open()) {
            String sql = "select img_1 from img where id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                resutl = rs.getString(1);
            } else
                resutl = "";
            ps.close();
            rs.close();
            con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resutl;
    }

    public List<Product> getByCaterogy(String cate) {
        List<Product> list = new ArrayList<>();
        try (Connection con = ConnectionDB.open()) {
            String sql = "select * from product where id_loai=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cate);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getString(1),
                        rs.getString(2),
                        getImg(rs.getString(1)),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8)

                ));
            }
            rs.close();
            ps.close();
            con.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public int getNumberPage() {
        return numberPage;
    }


    public Product getById(String id) {
        PreparedStatement s = null;
//        Connection con = ConnectionDB.getConn();
        Product p = new Product();
        try {
            String sql = "select * from product where id=?";
//            PreparedStatement s = con.prepareStatement(sql);
            s = ConnectionDB.connect(sql);
            s.setString(1, id);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                p.setId(rs.getString(1));
                p.setName(rs.getString(2));
                p.setPrice(rs.getDouble(4));
            }
            rs.close();
            s.close();
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(ProductEntity.class.getName()).log(Level.SEVERE, null, e);
        }
        return p;

    }


    //    public int innerAll(Collection<Product> data) {
//        Statement s = null;
//        try {
//            s = ConnectionDB.connect();
//            String sql = "INSERT INTO producttt (id, name, img, price) VALUES ";
//            int i = 0;
//            for (Product d : data) {
//                if (i < data.size()-1)
//                    sql += "(\"" + d.getId() + "\",\"" + d.getName() + "\",\"" + d.getImg() + "\"," + d.getPrice()  + "),";
//                else
//                    sql += "(\"" + d.getId() + "\",\"" + d.getName() + "\",\"" + d.getImg() + "\"," + d.getPrice() + ")";
//                i++;
//            }
////            System.out.println(sql);
//            s.executeUpdate(sql);
//            s.close();
//            return 0;
//        } catch (SQLException | ClassNotFoundException throwables) {
//            throwables.printStackTrace();
//            return 0;
//        }
//    }
    public List<Product> getListByPage(List<Product> arr, int start, int end) {
        List<Product> listPage = new LinkedList<>();
        for (int i = start; i < end; i++) {
            listPage.add(arr.get(i));
        }
        return listPage;
    }


//    public List<Product> getListProductByCategory(String idCategory ){
//        PreparedStatement s = null;
//        List<Product> list = new LinkedList<>();
//        try {
//            String sql = "select * from product where id=?";
//            s = ConnectionDB.connect(sql);
//            s.setString(1,idCategory);
//            ResultSet rs = s.executeQuery();
//
//            while (rs.next()) {
//                Product p=new Product();
//                p.setId(rs.getString(1));
//                Category ca = new Category(rs.getString("idCategory"),"",0);
//                p.setName(rs.getString(2));
//                p.setImg(rs.getString(3));
//                p.setPrice(rs.getDouble(4));
//                p.setDescription(rs.getString(5));
//                p.setDetail(rs.getString(6));
//                p.setQuantity(rs.getString(7));
//                p.setIdCategory(ca);
//                p.setState(rs.getString(9));
//                list.add(p);
//                rs.close();
//                s.close();
//
//            }
//        } catch (SQLException | ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//public  List<Product> getAll(){
//        List<Product> arr = new ArrayList<>();
//        try(Connection connection = ConnectionDB.open()) {
//            String sql ="select * from product";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()){
//                arr.add(new Product(
//                   rs.getString(1),
//                   rs.getString(2),
//                        rs.getString(3),
//                        rs.getDouble(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getInt(7),
//                        rs.getString(8),
//                        rs.getString(9)
//                ));
//            }
//            rs.close();
//            ps.close();
//            return arr;
//
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//
//
//    return arr;
//}


    public static void main(String[] args) {
        ProductEntity p = new ProductEntity();

        System.out.println(p.getAll(2, "price", 10));
        System.out.println(p.getNumberPage());
    }
}
