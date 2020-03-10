<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bus Draft</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="layui-col-md12" >
    <div class="layui-col-md10 layui-col-lg-offset1">
    </div>
</div>
<div class="layui-col-md12" style="margin-top: 60px;" id="mainBody">
    <div class="layui-col-md10 layui-col-lg-offset1">
        <div class="layui-card">
            <div class="layui-card-header">Base infomation</div>
            <div class="layui-card-body" style="font-size:16px;">
                <div class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="padding-top:0px;">Year</label>
                        <div class="layui-input-block">
                            <select name="modelYear" lay-verify="" id="modelYear" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                </div>

                <div class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="padding-top:0px;">Country</label>
                        <div class="layui-input-inline">
                            <select name="countryId" lay-verify="" id="countryId" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                </div>

                <div class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="padding-top:0px;">City</label>
                        <div class="layui-input-inline">
                            <select name="cityId" lay-verify="" id="cityId" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<input type="hidden" id="hidModelYear">
<input type="hidden" id="hidCountryId">
<input type="hidden" id="hidCityId">
</body>


<script src="../site/js/jquery-2.1.1.min.js"></script>
<script src="../layui/layui.js"></script>
<script src="../site/js/index.js?v=1"></script>
</html>