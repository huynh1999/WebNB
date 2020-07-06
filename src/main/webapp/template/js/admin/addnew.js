function uploadBrand(data) {
    var root = document.getElementById("categoryCode");
    var options="";
    for (var i = 1; i < data.length; i++)
    {
        options+="<option value='"+data[i]+"'>"+data[i]+"</option>";
    }
    root.innerHTML=options;
}
async function doWork() {
    if (window.location.search === "?addsuccess")
    {
        alert("Thêm sản phẩm thành công");
    }
    if (window.location.search === "?addfail")
    {
        alert("Thêm sản phẩm thất bại");
    }
    $("#btnAdd").click(function (e) {
        e.preventDefault();
        var sizeText=JSON.stringify({
            XL:$("#XL").text(),
            '2XL':$("#2XL").text(),
            XS:$("#XS").text(),
            L:$("#L").text(),
            S:$("#S").text(),
            M:$("#M").text(),
        });
        $("#sizeText").val(sizeText);
        $("#formSubmit").submit();
    });
    await axios.get("/admin/api/getCategory").then(re=>{uploadBrand(re.data.split("|"))});
    $('#categoryCode').multiselect({
        includeSelectAllOption: true
    });
    //validate price
    $('b').css('margin-top','0px');
    $("#price").on("keyup",function(e){
        $(this).val($(this).val().replace(/\D/g,""))
    });
    //validate size
    $("[contenteditable=true]").on("input",function () {
        $(this).text($(this).text().replace(/\D/,""));
        if($(this).text()==="")
        {
            $(this).text(0);
        }
    });
}
doWork();