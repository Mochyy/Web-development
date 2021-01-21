package controller;

import tools.MaHoa;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UpdateUser", urlPatterns = "/HUDI_war_exploded/updateuser")
public class UpdateUser extends HttpServlet {
    ListAccount account = new ListAccount();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ho = request.getParameter("ho");
        String ten = request.getParameter("ten");
        String tenDangNhap = request.getParameter("tenDangNhap");
        String newemail = request.getParameter("email");
        String curpass = request.getParameter("curpass");
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("username");
        String errnew = "";
        String errnewre="";
//        String pass="";
        if (!account.checkPass(MaHoa.maHoaMD5(curpass), email)) {
            errnew = "Nhap sai pass";
            System.out.println(account.checkPass(curpass,email));
        }else if (!newpass.equals(renewpass)) {
            errnewre = "Da nhap sai pass";
        }
        if (errnew.length() > 0)
            request.setAttribute("errnew", errnew);
        if (errnewre.length() > 0)
            request.setAttribute("errnewre", errnewre);
        try {
            if (errnew.length() == 0 && errnewre.length() == 0) {
                account.updateTaiKhoan(email, ten, ho, tenDangNhap, newemail, MaHoa.maHoaMD5(newpass));
            }
            System.out.println(errnew);
            System.out.println(email);
            RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
