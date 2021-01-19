

<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/16/2021
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="tools.MaHoa" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.MimeMessage" %>

<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    MaHoa md = new MaHoa();
    String smail = request.getParameter("email");
    int ma_dang_nhap = 0;
    if (smail != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = null;
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8", "root", "");

            Statement stmt = conn.createStatement();

            String sql1;
            sql1 = "SELECT email FROM user WHERE email = '" + smail + "'";

            ResultSet rs1 = stmt.executeQuery(sql1);

            if (rs1.first()) {
                String sql;
                sql = "SELECT ma_dang_nhap FROM user where email='" + smail + "'";
                ResultSet rs2 = stmt.executeQuery(sql);


                while (rs2.next()) {

                    ma_dang_nhap = rs2.getInt("ma_dang_nhap");
                }

                Timestamp intime = new Timestamp(new Date().getTime());

                Calendar cal = Calendar.getInstance();
                cal.setTimeInMillis(intime.getTime());
                cal.add(Calendar.MINUTE, 20);
                Timestamp exptime = new Timestamp(cal.getTime().getTime());

                int Rand_num = (int) (Math.random() * 1000000);
                String Rand = Integer.toString(Rand_num);
                String finale = (Rand + "" + intime); //
                String hash = md.maHoaMD5(finale); //hash code

                String save_hash = "insert into  reset_password (ma_dang_nhap, hash_code, exptime, datetime) values(" + ma_dang_nhap + ", '" + hash + "', '" + exptime + "', '" + intime + "')";
                int saved = stmt.executeUpdate(save_hash);
                if (saved > 0) {
                    String link = "http://localhost:8080/HUDI_war_exploded/reset_password.jsp";

                    String Host = "", user = "", pass = "";


                    Host = "smtp.gmail.com";
                    user = "truongnguyenthienan115@gmail.com";
                    pass = "uqtgslthlwzayfdp";


                    String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
                    String to = smail;
                    String from = "POTAMATO@gmail.com";
                    String subject = "Password Reset";
                    String messageText = " Click <a href=" + link + "?key=" + hash + ">Here</a> To Reset your Password. You must reset your password within 20 minutes.";//messageString;
                    String fileAttachment = "";
                    boolean WasEmailSent;
                    boolean sessionDebug = true;
                    Properties props = System.getProperties();
                    props.put("mail.Host", Host);
                    props.put("mail.transport.protocol.", "smtp");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.", "true");
                    props.put("mail.smtp.port", "465");
                    props.put("mail.smtp.socketFactory.fallback", "false");
                    props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
                    Session mailSession = Session.getDefaultInstance(props, null);
                    mailSession.setDebug(sessionDebug);
                    Message msg = new MimeMessage(mailSession);
                    msg.setFrom(new InternetAddress(from));
                    InternetAddress[] address = {new InternetAddress(to)};
                    msg.setRecipients(Message.RecipientType.TO, address);
                    msg.setSubject(subject);
                    msg.setContent(messageText, "text/html");
                    Transport transport = mailSession.getTransport("smtp");
                    transport.connect(Host, user, pass);
%>
<div class="alert success" style="padding: 30px; background-color: grey;
  color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin: 10%
 5%
15% 20%;">
    <a href="forgotpassword.jsp"> <span class="closebtn" style="color: white;
font-weight: bold; float: right; font-size: 40px; line-height: 35px; cursor:
pointer; transition: 0.3s;">&times;</span> </a>
    <h1 style="font-size:30px;">&nbsp;&nbsp; <strong>Check Your Email. Link To
        Reset Your Password Is Sent To : <% System.out.println(" " + smail); %></strong>
    </h1>
    <center><a href="forgotpassword.jsp"><h2><input type="button" value="OK">
    </h2></a></center>
</div>
<%
        try {
            transport.sendMessage(msg, msg.getAllRecipients());
            WasEmailSent = true; // assume it was sent
        } catch (Exception err) {
            WasEmailSent = false; // assume it's a fail
        }
        transport.close();
        //-----------------------------------------------
    }
} else {
%>
<div class="alert success" style="padding: 30px; background-color: grey;
 color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin: 10%
 5% 15% 20%;">
    <a href="forgotpassword.jsp"> <span class="closebtn" style="color:
 white; font-weight: bold; float: right; font-size: 40px; line-height: 35px;
 cursor: pointer; transition: 0.3s;">&times;</span> </a>
    <h1 style="font-size:30px;">&nbsp;&nbsp; <strong>There Is No Email As
        Such <% System.out.println(" " + smail); %></strong>Try Again </h1>
    <center><a href="forgotpassword.jsp"><h2><input type="button"
                                                    value="OK"></h2></a></center>
</div>
<%
        }

        stmt.close();
        rs1.close();
        conn.close();
    } catch (SQLException se) {
//Handle errors for JDBC
        se.printStackTrace();
    } catch (Exception e) {
//Handle errors for Class.forName
        e.printStackTrace();
    }
} else {
%>
<div class="alert success" style="padding: 30px; background-color: grey;
 color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin: 10%
 5% 15% 20%;">
    <a href="forgotpassword.jsp"> <span class="closebtn" style="color: white;
  font-weight: bold; float: right; font-size: 40px; line-height: 35px;
 cursor:
 pointer; transition: 0.3s;">&times;</span> </a>
    <h1 style="font-size:30px;">&nbsp;&nbsp; <strong>Please Enter The Valid
        Email Address</strong></h1>
    <center><a href="forgotpassword.jsp"><h2><input type="button" value="OK">
    </h2></a></center>
</div>
<%
    }
%>

