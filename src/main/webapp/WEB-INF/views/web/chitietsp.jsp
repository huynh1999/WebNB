<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/taglib.jsp"%>

<!doctype html>
<html lang="en">

<head>
  <title>Chi tiết</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/nhshop.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/category.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/chitietsp.css">
</head>

<body>
  <div class="container">
    <div id="root" class="row">
      <div class="col-8 col-sm-8">
        <div class="anhmieuta" id="lsimg">

        </div>
      </div>
      <div class="col-4 col-sm-4">
        <div class="row">
          <div class="col-8" style="padding-left: 0px;">
            <p class="tensp">${item.name}</p>
          </div>
          <div class="col-4">
            <p id="price">${item.price}</p>
          </div>
        </div>
        <div class="row">
          <h5>Chọn size</h5>
        </div>
        <div class="row" id="size">
        </div>
        <div class="row btmua" style="text-align: center; margin: auto; margin-top: 20px;">
          <button type="button" class="btn btn-outline-warning btnshop" id="add_cart">Thêm vào giỏ hàng</button>
        </div>
        <div class="row">
          <h5>Miêu tả</h5>
          <p id="des"></p>
        </div>
      </div>
    </div>
    <div class="row" style=" margin-top: 50px; border-top: 1px solid gray;">
      <h6 class="chudep" style="font-size: x-large; margin-top: 20px; background-image: -webkit-linear-gradient(#9ea811,#9dbd10,#e812a6);">Các sản phẩm đề xuất</h6>
      <div style="margin: auto;" role="list">
        <div class="row" role="list" style="text-align: center;" id="recommendProduct">
            <div class="col _1sanpham" role="listitem">

            </div>

        </div>
    </div>
  </div>
  </div>
  <script>
    window.onload=function(){
      $.getScript("/template/js/page/chitiet.js")
    }
  </script>
</body>

</html>