<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>POTAMATO - CROSSBODY LIST</title>
    <!-- Favicon -->
    <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/plugins/nouislider/nouislider.css">
</head>

<body>
<%
    String email_err = "", matkhau_err="",tenDangNhap_err="";
    if (request.getAttribute("email_err") != null) {
        email_err = (String) request.getAttribute("email_err");
    }
    if (request.getAttribute("matkhau_err") != null) {
        matkhau_err = (String) request.getAttribute("matkhau_err");
    }if (request.getAttribute("tenDangNhap_err") != null) {
    tenDangNhap_err = (String) request.getAttribute("tenDangNhap_err");
}
    String email="", matkhau="",tenDangNhap="";
    if (request.getAttribute("tenDangNhap") != null) {
        tenDangNhap = (String) request.getAttribute("tenDangNhap");
    }
    if (request.getAttribute("email") != null) {
        email = (String) request.getAttribute("email");
    }
    if (request.getAttribute("matkhau") != null) {
        matkhau = (String) request.getAttribute("matkhau");
    }
    String err="";
    if (request.getAttribute("err")!=null)
        err=(String) request.getAttribute("err");

%>
<div class="form-box">
    <div class="form-tab">
        <ul class="nav nav-pills nav-fill" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="signin-tab" data-toggle="tab" href="#signin" role="tab"
                   aria-controls="signin" aria-selected="true">Đăng nhập</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="register-tab" data-toggle="tab" href="#register" role="tab"
                   aria-controls="register" aria-selected="false">Đăng ký</a>
            </li>
        </ul>
        <div class="tab-content" id="tab-content-5">
            <div class="tab-pane fade show active" id="signin" role="tabpanel"
                 aria-labelledby="signin-tab">
                <form action="/HUDI_war_exploded/dangnhap" method="post">
                    <div class="form-group">
                        <p style="color:red;"><%=err%></p>
                        <label for="singin-email">Email đăng nhập *</label>
                        <input type="text" class="form-control" id="singin-email" name="singin-email"
                               required>
                    </div><!-- End .form-group -->

                    <div class="form-group">
                        <label for="singin-password">Mật khẩu *</label>
                        <input type="password" class="form-control" id="singin-password"
                               name="singin-password" required>
                    </div><!-- End .form-group -->

                    <div class="form-footer">
                        <button type="submit" class="btn btn-outline-primary-2">
                            <span>ĐĂNG NHẬP</span>
                            <i class="icon-long-arrow-right"></i>
                        </button>

                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="signin-remember">
                            <label class="custom-control-label" for="signin-remember">Lưu mật
                                khẩu</label>
                        </div><!-- End .custom-checkbox -->

                        <a href="forgotPass.html" class="forgot-link">Quên mật khẩu?</a>
                    </div><!-- End .form-footer -->
                </form>
                <div class="form-choice">
                    <p class="text-center">Đăng nhập với</p>
                    <div class="row">
                        <div class="col-sm-6">
                            <a href="https://accounts.google.com/" class="btn btn-login btn-g">
                                <i class="icon-google"></i>
                                Google
                            </a>
                        </div><!-- End .col-6 -->
                        <div class="col-sm-6">
                            <a href="https://facebook.com/" class="btn btn-login btn-f">
                                <i class="icon-facebook-f"></i>
                                Facebook
                            </a>
                        </div><!-- End .col-6 -->
                    </div><!-- End .row -->
                </div><!-- End .form-choice -->
            </div><!-- .End .tab-pane -->
            <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                <form action="/HUDI_war_exploded/dangki" method="post">
                    <div class="form-group">
                        <label for="register-name">Tên Đăng Nhập *</label>
                        <input type="text" class="form-control" id="register-name"
                               name="register-name" required value="<%=tenDangNhap%>">
                    </div><!-- End .form-group -->
                    <div class="form-group">
                        <p style="color: red"><%=email_err%>
                        </p>
                        <label for="register-email">Nhập Email *</label>
                        <input type="email" class="form-control" id="register-email"
                               name="register-email" required value="<%=email%>">
                    </div><!-- End .form-group -->

                    <div class="form-group">
                        <label for="register-password">Mật khẩu *</label>
                        <input type="password" class="form-control" id="register-password"
                               name="register-password" required value="<%=matkhau%>">
                    </div><!-- End .form-group -->

                    <div class="form-footer">
                        <button type="submit" class="btn btn-outline-primary-2">
                            ĐĂNG KÝ
                            <i class="icon-long-arrow-right"></i>
                        </button>

                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="register-policy"
                                   required>
                            <label class="custom-control-label" for="register-policy">Tôi đồng ý với
                                điều khoản dịch vụ</a> *</label>
                        </div><!-- End .custom-checkbox -->
                    </div><!-- End .form-footer -->
                </form>
                <div class="form-choice">
                    <p class="text-center">Đăng nhập với</p>
                    <div class="row">
                        <div class="col-sm-6">
                            <a href="https://accounts.google.com/" class="btn btn-login btn-g">
                                <i class="icon-google"></i>
                                Google
                            </a>
                        </div><!-- End .col-6 -->
                        <div class="col-sm-6">
                            <a href="https://facebook.com/" class="btn btn-login  btn-f">
                                <i class="icon-facebook-f"></i>
                                Facebook
                            </a>
                        </div><!-- End .col-6 -->
                    </div><!-- End .row -->
                </div><!-- End .form-choice -->
            </div><!-- .End .tab-pane -->
        </div><!-- End .tab-content -->
    </div><!-- End .form-tab -->
</div><!-- End .form-box -->
</body>
</html>