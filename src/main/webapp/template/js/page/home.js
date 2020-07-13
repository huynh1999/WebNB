
var input = document.querySelector('.pswrd');
var show = document.querySelector('.show');
show.addEventListener('click', active);

function active() {
    if (input.type === "password") {
        input.type = "text";
        show.style.color = "#1DA1F2";
    } else {
        input.type = "password";
        show.style.color = "#111";
    }
}
if(window.location.search==="?logoutSuccess")
{
    localStorage.removeItem("cart_item");
}
function fixPriceProduct() {
    $(".price").each(function () {
        $(this).text($(this).text().replace(/\D/g,"").replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,'));
    })
}
function doWork() {
    fixPriceProduct();
};
doWork();