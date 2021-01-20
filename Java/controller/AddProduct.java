package controller;

import db.ConnectionDB;
import entity.ProductEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "addProduct", urlPatterns = "/addProduct")
public class AddProduct extends HttpServlet {
    private ProductEntity dao = new ProductEntity();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String img = request.getParameter("img");
        boolean check = dao.addProduct(id, name, img, price, category);
        if (check) {
            request.setAttribute("notice", "Thêm sản phẩm " + name + " thành công");
        } else {
            request.setAttribute("notice", "Thêm sản phẩm " + name + " thất bại");
        }
        request.getRequestDispatcher("Nhapkho.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Nhapkho.jsp").forward(request, response);
    }
}
