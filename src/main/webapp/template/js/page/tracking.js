var root=document.getElementById("root");
var detailsTable=$("#detail-table");
if(data===undefined)data="error";
console.log("test");
var content="";
var listData=data;
if(listData!=="error")
{
    for(var i=0;i<listData.length;i++)
    {
        content+="<tr class=\"mathang\">\n" +
            "                            <td class=\"d-flex p-2\">\n" +
            "                                <a href=\"\"><img class=\"anhnho\"\n" +
            "                                                src=\""+listData[i].img+"\"" +
            "                                                alt=\"\"></a>\n" +
            "                                <a href=\"\" class=\"p-2\">"+listData[i].name+"</a>\n" +
            "                            </td>\n" +
            "                            <td>"+listData[i].price+"đ</td>\n" +
            "                            <td>"+listData[i].amount+"</td>\n" +
            "                            <td>0</td>\n" +
            "                            <td>"+listData[i].price+"đ</td>\n" +
            "                        </tr>";
    }
    content+="<tr class=\"mathang\">\n" +
        "                            <td class=\"d-flex p-2\">\n" +
        "                                <a href=\"\" class=\"p-2\">Tổng tiền </a>\n" +
        "                            </td>\n" +
        "                            <td></td>\n" +
        "                            <td></td>\n" +
        "                            <td></td>\n" +
        "                            <td>"+total+"đ</td>\n" +
        "                        </tr>";
    for(var i=0;i<details.length;i++)
    {
        detailsTable.append("<tr>\n" +
            "                            <td>"+details[i].date+"</td>\n" +
            "                            <td>"+details[i].content+"</td>\n" +
            "                        </tr>")
    }
    loadLine(parseInt(status));
    root.innerHTML=content;
}
else
{
    content="Có vẻ bạn không có quyền xem đơn hàng này.Vui lòng đăng nhập hoặc đổi tài khoản khác";
    root=document.getElementsByClassName("container");
    document.getElementsByClassName("row")[1].remove();
    root[0].innerHTML=content;
};
function loadLine(status) {
    var circle=$(".circle");
    for (var i=status+1;i<3;i++)
    {
        circle.eq(i).css("background-color","white");
    }
    if(status===4)
    {
        $("#line").css("background","red");
        circle.eq(3).find("div").text("Đơn hàng đã bị hủy");
        circle.eq(2).find("div").text("");
        circle.eq(1).find("div").text("");
        circle.css("border","3px solid red");
        circle.css("background-color","red");
        $(".popupSpan").css("color","red");
    }
}
