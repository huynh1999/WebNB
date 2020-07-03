var data;
var root;
var max=25;
var now=0;
root=$("#list");
function upload()
{
    for(var i=now;i<max;i++)
    {
        root.append("<div class=\"motanh\">\n" +
            "                                    <img class='img-in-list' src=\""+data[i].link+"\" alt=\"\" onerror=\"errorLoadImg.call(this)\">\n" +
            "                                    <p>"+data[i].link+"</p>\n" +
            "                                </div>");
    }
    now=max;
}
function errorLoadImg()
{
    this.onerror=null;
    this.src="/template/img/sportswear-t-shirt-w9CHRW2020-06-01T14-01-10-704.jpg";
}
window.addEventListener("scroll", function(){
    var maxY;
    if(window.scrollMaxY!==undefined){maxY=window.scrollMaxY}
    else maxY=document.documentElement.scrollHeight;
    if(maxY-scrollY<2500&&max===now&&max<data.length){
        if(max+12>data.length){
            max=data.length;
            document.getElementById("loadingGif").innerHTML="";
        }
        else max+=25;
        timer=setInterval(function () {
            if(document.getElementsByClassName("img-in-list")[now-1].complete)
            {
                upload();
                clearInterval(timer);
            }
        },500)
    }
});
function doWork() {
    console.log("test");
    axios.get("/admin/api/getAllImg")
        .then(re=>{data=re.data;upload()})
        .catch(error=>{root.html("Đã có lỗi xảy ra")});
}
doWork();