var dataAPI;
async function loadTypeAndCategory()
{
    //Data dropdown
    var nameTypeApi;
    await axios.get("/api/getTypeAndCategory").then(re=>{
        nameTypeApi=re.data;
    });
    var element=$("#listMenuType");
    element.html("");
    for(var i=0;i<nameTypeApi.length;i++)
    {
        var content="";
        for(var j=0;j<nameTypeApi[i].menuEntities.length;j++)
        {
            content+="<li>\n" +
                "                                                <a href=\"\">\n" +
                "                                                    <i class=\"menu-icon fa fa-caret-right\"></i>\n" +
                "                                                    "+nameTypeApi[i].menuEntities[j].nameMenu+"\n" +
                "                                                </a>\n" +
                "\n" +
                "                                                <b class=\"arrow\"></b>\n" +
                "                                            </li>"
        }
        if(content===""){
            content="<li>\n" +
                "                                                <a href=\"\">\n" +
                "                                                    <i class=\"menu-icon fa fa-caret-right\"></i>\n" +
                "                                                    \n" +
                "                                                </a>\n" +
                "\n" +
                "                                                <b class=\"arrow\"></b>\n" +
                "                                            </li>"
        }
        element.append("<li>\n" +
            "                                        <a href=\"#\" class=\"dropdown-toggle\">\n" +
            "                                            <i class=\"menu-icon fa fa-folder\"></i>\n" +
            "                                            <span class=\"menu-text\">"+nameTypeApi[i].nameType+" </span>\n" +
            "\n" +
            "                                            <b class=\"arrow fa fa-angle-down\"></b>\n" +
            "                                        </a>\n" +
            "                                        <b class=\"arrow\"></b>\n" +
            "\n" +
            "                                        <ul class=\"submenu\">"
        +content+"</ul>\n" +
            "                                    </li>");
    }
    await axios.get("/admin/api/getCategory").then(re=>{uploadCategory(re.data.split("|"))});
    uploadTypeMenu(nameTypeApi);
}
function uploadTypeMenu(data) {
    var element=document.getElementById("TypeMenuForm");
    var options="";
    for (var i = 0; i < data.length; i++)
    {
        options+="<option value='"+data[i].nameType+"'>"+data[i].nameType+"</option>";
    }
    element.innerHTML=options;
}
function uploadCategory(data) {
    var root = document.getElementById("CategoryCodeMenuForm");
    var options="";
    for (var i = 1; i < data.length; i++)
    {
        options+="<option value='"+data[i]+"'>"+data[i]+"</option>";
    }
    root.innerHTML=options;
}
function EventLoad()
{
    $("#btn_addtype").click(async function () {
        await axios.post("/admin/api/addType",{
            name:$("#nametype").val()
        }).then(re=>{
            if(re.data==="ok"){
                alert("Thêm type mới thành công");
                $("#nametype").val("");
                loadTypeAndCategory();
            }
            else {alert("Đã có lỗi xảy ra")}
        }).catch(er=>{alert("Đã có lỗi xảy ra")});
    });
    $("#btn_addCategoryCode").click(async function () {
        await axios.post("/admin/api/addCategoryCode",{
            code:$("#addCategoryCode").val()
        }).then(re=>{
            if(re.data==="ok"){
                alert("Thêm CategoryCode mới thành công");
                $("#addCategoryCode").val("");
            }
            else {alert("Đã có lỗi xảy ra")}
        }).catch(er=>{alert("Đã có lỗi xảy ra")});
    })
    $("#btn_addMenu").click(async function () {
        await axios.post("/admin/api/addCategoryToType",{
            categoryCode:$("#CategoryCodeMenuForm").val(),
            categoryMenu:$("#nameMenu").val(),
            nameType:$("#TypeMenuForm").val()
        }).then(re=>{
            if(re.data==="ok"){
                alert("Thêm Menu Thành Công")
            }
            else {
                alert("Có lỗi xảy ra");
            }
        }).catch(er=>alert("Có lỗi xảy ra"))
    })
    $("#deleteBtn").click(async function () {
        if ($('#radio2').is(':checked')){
            await axios.delete("/admin/api/deleteMenu",{data:{nameType:$("#typeOfDelete option:selected").val(),nameCate:$("#categoryOfDelete option:selected").val()}}).then(re=>{
                if(re.data==="ok"){alert("Xóa thành công Menu");location.reload()}
                else alert("Lỗi khi xóa");
            });
        }
        else {
            await axios.delete("/admin/api/deleteType",{data:{name:$("#typeOfDelete option:selected").val()}}).then(re=>{
                if(re.data==="ok"){alert("Xóa thành công");uploadDeleteContent()}
                else alert("Lỗi khi xóa");
            });
        }

    });
}
async function uploadDeleteContent()
{
    var nameTypeApi;
    await axios.get("/api/getTypeAndCategory").then(re=>{
        nameTypeApi=re.data;
        dataAPI=nameTypeApi;
    });
    var content="";
    var elementType=document.getElementById("typeOfDelete");
    for(var i=0;i<nameTypeApi.length;i++)
    {
        content+="<option value='"+nameTypeApi[i].nameType+"'>"+nameTypeApi[i].nameType+"</option>"
    }
    elementType.innerHTML=content;
}
function uploadDeleteCategory()
{
    var elementCategory=document.getElementById("categoryOfDelete");
    var content="",dataCate;
    var typeNow=$("#typeOfDelete option:selected").val();
    dataCate=dataAPI.find(e=>e.nameType===typeNow);
    for(var i=0;i<dataCate.menuEntities.length;i++)
    {
        content+="<option value='"+dataCate.menuEntities[i].nameCategory+"'>"+dataCate.menuEntities[i].nameMenu+"</option>";
    }
    elementCategory.innerHTML=content;
}

async function doWork()
{
    await uploadDeleteContent();
    $("#xoatypecate").on("change",function () {
        if ($('#radio2').is(':checked')) {
            $(".del-cate").show();
            console.log("true");
        } else if (!($('#radio2').is(':checked'))) {
            $(".del-cate").hide();
            console.log("false");
        }
    });
    uploadDeleteCategory();
    $("#typeOfDelete").on("change",function () {
        uploadDeleteCategory();
    });

    loadTypeAndCategory();
    EventLoad();
    //upload cate theo type;
    console.log("test");
}
doWork();
