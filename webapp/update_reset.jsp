<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/16/2021
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="tools.MaHoa" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    MaHoa md = new MaHoa();
    String ma_dang_nhap = request.getParameter("ma_dang_nhap");
    String np = request.getParameter("newpassword");
    String cp = request.getParameter("confirmpassword");
    //out.println(np +"/"+ cp);

    if (np.equals(" ") || cp.equals(" ")) {%>
<div class="alert success" style="padding: 30px; background-color: grey;
 color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin: 10%
 5% 15% 20%;">
    <a href="reset_password?ma_dang_nhap=<%=ma_dang_nhap%>"> <span
            class="closebtn" style="color: white; font-weight: bold; float: right;
    font-size: 40px; line-height: 35px; cursor: pointer; transition:
   0.3s;">&times;</span> </a>
    <h1 style="font-size:30px;">&nbsp;&nbsp; Please Fill Both The Fields
    </h1>
    <center><a href="reset_password?ma_dang_nhap=<%=ma_dang_nhap%>"><h2><input
            type="button" value="OK"></h2></a></center>
</div>
<% } else if (!np.equals(cp)) {
%>
<div class="alert success" style="padding: 30px; background-color: grey;
  color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin: 10%
  5% 15% 20%;">
    <a href="reset_password?ma_dang_nhap=<%=ma_dang_nhap%>"> <span
            class="closebtn" style="color: white; font-weight: bold; float: right;
        font-size: 40px; line-height: 35px; cursor: pointer; transition:
             0.3s;">&times;</span> </a>
    <h1 style="font-size:30px;">&nbsp;&nbsp; The Two Passwords Do Not
        Match. Try Again </h1>
    <center><a href="reset_password?ma_dang_nhap=<%=ma_dang_nhap%>"><h2>
        <input type="button" value="OK"></h2></a></center>
</div>
<%
} else {
    try {
        // Register JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Open a connection
        Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8", "root", "");
        // Execute SQL query
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("update user set mat_khau = '" + md.maHoaMD5(np) + "'where ma_dang_nhap = " + ma_dang_nhap + "");
%>
<div class="alert success" style="padding: 30px; background-color:
       grey; color: white; opacity: 1; transition: opacity 0.6s; width:65%;
      margin: 10% 5% 15% 20%;">
    <a href="login.jsp"> <span class="closebtn" style="color: white;
        font-weight: bold; float: right; font-size: 40px; line-height: 35px;
         cursor: pointer; transition: 0.3s;">&times;</span> </a>
    <h1 style="font-size:30px;">&nbsp;&nbsp; The Password Is
        Successfully Reset.<br>&nbsp;&nbsp; Try Login With New
        Password</h1>
    <br><br>
    <center><a href="login.jsp"><p style="font-size:20px">
        <input type="button" style="width:40px; height:35px;"
               value="OK"></p></a>
    </center>
</div>
<%
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }
    }
%>
