function SetupDefault()
{
    $(".loginclick").click(function () {
        event.preventDefault();
        $("#btshowlog").click();
    })
    $("#signuplink").click(function () {
        event.preventDefault();
        $("#btshowlogsignup").click();
    })
    if ($("a.logintextsc").text() != "Login") {
        $("a.logintextsc").addClass("dropdown-toggle");

        $("a.logintextsc").mouseenter(function () {
            $(".hidemydropdown").show();
        })
        $("a.logintextsc").mouseleave(function () {
            $(".hidemydropdown").mouseleave(function () {
                $(".hidemydropdown").hide();
            })
        })
    }
    //Check Username when Login
    async function apiUsername() {
        var redata="";
        var userName=$("[name=username]").val();
        await axios.post("/api/checkUsername",{
            username:userName
        }).then(re=>{
            redata=re.data;
        });
        return redata==="ok";
    }
    async function CheckUserName() {
        var t=await apiUsername();
        console.log(t);
        if(!t){
            $("#error-alert-register").show();
        }
        else {
            $("#error-alert-register").hide();
        }
    }
    $("#form_register").on('submit',async function (e) {
        e.preventDefault();
        var t=await apiUsername();
        if(t)
        {
            $("#form_register")[0].submit();
        }
    });
    $("[name=username]").change(function () {
        CheckUserName();
    });
    //Set value input in order to get css label login and register
    $("input").keyup(function () {
        $(this).attr("value",$(this).val());
    });
}
function HtmlMenuType(dataType)
{
    var html="<li class=\"menu_item\" id='type"+dataType.id+"' role=\"listitem\">" +
        "          <div class=\"list_down\">\n" +
        "              <a href=\"#\">"+dataType.nameType+"</a>\n" +
        "              <div class=\"dropdown_content\">\n" +
        "              </div>\n" +
        "          </div>\n" +
        "   </li>";
    $("ul.menu_list").append(html);
}
async function LoadMenu()
{
    var dataMenuApi;
    await axios.get("/api/getTypeAndCategory").then(re=>dataMenuApi=re.data);
    for(var i=0;i<dataMenuApi.length;i++)
    {
        var id="#type"+dataMenuApi[i].id;
        HtmlMenuType(dataMenuApi[i]);
        var contentMenu="";
        for(var j=0;j<dataMenuApi[i].menuEntities.length;j++)
        {
            contentMenu+="<a class=\"sm_item\" href=\"/category/"+dataMenuApi[i].menuEntities[j].nameCategory+"\">"+dataMenuApi[i].menuEntities[j].nameMenu+"</a>";
        }
        $(id).find("div.dropdown_content").append(contentMenu);
    }
}
$(document).ready(function () {
    $("#input1").keyup(function(e){
        if(e.keyCode == 13)
        {
            $(".search").submit();
        }
    });
    SetupDefault();
    LoadMenu();
    console.log("test");
});