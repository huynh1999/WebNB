<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">

<head>
  <title>Chi tiết</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/nhshop.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/checkout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/profile.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/chitietlichsu.css">
</head>

<body>
<script>
    var error="error";
  var data=${data};
  var total=${total};
</script>
    <div class="container">
        <div class="row">
            <div class="lichsumua" id="lichsumua" style="overflow-x:auto; width: 100%;">
                <br>
                <h5><b>Chi tiết đơn hàng</b> </h5>
                <table class="table bg-light">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Giảm giá</th>
                            <th>Tạm tính</th>
                        </tr>
                    </thead>
                    <tbody id="root">
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <a href="" class="mr-5">Quay trở lại</a>
            <button type="button" class="btn btn-warning">Theo dõi đơn hàng</button>
        </div>
    </div>
<script>
    window.onload=function () {
        $.getScript("/template/js/page/bill.js");
    }
</script>
</body>

</html>