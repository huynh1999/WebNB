<%@include file="/common/taglib.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="/template/css/login.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-4" id="changebackcolor">
            <div class="chudau">
                <h4 class="modal-title chudep">Signup</h4>
            </div>

            <form id="form_register" action="/register" method="post">
                <div class="input-field">
                    <input type="text" required="" name="username" pattern="[a-z0-9]{6,15}" title="Vui lòng nhập đúng định dạng">
                    <label>User Name</label>
                </div>
                <div class="input-field">
                    <input type="text" required="" name="fullname" pattern="([^\u0000-\u007F]|[ a-zA-z]){6,25}" title="Vui lòng nhập đúng định dạng">
                    <label>Full Name</label>
                </div>
                <div class="input-field">
                    <input type="text" required="" name="phone" pattern="0[0-9]{9}" title="Vui lòng nhập SDT có thật">
                    <label>Số điện thoại</label>
                </div>
                <div class="input-field">
                    <input type="text" required="" name="address" pattern="{6,30}" title="Vui lòng nhập địa chỉ có thật">
                    <label>Địa chỉ</label>
                </div>
                <div class="input-field">
                    <input type="text" required="" name="email" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[ a-zA-Z]{2,4}" title="Vui lòng nhập email có thật">
                    <label>Email</label>
                </div>
                <div class="input-field">
                    <input class="pswrd" id="password" type="password" required="" name="password" pattern="{6,15}" title="Password từ 6 đến 15 kí tự">
                    <span class="show"></span>
                    <label>Password</label>
                </div>
                <div class="input-field">
                    <input class="pswrd" type="password" required="">
                    <span class="show"></span>
                    <label>Password Again</label>
                </div>
                <div class="button">
                    <div class="inner">
                    </div>
                    <button type="submit" id="btn_signup">SIGNUP</button>
                </div>
            </form>
            <div class="signup">
                <p id="signup">Had account? <a href="/login" class="loginclick"
                                               data-dismiss="modal">Login</a></p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
