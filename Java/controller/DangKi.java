package controller;

import Model.Account;
import tools.MaHoa;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet(name = "DangKi", urlPatterns = "/HUDI_war_exploded/dangki")
public class DangKi extends HttpServlet {
    ListAccount tk = new ListAccount();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String tenDangNhap = request.getParameter("register-name");
        String email = request.getParameter("register-email");
        String matkhau = request.getParameter("register-password");

        String email_err="", matkhau_err="",tenDangNhap_err="";
        if (email.equals("")){
            email_err="vui long nhap";
        }
        if (tenDangNhap.equals("")){
           tenDangNhap_err="vui long nhap";
        }
        if (matkhau.equals("")){
            matkhau_err="vui long nhap";
        }
        if (tenDangNhap_err.length()>0){
            request.setAttribute("tenDangNhap_err", tenDangNhap_err);
        }
        if (email_err.length()>0){
            request.setAttribute("email_err", email_err);
        }
        if (matkhau_err.length()>0){
            request.setAttribute("matkhau_err", matkhau_err);
        }

        request.setAttribute("tenDangNhap", tenDangNhap);
        request.setAttribute("email", email);
        request.setAttribute("matkhau", matkhau);



        try {
            if (tk.kiemtrataikhoan(email)){
                email_err ="Địa chỉ email đã được đăng kí";
            }
            if (email_err.length()>0){
                request.setAttribute("email_err", email_err);
            }
            String url ="/PageLogin.jsp";
            if (tenDangNhap_err.length()==0&&email_err.length()==0&&matkhau_err.length()==0){
                Date id = new Date();
                Account acc = new Account(tenDangNhap,""+id.getTime(), MaHoa.maHoaMD5(matkhau),email,"sfaf");
                tk.themTaiKhoan(acc);
                url="/index.jsp";
            }else{
                url="/PageLogin.jsp";
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request,response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
