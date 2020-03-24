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
</head>
<body>

<div class="row" id="mainBody">
    <div class="col-md-12 col-md-offset-1">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Base info</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Year</label>
                        <div class="col-sm-8">
                            <label name="modelYear" class="form-control" lay-verify="" id="modelYear"
                                   style="display: block;width:200px;">${inputData.calc_year!}
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Country</label>
                        <div class="col-sm-8">
                            <label name="countryName" class="form-control" lay-verify="" id="countryName"
                                   style="display: block;width:200px;">${countryName!}
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">City</label>
                        <div class="col-sm-8">
                            <label name="countryName" class="form-control" lay-verify="" id="cityName"
                                   style="display: block;width:200px;">${cityName!}
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Bus fleet information</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Bus Size</label>
                        <div class="col-sm-8">
                            <label name="verticleType" class="form-control" lay-verify="" id="verticleType"
                                   style="display: block;width:200px;">
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Fuel type</label>
                        <div class="col-sm-8">
                            <label name="fuelType" class="form-control" lay-verify="" id="fuelType"
                                   style="display: block;width:200px;">
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Emission standard</label>
                        <div class="col-sm-8">
                            <label name="emissionStd" class="form-control" lay-verify="" id="emissionStd"
                                   style="display: block;width:200px;">
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Number of bus</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="busNumber" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Annual distance traveled (VKT)(km/year/bus)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="vkt" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Operational years</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="operationalYears" placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Fuel efficiency(L/100 km)</label>
                        <div class="col-sm-8">
                            <label type="text" readonly class="form-control" id="fuelEfficiency" placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Cost Factors</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">PROCUREMENT</label>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Lifetime Financial NPV</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">${resultData.financial_npv!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Lifetime Capital NPV</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Lifetime Procurement NPV</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Annualized Financial cost</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Annualized Capital cost/label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Annualized total procurement cost</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>





                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">OPERATION</label>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Lifetime labor cost NPV</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Lifetime fuel cost NPV</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Lifetime fuel cost (consider fuel cost increase)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Lifetime other operational cost NPV</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Lifetime operational cost NPV</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Fuel cost projection</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Additional fuel price</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Additional operational costs to include</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Annual general maintenance cost</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">MAINTENANCE</label>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Lifetime maintenance cost NPV</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Annualized</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">ADDITIONAL</label>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Lifetime additional cost NPV</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Annualized</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">TOTAL COST</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Sum all lifetime cost</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Sum all annualized cost</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"  placeholder=""
                                   style="width:200px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Emissions</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">TAILPIPE</label>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Carbon Monoxide (CO)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="coFactor" placeholder="" style="width:200px;">${resultEmissionData.co!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Total Hydrocarbons (THC)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="thcFactor" placeholder="" style="width:200px;">${resultEmissionData.thc!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Nitrogen Oxide (Nox)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="noxFactor" placeholder="" style="width:200px;">${resultEmissionData.nox!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 2.5 (PM 2.5)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="pm25Factor" placeholder="" style="width:200px;">${resultEmissionData.pm25!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 10 (PM 10)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="pm10Factor" placeholder="" style="width:200px;">${resultEmissionData.pm10!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Carbon Dioxide (CO2)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="co2Factor" placeholder="" style="width:200px;">${resultEmissionData.co2!}
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Greenhouse Gases (GHG/CO2e)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="co2eFactor" placeholder="" style="width:200px;">${resultEmissionData.co2e!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">UPSTREAM</label>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 2.5 (PM 2.5)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="pm25Factor2" placeholder="" style="width:200px;">${resultEmissionData.pm25_up!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 10 (PM 10)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="pm10Factor2" placeholder="" style="width:200px;">${resultEmissionData.pm10_up!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Carbon Dioxide (CO2)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="co2Factor2" placeholder="" style="width:200px;">${resultEmissionData.co2_up!}
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Greenhouse Gases (GHG/CO2e)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="co2eFactor2" placeholder="" style="width:200px;">${resultEmissionData.co2e_up!}
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Social cost</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Carbon Monoxide (CO)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="coFactor3" placeholder="" style="width:200px;">${resultSocialCostData.co!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Total Hydrocarbons (THC)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="thcFactor3" placeholder="" style="width:200px;">${resultSocialCostData.thc!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Nitrogen Oxide (Nox)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="noxFactor3" placeholder="" style="width:200px;">${resultSocialCostData.nox!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 2.5 (PM 2.5)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="pm25Factor3" placeholder="" style="width:200px;">${resultSocialCostData.pm25!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 10 (PM 10)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="pm10Factor3" placeholder="" style="width:200px;">${resultSocialCostData.pm10!}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Carbon Dioxide (CO2)</label>
                        <div class="col-sm-8">
                            <label type="text" class="form-control" id="co2Factor3" placeholder="" style="width:200px;">${resultSocialCostData.co2!}
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>



</body>


<script src="../site/js/jquery-2.1.1.min.js"></script>
<script src="../boostrap-3.3.7/js/bootstrap.js"></script>
</html>