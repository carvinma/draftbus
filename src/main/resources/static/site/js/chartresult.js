$(function () {
    //getchart("chart1");
    getData();
    function getData() {
        var ids = $("#hidRecordIds").val();
        $.ajax({
            type: "POST",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/api/getCompareData", // 请求发送到TestServlet处
            data: {
                ids:ids
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                if (data.code == 0) {
                    setchart("chart1",data.data1.dataset,data.data1.types,"Total cost (US$)");
                    setchart2("chart2",data.data2.dataset,data.data2.types,"Total emissions (tonne)");
                    setchart("chart3",data.data3.dataset,data.data3.types,"Lifetime social costs avoided (US$)");
                    //getchart("chart1",data.data1.legendData,data.data1.categoryData,data.data1.data);
                    //getchart("chart2",data.data2.legendData,data.data2.categoryData,data.data2.data);
                    //getchart3("chart3",data.data3.legendData,data.data3.categoryData,data.data3.data);
                    setchart("chart4",data.data4.dataset,data.data4.types,"Total emissions (tonne)");
                }
            }
        });
    }

    function getchart2(chartName,legendData,categoryData,data) {
        var myChart = echarts.init(document.getElementById(chartName));
        var option;
        option = {
            title : {
                text: '',
                subtext: ''
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:legendData  //fields
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : categoryData //name
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel:{formatter:'{value}US$/tonne'}
                }
            ],
            series : data
        };

        myChart.setOption(option);
    }

    function getchart(chartName,legendData,categoryData,data) {
        var myChart = echarts.init(document.getElementById(chartName));
        var option;
        option = {
            title : {
                text: '',
                subtext: ''
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:legendData  //fields
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : categoryData //name
                }
            ],
            yAxis : [
                {
                    type : 'value'

                }
            ],
            grid:{
                top:'100px;'
            },
            series : data
        };

        myChart.setOption(option);
    }
    
    function getchart1111(chartName) {
        var myChart = echarts.init(document.getElementById(chartName));
        var option;
        option = {
            title : {
                text: '',
                subtext: ''
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['蒸发量','降水量']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'蒸发量',
                    type:'bar',
                    data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                },
                {
                    name:'降水量',
                    type:'bar',
                    data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
                    markPoint : {
                        data : [
                            {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183, symbolSize:18},
                            {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name : '平均值'}
                        ]
                    }
                }
            ]
        };

        myChart.setOption(option);
    }


    function getchart3(chartName,legendData,categoryData,data) {
        var myChart = echarts.init(document.getElementById(chartName));
        var option;
        option = {
            title : {
                text: '',
                subtext: ''
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:legendData  //fields
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : categoryData //name
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    //name:'US$/tonne'
                    axisLabel:{formatter:'{value}($/tonne)'}
                }
            ],
            grid:{
                left:'160px'
            },
            series : data
        };

        myChart.setOption(option);
    }

    function setchart(chartName,dataset,types,yTitle){
        var myChart = echarts.init(document.getElementById(chartName));
        option = {
            legend: {},
            tooltip: {},
            dataset:dataset,
            xAxis: {type: 'category'},
            yAxis: {name: yTitle,type: 'value',nameLocation:'center', nameGap:140,fontSize:160},
            // Declare several bar series, each will be mapped
            // to a column of dataset.source by default.
            series: types,
            grid:{top:'80px',left:'150px'}
        };
        myChart.setOption(option);
    }
    function setchart2(chartName,dataset,types,yTitle){
        var myChart = echarts.init(document.getElementById(chartName));
        option = {
            legend: {},
            tooltip: {},
            dataset:dataset,
            xAxis: {type: 'category'},
            yAxis: {name: yTitle,type: 'value',nameLocation:'center', nameGap:40,fontSize:160},
            // Declare several bar series, each will be mapped
            // to a column of dataset.source by default.
            series: types,
            grid:{top:'80px',left:'150px'}
        };
        myChart.setOption(option);
    }

    function setchart2222(chartName,dataset,types){
        var myChart = echarts.init(document.getElementById(chartName));
        option = {
            legend: {},
            tooltip: {},
            dataset: {
                source: [
                    ['product', 'CO', 'COe', 'NOx'],
                    ['Matcha Latte', 43.3, 85.8, 93.7],
                    ['Milk Tea', 83.1, 73.4, 55.1],
                    ['Cheese Cocoa', 86.4, 65.2, 82.5],
                    ['Walnut Brownie', 72.4, 53.9, 39.1]
                ]
            },
            xAxis: {type: 'category'},
            yAxis: {},
            // Declare several bar series, each will be mapped
            // to a column of dataset.source by default.
            series: [
                {type: 'bar'},
                {type: 'bar'},
                {type: 'bar'}
            ]
        };
        myChart.setOption(option);
    }
    $( ".btnBack" ).click(function() {
        history.go(-1);
    });
});