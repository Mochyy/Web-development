<%@ page import="java.util.List" %>
<%@ page import="beans.Product" %>
<%@ page import="entity.ProductEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    // nhận từ requsest cái list sp
    List<Product> products = (List<Product>) request.getAttribute("products");

    for (Product p : products){
%>
<div class="col-6">
    <div class="product product-7 text-center">

        <figure class="product-media">
            <span class="product-label label-new">New</span>
            <a href="product.html">
                <img src="<%=p.getImg()%>"
                     alt="Product image" class="product-image">
            </a>

            <div class="product-action-vertical">
                <a href="#"
                   class="ajax-add-to-cart btn-product-icon btn-wishlist btn-expandable" ><span>add to wishlist</span></a>
            </div><!-- End .product-action-vertical -->

            <div class="product-action">
                <button  class="btn-product btn-cart" onclick="addCart(this)">
                    <!-- thẻ ân lm trung gian để lấy cái id sp add zô giỏ hàng-->
                    <input type="hidden" id="<%=p.getId()%>">
                    <span>add to cart</span>
                </button>
            </div><!-- End .product-action -->
        </figure><!-- End .product-media -->

        <div class="product-body">
            <div class="product-cat">
                <a href="#">Crossbody</a>
            </div><!-- End .product-cat -->
            <h3 class="product-title"><a href="product.html">
                <%=p.getName()%></a></h3><!-- End .product-title -->
            <div class="product-price">
                <%=p.getPrice()%>
            </div><!-- End .product-price -->
            <div class="ratings-container">
                <div class="ratings">
                    <div class="ratings-val" style="width: 80%;"></div>
                    <!-- End .ratings-val -->
                </div><!-- End .ratings -->
                <span class="ratings-text">( 8743 Reviews )</span>
            </div><!-- End .rating-container -->

            <div class="product-nav product-nav-thumbs">
            </div><!-- End .product-nav -->
        </div><!-- End .product-body -->
    </div><!-- End .product -->
    <%--                                    </c:forEach>--%>
</div>
<!-- End .col-sm-6 -->
<%
    }
%>
<!--cái danh sách thẻ cx sài button hết-->
<nav aria-label="Page navigation">
    <ul class="pagination justify-content-center">
        <li class="page-item disabled">
            <a class="page-link page-link-prev" href="#" aria-label="Previous" tabindex="-1"
               aria-disabled="true">
                <span aria-hidden="true"><i class="icon-long-arrow-left"></i></span>Prev
            </a>
        </li>
        <div style="clear: both"></div>

        <%
            // lấy đc số trang, vs trang hiện tại
            int numberPage = (int) request.getAttribute("numberPage");
            int nowpage = (int) request.getAttribute("nowpage");
            for(int i= 1;i < numberPage;i++){
                if (i == nowpage){
        %>
        <li class="page-item "><button class="page-link" style="color: rebeccapurple;
    background-color: blue;" href="" id="<%=i%>" onclick="page(this)"><%=i%></button></li>
        <%
            }else{%>
        <li class="page-item "><button class="page-link" href="" id="<%=i%>" onclick="page(this)"><%=i%></button></li>
            <%}}%>

        <li class="page-item">
            <a class="page-link page-link-next" href="#" aria-label="Next">
                Next <span aria-hidden="true"><i class="icon-long-arrow-right"></i></span>
            </a>
        </li>

    </ul>
</nav>
<script>

    function addCart(event) {
        // lấy ra danh sách các thẻ trong cái event(this)
        var list = event.children;
        console.log(list);

        // nãy gán giá trị mã sp vào id h lấy id là lấy mã
        var ma_sp = $(list[0]).attr("id");

        console.log(ma_sp);
        document.getElementById("addCartStatus").style.display = "none";
        document.getElementById('changepassword').style.transform = 'scaleY(0)';

        $.ajax({
           url:'AddCartController',
            type:'get',
            dataType:'html',
            data:{
               ma_sp:ma_sp
            },
            success:function (data){
                $('#changepasswordsuccess').html(data);

                document.getElementById("addCartStatus").style.display = "block";
                document.getElementById('changepassword').style.transform = 'scaleY(1)';
            },
            error: function (){
               alert("that bai");
            }

        });

    }
    function gobackpassword() {
        document.getElementById('changepassword').style.transform = 'scaleY(0)';}
</script>