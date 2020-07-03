
function uploadStatus()
{
    var content="<option value='0'>Đã tiếp nhận</option>"+
        "<option value='1'>Đã xác nhận đơn hàng</option>"+
        "<option value='2'>Đang vận chuyển</option>"+
        "<option value='3'>Giao hàng thành công</option>";
    document.getElementById("statusCode").innerHTML=content;
}
function uploadContent(data)
{
    var content="";
    for(var i=0;i<data.length;i++)
    {
        var statusContent;
        switch (data[i].status) {
            case 0:
                statusContent="Đã tiếp nhận";
                break;
            case 1:
                statusContent="Đã xác nhận đơn hàng";
                break;
            case 2:
                statusContent="Đang vận chuyển";
                break;
            case 3:
                statusContent="Giao hàng thành công";
                break;
        }
        content+="<tr>\n" +
            "                                                    <td>"+data[i].billName+"</td>\n" +
            "                                                    <td>"+data[i].createdBy+"</td>\n" +
            "                                                    <td>"+data[i].createdDate+"</td>\n" +
            "                                                    <td>\n" +statusContent+
            "                                                    </td>\n" +
            "                                                    <td>\n" +
            "                                                        <a class=\"btn btn-sm btn-primary btn-edit\" data-toggle=\"tooltip\"\n" +
            "                                                            title=\"Chi tiết hóa đơn\" href=\"/admin/bill/"+data[i].id+"\"><i\n" +
            "                                                                class=\"fa fa-pencil-square-o\" aria-hidden=\"true\"></i>\n" +
            "                                                        </a>\n" +
            "                                                    </td>\n" +
            "                                                </tr>";
    }
    $("tbody").html(content);
}
async function doWork() {
    uploadStatus();
    $("#btn_search").click(async function () {
        var data;
        await axios.get("/admin/api/getBillByStatus/"+$("#statusCode option:selected").val()).then(re=>{
            data=re.data;
        });
        uploadContent(data);
    })
}
doWork();