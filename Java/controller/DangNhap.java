package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DangNhap",urlPatterns = "/HUDI_war_exploded/dangnhap")
public class DangNhap extends HttpServlet {
    private ListAccount acc = new ListAccount();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String email = request.getParameter("singin-email");
        String matkhau = request.getParameter("singin-password");
        String err="";
        if (email.equals("")||matkhau.equals("")){
            err="vui long nhap day du";
        }else if (acc.kiemtradangnhap(email,matkhau)==false)
            err = "Email hoặc mật khẩu không chính xác";

        if (err.length()>0)
            request.setAttribute("err",err);
        String url = "/login.jsp";
        try {
            if (err.length()==0) {
                HttpSession session = request.getSession();
                session.setAttribute("username", email);
                url = "/index.jsp";
            } else {
                url = "/PageLogin.jsp";
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
