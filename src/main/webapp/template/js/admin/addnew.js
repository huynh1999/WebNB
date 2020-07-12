function uploadBrand(data) {
    var root = document.getElementById("categoryCode");
    var options="";
    for (var i = 1; i < data.length; i++)
    {
        options+="<option value='"+data[i]+"'>"+data[i]+"</option>";
    }
    root.innerHTML=options;
}
function loadInputImage(input)
{
    if (input.files) {
        var filesAmount = input.files.length;
        var element=$("#list_img");
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
async function doWork() {
    if (window.location.search === "?addsuccess")
    {
        alert("Thêm sản phẩm thành công");
    }
    if (window.location.search === "?addfail")
    {
        alert("Thêm sản phẩm thất bại");
    }
    //submit
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
    //multi select bootstrap
    await axios.get("/admin/api/getCategory").then(re=>{uploadBrand(re.data.split("|"))});
    $('#categoryCode').multiselect({
        includeSelectAllOption: true
    });
    $('b').css('margin-top','0px');
    //validate price
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
    //load Input Image
    $("#images").on("change",function () {
        loadInputImage(this);
    })
}
doWork();