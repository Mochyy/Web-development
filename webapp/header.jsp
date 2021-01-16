<%@ page import="entity.ProductEntity" %>
<%@ page import="Model.Cart" %>
<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <title>POTAMATO - CART</title>
    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="page-wrapper">
<header class="header">
    <div class="header-top">
        <div class="container">
            <div class="header-left">
                <div class="header-dropdown">
                    <a href="#">Usd</a>
                    <div class="header-menu">
                        <ul>
                            <li><a href="#">Eur</a></li>
                            <li><a href="#">Usd</a></li>
                        </ul>
                    </div><!-- End .header-menu -->
                </div><!-- End .header-dropdown -->

                <div class="header-dropdown">
                    <a href="#">Tiếng Việt</a>
                    <div class="header-menu">
                        <ul>
                            <li><a href="#">Tiếng Việt</a></li>
                            <li><a href="#">English</a></li>
                            <li><a href="#">French</a></li>
                        </ul>
                    </div><!-- End .header-menu -->
                </div><!-- End .header-dropdown -->
            </div><!-- End .header-left -->

            <div class="header-right">
                <ul class="top-menu">
                    <li>
                        <a href="#">Links</a>
                        <ul>
                            <li><a href="tel:#"><i class="icon-phone"></i>Gọi ngay: +0123 456 789</a></li>
                            <li><a href="wishlist.html"><i class="icon-heart-o"></i>Yêu thích <span>(3)</span></a>
                            </li>
                            <li><a href="about.html">Về Potamato</a></li>
                            <li><a href="contact.html">Liên hệ </a></li>
                            <li>
                                <div class="header-dropdown">
                                    <a href="#signin-modal" data-toggle="modal"><i class="icon-user"></i><%=session.getAttribute("username")%></a>
                                    <div class="header-menu">
                                        <ul>
                                            <li><a href="dashboard.html">Sửa thông tin đăng nhập</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul><!-- End .top-menu -->
            </div><!-- End .header-right -->
        </div><!-- End .container -->
    </div><!-- End .header-top -->

    <div class="header-middle sticky-header">
        <div class="container">
            <div class="header-left">
                <button class="mobile-menu-toggler">
                    <span class="sr-only">Toggle mobile menu</span>
                    <i class="icon-bars"></i>
                </button>

                <a href="index.html" class="logo">
                    <img src="https://i.imgur.com/ItlCRTo.png" alt="Potamato Logo" width="200" height="25">
                </a>

                <nav class="main-nav">
                    <ul class="menu sf-arrows">
                        <li class="megamenu-container active">
                            <a href="index.html">Trang chủ</a>
                        </li>
                        <li>
                            <a href="productmain.html" class="sf-with-ul">Cửa hàng</a>

                            <div class="megamenu megamenu-md" style="width: 500px">
                                <div class="row no-gutters">
                                    <div class="col-md-8">
                                        <div class="menu-col">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="menu-title">Danh mục sản phẩm</div>
                                                    <!-- End .menu-title -->
                                                    <ul>
                                                        <li><a href="Shop-handbag-1.html">Túi xách</a></li>
                                                        <li><a href="Shop-Backpack-1.html">Balo</a></li>
                                                        <li><a href="Shop-totebag-1">Túi tote</a></li>
                                                        <li><a href="Shop-crossbody-1.html">Túi đeo chéo</a></li>
                                                    </ul>

                                                    <div class="menu-title">Tất cả sản phẩm</div>
                                                    <!-- End .menu-title -->
                                                    <ul>
                                                        <li>
                                                            <a href="category-boxed.html"><span>Sản phẩm nổi bật<span
                                                                    class="tip tip-hot">Hot</span></span></a></li>
                                                    </ul>
                                                </div><!-- End .col-md-6 -->
                                            </div><!-- End .row -->
                                        </div><!-- End .menu-col -->
                                    </div><!-- End .col-md-8 -->

                                    <div class="col-md-4">
                                        <div class="banner banner-overlay">
                                            <a href="category.html" class="banner banner-menu">
                                                <img src="https://i.imgur.com/rAlobtm.png" alt="Banner"
                                                     style="width: 250px">
                                            </a>
                                        </div><!-- End .banner banner-overlay -->
                                    </div><!-- End .col-md-4 -->
                                </div><!-- End .row -->
                            </div><!-- End .megamenu megamenu-md -->
                        </li>
                        <li>
                            <a href="productmain.html" class="sf-with-ul">Sản phẩm</a>

                            <div class="megamenu megamenu-sm">
                                <div class="row no-gutters">
                                    <div class="col-md-6">
                                        <div class="menu-col">
                                            <div class="menu-title">Chi tiết sản phẩm nổi bật</div>
                                            <!-- End .menu-title -->
                                            <ul>
                                                <li><a href="product-handbag.html">Túi xách</a></li>
                                                <li><a href="product-backpack.html">Balo</a></li>
                                                <li>
                                                    <a href="product-centered.html"><span>Túi tote</span></a>
                                                </li>
                                                <li><a href="product-crossbody.html">Túi đeo chéo</a></li>

                                            </ul>
                                        </div><!-- End .menu-col -->
                                    </div><!-- End .col-md-6 -->

                                    <div class="col-md-6">
                                        <div class="banner banner-overlay">
                                            <a href="productmain.html">
                                                <img src="https://i.imgur.com/Mz03KM6.jpg" alt="Banner"
                                                     style="height: 220px">

                                                <div class="banner-content banner-content-bottom">
                                                    <div class="banner-title text-white">Xu hướng
                                                        mới<br><span><strong>Mùa đông 2020</strong></span></div>
                                                    <!-- End .banner-title -->
                                                </div><!-- End .banner-content -->
                                            </a>
                                        </div><!-- End .banner -->
                                    </div><!-- End .col-md-6 -->
                                </div><!-- End .row -->
                            </div><!-- End .megamenu megamenu-sm -->
                        </li>
                        <li>
                            <a href="FAQs.html">FAQs</a>


                        </li>
                        <li>
                            <a href="blog.html">Blog</a>

                        </li>
                    </ul><!-- End .menu -->
                </nav><!-- End .main-nav -->
            </div><!-- End .header-left -->

            <div class="header-right">
                <div class="header-search">
                    <a href="#" class="search-toggle" role="button" title="Tìm kiếm"><i class="icon-search"></i></a>
                    <form action="#" method="get">
                        <div class="header-search-wrapper">
                            <label for="q" class="sr-only">Tìm kiếm</label>
                            <input type="search" class="form-control" name="q" id="q"
                                   placeholder="Thương hiệu, màu sắc..."
                                   required>
                        </div><!-- End .header-search-wrapper -->
                    </form>
                </div><!-- End .header-search -->
                <div class="dropdown compare-dropdown">
                    <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false" data-display="static" title="Yêu thích"
                       aria-label="Yêu thích">
                        <i class="icon-heart-o"></i>
                    </a>

                    <div class="dropdown-menu dropdown-menu-right">
                        <ul class="compare-products">
                            <li class="compare-product">
                                <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                <h4 class="compare-product-title"><a href="product.html">Blue Night cross</a></h4>
                            </li>
                            <li class="compare-product">
                                <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                <h4 class="compare-product-title"><a href="product.html">White Long hipbag</a></h4>
                            </li>
                        </ul>

                        <!--                            <div class="compare-actions">-->
                        <!--                                <a href="#" class="action-link">Clear All</a>-->
                        <!--                                <a href="#" class="btn btn-outline-primary-2"><span>Compare</span><i-->
                        <!--                                        class="icon-long-arrow-right"></i></a>-->
                        <!--                            </div>-->
                    </div><!-- End .dropdown-menu -->
                </div><!-- End .compare-dropdown -->

                <div class="dropdown cart-dropdown">
                    <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false" data-display="static">
                        <i class="icon-shopping-cart"></i>
                        <span class="cart-count">2</span>
                    </a>

                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="dropdown-cart-products">
                            <div class="product">
                                <div class="product-cart-details">
                                    <h4 class="product-title">
                                        <a href="product.html">Beige knitted elastic hipbag</a>
                                    </h4>

                                    <span class="cart-product-info">
                                                <span class="cart-product-qty">1</span>
                                                x $84.00
                                            </span>
                                </div><!-- End .product-cart-details -->

                                <figure class="product-image-container">
                                    <a href="product.html" class="product-image">
                                        <img src="https://i.imgur.com/fGggttK.png" alt="product">
                                    </a>
                                </figure>
                                <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                            </div><!-- End .product -->

                            <div class="product">
                                <div class="product-cart-details">
                                    <h4 class="product-title">
                                        <a href="product.html">Blink utility cross</a>
                                    </h4>

                                    <span class="cart-product-info">
                                                <span class="cart-product-qty">1</span>
                                                x $76.00
                                            </span>
                                </div><!-- End .product-cart-details -->

                                <figure class="product-image-container">
                                    <a href="product.html" class="product-image">
                                        <img src="https://i.imgur.com/WX1unPv.png" alt="product">
                                    </a>
                                </figure>
                                <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                            </div><!-- End .product -->
                        </div><!-- End .cart-product -->

                        <div class="dropdown-cart-total">
                            <span>Tổng cộng: </span>

                            <span class="cart-total-price">$160.00</span>
                        </div><!-- End .dropdown-cart-total -->

                        <div class="dropdown-cart-action">
                            <a href="cart.html" class="btn btn-primary">Giỏ hàng</a>
                            <a href="checkout.html" class="btn btn-outline-primary-2"><span>Thanh toán</span><i
                                    class="icon-long-arrow-right"></i></a>
                        </div><!-- End .dropdown-cart-total -->
                    </div><!-- End .dropdown-menu -->
                </div><!-- End .cart-dropdown -->
            </div><!-- End .header-right -->
        </div><!-- End .container -->
    </div><!-- End .header-middle -->
</header><!-- End .header -->
</div>
</body>
</html>
