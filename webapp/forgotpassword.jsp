<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/16/2021
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>POTOMATO - FORGOTPASS</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>
<div class="page-wrapper">
    <jsp:include page="header.jsp"></jsp:include>

    <main class="main">
        <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
            <div class="container">
                <ol class="breadcrumb">
                    <!--                     <li class="breadcrumb-item"><a href="#">Pages</a></li> -->
                    <li class="breadcrumb-item active" aria-current="page">Quên mật khẩu</li>
                </ol>
            </div><!-- End .container -->
        </nav><!-- End .breadcrumb-nav -->

        <div class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17"
             style="background-image: url('https://i.imgur.com/dGMW53x.jpeg')">
            <div class="container">
                <div class="form-box">
                    <div class="form-tab">
                        <ul class="nav nav-pills nav-fill" role="tablist">

                            <li class="nav-item">
                                <a class="nav-link active" id="register-tab-2" data-toggle="tab" href="#register-2"
                                   role="tab" aria-controls="register-2" aria-selected="true">POTAMATO</a>
                            </li>
                        </ul>
                        <%--                        <div class="tab-content">--%>
                        <%--                            <div class="tab-pane fade show active" id="register-2" role="tabpanel"--%>
                        <%--                                 aria-labelledby="register-tab-2">--%>
                        <%--                                Chúc mừng bạn đã đổi mật khẩu thành công.--%>
                        <%--                                <br>--%>
                        <%--                                Vui lòng kiểm tra email của bạn!--%>
                        <%--                            </div><!-- .End .tab-pane -->--%>
                        <%--                        </div><!-- End .tab-content -->--%>

                        <form id="register-form" role="form" class="form" method="post"
                              action="mymail_fp.jsp">
                            <h3>Enter Your Email Below</h3>
                            <input id="email" name="email" placeholder="Email address" class="form-
   control" type="email" required autofocus>
                            <input name="recover-submit" class="btn btn-lg btn-primary btn-block"
                                   value="Get Password" type="submit">
                        </form>


                    </div><!-- End .form-tab -->
                </div><!-- End .form-box -->
            </div><!-- End .container -->
        </div><!-- End .login-page section-bg -->
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
        <jsp:include page="login.jsp"></jsp:include>
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
</body>


</html>

