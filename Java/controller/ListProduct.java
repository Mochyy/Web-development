package controller;

import beans.Product;
import entity.ProductEntity;
//import filter.Data;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

@WebServlet(name = "ListProduct", urlPatterns = "/ListProduct")
public class ListProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


       // Collection<Product> values = new ProductEntity().getAll();
        //request.setAttribute("products", values);
        request.getRequestDispatcher("lab6.jsp").forward(request,response);

    }
}
