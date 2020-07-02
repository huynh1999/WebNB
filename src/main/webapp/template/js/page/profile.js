// $("button.btn_changepass").click(function () {
//     event.preventDefault();
// })
// var input = document.querySelector('.pswrd');
// var show = document.querySelector('.show');
// show.addEventListener('click', active);
function active() {
    if (input.type === "password") {
        input.type = "text";
        show.style.color = "#1DA1F2";
    } else {
        input.type = "password";
        show.style.color = "#111";
    }
}
var root=document.getElementById("rootHistory");
function loadHistory() {
    var content="";
    for(var i=0;i<data.length;i++)
    {
        var status="";
        if(data[i].status===0)status="Đã tiếp nhận đơn hàng";
        else if(data[i].status===1)status="Đã xác nhận đơn hàng";
        else if(data[i].status===2)status="Đang vận chuyển";
        else if(data[i].status===3)status="Giao hàng thành công";
        else status="Đơn bị hủy";
        content+="<tr class=\"mathang\">\n" +
            "                                    <td><a href=\"/bill/"+data[i].billName+"\">"+data[i].billName+"</a></td>\n" +
            "                                    <td>"+data[i].createdDate+"</td>\n" +
            "                                    <td>\n" +
            "                                        <a href=\"\">"+JSON.parse(data[i].content).length+" sản phẩm</a>\n" +
            "                                    </td>\n" +
            "                                    <td>\n" +
            "                                        <p class=\"gia\">"+data[i].totalMoney+"</p>\n" +
            "                                    </td>\n" +
            "                                    <td>"+status+"</td>\n" +
            "                                </tr>"
    }
    root.innerHTML=content;
}
function onLoad() {
    if(localStorage.getItem("cart_item")!==null)
    {
        var rootCart=document.getElementsByClassName("mygiohang")[0];
        rootCart.innerHTML="<h5><b>Giỏ hàng</b> </h5>\n" +
            "                        <span><span>"+JSON.parse(localStorage.getItem("cart_item")).length+"</span> sản phẩm chưa thanh toán</span>\n" +
            "                        <button type=\"button\" class=\"btn btn-warning\"><a href='/cart'> Kiểm tra giỏ hàng ngay </a></button>"
    }
}
function ChangePass() {
    var alertrChange=$("#alter-changepass")[0];
    var redata;
    $("button[data-target='#myModalcpass']").click(function () {
        alertrChange.innerHTML="";
    })
    $("#btn-changepass").click(async function () {
        var post={
            "oldPass":$("#oldpass").val(),
            "newPass":$("#newpass").val(),
            "renewPass":$("#renewpass").val()
        };
        if(post.newPass!==post.renewPass)
        {
            alertrChange.innerHTML="<div class=\"alert alert-warning\" style=\"text-align: center;\">\n" +
                "    <strong>Lỗi!</strong>Mật khẫu lần thứ 2 không khớp. " +
                "  </div>";
            return;
        }
        await axios.post("/api/user/changePass",post).then(re=>{redata=re.data});
        if(redata==="error")
        {
            alertrChange.innerHTML="<div class=\"alert alert-danger\" style=\"text-align: center;\">\n" +
                "    <strong>Lỗi!  </strong>Lỗi khi đổi  mật khẩu.Vui lòng thử lại." +
                "  </div>";
        }
        else if(redata==="ok")
        {
            alertrChange.innerHTML="<div class=\"alert alert-success\" style=\"text-align: center;\">\n" +
                "    <strong>OK!</strong>Đổi mật khẩu thành công" +
                "  </div>";
        }
        else {
            alertrChange.innerHTML="<div class=\"alert alert-danger\" style=\"text-align: center;\">\n" +
                "    <strong>Lỗi!</strong>Lỗi không xác định" +
                "  </div>";
        }
        $("#oldpass").val("");
        $("#newpass").val("");
        $("#renewpass").val("")
    })
}
function UploadInfo() {
    var btn=document.getElementById("uploadInfo");
    $(btn).click(function () {
        var post={
            name:$("#nameInfo").val(),
            email:$("#emailInfo").val(),
            address:$("#addressInfo").val(),
            phone:$("#phoneInfo").val()
        };
        axios.post("/api/user/changeInfo",post).then(re=>{
            if(re.data==="ok")
            {
                $("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
                    $("#success-alert").slideUp(500);
                })
            }
            else {
                $("#error-alert").fadeTo(2000, 500).slideUp(500, function() {
                    $("#error-alert").slideUp(500);
                })
            }
        })
    })
}
function doWork() {
    console.log("test");
    onLoad();
    loadHistory();
    ChangePass();
    UploadInfo();
}
doWork();