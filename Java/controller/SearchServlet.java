package controller;

import beans.Product;
import dataBase.SearchDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "SearchServlet", urlPatterns = "/HUDI_war_exploded/search")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("q");
        SearchDAO searchDAO = new SearchDAO();
        Collection<Product> values = searchDAO.search(search);
        request.setAttribute("search", values);
        System.out.println(values);
        request.getRequestDispatcher("test.jsp").forward(request,response);
    }
}
