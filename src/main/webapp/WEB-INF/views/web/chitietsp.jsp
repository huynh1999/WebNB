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
  <link rel="stylesheet"  onerror="errorHandler()" href="${pageContext.request.contextPath}/template/css/category.css">
  <link rel="stylesheet" onerror="errorHandler()" href="${pageContext.request.contextPath}/template/css/chitietsp.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>

<body>
  <div class="container">
    <div id="root" class="row">
      <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12">
        <div class="anhmieuta" id="lsimg">

        </div>
      </div>
      <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
        <div class="row">
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8" style="padding-left: 0px;width:fit-content;">
            <p class="tensp">${item.name}</p>
          </div>
          <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4" style="width:fit-content;">
            <p id="price">${item.price}</p>
          </div>
        </div>
        <div class="row">
          <h5>Chọn size</h5>
        </div>
        <div class="row" id="size">
        </div>
        <div class="row btmua" style="text-align: center; margin: auto; margin-top: 20px;">
          <button type="button" class="btn btn-outline-warning btnshop" id="add_cart"><a href="#" data-toggle="popoverCheckout" title="Thành công" style="color:black;">Thêm vào giỏ hàng</a></button>
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
  <script>
$(document).ready(function(){
  $('[data-toggle="popoverCheckout"]').popover();   
});
</script>
</body>

</html>