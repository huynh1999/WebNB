var content;
var idproduct=parseInt(location.href.split("/")[4]);
var btnadd=document.getElementById("add_cart");
var url="/api/content/"+idproduct;
var listSize=document.getElementsByName("optradio");
function addCart() {
    var listItem=[];
    var item={
        id:idproduct,
        amount:1,
        size:"S",
        price:parseInt(document.getElementById("price").innerText.replace(/,/g,""))
    };
    for(var i=0;i<listSize.length;i++)
    {
        if(listSize[i].checked===true){item.size=listSize[i].value};
    }
    if(localStorage.getItem("cart_item")==="null"||localStorage.getItem("cart_item")===null)
    {
        listItem.push(item);
        localStorage.setItem("cart_item",JSON.stringify(listItem));
    }
    else
    {
        listItem=JSON.parse(localStorage.getItem("cart_item"));
        if(listItem.find(e=>e.id==idproduct))
        {
            listItem.find(e=>e.id==idproduct).size=item.size;
            localStorage.setItem("cart_item",JSON.stringify(listItem));
            return;
        }
        listItem.push(item);
        localStorage.setItem("cart_item",JSON.stringify(listItem));
    }
}
function uploadContent() {
    var root=document.getElementById("des");
    var des=Array.isArray(content.des)?content.des[0]:content.des;
    root.innerText=des.replace(". ","\n");
    var img=document.getElementById("lsimg");
    var htmlImg="";
    for(var i=0;i<content.img.length;i++)
    {
        htmlImg+=" <img\n" +
            "            src=\""+content.img[i]+"\"" +
            "            alt=\"\">"
    }
    img.innerHTML=htmlImg;
}
function uploadSize(data) {
    var root=document.getElementById("size");
    var body="";
    body+=HtmlRadioButton("XL",data.XL);
    body+=HtmlRadioButton("XS",data.XS);
    body+=HtmlRadioButton("L",data.L);
    body+=HtmlRadioButton("M",data.M);
    body+=HtmlRadioButton("S",data.S);
    body+=HtmlRadioButton("2XL",data["2XL"]);
    root.innerHTML=body;
}
function HtmlRadioButton(size,sl) {
    var re="";
    if(sl>0){
        re="<div class=\"form-check\">\n" +
            "            <label class=\"form-check-label\">\n" +
            "              <input type=\"radio\" checked class=\"form-check-input\" name=\"optradio\" value=\""+size+"\">"+size+"\n" +
            "            </label>\n" +
            "          </div>";
    }
    else re="<div class=\"form-check\">\n" +
        "            <label class=\"form-check-label\">\n" +
        "              <input type=\"radio\" disabled='true' class=\"form-check-input\" name=\"optradio\" value=\""+size+"\">"+size+"\n" +
        "            </label>\n" +
        "          </div>";
    return re;
}
async function uploadRecommendProduct() {
    var idProduct=window.location.pathname.split("/")[2];
    var recommendProduct;
    await axios.get("/api/getRecommendProduct/"+idProduct).then(re=>{
        recommendProduct=re.data;
    })
    var element=document.getElementById("recommendProduct");
    var content="";
    for(var i=0;i<recommendProduct.length;i++)
    {
        content+="<div class=\"col _1sanpham\" role=\"listitem\">"+
            "<a href=\"/product/"+recommendProduct[i].id+"\"><img alt=\"sanpham1\" class=\"anhsanpham\"\n" +
            "                        src=\""+recommendProduct[i].url1+"\"\n" +
            "                        alt=\"\"></a>\n" +
            "                <p>"+recommendProduct[i].name+"</p>"+
            "                <p>"+recommendProduct[i].price.replace("?","đ")+"</p></div>"
    }
    element.innerHTML=content;
}
function doWork() {
    axios.get(url).then(re=>{
        content=re.data;
        uploadContent();
    }).catch(er=>{
        var element=document.getElementById("root");
        element.innerText="Hiện không có sản phẩm này"
    });
    axios.get("/api/size/"+idproduct).then(
        re=>uploadSize(re.data)
    );
    $(btnadd).click(function () {
        addCart();
    });
    uploadRecommendProduct();
    console.log("test")
}
doWork();