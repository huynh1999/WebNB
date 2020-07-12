var idBill=window.location.pathname.split("/")[3];
async function uploadContent()
{
    var data;
    await axios.get("/admin/api/getBillById/"+idBill).then(re=>{
        data=re.data;
    });
    $("#billCode").val(data.billEntity.billName);
    $("#payer").val(data.name);
    $("#payment").val(data.billEntity.paymentMethod);
    $("#phone").val(data.phone);
    $("#dateBuy").val(data.billEntity.createdDate);
    $("#email").val(data.email);
    var contentList="";
    var contentBill=JSON.parse(data.billEntity.content);
    for(var i=0;i<contentBill.length;i++)
    {
        contentList+=" <tr>\n" +
            "                                        <td>\n" +
            "                                            <div class=\"ttsanpham\">\n" +
            "                                                <div class=\"anhsp\">\n" +
            "                                                    <img src=\""+contentBill[i].img+"\"\n" +
            "                                                        alt=\"\">\n" +
            "                                                </div>\n" +
            "                                                <div class=\"tensp\">"+contentBill[i].name+"</div>\n" +
            "                                            </div>\n" +
            "\n" +
            "                                        </td>\n" +
            "                                        <td>"+contentBill[i].size+"</td>\n" +
            "                                        <td>"+contentBill[i].amount+"</td>\n" +
            "                                        <td>"+contentBill[i].price+"</td>\n" +
            "<input id='id' value='"+contentBill[i].id+"' hidden>"+
            "                                    </tr>"
    }
    contentList+="<tr>\n" +
        "                                        <th></th>\n" +
        "                                        <th></th>\n" +
        "                                        <th>Thành tiền</th>\n" +
        "                                        <th>"+data.billEntity.totalMoney+"</th>\n" +
        "                                    </tr>";
    $("#listP").append(contentList);
    if(data.billEntity.status>=3){
        $("#status").attr("disabled","disabled")
    }
    $("#status").find("option").eq(data.billEntity.status).attr("selected","selected");
    $("#status").on("change",function () {
        var t=false;
        if($(this).find("option:selected").val()>=3) {
            t = confirm("Bạn có chắc muốn thay đổi trạng thái.\nTrạng thái này sau khi thay đổi sẽ không thể hoàn lại.");
            if (!t) return;
        }
       axios.post("/admin/api/setStatus",{
           id:data.billEntity.id,
           status:$(this).find("option:selected").val()
       }).then(re=>{
           if(re.data==="ok")alert("Thay đổi trạng thái thành công.");
           else alert("Có lỗi khi thay đổi trạng thái");
           if(t)location.reload();
       })

    });

    console.log(data);
}
async function doWork() {
    uploadContent();
}
doWork();