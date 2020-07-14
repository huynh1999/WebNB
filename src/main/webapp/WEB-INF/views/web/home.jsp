<%@ page import="online.newbrandshop.util.SecurityUtils" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<!doctype html>
<html lang="en">

<head>
    <title>NBShop Online</title>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords"
        content="Quần áo hàng hiệu,Shop quần áo TPHCM,Quần áo New Brand,Shop quần áo online,Quần áo cho nam/nữ">
    <meta name="description"
        content="Newbrandshop.online chuyên buôn bán các loại áo quần hàng hiệu, thời trang, mẫu mã đa dạng, giá cả hợp lí bằng nhiều hình thức. Khách hàng có thể đến trực tiếp cửa hàng để chọn lựa và mua sản phẩm. Ngoài ra khách hàng củng có thể mua bằng hình thức online vô cùng tiện lợi.">
    <!-- Bootstrap CSS -->
    <!-- css  -->

</head>

<body>
    <!-- body  -->
    <div id="my_slide" class="carousel slide my_slide" data-ride="carousel">
            <ol class="carousel-indicators _hidden">
                <li data-target="#my_slide" data-slide-to="0" class="active"></li>
                <li data-target="#my_slide" data-slide-to="1"></li>
                <li data-target="#my_slide" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="main">
                <div class="carousel-item active">
                    <p>Mừng khai trương, Giảm giá 20000vnđ cho khách hàng đăng kí thành viên</p>
                </div>
                <div class="carousel-item">
                    <p>Miễn phí vận chuyển trong ngày 3 - 5/7/2020</p>
                </div>
                <div class="carousel-item">
                    <p>New Brand Shop</p>
                </div>
            </div>
            <a class="carousel-control-prev" href="#my_slide" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#my_slide" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    <!-- login  -->



        <!-- test text image  -->
    <!--  <div class="test_text">
            WELCOME<br>TO<br>NHShop   
        </div>-->

    <!--              -->
    <!--               -->
    <!-- top brand  -->
        <!--  -->
        <i class="fa fa-star mystar"></i>
        <h5 class="tieu_de">TOP BRAND</h5>
        <!-- slickslide -->
        <div class="main-slider row">
            <div class="videoslide col-xl-12">
                <div class="video">
                    <video autoplay="true" muted="true" loop="true" aria-valuetext="true" class="video_intro">
                        <source src="/template/videos/gucci.mp4">
                        Your browser does not support HTML5 video.

                    </video>
                </div>
                <div class="motavideo">
                    <h5>GUCCI</h5>
                    <p>Là thương hiệu nổi tiếng và uy tín ở châu Âu. Sản phẩm có nhiều mẫu mã đa dạng phong phú. </p>
                    <a href="/category/ClothesWomanNike" class="shopnow">Shop now</a>
                </div>

            </div>
            <div class="videoslide col-xl-12">
                <div class="video">
                    <video autoplay="true" muted="true" loop="true" aria-valuetext="true" class="video_intro">
                        <source src="/template/videos/nike.mp4">
                        Your browser does not support HTML5 video.

                    </video>
                </div>
                <div class="motavideo">
                    <h5>NIKE</h5>
                    <p>Là thương hiệu nổi tiếng và uy tín ở châu Âu. Sản phẩm có nhiều mẫu mã đa dạng phong phú. </p>
                    <a href="/category/ClothesKidBoyNike" class="shopnow">Shop now</a>
                </div>

            </div>
            <div class="videoslide col-xl-12">
                <div class="video">
                    <video autoplay="true" muted="true" loop="true" aria-valuetext="true" class="video_intro">
                        <source src="/template/videos/adidas.mp4">
                        Your browser does not support HTML5 video.

                    </video>
                </div>
                <div class="motavideo">
                    <h5>ADIDAS</h5>
                    <p>Là thương hiệu nổi tiếng và uy tín ở châu Âu. Sản phẩm có nhiều mẫu mã đa dạng phong phú. </p>
                    <a href="/category/ClothesKidGirlNike" class="shopnow">Shop now</a>
                </div>

            </div>
            <div class="videoslide col-xl-12">
                <div class="video">
                    <video autoplay="true" muted="true" loop="true" aria-valuetext="true" class="video_intro">
                        <source src="/template/videos/chanel.mp4">
                        Your browser does not support HTML5 video.

                    </video>
                </div>
                <div class="motavideo">
                    <h5>CHANEL</h5>
                    <p>Là thương hiệu nổi tiếng và uy tín ở châu Âu. Sản phẩm có nhiều mẫu mã đa dạng phong phú. </p>
                    <a href="/category/ClothesMenNike" class="shopnow">Shop now</a>
                </div>

            </div>


        </div>

        <!-- top product  -->
        <br>
        <i class="fa fa-star mystar"></i>
        <h5 class="tieu_de">TOP PRODUCT</h5>
        <div class="product-slider row" id="topProduct">
            <c:forEach var="item" items="${topProduct}">
                <div class="onepartslide">
                    <a href="/product/${item.id}"><img alt="sanpham4" class="anhsanpham"
                                                src="${item.url1}"
                                                alt=""></a>
                    <p>${item.name}</p>
                    <p class="price">${item.price}đ</p>
                    <div class="shopbasket">
                        <a href="/product/${item.id}"><i class="fa fa-shopping-basket"></i></a>
                    </div>
                </div>
            </c:forEach>
        </div>
<script>
    window.onload=function () {
        $.getScript("/template/js/page/home.js")
    }
</script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
</body>

</html>