
//차트 생성
Chart.defaults.global.legend.display = false;
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: {
        labels: ['바지1', '바지2', '바지3', '바지4', '바지5'],
        datasets: [{
            label: '시장 점유율',
            data: [50, 30, 20, 10, 10],
			backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(0, 0, 0, 1)',
                'rgba(0, 0, 0, 1)',
                'rgba(0, 0, 0, 1)',
                'rgba(0, 0, 0, 1)'
            ],
            borderWidth: 1
        }]
    },
    
    options: {
        events: [],
        responsive: true,
        maintainAspectRatio : true,
        scales: {
            xAxes: [{
                ticks: {
					beginAtZero: true,
					callback: function(value, index, values) {
                        return value + '%';
                    }
                }
            }]
		}
    }
});

//클릭이벤트 핸들링
var colorArray = [
    {click:true, backgroundColor:'rgba(255, 99, 132, 0.2)', borderColor: 'rgba(255, 99, 132, 1)'},
    {click:false, backgroundColor:'rgba(54, 162, 235, 0.2)', borderColor: 'rgba(54, 162, 235, 1)'},
    {click:false, backgroundColor:'rgba(255, 206, 86, 0.2)', borderColor: 'rgba(255, 206, 86, 1)'},
    {click:false, backgroundColor:'rgba(75, 192, 192, 0.2)', borderColor: 'rgba(75, 192, 192, 1)'},
    {click:false, backgroundColor:'rgba(153, 102, 255, 0.2)', borderColor: 'rgba(153, 102, 255, 1)'}
]

document.getElementById("myChart").onclick = function(evt)
{   
    var activePoints = myChart.getElementsAtEvent(evt);

    if(activePoints.length > 0)
    {
     	var clickedElementindex = activePoints[0]["_index"];

     	//get specific label by index 
    	var label = myChart.data.labels[clickedElementindex];

    	//get value by index      
      	var value = myChart.data.datasets[0].data[clickedElementindex];

        //클릭 이벤트
        if(!(colorArray[clickedElementindex].click)){
            myChart.data.datasets[0].backgroundColor[clickedElementindex] = colorArray[clickedElementindex].backgroundColor;
            myChart.data.datasets[0].borderColor[clickedElementindex] = colorArray[clickedElementindex].borderColor;
            colorArray[clickedElementindex].click = true;
        }
        else{
            myChart.data.datasets[0].backgroundColor[clickedElementindex] = 'rgba(0, 0, 0, 0.2)';
            myChart.data.datasets[0].borderColor[clickedElementindex] = 'rgba(0, 0, 0, 1)';
            colorArray[clickedElementindex].click = false;
        }
		myChart.update();
   }
}