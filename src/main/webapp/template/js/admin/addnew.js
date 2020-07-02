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
    await axios.get("/admin/api/getCategory").then(re=>{uploadBrand(re.data.split("|"))});
    $('#categoryCode').multiselect({
        includeSelectAllOption: true
    });
    $('b').css('margin-top','0px');
}
doWork();