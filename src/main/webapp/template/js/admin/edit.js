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
    $("#active").find("option").eq(data.active).attr("selected","selected");
    //load size
    var size=JSON.parse(data.size);
    $("[contenteditable=true]").each(function () {
        $(this).text(size[$(this).attr("id")]);
    });
    //validate size
    $("[contenteditable=true]").on("input",function () {
        $(this).text($(this).text().replace(/\D/,""));
        if($(this).text()==="")
        {
            $(this).text(0);
        }
    });
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
//xử lí ảnh
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
function loadInputImage(input)
{
    if (input.files) {
        var filesAmount = input.files.length;
        var element=$("#list_img_new");
        element.html("");
        for (i = 0; i < filesAmount; i++) {
            var reader = new FileReader();

            reader.onload = function(event) {
                element.append("<div class=\"anhnhothanhphan\">\n" +
                    "                          <img src=\""+event.target.result+"\" alt=\"\">\n" +
                    "                          </div>")
            };
            reader.readAsDataURL(input.files[i]);
        }
    }
}
function submitButton()
{
    var cateCode=[];
    $('#categoryCode option:selected').each(function(){cateCode.push($(this).val())});
    var price=$('#price').val();
    var des=$('#shortDescription').val();
    var name=$('#name').val();
    var active=$("#active option:selected").val();
    var sizeText=JSON.stringify({
        XL:$("#XL").text(),
        '2XL':$("#2XL").text(),
        XS:$("#XS").text(),
        L:$("#L").text(),
        S:$("#S").text(),
        M:$("#M").text(),
    });
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
        active:active,
        des:des,
        lsCate: cateCode,
        name:name,
        size:sizeText,
        content:JSON.stringify(content)
    }).then(re=>{
        if(re.data==="ok"){
            alert("Cập nhật thành công")
        }
        else {alert("Cập nhật thất bại")}
    });
    if($("#images")[0].files.length>0)
    {
       $("#id").val(window.location.pathname.split("/")[3]);
       $("#formSubmit").submit();
    }
}
async function doWork() {
    await axios.get("/admin/api/getCategory").then(re=>{uploadCategory(re.data.split("|"))});
    await axios.get("/admin/api/product/"+idproduct).then(re=>{
        loadData(re.data);
    });
    $(".button-donganhnho").click(function () {
        $(this).parent("div").remove();
    });
    doWithImg();
    $("#btnUpdate").click(function () {
        submitButton();
    });
    $("#price").on("keyup",function(e){
        $(this).val($(this).val().replace(/\D/g,""))
    });
    $("#images").on("change",function () {
        loadInputImage(this);
    });
    console.log("test");
}
doWork();