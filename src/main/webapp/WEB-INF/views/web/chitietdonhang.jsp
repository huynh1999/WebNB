<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Huynh
  Date: 6/9/2020
  Time: 10:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">

<head>
    <title>Tracking</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" onerror="errorHandler()" href="/template/css/profile.css">
    <link rel="stylesheet" onerror="errorHandler()" href="/template/css/chitietlichsu.css">
    <style>
        #line {
            height: 6px;
            width: 70%;
            background: green;
            border-radius: 5px;
            margin: auto;
            position: relative;
        }

        .circle {
            width: 20px;
            height: 20px;
            background: green;
            border-radius: 15px;
            position: absolute;
            top: -7px;
            border: 3px solid green;
            cursor: pointer;
        }

        .popupSpan {
            width: auto;
            height: auto;
            padding: 10px;
            white-space: nowrap;
            display: inline-block;
            color: green;
            position: absolute;
            top: 20px;
            left: -75px;
            display: block;
            transition: all 0.1s ease-out;
        }
    </style>
</head>

<body>
<script>
    var error="error";
    var data=${data};
    var total=${total};
    var status=${status};
    var details=${details};
</script>
<div class="container">
        <div class="row">
            <h5>Trạng thái đơn hàng</h5>
        </div><br>
        <div class="row">
            <div id="line">
                <div class="circle" id="circle0" style="left:0%;">
                    <div class="popupSpan">
                        NBShop đã tiếp nhận
                    </div>
                </div>
                <div class="circle" id="circle1" style="left:33%;">
                    <div class="popupSpan">
                        NBShop đã xac nhận
                    </div>
                </div>
                <div class="circle" id="circle2" style="left:66%;">
                    <div class="popupSpan">
                        Đang vận chuyển
                    </div>
                </div>
                <div class="circle" id="circle3" style="left:99%;">
                    <div class="popupSpan">
                        Giao hàng thành công
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 65px">
            <h5>Chi tiết trạng thái đơn hàng</h5>
            <div class="table-responsive bg-light">
                <table class="table" >
                    <thead class="thead-light">
                        <tr>
                            <th colspan="2">Ngày tháng</th>
                            <th colspan="2">Nội dung</th>
                        </tr>
                    </thead>
                    <tbody id="detail-table">

                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <h5>Kiện hàng gồm có</h5>
            <div class="table-responsive">
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
    </div>
<script>
    window.onload=function () {
        $.getScript("/template/js/page/tracking.js");
    }
</script>
</body>

</html>
