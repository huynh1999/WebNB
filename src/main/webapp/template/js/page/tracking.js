var root=document.getElementById("root");
var detailsTable=$("#detail-table");

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
    root.innerHTML=content;
}
else
{
    content="Có vẻ bạn không có quyền xem đơn hàng này.Vui lòng đăng nhập hoặc đổi tài khoản khác";
    root=document.getElementsByClassName("container");
    document.getElementsByClassName("row")[1].remove();
    root[0].innerHTML=content;
};
