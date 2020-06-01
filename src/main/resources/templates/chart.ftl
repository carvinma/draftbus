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

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Cost Output</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">

                    <div class="col-md-6">
                        <div id="chart1" style="height:400px;width:600px;"></div>
                    </div>
                    <div class="col-md-6">

                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">EMISSIONS OUTPUT</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <div id="chart2" style="height:400px;width:600px;"></div>
                        </div>
                        <div class="col-md-6">

                        </div>
                    </div>

                </div>

            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">SOCIAL COST OUTPUT</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <div id="chart3" style="height:400px;width:600px;"></div>
                        </div>
                        <div class="col-md-6">

                        </div>
                    </div>

                </div>
            </div>
        </div>


    </div>
</div>

<input id="hidRecordIds" type="hidden" value="${recordIds!}">
</body>


<script src="../site/js/jquery-2.1.1.min.js"></script>
<script src="../bootstrap-3.3.7/js/bootstrap.js"></script>
<script src="../site/js/echarts.min.js"></script>
<script src="../site/js/chartresult.js?v=1"></script>
</html>