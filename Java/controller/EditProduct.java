package controller;

import beans.Product;
import entity.ProductEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "editProduct", urlPatterns = "/editProduct")
public class EditProduct extends HttpServlet {
    private ProductEntity dao = new ProductEntity();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String img = request.getParameter("img");
        boolean check = dao.updateProduct(id, name, img, price, category);
        if (check) {
            request.setAttribute("notice", "Cập nhật sản phẩm " + name + " thành công");
        } else {
            request.setAttribute("notice", "Cập nhật sản phẩm " + name + " thất bại");
        }
       doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product pro = dao.getProduct(id);
        request.setAttribute("pro",pro);
        request.getRequestDispatcher("Capnhat.jsp").forward(request,response);
    }
}
