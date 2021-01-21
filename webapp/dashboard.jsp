<%@ page import="java.util.List" %>
<%@ page import="Model.Account" %>
<%@ page import="controller.ListAccount" %>
<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">


<!-- molla/dashboard.html  22 Nov 2019 10:03:13 GMT -->
<head>
    <meta charset="UTF-8">
    <title>POTAMATO - DASHBOARD</title>
    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
<%
    ListAccount listAccount = new ListAccount();
    List<Account> list = listAccount.getByID((String) session.getAttribute("username"));

    String errnew = "";
    String errnewre="";
    if (request.getAttribute("errnew")!=null){
        errnew = (String) request.getAttribute("errnew");
    }
    if (request.getAttribute("errnewre")!=null){
        errnewre = (String) request.getAttribute("errnewre");
    }

%>
<div class="page-wrapper">
   <jsp:include page="header.jsp"></jsp:include>

    <main class="main">
        <div class="page-header text-center" style="background-image: url('https://i.imgur.com/CoNJgta.jpg')">
            <div class="container">
                <h1 class="page-title">Tài khoản<span>Shop</span></h1>
            </div><!-- End .container -->
        </div><!-- End .page-header -->
        <nav aria-label="breadcrumb" class="breadcrumb-nav mb-3">
            <div class="container">
                <!--                <ol class="breadcrumb">-->
                <!--                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>-->
                <!--                    <li class="breadcrumb-item"><a href="#">Shop</a></li>-->
                <!--                    <li class="breadcrumb-item active" aria-current="page">My Account</li>-->
                <!--                </ol>-->
            </div><!-- End .container -->
        </nav><!-- End .breadcrumb-nav -->

        <div class="page-content">
            <div class="dashboard">
                <div class="container">
                    <div class="row">
                        <aside class="col-md-4 col-lg-3">
                            <ul class="nav nav-dashboard flex-column mb-3 mb-md-0" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="tab-dashboard-link" data-toggle="tab"
                                       href="#tab-dashboard" role="tab" aria-controls="tab-dashboard"
                                       aria-selected="true">Tổng quan</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab-orders-link" data-toggle="tab" href="#tab-orders"
                                       role="tab" aria-controls="tab-orders" aria-selected="false">Lịch sử mua hàng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab-address-link" data-toggle="tab" href="#tab-address"
                                       role="tab" aria-controls="tab-address" aria-selected="false">Địa chỉ</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab-account-link" data-toggle="tab" href="#tab-account"
                                       role="tab" aria-controls="tab-account" aria-selected="false">Thông tin đăng
                                        nhập</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/HUDI_war_exploded/dangxuat?command=logout">Đăng xuất</a>
                                </li>
                            </ul>
                        </aside><!-- End .col-lg-3 -->

                        <div class="col-md-8 col-lg-9">
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="tab-dashboard" role="tabpanel"
                                     aria-labelledby="tab-dashboard-link">
                                    <p>Chào <span class="font-weight-normal text-dark">bạn</span> (không phải <span
                                            class="font-weight-normal text-dark">người dùng</span>? <a
                                            href="/HUDI_war_exploded/dangxuat?command=logout">Đăng xuất</a>)
                                        <br>
                                        Từ trang tổng quan này, bạn có thể xem <a href="#tab-orders"
                                                                                  class="tab-trigger-link link-underline">đơn
                                            hàng đặt gần đây</a>, quản lí <a href="#tab-address"
                                                                             class="tab-trigger-link">địa chỉ giao
                                            hàng</a>, và <a href="#tab-account"
                                                            class="tab-trigger-link">thông tin tài khoản của bạn</a>.
                                    </p>
                                </div><!-- .End .tab-pane -->

                                <div class="tab-pane fade" id="tab-orders" role="tabpanel"
                                     aria-labelledby="tab-orders-link">
                                    <!--                                    <p>No order has been made yet.</p>-->
                                    <a href="order-history.html" class="btn btn-outline-primary-2"><span>Lịch sử</span><i
                                            class="icon-long-arrow-right"></i></a>
                                </div><!-- .End .tab-pane -->

                                <div class="tab-pane fade" id="tab-address" role="tabpanel"
                                     aria-labelledby="tab-address-link">
                                    <p>Địa chỉ dưới đây được mặt định khi thanh toán.</p>
                                    <%
                                        for (Account b:list){

                                    %>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="card card-dashboard">
                                                <div class="card-body">
                                                    <h3 class="card-title">Địa chỉ</h3><!-- End .card-title -->

                                                    <p>Tên:<%=b.getTenDangNhap()%><br>
                                                        Địa chỉ:<br>
                                                        Sđt:<br>
                                                        Email:<%=b.getEmail()%><br>
                                                        <a href="#">Edit <i class="icon-edit"></i></a></p>
                                                </div><!-- End .card-body -->
                                            </div><!-- End .card-dashboard -->
                                        </div><!-- End .col-lg-6 -->
                                    </div><!-- End .row -->

                                    <%}%>
                                </div><!-- .End .tab-pane -->
                                <%
                                    for (Account a:list){

                                %>
                                <div class="tab-pane fade" id="tab-account" role="tabpanel"
                                     aria-labelledby="tab-account-link">
                                    <form action="/HUDI_war_exploded/updateuser" method="post">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label>Họ *</label>
                                                <input type="text" class="form-control" required name="ho" id="ho" value="<%=a.getHo()%>">
                                            </div><!-- End .col-sm-6 -->

                                            <div class="col-sm-6">
                                                <label>Tên *</label>
                                                <input type="text" class="form-control" required name="ten" id="ten" value="<%=a.getTen()%>">
                                            </div><!-- End .col-sm-6 -->
                                        </div><!-- End .row -->

                                        <label>Tên đăng nhập *</label>
                                        <input type="text" class="form-control" required name="tenDangNhap" id="tenDangNhap" value="<%=a.getTenDangNhap()%>">
                                        <small class="form-text">This will be how your name will be displayed in the
                                            account section and in reviews</small>

                                        <label>Email *</label>
                                        <input type="email" class="form-control" required name="email" id="email" value="<%=a.getEmail()%>">

                                        <p style="color: red"><%=errnew%></p><br>
                                        <label>Mật khẩu hiện tại</label>
                                        <input type="password" class="form-control" name="curpass">

                                        <p style="color: red"><%=errnewre%></p><br>
                                        <label>Mật khẩu mới</label>
                                        <input type="password" class="form-control" name="newpass">

                                        <label>Nhập lại mật khẩu mới</label>
                                        <input type="password" class="form-control mb-2" name="renewpass">

                                        <button type="submit" class="btn btn-outline-primary-2">
                                            <span>LƯU THAY ĐỔI</span>
                                            <i class="icon-long-arrow-right"></i>
                                        </button>
                                    </form>

                                </div><!-- .End .tab-pane -->
                                <%}%>
                            </div>
                        </div><!-- End .col-lg-9 -->
                    </div><!-- End .row -->
                </div><!-- End .container -->
            </div><!-- End .dashboard -->
        </div><!-- End .page-content -->
    </main><!-- End .main -->

    <jsp:include page="footer.jsp"></jsp:include>
</div><!-- End .page-wrapper -->
<button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

<!-- Mobile Menu -->
<div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

<div class="mobile-menu-container">
    <div class="mobile-menu-wrapper">
        <span class="mobile-menu-close"><i class="icon-close"></i></span>

        <form action="#" method="get" class="mobile-search">
            <label for="mobile-search" class="sr-only">Tìm kiếm</label>
            <input type="search" class="form-control" name="mobile-search" id="mobile-search" placeholder="Search in..."
                   required>
            <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
        </form>

        <div class="social-icons">
            <a href="#" class="social-icon" target="_blank" title="Facebook"><i class="icon-facebook-f"></i></a>
            <a href="#" class="social-icon" target="_blank" title="Twitter"><i class="icon-twitter"></i></a>
            <a href="#" class="social-icon" target="_blank" title="Instagram"><i class="icon-instagram"></i></a>
            <a href="#" class="social-icon" target="_blank" title="Youtube"><i class="icon-youtube"></i></a>
        </div><!-- End .social-icons -->
    </div><!-- End .mobile-menu-wrapper -->
</div><!-- End .mobile-menu-container -->

<div class="modal fade" id="signin-modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="icon-close"></i></span>
                </button>

                <jsp:include page="login.jsp"></jsp:include>
            </div><!-- End .modal-body -->
        </div><!-- End .modal-content -->
    </div><!-- End .modal-dialog -->
</div>
<!-- Plugins JS File -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/jquery.hoverIntent.min.js"></script>
<script src="assets/js/jquery.waypoints.min.js"></script>
<script src="assets/js/superfish.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<!-- Main JS File -->
<script src="assets/js/main.js"></script>
<script>
    //Hàm đọc giá trị và hiện thị thông tin
    function textthaydoi() {
        var value = $( this ).val();
        // $( "p#giatriinputtext" ).text( value );
    }

    $( "#ho" ).keyup(textthaydoi);
    $( "#ho" ).keyup();

    $( "#ten" ).keyup(textthaydoi);
    $( "#ten" ).keyup();

    $( "#tenDangNhap" ).keyup(textthaydoi);
    $( "#tenDangNhap" ).keyup();

    $( "#email" ).keyup(textthaydoi);
    $( "#email" ).keyup();
</script>
</body>
</html>
