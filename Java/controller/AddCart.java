package controller;

import Model.Cart;
import beans.Product;
import entity.ProductEntity;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddCart", urlPatterns = "/AddCart")
public class AddCart extends HttpServlet {
    private ProductEntity pe = new ProductEntity();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String msp = request.getParameter("id");
        String command =request.getParameter("command");
        String cartID = request.getParameter("cartId");

        System.out.println("insert" + msp +"\t" + command +"\t" + cartID);


//        request.getRequestDispatcher("lab6.jsp").forward(request,response);

        ArrayList<Long> listBuy=null;
        String url = "/cart.jsp";
        try {
            listBuy = (ArrayList<Long>) session.getAttribute("cartId");
            long idBuy =0;
            if (request.getParameter("cartId")!=null){
                idBuy =Long.parseLong(request.getParameter("cartId"));
            }
            Product p = pe.getById(msp);
            switch (command){
                case "insert":
                    if (listBuy==null){
                        listBuy = new ArrayList<>();
                        session.setAttribute("cartId", idBuy);
                    }
                    if (!listBuy.contains(idBuy)){
                        cart.AddToCart(p,1);
                        listBuy.add(idBuy);
                    }
                    url="/cart.jsp";
                    break;
                default:
                    break;
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
