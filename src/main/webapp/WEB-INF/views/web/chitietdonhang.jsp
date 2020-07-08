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
    <title>Login</title>
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
<div class="container">
        <div class="row">
            <h5>Trạng thái đơn hàng</h5>
        </div><br>
        <div class="row">
            <div id="line">
                <div class="circle" style="left:0%;">
                    <div class="popupSpan">
                        Đặt hàng thành công
                    </div>
                </div>
                <div class="circle" style="left:33%;background-color: white;">
                    <div class="popupSpan">
                        NBShop đã tiếp nhận
                    </div>
                </div>
                <div class="circle" style="left:66%;background-color: white;">
                    <div class="popupSpan">
                        Đang vận chuyển
                    </div>
                </div>
                <div class="circle" style="left:99%;background-color: white;">
                    <div class="popupSpan">
                        Giao hàng thành công
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 65px">
            <h5>Chi tiết trạng thái đơn hàng</h5>
            <div class="table-responsive bg-light">
                <table class="table">
                    <thead class="thead-light">
                        <tr>
                            <th colspan="2">Ngày 12/22/2000</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>15:02</td>
                            <td>Giao hàng thành công</td>
                        </tr>
                        <tr>
                            <td>10:09</td>
                            <td>Đang vận chuyển</td>
                        </tr>
                    </tbody>
                </table>
                <table class="table">
                    <thead class="thead-light">
                        <tr>
                            <th colspan="2">Ngày 12/22/2000</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>12:00</td>
                            <td>NBShop đã tiếp nhận</td>
                        </tr>
                        <tr>
                            <td>2:00</td>
                            <td>Đặt hàng thành công</td>
                        </tr>
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
                    <tbody>
                        <tr class="mathang">
                            <td class="d-flex p-2">
                                <a href=""><img class="anhnho"
                                        src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/i1-86f7b43f-2f76-42cb-b253-a7591b6032c7/jordan-short-sleeve-crew-BsLCrG.jpg"
                                        alt=""></a>
                                <a href="" class="p-2">Tên sp áo thun nike blalala123</a>
                            </td>
                            <td>500000</td>
                            <td>1</td>
                            <td>20000</td>
                            <td>480000</td>
                        </tr>
                        <tr class="mathang">
                            <td class="d-flex p-2">
                                <a href=""><img class="anhnho"
                                        src="https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/i1-86f7b43f-2f76-42cb-b253-a7591b6032c7/jordan-short-sleeve-crew-BsLCrG.jpg"
                                        alt=""></a>
                                <a href="" class="p-2">Tên sp áo thun nike blalala123</a>
                            </td>
                            <td>500000</td>
                            <td>1</td>
                            <td>20000</td>
                            <td>480000</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
        var trangthaiflag = 3;
        var distan=0;
        var trangthai=["Đặt hàng thành công","NBShop đã tiếp nhận","Đang vận chuyển","Giao hàng thành công"]
        for (var i = 0; i < trangthaiflag; i++) {
            $("#line").append('<div class="circle" id="circle' + i + '" style="left: ' + distan +
                '%;"><div class="popupSpan">' + trangthai[i] + '</div></div>');
            distan+=33;
        }
    </script>
</body>

</html>
