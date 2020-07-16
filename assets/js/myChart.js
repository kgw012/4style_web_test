
// Chart.defaults.global.legend.display = false;

/* myChart (1-2에 구현된 그래프) */

    //차트 생성
    
    if(document.getElementById('myChart') != null){
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
                        'darkgrey',
                        'darkgrey',
                        'darkgrey',
                        'darkgrey'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'black',
                        'black',
                        'black',
                        'black'
                    ],
                    borderWidth: 1,
                }]
            },
            
            options: {
                //hover이벤트 핸들링
                tooltips: { enabled: false },   //툴팁없애기
                onHover: function(evt, elements)
                {   
                    $("#myChart").css("cursor", elements[0] ? "pointer" : "default");   //포인터모양 바꾸기
                },
                legend: {display: false},

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
                    myChart.data.datasets[0].backgroundColor[clickedElementindex] = "darkgrey";
                    myChart.data.datasets[0].borderColor[clickedElementindex] = "black";
                    colorArray[clickedElementindex].click = false;
                }
                myChart.update();
            }
        }
    }
    


/* myChart2(3-1에 구현된 그래프) */

    if(document.getElementById('myChart2') != null){
        var ctx2 = document.getElementById('myChart2').getContext('2d');
        var myChart2 = new Chart(ctx2, {
            type: 'horizontalBar',
            data: {
                labels: ['캐쥬얼', '힙합', '스트릿', '빈티지', '댄디'],
                datasets: [{
                    label: '시장 점유율',
                    data: [50, 30, 20, 10, 10],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'darkgrey',
                        'darkgrey',
                        'darkgrey',
                        'darkgrey'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'black',
                        'black',
                        'black',
                        'black'
                    ],
                    borderWidth: 1,
                }]
            },
            
            options: {
                //hover이벤트 핸들링
                tooltips: { enabled: false },   //툴팁없애기
                onHover: function(evt, elements)
                {   
                    $("#myChart2").css("cursor", elements[0] ? "pointer" : "default");   //포인터모양 바꾸기
                },
                legend: {display: false},
    
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
        var colorArray2 = [
            {click:true, backgroundColor:'rgba(255, 99, 132, 0.2)', borderColor: 'rgba(255, 99, 132, 1)'},
            {click:false, backgroundColor:'rgba(54, 162, 235, 0.2)', borderColor: 'rgba(54, 162, 235, 1)'},
            {click:false, backgroundColor:'rgba(255, 206, 86, 0.2)', borderColor: 'rgba(255, 206, 86, 1)'},
            {click:false, backgroundColor:'rgba(75, 192, 192, 0.2)', borderColor: 'rgba(75, 192, 192, 1)'},
            {click:false, backgroundColor:'rgba(153, 102, 255, 0.2)', borderColor: 'rgba(153, 102, 255, 1)'}
        ]
    
        document.getElementById("myChart2").onclick = function(evt)
        {   
            var activePoints = myChart2.getElementsAtEvent(evt);
    
            if(activePoints.length > 0)
            {
                var clickedElementindex = activePoints[0]["_index"];
    
                //get specific label by index 
                var label = myChart2.data.labels[clickedElementindex];
    
                //get value by index      
                var value = myChart2.data.datasets[0].data[clickedElementindex];
    
                //클릭 이벤트
                if(!(colorArray2[clickedElementindex].click)){
                    myChart2.data.datasets[0].backgroundColor[clickedElementindex] = colorArray2[clickedElementindex].backgroundColor;
                    myChart2.data.datasets[0].borderColor[clickedElementindex] = colorArray2[clickedElementindex].borderColor;
                    colorArray2[clickedElementindex].click = true;
                }
                else{
                    myChart2.data.datasets[0].backgroundColor[clickedElementindex] = "darkgrey";
                    myChart2.data.datasets[0].borderColor[clickedElementindex] = "black";
                    colorArray2[clickedElementindex].click = false;
                }
                myChart2.update();
            }
        }
    }
    