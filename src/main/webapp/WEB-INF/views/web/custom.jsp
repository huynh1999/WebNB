<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<!doctype html>
<html lang="en">

<head>
    <title>Custom</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/nhshop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/category.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/custom.css">
</head>

<body>
    <i class="fa fa-home myhome"></i><i class="fa fa-angle-right myhome myarrow"></i>
    <h5 class="tieu_de">Custom</h5>
    <div class="custom_box">
        <h2><b>Thông tin đặt hàng</b> </h2>
        <div class="b2_boxform">
            <form action="">
                <div class="b2_boxcontain">
                    <label for="fname">Họ Và Tên</label>
                    <input type="text" id="fname" name="fname" oninput="checkname()"><br>
                    <p class="sp_name">Tên không hợp lệ</p>
                    <label for="fmail">Địa chỉ Email</label>
                    <input type="text" id="fmail" name="fmail" oninput="checkmail()"><br>
                    <p class="sp_mail">Email không hợp lệ</p>
                    <label for="fphone">Số điện thoại</label>
                    <input type="text" id="fphone" name="fphone" oninput="checkphone()"><br>
                    <p class="sp_phone">Số điện thoại không hợp lệ</p>
                    <div class="imgurl">
                        <label for="bimg">Image URL</label>
                        <button>Choose Files</button> <span>image3.jpg</span><br>
                        <p class="sp_url">URL chua duoc chon</p>
                    </div>
                    <label id="lcontent" for="fcontent">Thông tin thêm</label>
                    <textarea type="text" id="fcontent" name="fcontent" oninput="checkprice()"></textarea><br>
                    <div class="bsubmit">
                        <button id="bt_submit" type="button" class="new">Gửi</button>
                    </div>

                </div>

            </form>
        </div>
    </div>
    <script>
        function checkname() {
            var name1 = document.getElementById("fname").value;
            for (var i = 0; i < name1.length; i++) {
                if (!((name1.charCodeAt(i) >= 65 && name1.charCodeAt(i) <= 90) || (name1.charCodeAt(i) >= 97 && name1
                            .charCodeAt(i) <= 122) || name1.charCodeAt(i) == 32 || (name1.charCodeAt(i) >= 192 && name1
                            .charCodeAt(i) <= 195) || (name1.charCodeAt(i) >= 200 && name1.charCodeAt(i) <= 214) || (
                            name1.charCodeAt(i) >= 217 && name1.charCodeAt(i) <= 221) || (name1.charCodeAt(i) >= 224 &&
                            name1.charCodeAt(i) <= 227) || (name1.charCodeAt(i) >= 232 && name1.charCodeAt(i) <= 239) ||
                        (name1.charCodeAt(i) >= 242 && name1.charCodeAt(i) <= 246) || (name1.charCodeAt(i) >= 249 &&
                            name1.charCodeAt(i) <= 253))) {
                    $(".sp_name").show();
                } else
                    $(".sp_name").hide();
            }
        }

        function checkmail() {
            var mail1 = document.getElementById("fmail").value;
            var dem = 0;
            var demsau = 0;
            for (var i = 0; i < mail1.length; i++) {
                if (mail1.charCodeAt(i) == 64) {
                    dem++;
                    for (var j = i + 1; j < mail1.length; j++) {
                        demsau++;
                    }
                }
            }
            if (dem != 1 || mail1.charCodeAt(0) == 64 || demsau == 0) {
                $(".sp_mail").show();
            }
            if (dem == 1 && mail1.charCodeAt(0) != 64 && demsau != 0) {
                $(".sp_mail").hide();
            }

        }
        function checkphone(){
            var phone1=document.getElementById("fphone").value;
            for(var i=0;i<phone1.length;i++){
                if(!(phone1.length==10&&phone1.charCodeAt(i)>=48&&phone1.charCodeAt(i)<=57&&phone1.charCodeAt(0)==48)){
                    $(".sp_phone").show();
                }
                else
                $(".sp_phone").hide();
            }
            
        }
    </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
</body>

</html>