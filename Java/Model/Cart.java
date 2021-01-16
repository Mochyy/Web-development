package Model;

import beans.Product;
import com.sun.net.httpserver.HttpContext;

import javax.servlet.http.HttpSession;
import java.util.TreeMap;

public class Cart {
    TreeMap<Product, Integer> list;
    long cartId;

    public Cart() {
        list = new TreeMap<>();
        cartId = System.currentTimeMillis();
    }

    public Cart(TreeMap<Product, Integer> list, long cartId) {
        this.list = list;
        this.cartId = cartId;
    }

    public TreeMap<Product, Integer> getList() {
        return list;
    }

    public void setList(TreeMap<Product, Integer> list) {
        this.list = list;
    }

    public long getCartId() {
        return cartId;
    }

    public void setCartId(long cartId) {
        this.cartId = cartId;
    }

    public void AddToCart(Product p, int soluong) {
        boolean bln = list.containsKey(p);
        if (bln) {
            int sl = list.get(p);
            soluong += sl;
            list.put(p, soluong);
        } else
            list.put(p, soluong);
//        HttpContext.Session
    }

    public void subToCart(Product p, int soluong) {
        boolean bln = list.containsKey(p);
        if (bln) {
            int sl = list.get(p);
            soluong -= sl;
            if (soluong < 0) {
                list.remove(p);
            } else {
                list.remove(p);
                list.put(p, soluong);
            }
        }
    }
    public void removeToCart(Product p){
        boolean bln = list.containsKey(p);
        if(bln){
            list.remove(p);
        }
    }
}
