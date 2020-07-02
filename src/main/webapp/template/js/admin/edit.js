var idproduct=window.location.pathname.split("/")[3];
function uploadCategory(data) {
    var root = document.getElementById("categoryCode");
    var options="";
    for (var i = 1; i < data.length; i++)
    {
        options+="<option value='"+data[i]+"'>"+data[i]+"</option>";
    }
    root.innerHTML=options;
}
function loadData(data)
{
    var content=JSON.parse(data.content);
    var listImg=content.img;
    var root=$("#list_img");
    for(var i=0;i<listImg.length;i++)
    {
        root.append("<div class=\"anhnhothanhphan\">\n" +
            "                                                <img src=\""+listImg[i]+"\" alt=\"\">\n" +
            "                                                <button type=\"button\" class=\"button-donganhnho\">x</button>\n" +
            "                                            </div>")
    }
    $("#name").val(data.name);
    $("#id").val(data.id);
    $("#price").val(data.price);
    $("#shortDescription").val(content.des);
    //Xữ lí category 
    axios.get('/admin/api/getCategory/'+idproduct).then(re=>{
        loadDefaultCategory(re.data);
    })
    
}
function loadDefaultCategory(data) {
    var optionElement=$('#categoryCode').find('option');
    for(var i=0;i<data.length;i++)
    {
        $.each(optionElement,function (index) {
            if($(this).val()===data[i].categoryName)
            {
                $(this).attr('selected','selected');
            }
        })
    }
    $('#categoryCode').multiselect({
        includeSelectAllOption: true
    });
    $('b').css('margin-top','0px');
}
function doWithImg()
{
    var listImgElement=$("#list_img");
    $("#img").on('keypress',function(e) {
        if(e.which == 13) {
            listImgElement.append("<div class=\"anhnhothanhphan\">\n" +
                "                                                <img src=\""+$(this).val()+"\" alt=\"\">\n" +
                "                                                <button type=\"button\" class=\"button-donganhnho\">x</button>\n" +
                "                                            </div>");
            $(this).val("");
        }
        $(".button-donganhnho").click(function () {
            $(this).parent("div").remove();
        })
    });
}
function submitButton()
{
    var cateCode=[];
    $('option:selected').each(function(){cateCode.push($(this).val())});
    var price=$('#price').val();
    var des=$('#shortDescription').val();
    var name=$('#name').val();
    var img=[];
    $('img').each(function () {
        img.push($(this).attr('src'));
    });
    var content={
        price:price,
        des:des,
        name:name,
        img:img,
    };
    axios.post('/admin/api/updateProduct',{
        id:window.location.pathname.split("/")[3],
        price:price,
        des:des,
        lsCate: cateCode,
        name:name,
        content:JSON.stringify(content)
    }).then(re=>{
        if(re.data==="ok"){
            alert("Cập nhật thành công")
        }
        else {alert("Cập nhật thất bại")}
    })
}
async function doWork() {
    await axios.get("/admin/api/getCategory").then(re=>{uploadCategory(re.data.split("|"))});
    await axios.get("/api/product/"+idproduct).then(re=>{
        loadData(re.data);
    });
    $(".button-donganhnho").click(function () {
        $(this).parent("div").remove();
    });
    doWithImg();
    $("#btnUpdate").click(function () {
        submitButton();
    });
    console.log("test");
}
doWork();