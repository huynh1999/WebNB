var dataAPI;
var dataBill=[];
var dataDay=[];
var myChart=null;
$("#btn_search").click(function () {
    var month=parseInt($("[name=month] option:selected").val());
    var year=parseInt($("[name=year] option:selected").val());
    if(myChart!==null)myChart.destroy();
    axios.get("/admin/api/dataBillMonth/"+month+"/"+year).then(re=>{
        dataAPI=re.data;
        dataDay=getDaysInMonth(month,year);
        dataAPI.forEach(element => {
            var tmp=new Date(element.date);
            dataBill[tmp.getDate()-1]=element.money;
        });
        try{
            renderChart(dataBill,dataDay);
        }
        catch (e) {

        }
    });
});
console.log("test");
function renderChart(data, labels) {
    var ctx = document.getElementById("myChart").getContext('2d');
    myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'This month',
                data: data,
                borderColor: 'rgba(75, 192, 192, 1)',
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
            }]
        },
        options: {
            responsive:true,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true,
                        callback: function(value, index, values) {
                            return float2vnd(value);
                        }
                    }
                }]
            }
        },
    });
}
function float2vnd(value){
    return value.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
}
function getDaysInMonth(month, year) {
    var date = new Date(year, month-1, 1);
    var days = [];
    dataBill=[];
    while (date.getMonth() === month-1) {
        days.push(date.getDate()+"/"+(date.getMonth()+1)+"/"+date.getFullYear());
        dataBill.push(0);
        date.setDate(date.getDate() + 1);
    }
    return days;
}