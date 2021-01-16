<%@ page import="entity.ProductEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.Product" %>
<%@ page import="Model.Cart" %>
<%@ page import="java.text.NumberFormat" %>
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
    <link rel="stylesheet" href="css/hien.css">


</head>

<body>
<%
        ProductEntity pe = new ProductEntity();
    NumberFormat nf =NumberFormat.getInstance();
    nf.setMinimumIntegerDigits(0);


    Cart cart = (Cart) session.getAttribute("cart");
    if (cart ==null){
        cart=new Cart();
        session.setAttribute("cart", cart);
    }

    int count =0;

%>
<div class="page-wrapper">
    <jsp:include page="header.jsp"></jsp:include>
    <main class="main">
        <div class="page-header text-center" >
            <!--style="background-image: url('https://i.imgur.com/69I7DV8.jpg')"-->
            <div class="container">
                <h1 class="page-title" style="font-weight: bold">CROSSBODY<span>Shop</span></h1>
            </div><!-- End .container -->
        </div><!-- End .page-header -->
        <nav aria-label="breadcrumb" class="breadcrumb-nav mb-2">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Shop</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Crossbody</li>
                </ol>
            </div><!-- End .container -->
        </nav><!-- End .breadcrumb-nav -->

        <div class="page-content">
            <div class="container">
                <div class="row">


                    <div class="col-lg-9" id="" >


                        <!-- t nghĩ bỏ hết đống này qua product luôn nó ms set dc chỗ 6- 36-->

                        <div class="toolbox">


                            <div class="toolbox-left">
                                <div class="toolbox-info">

                                    Showing <span>6 of 36</span> Products
                                </div><!-- End .toolbox-info -->
                            </div><!-- End .toolbox-left -->



                            <div class="toolbox-right">
                                <div class="toolbox-sort">
                                    <label for="sortby">Sort by:</label>
                                    <div class="select-custom">

                                        <!-- khi thay đổi giá trị thì gọi tới cái load luôn, load lấy gias
                                         trị option nào dc chọn VD: chọn price thì select lúc này là
                                         price, load lấy giá trị thẻ này chính là lấy cái price-->
                                        <select name="sortby" id="sortby"  class="form-control" onchange="load()">
                                            <option value="name" selected="selected">Name</option>
                                            <option value="price">Price</option>
                                            <option value="quantity">Quantity</option>
                                        </select>



                                    </div>
                                </div><!-- End .toolbox-sort -->
                                <div class="toolbox-layout">
                                    <a href=""  class="btn-layout">
                                        <svg width="16" height="10">
                                            <rect x="0" y="0" width="4" height="4"/>
                                            <rect x="6" y="0" width="10" height="4"/>
                                            <rect x="0" y="6" width="4" height="4"/>
                                            <rect x="6" y="6" width="10" height="4"/>
                                        </svg>
                                    </a>
                                    <!--lúc trước chỗ đó là thẻ <a> lúc mk click zô thì nó reset lại trang thì
                                    cái $(document).ready nó ms chạy lại á, nó chạy lại đè cái mk vừa click
                                    nên nó hiện cái reset lại, nghĩ nó túc, thay bằng button thì k reset lại là ok -->



                                    <!--khi click vào button t gọi 1 sự kiện để nó set cái input:#startpage
                                     lại giá trị mà cái t click vào changeg(this) click vào truyền cho cái this
                                     ý là chính cái thẻ đó luôn, truyền tất cả những gì liên quan tới cái thẻ mà t click vào
                                     -->
                                    <button type="button" onclick="changeg(this)" id="10">
                                        <svg width="10" height="10">
                                            <rect x="0" y="0" width="4" height="4"/>
                                            <rect x="6" y="0" width="4" height="4"/>
                                            <rect x="0" y="6" width="4" height="4"/>
                                            <rect x="6" y="6" width="4" height="4"/>
                                        </svg>
                                    </button>

                                    <button type="button" onclick="changeg(this)" id="15">
                                        <svg width="16" height="10">
                                            <rect x="0" y="0" width="4" height="4"/>
                                            <rect x="6" y="0" width="4" height="4"/>
                                            <rect x="12" y="0" width="4" height="4"/>
                                            <rect x="0" y="6" width="4" height="4"/>
                                            <rect x="6" y="6" width="4" height="4"/>
                                            <rect x="12" y="6" width="4" height="4"/>
                                        </svg>
                                    </button>

                                    <button type="button" onclick="changeg(this)" id="20">
                                        <svg width="22" height="10">
                                            <rect x="0" y="0" width="4" height="4"/>
                                            <rect x="6" y="0" width="4" height="4"/>
                                            <rect x="12" y="0" width="4" height="4"/>
                                            <rect x="18" y="0" width="4" height="4"/>
                                            <rect x="0" y="6" width="4" height="4"/>
                                            <rect x="6" y="6" width="4" height="4"/>
                                            <rect x="12" y="6" width="4" height="4"/>
                                            <rect x="18" y="6" width="4" height="4"/>
                                        </svg>
                                    </button>
                                    <!--cái thẻ trung gian nek, click vào thì nó set lại giá trị cía này, rồi gọi hàm load
                                    , load nó lấy giá trị chỗ này -->
                                    <input type="hidden"  name="" id="selet" value="10" >

                                    <input type="hidden" name="" id="startpage" value="10">
                                    <input type="hidden" name="" id="nowpage" value="1">

                                </div><!-- End .toolbox-layout -->
                            </div><!-- End .toolbox-right -->


                        </div><!-- End .toolbox -->


                        <div class="products mb-3">
                            <div class="row justify-content-center" id="loadProductList">

                            <!-- .html là adđ nguyên thẻ productlist.jsp zô chỗ này-->

                            </div><!-- End .row -->
                            <%--                            </c:forEach>--%>

                        </div><!-- End .products -->



                    </div><!-- End .col-lg-9 -->



                    <aside class="col-lg-3 order-lg-first">
                        <div class="sidebar sidebar-shop">
                            <div class="widget widget-clean">
                                <label>Filters:</label>
                                <a href="#" class="sidebar-filter-clear">Clean All</a>
                            </div><!-- End .widget widget-clean -->

                            <div class="widget widget-collapsible">

                                <div class="collapse show" id="widget-1">
                                    <!--                                    <div class="widget-body">-->
                                    <div class="filter-items filter-items-count">
                                        <!--                                            End .filter-items &ndash;&gt;-->
                                    </div><!-- End .widget-body -->
                                </div><!-- End .collapse -->
                            </div><!-- End .widget -->

                            <div class="widget widget-collapsible">
                                <h3 class="widget-title">
                                    <a data-toggle="collapse" href="#widget-2" role="button" aria-expanded="true"
                                       aria-controls="widget-2">
                                        Size
                                    </a>
                                </h3><!-- End .widget-title -->

                                <div class="collapse show" id="widget-2">
                                    <div class="widget-body">
                                        <div class="filter-items">

                                            <div class="filter-item">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="size-2">
                                                    <label class="custom-control-label" for="size-2">S</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .filter-item -->

                                            <div class="filter-item">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" checked
                                                           id="size-3">
                                                    <label class="custom-control-label" for="size-3">M</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .filter-item -->

                                            <div class="filter-item">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" checked
                                                           id="size-4">
                                                    <label class="custom-control-label" for="size-4">L</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .filter-item -->

                                            <div class="filter-item">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="size-5">
                                                    <label class="custom-control-label" for="size-5">XL</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .filter-item -->

                                        </div><!-- End .filter-items -->
                                    </div><!-- End .widget-body -->
                                </div><!-- End .collapse -->
                            </div><!-- End .widget -->

                            <div class="widget widget-collapsible">
                                <h3 class="widget-title">
                                    <a data-toggle="collapse" href="#widget-3" role="button" aria-expanded="true"
                                       aria-controls="widget-3">
                                        Colour
                                    </a>
                                </h3><!-- End .widget-title -->

                                <div class="collapse show" id="widget-3">
                                    <div class="widget-body">
                                        <div class="filter-colors">
                                            <a href="#" style="background: #ebebeb;"><span
                                                    class="sr-only">Color Name</span></a>
                                            <a href="#" style="background: #ffbbbb;"><span
                                                    class="sr-only">Color Name</span></a>
                                            <a href="#" style="background: #AF7AC5;"><span
                                                    class="sr-only">Color Name</span></a>
                                            <a href="#" class="selected" style="background: #85C1E9     ;"><span
                                                    class="sr-only">Color Name</span></a>
                                            <a href="#" style="background: #48C9B0 ;"><span
                                                    class="sr-only">Color Name</span></a>
                                            <a href="#" style="background: #F7DC6F;"><span
                                                    class="sr-only">Color Name</span></a>
                                            <a href="#" style="background: #D35400;"><span
                                                    class="sr-only">Color Name</span></a>
                                            <a href="#" style="background: #2c3340;"><span
                                                    class="sr-only">Color Name</span></a>
                                        </div><!-- End .filter-colors -->
                                    </div><!-- End .widget-body -->
                                </div><!-- End .collapse -->
                            </div><!-- End .widget -->

                            <div class="widget widget-collapsible">
                                <h3 class="widget-title">
                                    <a data-toggle="collapse" href="#widget-4" role="button" aria-expanded="true"
                                       aria-controls="widget-4">
                                        Brand
                                    </a>
                                </h3><!-- End .widget-title -->

                                <div class="collapse show" id="widget-4">
                                    <div class="widget-body">
                                        <div class="filter-items">
                                            <div class="filter-item">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="brand-1">
                                                    <label class="custom-control-label" for="brand-1">Chanel</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .filter-item -->

                                            <div class="filter-item">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="brand-2">
                                                    <label class="custom-control-label" for="brand-2">Gucci</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .filter-item -->

                                            <div class="filter-item">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="brand-3">
                                                    <label class="custom-control-label" for="brand-3">Coach</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .filter-item -->

                                            <div class="filter-item">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="brand-4">
                                                    <label class="custom-control-label" for="brand-4">Celine</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .filter-item -->

                                            <div class="filter-item">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="brand-5">
                                                    <label class="custom-control-label" for="brand-5">Bernini</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .filter-item -->

                                            <div class="filter-item">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="brand-6">
                                                    <label class="custom-control-label" for="brand-6">Jimmy Choo</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .filter-item -->

                                            <div class="filter-item">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="brand-7">
                                                    <label class="custom-control-label" for="brand-7">Nike</label>
                                                </div><!-- End .custom-checkbox -->
                                            </div><!-- End .filter-item -->

                                        </div><!-- End .filter-items -->
                                    </div><!-- End .widget-body -->
                                </div><!-- End .collapse -->
                            </div><!-- End .widget -->

                            <div class="widget widget-collapsible">
                                <h3 class="widget-title">
                                    <a data-toggle="collapse" href="#widget-5" role="button" aria-expanded="true"
                                       aria-controls="widget-5">
                                        Price
                                    </a>
                                </h3><!-- End .widget-title -->

                                <div class="collapse show" id="widget-5">
                                    <div class="widget-body">
                                        <div class="filter-price">
                                            <div class="filter-price-text">
                                                Price Range:
                                                <span id="filter-price-range"></span>
                                            </div><!-- End .filter-price-text -->

                                            <div id="price-slider"></div><!-- End #price-slider -->
                                        </div><!-- End .filter-price -->
                                    </div><!-- End .widget-body -->
                                </div><!-- End .collapse -->
                            </div><!-- End .widget -->
                        </div><!-- End .sidebar sidebar-shop -->
                    </aside><!-- End .col-lg-3 -->

                </div><!-- End .row -->
            </div><!-- End .container -->
        </div><!-- End .page-content -->
    </main><!-- End .main -->

    <jsp:include page="footer.jsp"></jsp:include>
</div><!-- End .page-wrapper -->
<button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

<!-- Mobile Menu -->
<div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->


<!-- t cop cái forrm qua cho nhanh-->

<div id="addCartStatus" style="display:none">
    <div class="changepassword" id="changepassword">
        <div class="hiddenchangepassword" onclick="gobackpassword()"></div>
        <div class="mainchangepassword">
            <p class="changepasswordtitle"><i class="fa fa-cogs"></i>POTAMATO</p>
            <div class="changepasswordsuccess" id="changepasswordsuccess">
                <!-- chỗ add hiện thông b-->

            </div>
        </div>
    </div>
</div>






<div class="mobile-menu-container">
    <div class="mobile-menu-wrapper">
        <span class="mobile-menu-close"><i class="icon-close"></i></span>

        <form action="#" method="get" class="mobile-search">
            <label for="mobile-search" class="sr-only">Search</label>
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
<script src="assets/js/bootstrap-input-spinner.js"></script>
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/wNumb.js"></script>
<script src="assets/js/nouislider.min.js"></script>
<!-- Main JS File -->
<script src="assets/js/main.js"></script>
</body>


<script>



        /// tương tự với cái page luôn, mỗi cái click vào số trang á, nó set giá trị cho thẻ input ẩn để load lấy giá
        // trị từ đó
    function page(event){

        var n = $(event).attr("id");

        $('#nowpage').prop("value",n);

        console.log(n);

        load();

    }


    // chỗ này sử lí
    function changeg(evant){
        // khi click vào evant chính là cái this náy á, var d = $(evant).attr("id"); là jquery lấy ra giá trị chỗ
        // id VD: button id="15" click zô nó lấy đc d = 15;
        //  function load t cần 3 tham số để thực hiện đc , page,sort vs số trang hiện tại(còn cái giá nữa)
        // mà cái load() này sài chung v nên 3 tham số này phải lấy từ 1 chỗ cố định nào đó
        // như cái số sp1trang t lấy bằng cách lấy giá trị val() (value) của 1 input:hiden có id nào đo
        //var num = $("#selet").val(); mà giá trị này tùy thuốc vào cái click đúng k,
        // v khi mk click vào button id="15" thì phải làm sao đó sét giá trị cho input:hiden = 15 trước khi gọi hàm load()
        //  $('#selet').prop("value",d); là hàm set giá trị cho input:hien id="selet
        var d = $(evant).attr("id");

        $('#selet').prop("value",d);
        // set xog gọi hàm load lúc đó thẻ '#selet đã có giá trị 15 nó lấy 15 để thực hiện
        load();
        // ok chưa đã ok
    }


    // laod nhận 3 tham số
    function load(){
        // thẻ select nó gọi onchange luôn là lúc, mk chọn 1 c1ddeeer sắp xếp thẻ nó gọi luôn laod
        var sort = $("#sortby").val();
        // thẻ ẩn hiển thị bao nhiêu sản phẩm / trang
        var num = $("#selet").val();
    // thẻ ẩn nowpage là số trang click vào
        var page = $('#nowpage').val();

        console.log(page)

        $.ajax({
            url: 'LoadProductController',
            type:'get',
            // load bằng ajax thì để html
            dataType:'html',
            data:{
                // xog r truyền 3 tham số zô LoadProductController sử lí
                sort: sort,
                num: num,
                page: page,
            },
            success: function (data){
                // data dc gửi về là trang productlist.jsp sau khi dc load trang :v
                $('#loadProductList').html(data);
            },
            error: function (){
                alert("that bai");
            }

        });

    }

    // cái này là lúc ms zô trang mk chưa click gi hết phải có gì đó cho nó load danh sách sản phẩm

    $(document).ready(function (){

        $.ajax({
            url: 'LoadProductController',
            type:'get',
            // load bằng ajax thì để html
            dataType:'html',
            data:{
                sort: "name",
                num: 10,
                page:1,
            },
            success: function (data){
                // data là dữ liệu sau khi LoadProductController sử lí xog trả về, có nhiều kiểu có kiểu json nó trả về kiểu json ,
                // có thể trả về html
                // có trang productList.jsp sau khi dc sử lí,(load sản phẩm load trang gì đấy ) nó đc add vào thẻ có id "loadProductList'

                $('#loadProductList').html(data);

            },
            error: function (){
                alert("that bai");
            }

        });



    });

</script>


@section scripts{
<script>
    $(document).ready(function (){
        $(".ajax-add-to-cart").click(function (){
            $.ajax({
                url:"/Cart/AddToCart",
                data:{
                    p: $(this).data("p"),
                    soluong:1,
                    type:"ajax"
                },
                success:function (data){

                }
            })
        })
    });



</script>}







</html>
