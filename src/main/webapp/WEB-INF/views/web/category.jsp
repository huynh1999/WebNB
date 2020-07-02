<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<!doctype html>
<html lang="en">

<head>
    <title>Category</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/nhshop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/category.css">

</head>

<body>
    <i class="fa fa-home myhome"></i><i class="fa fa-angle-right myhome myarrow"></i>
    <h5 class="tieu_de">Brand</h5>
    <div class="leftbox">
        <h5>Brand</h5>
        <ul>
            <li><a href="#">NIKE</a></li>
            <li><a href="#">ADIDAS</a></li>
            <li><a href="#">GUCCI</a></li>
            <li><a href="#">CHANEL</a></li>
        </ul>
    </div>
    <div class="product_box" role="list">
        <div class="_12sanpham" role="list" id="box_item">
        </div>
    </div>
    <div id="loadingGif" style="text-align: center">
        <img src="/template/img/loading.gif">
    </div>
    <script>
        window.onload=function () {
            $.getScript("/template/js/page/category.js");
        }
    </script>
</body>

</html>