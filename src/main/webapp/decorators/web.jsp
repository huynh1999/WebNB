<%@ page import="online.newbrandshop.util.SecurityUtils" %>
<%@include file="/common/taglib.jsp"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-169860339-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-169860339-1');
	</script>

	<script>
		function errorHandler(script) {
			location.reload();
		}
	</script>
	<meta charset="utf-8">
	<meta name="description"
		  content="Newbrandshop.online chuyên buôn bán các loại áo quần hàng hiệu, thời trang, mẫu mã đa dạng, giá cả hợp lí bằng nhiều hình thức. Khách hàng có thể đến trực tiếp cửa hàng để chọn lựa và mua sản phẩm. Ngoài ra khách hàng củng có thể mua bằng hình thức online vô cùng tiện lợi.">

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="">
	<title><dec:title /></title>
	<link href="<c:url value='/template/css/bootstrap.min.css' />"
		  rel="stylesheet" type="text/css">
	<dec:head />
	<link onerror="errorHandler()" rel="stylesheet" href=" ${pageContext.request.contextPath}/template/css/nhshop.css">
	<link rel="shortcut icon" href=" ${pageContext.request.contextPath}/template/logo/icon.ico" type="image/x-icon">
	<!-- slick slide -->
	<link onerror="errorHandler()" rel="stylesheet" href=" ${pageContext.request.contextPath}/template/slick/slick.css">
	<link onerror="errorHandler()" rel="stylesheet" href=" ${pageContext.request.contextPath}/template/slick/slick-theme.css">
</head>
<body>
<!-- header -->
<!-- Load Facebook SDK for JavaScript -->
<script>
	window.fbAsyncInit = function() {
		FB.init({
			xfbml            : true,
			version          : '7.0'
		});
	};
	window.fbAsyncInit = function() {
		FB.init({
			appId      : '189392698895180',
			cookie     : true,                     // Enable cookies to allow the server to access the session.
			xfbml      : true,                     // Parse social plugins on this webpage.
			version    : '7.0'           // Use this Graph API version for this call.
		});


		FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
			console.log("getLoginStatus"+response);
			statusChangeCallback(response);        // Returns the login status.
		});
	};
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>

<!-- Your Chat Plugin code -->
<div class="fb-customerchat"
	 attribution=setup_tool
	 page_id="106383004443658"
	 theme_color="#E12942"
	 logged_in_greeting="Chúng tôi có thể giúp gì cho bạn?"
	 logged_out_greeting="Chúng tôi có thể giúp gì cho bạn?">
</div>
<%--LoginFB--%>
<script>
	function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
		console.log('statusChangeCallback');
		console.log(response);                   // The current login status of the person.
		if (response.status === 'connected') {   // Logged into your webpage and Facebook.
			testAPI();
		} else {                                 // Not logged into your webpage or we are unable to tell.
			document.getElementById('status').innerHTML = 'Please log ' +
					'into this webpage.';
		}
	}


	function checkLoginState() {               // Called when a person is finished with the Login Button.
		FB.getLoginStatus(function(response) {   // See the onlogin handler
			statusChangeCallback(response);
		});
	}





	(function(d, s, id) {                      // Load the SDK asynchronously
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));


	function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
		console.log('Welcome!  Fetching your information.... ');
		FB.api('/me?fields=email,name', function(response) {
			axios.post("/api/login-facebook",{
				id:response.id,
				name:response.name,
				email:response.email
			}).then(re=>{
				if(re.data==="ok"){location.reload()};
			})

		});
	}

</script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v7.0&appId=189392698895180&autoLogAppEvents=1"></script>

<%--Chat mess--%>
<div class="container-fluid mynopad">
<!-- header  -->
<div class="header" role="list" style="padding:0px;">
	<div class="headinfo" role="listitem">
		<div class="headinfo_left" role="listitem">
			<a href="https://www.facebook.com/NBS-SHOP-106383004443658/" class="text_" data-target="#myModal">Join us</a>
		</div>
		<sec:authorize access="isAnonymous()">
			<div class="headinfo_right" role="listitem">
				<a href="#" class="text_ loginclick">Login</a>
				<a href="/help" class="text_">Help</a>
				<a href="${pageContext.request.contextPath}/cart" class="fa fa-shopping-cart icon_color"></a>
				<a href="#" class="fa fa-map-marker icon_color"><span class="text_"> HCM</span></a>
			</div>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('customer','admin')">
			<div class="headinfo_right dropdown" role="listitem">
				<a href="#" class="text_ logintextsc" data-toggle="dropdown">Welcome <%=SecurityUtils.getPrincipal().getName()%></a>
				<div class="dropdown-menu hidemydropdown">
					<a href="/user/profile" class="dropdown-item">Profile</a>
					<div class="dropdown-divider"></div>
					<a href="/logout" class="dropdown-item">Logout</a>
				</div>
				<a href="#" class="text_">Help</a>
				<a href="${pageContext.request.contextPath}/cart" class="fa fa-shopping-cart icon_color"></a>
				<a href="#" class="fa fa-map-marker icon_color"><span class="text_"> HCM</span></a>
			</div>
		</sec:authorize>

	</div>
	<div class="row" style="margin-left: 0px; margin-right: 0px;">
                <!-- <div class="headmenu"> -->
                <div class="col-xl-3 col-lg-3 headmenu_cl1" role="listitem">
                    <a href="/home" style="color: white; text-decoration: none;">NBShop</a>
                </div>
                <div class="col-xl-6 col-lg-6 headmenu_cl2" role="list">
                    <ul class="menu_list" role="list">

			</ul>
		</div>
		<div class="col-xl-3 col-lg-3 headmenu_cl3 " role="form">
		<form class="search" action="/search">
                    <div class="input-group mycusinput-group">
                        <input id="input1" type="text" class="form-control" placeholder="Search" name="keyword"
                            style="height: 44.6px;">
                        <div class="input-group-append">
                            <button class="btn btn-success mybutton-search" type="submit"><i
                                    class="fa fa-search"></i></button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            <!-- menu thu gon  -->
            <div class="menuthugon">
                <div id="mySidepanel" class="sidepanel">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                    <!-- <a href="#" class="loginclick logintextsc1">Login1</a>
                    <div class="dropdown-menu hidemydropdown">
                        <a href="#" class="dropdown-item">Profile</a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item">Logout</a>
                    </div> -->
                    <div id="accordion" style="display: none;">
                        <div class="acc" style="background-color: black;">
                            <div class="acc-header">
                                <a class="acc-link" data-toggle="collapse" href="#collapseOne">Chào,Huỳnh</a>
                            </div>
                            <div id="collapseOne" class="collapse" data-parent="#accordion" style="display: none;">
                                <div class="acc-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="background-color: black;"><a
                                                href="/user/profile">Profile</a> </li>
                                        <li class="list-group-item" style="background-color: black;"><a
                                                href="/logout">Logout</a> </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                    <a href="/login">Login</a>
                    <a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a>
                    <a href="/category/ClothesWomanNike">Sản phẩm</a>
                    <a href="https://www.facebook.com/NBS-SHOP-106383004443658/">Join us</a>
                    <a href="/help">Help</a>
                </div>

                <button class="openbtn" onclick="openNav()">☰</button>
            </div>
            <script>
                function openNav() {
                    document.getElementById("mySidepanel").style.width = "250px";
                }

                function closeNav() {
                    document.getElementById("mySidepanel").style.width = "0";
                }
            </script>
        </div>
<!-- login  -->
<div class="mylogform modal-open">
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="display: none;"
			id="btshowlog">
		Open modal
	</button>
	<!-- The Modal -->
	<!-- login  -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="containerform">
						<div class="chudau">
							<h4 class="modal-title chudep">Login</h4>
						</div>

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
						<div class="links">
							<div class="face">
								<fb:login-button size="xlarge"
												 scope="public_profile,email"
												 onlogin="checkLoginState();">
									Connect to Facebook
								</fb:login-button>
							</div>
						</div>
						<div class="signup">
							<p id="signup">Not a member? <a href="#" data-dismiss="modal">Signup now</a></p>
						</div>
					</div>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	<!-- signup  -->
	<div class="mylogform">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalSignup" style="display: none;"
				id="btshowlogsignup">
			Open modal
		</button>
		<!-- The Modal -->
		<!-- signup  -->
		<div class="modal fade" id="myModalSignup" >
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">

						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<div class="containerform">
							<div class="chudau">
								<h4 class="modal-title chudep">Signup</h4>
							</div>
							<div class="alert alert-danger" id="error-alert-register" style="display: none;text-align: center">
								<button type="button" class="close" data-dismiss="alert">x</button>
								<strong>Error! </strong> Tên đăng nhập đã được sử dụng
							</div>
							<form id="form_register" action="/register" method="post">
								<div class="input-field">
									<input type="text" required="" name="username" pattern="[a-z0-9]{6,15}" title="Vui lòng nhập đúng định dạng">
									<label>User Name</label>
								</div>
								<div class="input-field">
									<input type="text" required="" name="fullname" pattern="([^\u0000-\u007F]|[ a-zA-z0-9]){6,25}" title="Vui lòng nhập đúng định dạng">
									<label>Full Name</label>
								</div>
								<div class="input-field">
									<input type="text" required="" name="phone" pattern="0[0-9]{9}" title="Vui lòng nhập SDT có thật">
									<label>Số điện thoại</label>
								</div>
								<div class="input-field">
									<input type="text" required="" name="address" pattern=".{6,30}" title="Vui lòng nhập địa chỉ có thật">
									<label>Địa chỉ</label>
								</div>
								<div class="input-field">
									<input type="text" required="" name="email" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[ a-zA-Z]{2,4}" title="Vui lòng nhập email có thật">
									<label>Email</label>
								</div>
								<div class="input-field">
									<input class="pswrd" id="password" type="password" required="" name="password" pattern="[ 0-9a-zA-Z]{6,15}" title="Password từ 6 đến 15 kí tự">
									<span class="show"></span>
									<label>Password</label>
								</div>
								<div class="input-field">
									<input class="pswrd" id="repassword" type="password" required="">
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
								<p id="signup">Had account? <a href="#" class="loginclick" data-dismiss="modal">Login</a></p>
							</div>
						</div>

					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>


	<dec:body />


<%--	<!-- Footer -->--%>
<!-- footer  -->
        <div class="row footer" style="margin-left: 0px; margin-right: 0px; padding: 0px">
            <div class="col" style="margin: auto;">
                <h4 style="color: red;margin-top: 8px;">About NBShop</h4>
                <ul style="list-style: none;">
                    <li><a href="/hethongcuahang" style="color: aliceblue; text-decoration: none;"><h5>Hệ thống cửa hàng</h5></a></li>
                    <li><a href="/thongtinshop" style="color: aliceblue; text-decoration: none;"><h5>Thông tin</h5></a></li>
                    <li><a href="/help" style="color: aliceblue; text-decoration: none;"><h5>Ứng tuyển việc làm</h5></a></li>
                </ul>
            </div>
            <div class="col" style="margin: auto;">
                <h4 style="color: red;margin-top: 8px;">Get help</h4>
                <ul style="list-style: none;">
                    <li><a href="${pageContext.request.contextPath}/cart" style="color: aliceblue; text-decoration: none;"><h5>Giỏ hàng</h5></a></li>
                    <li><a href="/help" style="color: aliceblue; text-decoration: none;"><h5>Chính sách</h5></a></li>
                    <li><a href="https://mail.google.com/" style="color: aliceblue; text-decoration: none;"><h5>Liên hệ</h5></a></li>
                </ul>
            </div>
            
            <div class="col socialhide" style="margin: auto; text-align: center;">
                <ul style="list-style: none; margin: auto; text-align: left;">
                    <li><a href="https://www.facebook.com/NBS-SHOP-106383004443658/" style="color:white;"><i class="fa fa-facebook-square text-primary p-2"
                                style="font-size: xx-large;"></i>Facebook</a>
                    </li>
                    <li><a href="https://twitter.com/explore" style="color:white;"><i class="fa fa-twitter-square text-info p-2" style="font-size: xx-large;"></i>Twitter</a>
                    </li>
                    <li><a href="https://www.youtube.com/" style="color:white;"><i class="fa fa-youtube-square text-danger p-2" style="font-size: xx-large;"></i>Youtube</a>
                    </li>
                </ul>

            </div>
            <div class="col socialhide" style="padding: 10px;">
            <div class="fb-page" data-href="https://www.facebook.com/NBS-SHOP-106383004443658/" data-tabs="timeline" data-width="" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/NBS-SHOP-106383004443658/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/NBS-SHOP-106383004443658/">NBS SHOP</a></blockquote></div></div>
        </div>

</div>
	<script src="/template/js/common/axios.js" onerror="errorHandler()"></script>
	<link href="<c:url value='/template/css/font-awesome.min.css' />"
		  rel="stylesheet" type="text/css">
	<script src="<c:url value='/template/js/common/jquery.js' />" onerror="errorHandler()"></script>
	<script src="<c:url value='/template/js/common/jquery.js' />" onerror="errorHandler()"></script>
	<script type="text/javascript" src="/template/slick/slick.min.js" onerror="errorHandler()"></script>
	<script src="<c:url value='/template/js/common/bootstrap.min.js' />" onerror="errorHandler()"></script>
	<script src="${pageContext.request.contextPath}/template/js/common/popper.js" onerror="errorHandler()"></script>
	<script src="/template/js/page/web.js" onerror="errorHandler()"></script>
	<script>
        $('.main-slider').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 4000,
        });
    </script>
    <script>
        if ($(window).width() < 1024) {
            $(".mybutton-search").click(function () {
                $("#input1").show();
                $(".headmenu_cl1").hide();
                $(".headmenu_cl3").css("width", "100%");
                $(".mybutton-search").attr("type","button");
            })
            $(".header").mouseleave(function () {
                $("#input1").hide();
                $(".headmenu_cl1").show();
                $(".headmenu_cl3").css("width", "fit-content");
            })
            $(".socialhide").hide();
        }
    </script>
    <script>
        console.log($(".acc-link").text());
        if ($(".acc-link").text() != "Login") {
            $("#collapseOne").show();
        }
    </script>
    <script>
        $('.product-slider').slick({
            centerMode: true,
            centerPadding: '60px',
            slidesToShow: 3,
            autoplay: true,
            autoplaySpeed: 2000,
            responsive: [{
                    breakpoint: 768,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '40px',
                        slidesToShow: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '40px',
                        slidesToShow: 1
                    }
                }
            ]
        });
    </script>
    
</body>
</html>