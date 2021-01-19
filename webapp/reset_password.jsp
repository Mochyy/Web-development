<%@ page import="tools.MaHoa" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.Date" %>


<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/16/2021
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    MaHoa md = new MaHoa();
    String hash = (request.getParameter("key"));

    Timestamp curtime = new Timestamp(new Date().getTime());

    int ma_dang_nhap = 0;
    Timestamp exptime;

    try {
// Register JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

// Open a connection
        Connection conn = null;
        Class.forName("com.mysql.jdbc.Driver");
        conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8", "root", "");

        Statement stmt = conn.createStatement();

        String sql = "select ma_dang_nhap, exptime from reset_password where hash_code ='" + hash + "'";
        ResultSet rs = stmt.executeQuery(sql);
        if (rs.first()) {
            ma_dang_nhap = rs.getInt("ma_dang_nhap");
            exptime = rs.getTimestamp("exptime");

            //out.println(exptime+"/"+curtime);
            if ((curtime).before(exptime)) {
%>
<div class="container">
    <form class="form-signin" action="update_reset.jsp" method="Post">
        <br/><br/>
        <h4 class="form-signin-heading">Reset Your Password Here</h4>
        <br>
        <text style="font-size:13px;"><span class="req"
                                            style="color:red">* </span>Enter New Password
        </text>
        <input type="password" name="newpassword"
               class="form-control" placeholder="New Password" required autofocus>
        <br>
        <text style="font-size:13px;"><span class="req"
                                            style="color:red">* </span>Enter New Password Again
        </text>
        <input type="password" name="confirmpassword"
               class="form-control" placeholder="New Password Again" required>

        <input type="hidden" name="ma_dang_nhap" value=<%=ma_dang_nhap %>>
        <br>
        <button class="btn btn-lg btn-primary btn-block"
                type="submit">Reset Password
        </button>
    </form>
</div>
<!-- /container -->
<% } else {
%>
<div class="alert success" style="padding: 30px; background-color:
   grey; color: white; opacity: 1; transition: opacity 0.6s; width:50%;
  margin: 10% 5% 15% 20%;">
    <a href="forgotpassword.jsp"> <span class="closebtn"
                                        style="color: white; font-weight: bold; float: right; font-size: 40px;
   line-height: 35px; cursor: pointer; transition: 0.3s;">&times;</span>
    </a>
    <h1 style="font-size:30px;">&nbsp;&nbsp; The Time To Reset
        Password Has Expired.<br> &nbsp;&nbsp; Try Again </h1>
    <center><a href="forgotpassword.jsp"><h2><input type="button"
                                                    value="OK"></h2></a></center>
</div>
<%
    }
} else {
%>
<div class="alert success" style="padding: 30px; background-color: grey;
   color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin:
    10% 5% 15% 20%;">
    <a href="forgotpassword.jsp"> <span class="closebtn" style="color:
      white; font-weight: bold; float: right; font-size: 40px; line-height:
       35px; cursor: pointer; transition: 0.3s;">&times;</span> </a>
    <h1 style="font-size:30px;">&nbsp;&nbsp; The Hash Key DO Not Match.
        <br/> &nbsp;&nbsp;&nbsp;Try Again!! </h1>
    <center><a href="forgotpassword.jsp"><h2><input type="button"
                                                    value="OK"></h2></a></center>
</div>
<%
        }
        // Clean-up environment
        rs.close();
        stmt.close();
        conn.close();
    } catch (SQLException se) {
        //Handle errors for JDBC
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>