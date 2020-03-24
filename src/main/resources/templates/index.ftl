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
                        <div class="col-sm-8" >
                            <select name="modelYear" class="form-control" lay-verify="" id="modelYear" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Country</label>
                        <div class="col-sm-8">
                            <select name="countryId" class="form-control" lay-verify="" id="countryId" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">City</label>
                        <div class="col-sm-8">
                            <select name="cityId" class="form-control" lay-verify="" id="cityId" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">General information</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Discount rate</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="discountRate" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Social discount rate</label>
                        <div class="col-sm-8" >
                              <input type="text" class="form-control" id="socialDiscountRate" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Inflation rate</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="inflationRate" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Temperature </label>
                        <div class="col-sm-8">
                            <select class="form-control" lay-verify="" id="temperature" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Humidity </label>
                        <div class="col-sm-8">
                            <select class="form-control" lay-verify="" id="humidity" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Altitude/slope </label>
                        <div class="col-sm-8">
                            <select class="form-control" lay-verify="" id="slope" style="display: block;width:200px;">
                            </select>
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
                        <div class="col-sm-8" >
                            <select  class="form-control" lay-verify="" id="verticleType" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Fuel type</label>
                        <div class="col-sm-8">
                            <select class="form-control" lay-verify="" id="fuelType" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Emission standard</label>
                        <div class="col-sm-8">
                            <select  class="form-control" lay-verify="" id="emissionStd" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Number of bus</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="busNumber" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Replacement ratio</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="replacementRatio" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Annual distance traveled (VKT)(km/year/bus)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="vkt" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Operational years</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="operationalYears" placeholder="" style="width:200px;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Average operational speed </label>
                        <div class="col-sm-8">
                            <select class="form-control" lay-verify="" id="opSpeed" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Inspection and Maintenance </label>
                        <div class="col-sm-8">
                            <select class="form-control" lay-verify="" id="maintenance" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Load </label>
                        <div class="col-sm-8">
                            <select class="form-control" lay-verify="" id="feLoad" style="display: block;width:200px;">
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Fuel efficiency(L/100 km)</label>
                        <div class="col-sm-8" >
                            <input type="text" readonly class="form-control" id="fuelEfficiency" placeholder="" style="width:200px;">
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
                        <label for="" class="col-sm-4 control-label">Purchase price</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="purchasePrice" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Residual value</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="residualValue" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Down payment</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="downPaymentRate" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Loan interest rate</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="loanInterestRate" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Loan time</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="loanTime" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Procurement subsidy</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="procurementSubsidy" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Battery price</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="batteryPrice" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Battery leasing price</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="batteryLeasingPrice" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Battery content</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="batteryContent" placeholder="" style="width:200px;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Annual total labor cost</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="annualLaborCost" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Fuel price</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="fuelPrice" placeholder="" style="width:200px;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Fuel cost projection</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="fuelCostProjection" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Additional fuel price</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="additionalFuelPrice" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Additional operational costs to include</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="additionalOperationalCost" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Annual general maintenance cost</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="annualMaintenanceCost" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Tires</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="tires" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Frequency</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="tiresFrequency" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Engine overhaul</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="engineOverhaul" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Frequency</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="engineOverhaulFrequency" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Transmission overhaul</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="transmissionOverhaul" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Frequency</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="transmissionOverhaulFrequency" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Battery overhaul</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="batteryOverhaul" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Frequency</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="batteryOverhaulFrequency" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Vehicle retrofits</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="vehicleRetrofits" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Frequency</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="vehicleRetrofitsFrequency" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Additional maintenance costs to include </label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="additionalMaintenanceCost" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Insurance</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="insurance" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Administration</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="administration" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Other tax and fee</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="otherTaxFee" placeholder="" style="width:200px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Emissions Factors</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">TAILPIPE</label>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Carbon Monoxide (CO)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="coFactor" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Total Hydrocarbons (THC)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="thcFactor" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Nitrogen Oxide (Nox)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="noxFactor" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 2.5 (PM 2.5)</label>
                            <div class="col-sm-8" >
                                <input type="text" class="form-control" id="pm25Factor" placeholder="" style="width:200px;">
                            </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 10 (PM 10)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="pm10Factor" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Carbon Dioxide (CO2)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="co2Factor" placeholder="" style="width:200px;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Greenhouse Gases (GHG/CO2e)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="co2eFactor" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">UPSTREAM</label>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 2.5 (PM 2.5)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="pm25Factor2" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 10 (PM 10)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="pm10Factor2" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Carbon Dioxide (CO2)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="co2Factor2" placeholder="" style="width:200px;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Greenhouse Gases (GHG/CO2e)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="co2eFactor2" placeholder="" style="width:200px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Social cost factors</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Carbon Monoxide (CO)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="coFactor3" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Total Hydrocarbons (THC)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="thcFactor3" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Nitrogen Oxide (Nox)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="noxFactor3" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 2.5 (PM 2.5)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="pm25Factor3" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Particulate Matter 10 (PM 10)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="pm10Factor3" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Carbon Dioxide (CO2)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="co2Factor3" placeholder="" style="width:200px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Infrastructure (optional)</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Charger construction($)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="chargerConstruction" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Number of chargers</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="chargersNumber" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Procurement cost($)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="procurementCost" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Operational cost($/year)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="operationalCost" placeholder="" style="width:200px;">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Maintenance cost($/year)</label>
                        <div class="col-sm-8" >
                            <input type="text" class="form-control" id="maintenanceCost" placeholder="" style="width:200px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-horizontal">
            <div class="form-group">
                <button id="btnCalc" class="btn btn-success">Calculate</button>
            </div>
        </div>

    </div>
</div>

<input type="hidden" id="hidRecordId" value="${inputData.record_id!}">
<input type="hidden" id="hidModelYear" value="${inputData.calc_year!}">
<input type="hidden" id="hidCountryId" value="${inputData.country_id!}">
<input type="hidden" id="hidCityId" value="${inputData.city_id!}">
<input type="hidden" id="hidVerticleType" value="${busFleet.verticle_type!}">
<input type="hidden" id="hidFuelType" value="${busFleet.fuel_type!}">
<input type="hidden" id="hidEmissionStd" value="${busFleet.emission_std!}">
<input type="hidden" id="hidMaintenance" value="${busFleet.maintenance!}">
<input type="hidden" id="hidOpSpeed" value="${busFleet.op_speed!}">



</body>


<script src="../site/js/jquery-2.1.1.min.js"></script>
<script src="../boostrap-3.3.7/js/bootstrap.js"></script>
<script src="../site/js/index.js?v=1"></script>
</html>