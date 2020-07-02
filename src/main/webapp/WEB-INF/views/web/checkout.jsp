<%@ page import="online.newbrandshop.util.SecurityUtils" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/taglib.jsp"%>

<!doctype html>
<html lang="en">

<head>
  <title>Checkout</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/nhshop.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/template/css/checkout.css">
  <link rel="shortcut icon" href=" ${pageContext.request.contextPath}/template/logo/icon.ico" type="image/x-icon">
</head>

<body>
  <div class="container">
        <div class="row">
            <div class="col-8">
                <h5>Giỏ hàng</h5>
                <table class="table">
                    <tbody id="root">

                    </tbody>
                </table>
            </div>
            <div class="col-4">
                <h5>Thanh toán</h5>
                <div class="row textcenter" style="margin: auto;">
                    <div class="col-6">
                        <p>Tổng tiền</p>
                        <p>Khuyến mãi</p>

                    </div>
                    <div class="col-6">
                        <p id="tong"></p>
                        <p id="km"></p>

                    </div>
                </div>
                <div class="row botron textcenter">
                    <div class="col-6">
                        <p style="margin-top: 15px;">Thành tiền</p>
                    </div>
                    <div class="col-6">
                        <p id="thanh" style="margin-top: 15px;"></p>
                    </div>

                </div>
                <div class="row">
                    <button type="button" class="btn btn-warning btn_thanhtoan" style="margin: auto; margin-top: 10px;">Thanh
                        toán</button>
                </div>
            </div>

        </div>
        <!-- thanh toán  -->
      <sec:authorize access="isAnonymous()">
      <div>
          <!-- The Modal -->
          <div class="modal fade" id="ModalOfCheckout">
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
                                  <h4 class="modal-title">Thông tin thanh toán</h4>
                              </div>

                              <form action="/checkout" id="checkout" method="post">
                                  <div class="input-field">
                                      <input type="text" required="" name="name">
                                      <label>Tên</label>
                                  </div>
                                  <div class="input-field">
                                      <input type="text" required="" name="email">
                                      <label>Email</label>
                                  </div>
                                  <div class="input-field">
                                      <input type="text" required="" name="phone">
                                      <label>Số điện thoại</label>
                                  </div>
                                  <div class="input-field">
                                      <input type="text" required="" name="address">
                                      <label>Địa chỉ nhận hàng</label>
                                  </div>
                                  <input name="content" hidden value ="">

                                  <!-- <div id="widget">
                                      <form>
                                          City/State&raquo; <select name="city_state" size="1"
                                              onchange="print_city_state(country,this)"></select>
                                      </form>
                                      <div id="txtregion"></div>
                                      <div id="txtplacename"></div>
                                  </div> -->
                                  <div style="text-align: center;">
                                      <div class="inner">
                                      </div>
                                      <button class="btn btn-warning" type="submit" id="dathang">Hoàn thành</button>
                                  </div>
                              </form>
                          </div>

                      </div>

                      <!-- Modal footer -->
                      <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      </div>

                  </div>
              </div>
          </div>
      </sec:authorize>
      <sec:authorize access="hasAnyRole('customer','admin')">
          <div>
              <!-- The Modal -->
              <div class="modal fade" id="ModalOfCheckout">
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
                                      <h4 class="modal-title">Thông tin thanh toán</h4>
                                  </div>

                                  <form action="${pageContext.request.contextPath}/checkout" id="checkout" method="post" accept-charset="utf-8">
                                      <div class="input-field">
                                          <input type="text" required="" name="name" value="<%=SecurityUtils.getPrincipal().getName()%>">
                                          <label>Tên</label>
                                      </div>
                                      <div class="input-field">
                                          <input type="text" required="" name="email" value="<%=SecurityUtils.getPrincipal().getEmail()%>">
                                          <label>Email</label>
                                      </div>
                                      <div class="input-field">
                                          <input type="text" required="" name="phone" value="<%=SecurityUtils.getPrincipal().getPhonenumber()%>">
                                          <label>Số điện thoại</label>
                                      </div>
                                      <div class="input-field">
                                          <input type="text" required=""  name="address" value="<%=SecurityUtils.getPrincipal().getAddress()%>">
                                          <label>Địa chỉ nhận hàng</label>
                                      </div>
                                      <input name="content" hidden value="">
                                      <!-- <div id="widget">
                                          <form>
                                              City/State&raquo; <select name="city_state" size="1"
                                                  onchange="print_city_state(country,this)"></select>
                                          </form>
                                          <div id="txtregion"></div>
                                          <div id="txtplacename"></div>
                                      </div> -->
                                      <div style="text-align: center;">
                                          <div class="inner">
                                          </div>
                                          <button class="btn btn-warning" type="submit" id="dathang">Hoàn thành</button>
                                      </div>
                                  </form>
                              </div>

                          </div>

                          <!-- Modal footer -->
                          <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          </div>

                      </div>
                  </div>
              </div>
      </sec:authorize>

            <div class="row" style=" margin-top: 50px; border-top: 1px solid gray;">
                <h6 class="chudep"
                    style="font-size: x-large; margin-top: 20px; background-image: -webkit-linear-gradient(#9ea811,#9dbd10,#e812a6);">
                    Các sản phẩm đề xuất</h6>
                <div style="margin: auto;" role="list">
                    <div class="row" role="list" style="text-align: center;">
                        <div class="col _1sanpham" role="listitem">
                            <a href="#"><img alt="sanpham1" class="anhsanpham"
                                    src="https://cdn3.yame.vn/pimg/ao-thun-nam-y2010-bd-b01-0019570/f7e1d4ae-c9b3-0100-d1ac-0016c9eb68f5.jpg?w=440"
                                    alt=""></a>
                            <p>100.000 vnd</p>
                            <!-- mau  -->
                            <a href="#"><img alt="mau sac sp1" class="anhmau"
                                    src="https://cdn3.yame.vn/pimg/ao-thun-nam-y2010-bd-b01-0019570/f7e1d4ae-c9b3-0100-d1ac-0016c9eb68f5.jpg?w=440"
                                    alt=""></a>

                        </div>
                        <div class="col _1sanpham" role="listitem">
                            <a href="#"><img alt="sanpham2" class="anhsanpham"
                                    src="https://cdn3.yame.vn/pimg/ao-thun-nam-y2010-bd-b03-0019572/d901b2c4-22ec-0300-5539-0016c9eb9d40.jpg?w=440"
                                    alt=""></a>
                            <p>100.000 vnd</p>
                            <!-- mau  -->
                            <a href="#"><img alt="mau sanpham2" class="anhmau"
                                    src="https://cdn3.yame.vn/pimg/ao-thun-nam-y2010-bd-b03-0019572/d901b2c4-22ec-0300-5539-0016c9eb9d40.jpg?w=440"
                                    alt=""></a>

                        </div>
                        <div class="col _1sanpham" role="listitem">
                            <a href="#"><img alt="sanpham3" class="anhsanpham"
                                    src="https://cdn2.yame.vn/pimg/ao-khoac-y2010-kaki-e06-0019437/80f8c358-7a9c-1e00-c2bc-0016a782c0ff.jpg?w=440"
                                    alt=""></a>
                            <p>100.000 vnd</p>
                            <!-- mau  -->
                            <a href="#"><img alt="mau sanpham3" class="anhmau"
                                    src="https://cdn2.yame.vn/pimg/ao-khoac-y2010-kaki-e06-0019437/80f8c358-7a9c-1e00-c2bc-0016a782c0ff.jpg?w=440"
                                    alt=""></a>
                            <a href="#"><img alt="mau sanpham3" class="anhmau"
                                    src="https://cdn3.yame.vn/pimg/ao-khoac-y2010-kaki-e06-0019437/6e5365aa-cd19-1b00-f315-0016a7827302.jpg?w=100&h=140&c=true"
                                    alt=""></a>
                            <a href="#"><img alt="mau sanpham3" class="anhmau"
                                    src="https://cdn2.yame.vn/pimg/ao-khoac-y2010-kaki-e06-0019437/2711de3d-4e22-1c00-56b4-0016a7829674.jpg?w=100&h=140&c=true"
                                    alt=""></a>

                        </div>
                    </div>
                </div>
            </div>
            
            <!-- <script>
                var tong = 0;
                var gia = [];
                var soluong = [];
                $('table > tbody  > tr > td > p.gia').each(function () {
                    gia.push($(this).text());
                });
                $('table > tbody  > tr > td > div.mycustomformgroup > div.mycustomformgroup_c2 > select.mycustomselectsl')
                    .each(function () {
                        soluong.push($(this).val());
                    });
                for (var i = 0; i < gia.length; i++) {
                    for (var j = 0; j < soluong.length; j++) {
                        if (i == j) {
                            tong = tong + gia[i] * soluong[j];
                        }
                    }
                }
                $("#tong").text(tong);
                var thanh = tong - parseInt($("#km").text());
                $("#thanh").text(thanh);
                $(document).change(function () {
                    var tong = 0;
                    var gia = [];
                    var soluong = [];
                    $('table > tbody  > tr > td > p.gia').each(function () {
                        gia.push($(this).text());
                    });
                    $('table > tbody  > tr > td > div.mycustomformgroup > div.mycustomformgroup_c2 > select.mycustomselectsl')
                        .each(function () {
                            soluong.push($(this).val());
                        });
                    for (var i = 0; i < gia.length; i++) {
                        for (var j = 0; j < soluong.length; j++) {
                            if (i == j) {
                                tong = tong + gia[i] * soluong[j];
                            }
                        }
                    }
                    $("#tong").text(tong);
                    var thanh = tong - parseInt($("#km").text());
                    $("#thanh").text(thanh);
                })
            </script>
            <script>
                $("button.btn_thanhtoan").click(function () {
                    event.preventDefault();
                })
                var input = document.querySelector('.pswrd');
                var show = document.querySelector('.show');
                show.addEventListener('click', active);

                function active() {
                    if (input.type === "password") {
                        input.type = "text";
                        show.style.color = "#1DA1F2";
                    } else {
                        input.type = "password";
                        show.style.color = "#111";
                    }
                }
            </script>
            <script>
                $("#dathang").click(function(){
                    if($("#dathang").attr("data-dismiss","modal")){
                        alert("Đặt hàng thành công");
                    }
                    
                })
            </script> -->
        </div>
  </div>
<script>
    window.onload=function(){
        $.getScript("/template/js/page/checkout.js");
    }
</script>
</body>

</html>