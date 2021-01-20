<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 1/20/2021
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <title>POTAMATO - NHẬP KHO</title>


    <!-- Bootstrap core CSS -->
    <link href="admin-lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="admin-lib/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="admin-lib/gritter/css/jquery.gritter.css"/>
    <!-- Custom styles for this template -->
    <link href="admin-css/style.css" rel="stylesheet">
    <link href="admin-css/style-responsive.css" rel="stylesheet">

    <!--external css-->
    <link href="admin-lib/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="admin-lib/bootstrap-fileupload/bootstrap-fileupload.css"/>
    <link rel="stylesheet" type="text/css" href="admin-lib/bootstrap-datepicker/css/datepicker.css"/>
    <link rel="stylesheet" type="text/css" href="admin-lib/bootstrap-daterangepicker/daterangepicker.css"/>
    <link rel="stylesheet" type="text/css" href="admin-lib/bootstrap-timepicker/compiled/timepicker.css"/>
    <link rel="stylesheet" type="text/css" href="admin-lib/bootstrap-datetimepicker/datertimepicker.css"/>

</head>

<body>
<section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a href="admin-index.html" class="logo"><b>POTA<span>MATO</span></b></a>
        <!--logo end-->
        <div class="nav notify-row" id="top_menu">
            <!--  notification start -->
            <ul class="nav top-menu">
                <!-- settings start -->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="admin-index.html#">
                        <i class="fa fa-tasks"></i>
                        <span class="badge bg-theme">4</span>
                    </a>
                    <ul class="dropdown-menu extended tasks-bar">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">Bạn có 4 nhiệm vụ đang chờ xử lý</p>
                        </li>
                        <li>
                            <a href="admin-index.html#">
                                <div class="task-info">
                                    <div class="desc">Bảng quản trị POTAMATO</div>
                                    <div class="percent">40%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">40% Hoàn thành (thành công)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="admin-index.html#">
                                <div class="task-info">
                                    <div class="desc">Cập nhật cơ sở dữ liệu</div>
                                    <div class="percent">60%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Hoàn thành (cảnh báo)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="admin-index.html#">
                                <div class="task-info">
                                    <div class="desc">Phát triển sản phẩm</div>
                                    <div class="percent">80%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Hoành thành</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="admin-index.html#">
                                <div class="task-info">
                                    <div class="desc">Thanh toán đã gửi</div>
                                    <div class="percent">70%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                        <span class="sr-only">70% Hoàn thành (quang trọng)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="external">
                            <a href="#">Xem tất cả công việc</a>
                        </li>
                    </ul>
                </li>
                <!-- settings end -->
                <!-- inbox dropdown start-->
                <li id="header_inbox_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="admin-index.html#">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-theme">5</span>
                    </a>
                    <ul class="dropdown-menu extended inbox">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">BẠn có 5 tin nhắn mới</p>
                        </li>
                        <li>
                            <a href="lobby.html">
                                <span class="photo"><img alt="avatar"
                                                         src="https://i.pinimg.com/564x/66/d9/36/66d93692e10e095e2195e1199f9c15d1.jpg"></span>
                                <span class="subject">
                  <span class="from">Meo Meo</span>
                  <span class="time">Bây giờ</span>
                  </span>
                                <span class="message">
                  Nhập kho được 30%.
                  </span>
                            </a>
                        </li>
                        <li>
                            <a href="lobby.html">
                                <span class="photo"><img alt="avatar" src="https://i.imgur.com/RXsWLgP.png"></span>
                                <span class="subject">
                  <span class="from">Diễm My</span>
                  <span class="time">40 giây.</span>
                  </span>
                                <span class="message">
                  My kiểm định xong sản phẩm rồi.
                  </span>
                            </a>
                        </li>
                        <li>
                            <a href="lobby.html">
                                <span class="photo"><img alt="avatar"
                                                         src="https://i.pinimg.com/564x/42/b3/4b/42b34b3e9d6eb7e313f86c6342e5593c.jpg"></span>
                                <span class="subject">
                  <span class="from">Phú Hải</span>
                  <span class="time">2 phút.</span>
                  </span>
                                <span class="message">
                  Bảo trì hệ thống trong 30p nữa.
                  </span>
                            </a>
                        </li>
                        <li>
                            <a href="lobby.html">
                                <span class="photo"><img alt="avatar"
                                                         src="https://i.pinimg.com/564x/4c/6c/37/4c6c37b3538069be05bc3e6796048c8e.jpg"></span>
                                <span class="subject">
                  <span class="from">Hà Ninh</span>
                  <span class="time">30 phút.</span>
                  </span>
                                <span class="message">
                  Khách đang đợi trả lời mail.
                  </span>
                            </a>
                        </li>
                        <li>
                            <a href="admin-index.html#">Xem tất cả tin nhắn</a>
                        </li>
                    </ul>
                </li>
                <!-- inbox dropdown end -->
                <!-- notification dropdown start-->
                <li id="header_notification_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="admin-index.html#">
                        <i class="fa fa-bell-o"></i>
                        <span class="badge bg-warning">7</span>
                    </a>
                    <ul class="dropdown-menu extended notification">
                        <div class="notify-arrow notify-arrow-yellow"></div>
                        <li>
                            <p class="yellow">Bạn có 7 thông báo mới</p>
                        </li>
                        <li>
                            <a href="admin-index.html#">
                                <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                Máy chủ quá tải.
                                <span class="small italic">4 phút.</span>
                            </a>
                        </li>
                        <li>
                            <a href="admin-index.html#">
                                <span class="label label-warning"><i class="fa fa-bell"></i></span>
                                Bộ nhớ # 2 Không phản hồi.
                                <span class="small italic">50 phút.</span>
                            </a>
                        </li>
                        <li>
                            <a href="admin-index.html#">
                                <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                Dung lượng đĩa đạt 85%.
                                <span class="small italic">2 giờ.</span>
                            </a>
                        </li>
                        <li>
                            <a href="admin-index.html#">
                                <span class="label label-success"><i class="fa fa-plus"></i></span>
                                Người dùng mới đã đăng ký.
                                <span class="small italic">3 giờ.</span>
                            </a>
                        </li>
                        <li>
                            <a href="admin-index.html#">Xem tất cả thông báo</a>
                        </li>
                    </ul>
                </li>
                <!-- notification dropdown end -->
            </ul>
            <!--  notification end -->
        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="admin-login.html">Đăng xuất</a></li>
            </ul>
        </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
                <p class="centered"><a href="profile.html"><img src="https://i.imgur.com/oE1QFEm.png" class="img-circle"
                                                                width="80"></a></p>
                <h5 class="centered">Thiên Ân</h5>
                <li class="mt">
                    <a href="admin-index.html">
                        <i class="fa fa-dashboard"></i>
                        <span>Quản trị</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-users"></i>
                        <span>Quản lý thành viên</span>
                    </a>
                    <ul class="sub">
                        <li><a href="Thành%20viên%20quản%20trị.html">Thành viên quản trị</a></li>
                        <li><a href="Khách%20hàng.html">Khách hàng</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" class="active">
                        <i class="fa fa-barcode"></i>
                        <span>Quản lý sản phẩm</span>
                    </a>
                    <ul class="sub">
                        <li><a href="Danh%20sách%20sản%20phẩm.html">Danh sách sản phẩm</a></li>
                        <li><a href="Trạng%20thái.html">Trạng thái</a></li>
                        <li class="active"><a href="Nhập%20kho.html">Nhập kho</a></li>
                    </ul>
                </li>
                <li>
                    <a href="inbox.html">
                        <i class="fa fa-envelope"></i>
                        <span>Mail </span>
                        <span class="label label-theme pull-right mail-info">2</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-comments-o"></i>
                        <span>Chat</span>
                    </a>
                    <ul class="sub">
                        <li><a href="lobby.html">Tin nhắn chờ</a></li>
                        <li><a href="chat_room.html">Phòng chat</a></li>
                    </ul>
                </li>
                <li>
                    <a href="google_maps.html">
                        <i class="fa fa-map-marker"></i>
                        <span>Google Maps </span>
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <!-- FORM VALIDATION -->
                        <div class="row mt">
                            <div class="col-lg-12">
                                <h4><i class="fa fa-angle-right"></i> Nhập hàng</h4>
                                <div class="form-panel">
                                    <div class=" form">
                                        <form class="cmxform form-horizontal style-form" id="commentForm" method="post"
                                              action="${pageContext.request.contextPath}/addProduct">
                                            <div class="form-group ">
                                                <label for="cname" class="control-label col-lg-2">ID sản phẩm
                                                    (required)</label>
                                                <div class="col-lg-10">
                                                    <input class=" form-control" id="cname" name="id" minlength="2"
                                                           type="text" required/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="cemail" class="control-label col-lg-2">Tên sản phẩm
                                                    (required)</label>
                                                <div class="col-lg-10">
                                                    <input class="form-control " id="cemail" type="text" name="name"
                                                           required/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="curl" class="control-label col-lg-2">Giá (required)</label>
                                                <div class="col-lg-10">
                                                    <input class="form-control " id="curl" type="text" name="price"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="ccomment" class="control-label col-lg-2">Danh mục</label>
                                                <div class="col-lg-10">
                                                    <select class="form-control " id="ccomment" name="category">
                                                        <option value="HB">Handbag</option>
                                                        <option value="BP">Backpack</option>
                                                        <option value="TB">Totebag</option>
                                                        <option value="CB">Crossbody</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group last">
                                                <label class="control-label col-md-3">Tải hình</label>
                                                <div class="col-md-9">
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <div class="fileupload-new thumbnail"
                                                             style="width: 200px; height: 150px;">
                                                            <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image"
                                                                 alt=""/>
                                                        </div>
                                                        <div class="fileupload-preview fileupload-exists thumbnail"
                                                             style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                        <div>
                                                            <span class="btn btn-theme02 btn-file">
                                                                <span class="fileupload-new"><i
                                                                        class="fa fa-paperclip"></i> Chọn hình</span>
                                                                 <span class="fileupload-exists"><i
                                                                         class="fa fa-undo"></i> Thay đổi</span>
                                                                  <input type="file" class="default" name="img"/>
                                                             </span>
                                                            <a href="advanced_form_components.html#"
                                                               class="btn btn-theme04 fileupload-exists"
                                                               data-dismiss="fileupload"><i class="fa fa-trash-o"></i>
                                                                Xóa</a>
                                                        </div>
                                                    </div>
                                                    <span class="label label-info">Chú ý!</span>
                                                    <span>Hình thu nhỏ hình ảnh đính kèm chỉ được hỗ trợ trong Firefox mới nhất, Chrome, Opera, Safari và Internet Explorer 10 </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-lg-offset-2 col-lg-10">
                                                    <button class="btn btn-theme" type="submit">Thêm hàng</button>
                                                    <button class="btn btn-theme04" type="button">Hủy bỏ</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- /form-panel -->
                            </div>
                            <!-- /col-lg-12 -->
                        </div>
                    </div>
                    <!-- /content-panel -->
                </div>
                <!-- /col-md-12 -->

                <!-- @@@@@@@@@@ HIỆN THÔNG BÁO @@@@@@@@@@@@@ -->
                <c:if test="${notice != null && notice != ''}">

                    <script>
                        window.onload = function () {
                            document.getElementById('btn-message').click();
                        }
                    </script>

                    <!-- Button trigger modal -->
                    <button style="display: none" type="button" id="btn-message"
                            class="btn btn-white" data-toggle="modal"
                            data-target="#exampleModalCenter"></button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModalCenter" tabindex="-1"
                         role="dialog" aria-labelledby="exampleModalCenterTitle"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">${notice}</h5>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-success" data-dismiss="modal">Đóng</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:if>
                <!-- @@@@@@@@@@ END HIỆN THÔNG BÁO  @@@@@@@@@@@@@ -->
            </div>
            </div>
            <!-- /col-lg-6 -->
            </div>
            <!--/ row -->
        </section>
        <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
        <div class="text-center">
            <p>
                <strong>POTAMATO - Nâng niu từng sản phẩm.</strong>
            </p>
            <a href="admin-index.html#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>
    <!--footer end-->
</section>
<!-- js placed at the end of the document so the pages load faster -->
<script src="admin-lib/jquery/jquery.min.js"></script>

<script src="admin-lib/bootstrap/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="admin-lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="admin-lib/jquery.scrollTo.min.js"></script>
<script src="admin-lib/jquery.nicescroll.js" type="text/javascript"></script>
<!--common script for all pages-->
<script src="admin-lib/common-scripts.js"></script>
<!--script for this page-->
<script type="text/javascript" src="admin-lib/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="admin-lib/gritter-conf.js"></script>

<!--script for this page-->
<script src="admin-lib/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript" src="admin-lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
<script type="text/javascript" src="admin-lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="admin-lib/bootstrap-daterangepicker/date.js"></script>
<script type="text/javascript" src="admin-lib/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="admin-lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="admin-lib/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="admin-lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<script src="admin-lib/advanced-form-components.js"></script>
</body>

</html>

