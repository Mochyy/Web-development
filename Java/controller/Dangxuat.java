package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Dangxuat", urlPatterns = "/HUDI_war_exploded/dangxuat")
public class Dangxuat extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("command").equals("logout")){
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("/HUDI_war_exploded/index.jsp");
            }
    }
}
