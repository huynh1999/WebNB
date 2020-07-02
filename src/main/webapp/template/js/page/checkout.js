if(window.location.search==="?error")
{
    if(localStorage.getItem("tmp")!==null)
    {
        localStorage.setItem("cart_item",localStorage.getItem("tmp"));
        localStorage.removeItem("tmp");
        alert("Đã có lỗi khi đặt hàng.Vui lòng thử lại");
    }
}
else {
    localStorage.removeItem("tmp");
}
var listItem=JSON.parse(localStorage.getItem("cart_item"));
if(listItem===null)listItem=[];
var root=document.getElementById("root");
//Load Data Default
async function LoadData() {
    for(var i=0;i<listItem.length;i++)
    {
        var data=listItem[i];
        await axios.get("/api/product/"+data.id).then(re=>{
            ShowData(i+1,re.data)
        })
    }
}
function ShowData(index,data) {
    $(root).append("<tr class=\"mathang\">\n" +
        "                            <th scope=\"row\">"+index+"</th>\n" +
        "                            <td><img class=\"anhsanpham thugon\"\n" +
        "                                    src=\""+data.url1+"\"\n" +
        "                                    alt=\"anh sp\"></td>\n" +
        "                            <td>\n" +
        "                               <input class='idproduct' value='"+data.id+"' hidden> " +
        "                               <input class='sizedata' value='"+data.size+"' hidden>"+
        "                                <h6>"+data.name+"</h6>\n" +
        "                                <div class=\"form-group mycustomformgroup\">\n" +
        "                                    <div class=\"mycustomformgroup_c1\">\n" +
        "                                        <label class=\"lbsize\" for=\"size\">Size</label>\n" +
        "                                    </div>\n" +
        "                                    <div class=\"mycustomformgroup_c2\">\n" +
        "                                        <select class=\"form-control mycustomselect\" name=\"size\" >\n" +
        "                                        </select>\n" +
        "                                    </div>\n" +
        "                                </div>\n" +
        "                                <div class=\"form-group mycustomformgroup\">\n" +
        "                                    <div class=\"mycustomformgroup_c1\">\n" +
        "                                        <label class=\"lbsoluong\" >Số lượng</label>\n" +
        "                                    </div>\n" +
        "                                    <div class=\"mycustomformgroup_c2\">\n" +
        "                                        <select class=\"form-control mycustomselect mycustomselectsl\" name=\"amount\">\n" +
        "                                        </select>\n" +
        "                                    </div>\n" +
        "\n" +
        "                                </div>\n" +
        "                                <button type=\"button\" class=\"btn btn-danger deleteBtn\">Xóa</button>\n" +
        "                            </td>\n" +
        "                            <td>\n" +
        "                                <p class=\"gia\">"+data.price+"</p>\n" +
        "                            </td>\n" +
        "                        </tr>");
    SetSizeProductHave(data.size);
}
function SetSizeProductHave(data) {
    var changeElement=$('tr').last();
    var datatmp=JSON.parse(data);
    var sizeHtml="";
    if(datatmp.S>0)sizeHtml+="<option value='S'>S</option>";
    if(datatmp.XL>0)sizeHtml+="<option value='XL'>XL</option>";
    if(datatmp.XS>0)sizeHtml+="<option value='XS'>XS</option>";
    if(datatmp["2XL"]>0)sizeHtml+="<option value='2XL'>2XL</option>";
    if(datatmp.M>0)sizeHtml+="<option value='M'>M</option>";
    if(datatmp.L>0)sizeHtml+="<option value='L'>L</option>";
    changeElement.find('[name=size]').html(sizeHtml);
}
function SetAmountProductHave(data,element) {
    var amountHtml="<option selected value='1'>1</option>";
    var max;
    if(data>10)max=10;
    else max=data;
    for(var i=1;i<max;i++)
    {
        amountHtml+="<option value='"+(i+1)+"'>"+(i+1)+"</option>"
    }
    element.innerHTML=amountHtml;
}
//delete Data
function deleteItemCart(id,index) {console.log(index)
    listItem=JSON.parse(localStorage.getItem("cart_item"));
    listItem= $.grep(listItem, function(e){
        return e.id != id;
    });
    console.log(listItem)
    localStorage.setItem("cart_item",JSON.stringify(listItem));
    $("th").each(function () {
        var indexid=parseInt(index);
        var indexnow=parseInt($(this).text());
        if(indexid<indexnow){$(this).text(--indexnow)};
    })
}
//Add event listener when change size and amount
function ChangeSize(selectElement)
{
    selectElement.addEventListener("change",function(){
        var dataSize=JSON.parse($(this).parents("tr").find(".sizedata").val());
        var idproduct=$(this).parents("tr").find("input[hidden]").val();
        var maxAmount;
        var option=$(this).find("option");
        for(var i=0;i<option.length;i++){
            if(option[i].selected){
                maxAmount=dataSize[option[i].value];
                SetAmountProductHave(maxAmount,$(this).parents("tr").find("select[name=amount]")[0]);
                var listItem=JSON.parse(localStorage.getItem("cart_item"));
                listItem.find(e=>e.id==idproduct).size=option[i].value;
                listItem.find(e=>e.id==idproduct).amount=1;
                localStorage.setItem("cart_item",JSON.stringify(listItem));
            }
        }
    })
}
function ChangeAmount(selectElement) {
    selectElement.addEventListener("change",function () {
        var idproduct=$(this).parents("tr").find("input[hidden]").val();
        var option=$(this).find("option");
        for(var i=0;i<option.length;i++){
            if(option[i].selected){
                var listItem=JSON.parse(localStorage.getItem("cart_item"));
                listItem.find(e=>e.id==idproduct).amount=parseInt(option[i].value);
                localStorage.setItem("cart_item",JSON.stringify(listItem));
            }
        }
        SetTotalPrice();
    })
}
function SetSizeAndAmountEventChange()
{
    var sizeSelect=$("select[name=size]");
    var amountSelect=$("select[name=amount]");
    for(var i=0;i<sizeSelect.length;i++)
    {
        ChangeSize(sizeSelect[i]);
        ChangeAmount(amountSelect[i]);
    }
}
function SetDefaultValue()
{
    var row=document.getElementsByClassName("mathang");
    for(var i=0;i<row.length;i++)
    {
        var maxAmount;
        var selectedSizeValue;
        var dataSize=JSON.parse($(row[i]).find(".sizedata").val());
        var sizeElement=$(row[i]).find("select[name=size]").find("option");
        var listItem=JSON.parse(localStorage.getItem("cart_item"));
        var sizeInfo=listItem[i].size;
        var index=listItem[i].amount-1;
        for(var j=0;i<sizeElement.length;j++)
        {
            if(sizeElement[j].value===sizeInfo){
                sizeElement[j].setAttribute("selected","selected");
                //lấy sl của size
                selectedSizeValue=sizeElement[j].value;
                maxAmount=dataSize[selectedSizeValue];
                SetAmountProductHave(maxAmount,$(row[i]).find("select[name=amount]")[0]);
                break;
            }
        }
        var amount=$(row[i]).find("select[name=amount]").find("option");
        if(maxAmount>=listItem[i].amount){
            amount[index].setAttribute("selected","selected");
        }
        else{
            var idProduct=$(row[i]).find(".idproduct").val();
            var listItem=JSON.parse(localStorage.getItem("cart_item"));
            listItem.find(e=>e.id==idProduct).amount=maxAmount;
            localStorage.setItem("cart_item",JSON.stringify(listItem));
            amount[maxAmount-1].setAttribute("selected","selected");
        }
    }
}

//hàm cập nhật giá
function SetTotalPrice()
{
    listItem=JSON.parse(localStorage.getItem("cart_item"));
    var element=document.getElementById("tong");
    var total=0;
    for(var i=0;i<listItem.length;i++)
    {
        total+=parseInt(listItem[i].amount)*parseInt(listItem[i].price);
    }
    element.innerText=total+"đ";
}
function CheckOut()
{
    $("#checkout").submit(function () {
        $("input[name=content]").attr("value",localStorage.getItem("cart_item"));
        localStorage.setItem("tmp",localStorage.getItem("cart_item"));
        localStorage.removeItem("cart_item");
        return true;
    })
}
async function doWork() {
    await LoadData();
    $(".deleteBtn").click(function()
    {
        var index=$(this).parents("tr").find("th").text();
        var idproduct=$(this).parents("tr").find("input.idproduct").val();
        $(this).parents("tr").remove();
        deleteItemCart(idproduct,index);
    });
    $(".btn_thanhtoan").click(function (e) {
        if(listItem.length!==0){
            e.preventDefault();
            $('#ModalOfCheckout').modal('show');
        }
    });
    SetSizeAndAmountEventChange();
    SetDefaultValue();
    SetTotalPrice();
    CheckOut();
    console.log("test");
}
doWork();
