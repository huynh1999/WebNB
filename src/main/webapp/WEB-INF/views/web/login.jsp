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

    <link rel="stylesheet" href="/template/css/login.css">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-4" id="changebackcolor">
            <div class="chudau">
                <h4 class="modal-title chudep">Login</h4>
            </div>
            <div id="show_alert"></div>
            <form action="<c:url value="/j_spring_security_check" />" method="post">
                <div class="input-field">
                    <input type="text" required="" name="j_username">
                    <label>Username</label>
                </div>
                <div class="input-field">
                    <input class="pswrd" type="password" required="" name="j_password">
                    <span class="show"></span>
                    <label>Password</label>
                </div>
                <div class="button">
                    <div class="inner">
                    </div>
                    <button type="submit">LOGIN</button>
                </div>
            </form>
            <div class="auth">
                <p id="login_with">Or login with</p>
            </div>
            <div class="links" style="margin:auto;text-align:center;">
                    <fb:login-button size="large"
                                     scope="public_profile,email"
                                     onlogin="checkLoginState();">
                        Connect to Facebook
                    </fb:login-button>
            </div>
            <div class="signup">
                <p id="signup">Not a member? <a href="/registerWeb" id="signuplink" data-dismiss="modal">Signup
                    now</a></p>
            </div>
        </div>
    </div>
</div>
<script>
    window.onload=function(){
        $.getScript("/template/js/page/login.js");
    }

</script>
</body>

</html>
