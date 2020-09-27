window.draw_graph = -> 

    ctx = document.getElementById("myChart").getContext('2d')
    barNum = gon.records
    weightmax = gon.weight.max
    
    labels = new Array(barNum)
    bgColors = new Array(barNum)
    bdColors = new Array(barNum)
    for i in [0...barNum]
        bgColors[i] = 'rgba(75, 192, 192, 0)'
        bdColors[i] = 'rgba(75, 192, 192, 1)'
    myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: gon.date
            datasets: [{
                label: '食事量',
                data:gon.food_amount
                pointBackgroundColor: "rgba(54,164,235,0.8)",
                borderColor: "rgba(54,164,235,0.8)",
                fill: false
                lineTension: 0
                borderWidth: 3
                yAxisID: "y-axis-1",
            }
            {
                type:"line"
                label: '体重',
                data: gon.weight, 
                backgroundColor: "rgba(254,97,132,0.1)",
                borderColor: "rgba(254,97,132,0.5)",
                fill: false
                lineTension: 0
                borderWidth: 3
                yAxisID: "y-axis-2",
            }
            
            ]

        },
        
        options: {
            scales: {
                    xAxes: [{
                        type: 'time',
                        time: {
                            unit: 'month'
                        }
                    ticks: {
                        min:gon.datemin,
                        max:gon.datemax,
                    }
                    }]
                
                
                yAxes: [{
                    id: "y-axis-1",
                    position: "left",
                    ticks: {
                        min:gon.food_amountmin,
                        max:gon.food_amountmax,
                    }
                    scaleLabel: {
                        display: true, 
                        labelString: "食事量 [g]",
                    }
                },{
                    id: "y-axis-2",
                    position: "right",
                    ticks: {
                        min:gon.weightmin
                        max:gon.weightmax,
                    }
                    scaleLabel: {
                        display: true, 
                        labelString: "体重 [g]",
                    }
                    gridLines: { 
                        drawOnChartArea: false, 
                    },
                }],
            }
        }
    })