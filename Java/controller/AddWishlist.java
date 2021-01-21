package controller;

import dataBase.CartDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddWishlist", urlPatterns = "/AddWishlist")
public class AddWishlist extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ma_sp = request.getParameter("ma_sp");

        HttpSession session = request.getSession();

        // chỗ này lấy ra id khách hàng đã đăng nhập.

        // mai mốt thế zô là dc
        String ma_kh = "kh001";

        CartDAO cartDAO = new CartDAO();

        boolean result = cartDAO.addCart(ma_kh,ma_sp);

        System.out.println(ma_sp);
        System.out.println(result);

        // mé đâu ra z
        request.setAttribute("check",result);

        request.getRequestDispatcher("notifyCartStatus/AddWishlistStatus.jsp").forward(request,response);
    }
}
