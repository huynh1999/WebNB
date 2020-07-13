function uploadCategory(data) {
    var root = document.getElementById("categoryCode");
    var options="";
    for (var i = 1; i < data.length; i++)
    {
        options+="<option value='"+data[i]+"'>"+data[i]+"</option>";
    }
    root.innerHTML=options;
}
function uploadDataAfterSearch(data)
{
    var root=$("#bodyList");
    root.html("");

    for(var i=0;i<data.length;i++)
    {
        var statusContent="";
        if(data[i].active===1)
        {
            statusContent="<td style='color: #0be192;font-weight: bold;'>"+data[i].id+"</td>"
        }
        else {
            statusContent="<td style='color: red;font-weight: bold;'>"+data[i].id+"</td>"
        }
        root.append("<tr>\n" +
            statusContent+
            "                                                    <td>"+data[i].name+"</td>\n" +
            "                                                    <td>"+JSON.parse(data[i].content).des+"</td>\n" +
            "                                                    <td>\n" +
            "                                                        <a class=\"btn btn-sm btn-primary btn-edit\" data-toggle=\"tooltip\"\n" +
            "                                                            title=\"Cập nhật sản phẩm\" href=\"/admin/editProduct/"+data[i].id+"\"><i\n" +
            "                                                                class=\"fa fa-pencil-square-o\" aria-hidden=\"true\"></i>\n" +
            "                                                        </a>\n" +
            "                                                    </td>\n" +
            "                                                </tr>")
    }
}
async function doWork() {
    await axios.get("/admin/api/getCategory").then(re=>{uploadCategory(re.data.split("|"))});
    $("#btn_search").click(function () {
        axios.get("/admin/api/category/"+$("select").val()).then(re=>{
            uploadDataAfterSearch(re.data);
        })
    })
    console.log("test");
}
doWork();