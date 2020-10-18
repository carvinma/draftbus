<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bus Draft</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <style>
        td.nowrap{
            white-space: nowrap;
        }
    </style>
</head>
<body>

<div class="row" id="mainBody">

    <div class="col-md-11 col-md-offset-1">
        <div  id="backBody" style="margin-top:20px;margin-bottom: 20px;margin-right:20px; ">
            <a class="btn btn-primary btnBack">Back</a>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Cost Output</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">

                    <div class="col-md-10">
                        <div id="chart1" style="height:500px;width:800px;"></div>
                    </div>
                    <div class="col-md-2">

                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Emissions Output</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="col-md-12">
                        <div class="col-md-6" style="margin-left:-50px">
                            <div id="chart2" style="height:500px;width:600px;"></div>
                        </div>
                        <div class="col-md-6">
                            <div id="chart4" style="height:500px;width:600px;"></div>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Social Cost Output</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="col-md-12">
                        <div class="col-md-10">
                            <div id="chart3" style="height:500px;width:800px;"></div>
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div  id="backBody" style="margin-bottom: 20px;margin-right:20px; ">
            <a class="btn btn-primary btnBack">Back</a>
        </div>
    </div>
</div>

<input id="hidRecordIds" type="hidden" value="${recordIds!}">
</body>


<script src="../site/js/jquery-2.1.1.min.js"></script>
<script src="../bootstrap-3.3.7/js/bootstrap.js"></script>
<script src="../site/js/echarts.min.js"></script>
<script src="../site/js/chartresult.js?v=5"></script>
</html>