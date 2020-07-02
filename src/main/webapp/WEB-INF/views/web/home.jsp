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
    <meta name="Description"
        content="Newbrandshop.online chuyên buôn bán các loại áo quần hàng hiệu, thời trang, mẫu mã đa dạng, giá cả hợp lí bằng nhiều hình thức. Khách hàng có thể đến trực tiếp cửa hàng để chọn lựa và mua sản phẩm. Ngoài ra khách hàng củng có thể mua bằng hình thức online vô cùng tiện lợi.">
    <!-- Bootstrap CSS -->
    <!-- css  -->
    <link rel="stylesheet" href=" ${pageContext.request.contextPath}/template/css/nhshop.css">
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
                <p>Due to unavoidable circumstances, some orders may be delayed. We apologize for any inconvenience and
                    we appreciate your patience.</p>
            </div>
            <div class="carousel-item">
                <span>FREE DELIVERY TO YOU</span>
                <p>Get Free Standard Delivery On All Orders. See Details</p>
            </div>
            <div class="carousel-item">
                <p>hello</p>
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
    <div class="content_box" role="main">


        <div class="shop_content" role="main">
            <div class="left" role="main">
                <video autoplay="true" muted="true" loop="true" aria-valuetext="true" id="video_intro">
                    <source src="/template/videos/gucci.mp4">
                    Your browser does not support HTML5 video.

                </video>
            </div>
            <div class="right" role="main">
                <div class="right_top" role="main">
                    <p>GUCCI</p><br>
                    <div class="right_bot" role="main">
                        <blockquote>
                            <span>Lorem, ipsum dolor sit amet consectetur adipisicing elit.</span>
                            <span>Aperiam dolorem itaque delectus sunt atque debitis sapiente magni, </span>
                            <span>dicta assumenda officia voluptatum</span>
                            <span>voluptas provident maiores sit, expedita inventore placeat quis facere.</span>
                        </blockquote>
                        <a class="shopnow" href="#">Shop now >></a>
                    </div>
                </div>

            </div>


        </div>
        <div class="shop_content" role="main">
            <div class="left" role="main">
                <video autoplay="true" muted="true" loop="true" aria-valuetext="true" id="video_intro">
                    <source src="/template/videos/chanel.mp4">
                    Your browser does not support HTML5 video.

                </video>
            </div>
            <div class="right" role="main">
                <div class="right_top" role="main">
                    <p>CHANEL</p><br>
                    <div class="right_bot" role="main">
                        <blockquote>
                            <span>Lorem, ipsum dolor sit amet consectetur adipisicing elit.</span>
                            <span>Aperiam dolorem itaque delectus sunt atque debitis sapiente magni, </span>
                            <span>dicta assumenda officia voluptatum</span>
                            <span>voluptas provident maiores sit, expedita inventore placeat quis facere.</span>
                        </blockquote>
                        <a class="shopnow" href="#">Shop now >></a>
                    </div>
                </div>

            </div>


        </div>
        <div class="shop_content" role="main">
            <div class="left" role="main">
                <video autoplay="true" muted="true" loop="true" aria-valuetext="true" id="video_intro">
                    <source src="/template/videos/adidas.mp4">
                    Your browser does not support HTML5 video.

                </video>
            </div>
            <div class="right" role="main">
                <div class="right_top" role="main">
                    <p>ADIDAS</p><br>
                    <div class="right_bot" role="main">
                        <blockquote>
                            <span>Lorem, ipsum dolor sit amet consectetur adipisicing elit.</span>
                            <span>Aperiam dolorem itaque delectus sunt atque debitis sapiente magni, </span>
                            <span>dicta assumenda officia voluptatum</span>
                            <span>voluptas provident maiores sit, expedita inventore placeat quis facere.</span>
                        </blockquote>
                        <a class="shopnow" href="#">Shop now >></a>
                    </div>
                </div>

            </div>


        </div>
        <div class="shop_content" role="main">
            <div class="left" role="main">
                <video autoplay="true" muted="true" loop="true" aria-valuetext="true" id="video_intro">
                    <source src="/template/videos/nike.mp4">
                    Your browser does not support HTML5 video.

                </video>
            </div>
            <div class="right" role="main">
                <div class="right_top" role="main">
                    <p>NIKE</p><br>
                    <div class="right_bot" role="main">
                        <blockquote>
                            <span>Lorem, ipsum dolor sit amet consectetur adipisicing elit.</span>
                            <span>Aperiam dolorem itaque delectus sunt atque debitis sapiente magni, </span>
                            <span>dicta assumenda officia voluptatum</span>
                            <span>voluptas provident maiores sit, expedita inventore placeat quis facere.</span>
                        </blockquote>
                        <a class="shopnow" href="#">Shop now >></a>
                    </div>
                </div>

            </div>


        </div>




    </div>
    <!--               -->
    <!--               -->
    <!--               -->
    <!-- top product  -->
    <i class="fa fa-star mystar"></i>
    <h5 class="tieu_de">TOP PRODUCT</h5>
<%--    <div class="product_box" role="list">--%>
<%--        <div class="_12sanpham" role="list">--%>
<%--            <div class="_1sanpham" role="listitem">--%>
<%--                <a href="#"><img alt="sanpham1" class="anhsanpham"--%>
<%--                        src="https://cdn3.yame.vn/pimg/ao-thun-nam-y2010-bd-b01-0019570/f7e1d4ae-c9b3-0100-d1ac-0016c9eb68f5.jpg?w=440"--%>
<%--                        alt=""></a>--%>
<%--                        <p style=" margin-top: 10px;">Áo nike mksks</p>--%>
<%--                <p>100.000 vnd</p>--%>
<%--                <!-- mau  -->--%>
<%--                <a href="#"><img alt="mau sac sp1" class="anhmau"--%>
<%--                        src="https://cdn3.yame.vn/pimg/ao-thun-nam-y2010-bd-b01-0019570/f7e1d4ae-c9b3-0100-d1ac-0016c9eb68f5.jpg?w=440"--%>
<%--                        alt=""></a>--%>

<%--            </div>--%>
<%--            <div class="_1sanpham" role="listitem">--%>
<%--                <a href="#"><img alt="sanpham2" class="anhsanpham"--%>
<%--                        src="https://cdn3.yame.vn/pimg/ao-thun-nam-y2010-bd-b03-0019572/d901b2c4-22ec-0300-5539-0016c9eb9d40.jpg?w=440"--%>
<%--                        alt=""></a>--%>
<%--                        <p style=" margin-top: 10px;">Áo nike mksks</p>--%>
<%--                <p>100.000 vnd</p>--%>
<%--                <!-- mau  -->--%>
<%--                <a href="#"><img alt="mau sanpham2" class="anhmau"--%>
<%--                        src="https://cdn3.yame.vn/pimg/ao-thun-nam-y2010-bd-b03-0019572/d901b2c4-22ec-0300-5539-0016c9eb9d40.jpg?w=440"--%>
<%--                        alt=""></a>--%>

<%--            </div>--%>
<%--            <div class="_1sanpham" role="listitem">--%>
<%--                <a href="#"><img alt="sanpham3" class="anhsanpham"--%>
<%--                        src="https://cdn2.yame.vn/pimg/ao-khoac-y2010-kaki-e06-0019437/80f8c358-7a9c-1e00-c2bc-0016a782c0ff.jpg?w=440"--%>
<%--                        alt=""></a>--%>
<%--                        <p style=" margin-top: 10px;">Áo nike mksks</p>--%>
<%--                <p>100.000 vnd</p>--%>
<%--                <!-- mau  -->--%>
<%--                <a href="#"><img alt="mau sanpham3" class="anhmau"--%>
<%--                        src="https://cdn2.yame.vn/pimg/ao-khoac-y2010-kaki-e06-0019437/80f8c358-7a9c-1e00-c2bc-0016a782c0ff.jpg?w=440"--%>
<%--                        alt=""></a>--%>
<%--                <a href="#"><img alt="mau sanpham3" class="anhmau"--%>
<%--                        src="https://cdn3.yame.vn/pimg/ao-khoac-y2010-kaki-e06-0019437/6e5365aa-cd19-1b00-f315-0016a7827302.jpg?w=100&h=140&c=true"--%>
<%--                        alt=""></a>--%>
<%--                <a href="#"><img alt="mau sanpham3" class="anhmau"--%>
<%--                        src="https://cdn2.yame.vn/pimg/ao-khoac-y2010-kaki-e06-0019437/2711de3d-4e22-1c00-56b4-0016a7829674.jpg?w=100&h=140&c=true"--%>
<%--                        alt=""></a>--%>

<%--            </div>--%>
<%--            <div class="_1sanpham" role="listitem">--%>
<%--                <a href="#"><img alt="sanpham4" class="anhsanpham"--%>
<%--                        src="https://cdn2.yame.vn/pimg/so-mi-nam-y2010-tn-g02-0019333/bd607f52-b1cf-0d00-65a6-0016c85210ee.jpg?w=440"--%>
<%--                        alt=""></a>--%>
<%--                        <p style=" margin-top: 10px;">Áo nike mksks</p>--%>
<%--                <p>100.000 vnd</p>--%>
<%--                <!-- mau  -->--%>
<%--                <a href="#"><img alt="mau sanpham4" class="anhmau"--%>
<%--                        src="https://cdn2.yame.vn/pimg/so-mi-nam-y2010-tn-g02-0019333/bd607f52-b1cf-0d00-65a6-0016c85210ee.jpg?w=440"--%>
<%--                        alt=""></a>--%>
<%--                <a href="#"><img alt="mau sanpham4" class="anhmau"--%>
<%--                        src="https://cdn3.yame.vn/pimg/so-mi-nam-y2010-tn-g02-0019333/aebb4408-0c25-0c00-6817-0016c8520406.jpg?w=100&h=140&c=true"--%>
<%--                        alt=""></a>--%>

<%--            </div>--%>
<%--            <div class="_1sanpham" role="listitem">--%>
<%--                <a href="#"><img alt="sanpham5" class="anhsanpham"--%>
<%--                        src="https://cdn2.yame.vn/pimg/quan-jean-nam-y2010-dai-b33-0019430/de7d9052-93c1-3200-d42b-00168ca7ac40.jpg?w=440"--%>
<%--                        alt=""></a>--%>
<%--                        <p style=" margin-top: 10px;">Áo nike mksks</p>--%>
<%--                <p>100.000 vnd</p>--%>
<%--                <!-- mau  -->--%>
<%--                <a href="#"><img alt="mau sanpham5" class="anhmau"--%>
<%--                        src="https://cdn2.yame.vn/pimg/quan-jean-nam-y2010-dai-b33-0019430/de7d9052-93c1-3200-d42b-00168ca7ac40.jpg?w=440"--%>
<%--                        alt=""></a>--%>
<%--                <a href="#"><img alt="mau sanpham5" class="anhmau"--%>
<%--                        src="https://cdn3.yame.vn/pimg/quan-jean-nam-y2010-dai-b33-0019430/0ddf4572-81eb-3800-802b-00168ca803d3.jpg?w=100&h=140&c=true"--%>
<%--                        alt=""></a>--%>

<%--            </div>--%>
<%--            <div class="_1sanpham" role="listitem">--%>
<%--                <a href="#"><img alt="sanpham6" class="anhsanpham"--%>
<%--                        src="https://cdn3.yame.vn/pimg/quan-tay-nam-no-style-dai-hg08-0019169/5642e409-1805-db00-98bc-0016746b6f3a.jpg?w=440"--%>
<%--                        alt=""></a>--%>
<%--                        <p style=" margin-top: 10px;">Áo nike mksks</p>--%>
<%--                <p>100.000 vnd</p>--%>
<%--                <!-- mau  -->--%>
<%--                <a href="#"><img alt="mau sanpham6" class="anhmau"--%>
<%--                        src="https://cdn3.yame.vn/pimg/quan-tay-nam-no-style-dai-hg08-0019169/5642e409-1805-db00-98bc-0016746b6f3a.jpg?w=440"--%>
<%--                        alt=""></a>--%>
<%--                <a href="#"><img alt="mau sanpham6" class="anhmau"--%>
<%--                        src="https://cdn3.yame.vn/pimg/quan-tay-nam-no-style-dai-hg08-0019169/8b6225b7-d4cb-ec00-94c2-0016746bc8ac.jpg?w=100&h=140&c=true"--%>
<%--                        alt=""></a>--%>
<%--                <a href="#"><img alt="mau sanpham6" class="anhmau"--%>
<%--                        src="https://cdn3.yame.vn/pimg/quan-tay-nam-no-style-dai-hg08-0019169/21a0e5dd-9aaa-ed00-f99a-0016746bdc12.jpg?w=100&h=140&c=true"--%>
<%--                        alt=""></a>--%>

<%--            </div>--%>


<%--        </div>--%>
<%--    </div>--%>

    <!--  -->
    <!--  -->
    <!--  -->
    <!-- footer  -->
    <div class="footer" role="main">
        <div class="cot1" role="main">
            <h3>Thông tin 1</h3>
            Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur reprehenderit quod laborum eveniet hic
            facilis, molestias voluptas! Reiciendis eveniet labore, dolorem, cumque dignissimos laudantium libero
            repellat, natus porro possimus cum!
        </div>
        <div class="cot2" role="main">
            <h3>Thông tin 2</h3>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium itaque pariatur earum perferendis,
            reprehenderit repellendus hic quaerat, explicabo placeat vitae labore qui necessitatibus quisquam
            voluptatibus id dolorum consectetur, non maiores.
        </div>
        <div class="cot3" role="main">
            <h3>Thông tin 3</h3>

        </div>
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