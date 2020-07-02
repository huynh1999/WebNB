var root=document.getElementById("show_alert");
var param=window.location.search;
switch (param) {
    case "?successRegister":
        root.innerHTML="<div class=\"alert alert-success\">\n" +
            "    <strong>Success!</strong> Đăng kí thành công.\n" +
            "  </div>";
        break;
    case "?errorRegister":
        root.innerHTML="<div class=\"alert alert-danger\">\n" +
            "    <strong>Error!</strong> Đăng kí thất bại.Vui lòng thử lại sau.\n" +
            "  </div>";
        break;
    case "?incorrectAccount":
        root.innerHTML="<div class=\"alert alert-danger\">\n" +
            "    <strong>Error!</strong> Đăng nhập thất bại.Vui lòng thử lại sau.\n" +
            "  </div>";
        break;
}
console.log("test");