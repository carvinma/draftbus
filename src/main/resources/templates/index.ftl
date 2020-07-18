<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Bus Draft</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.css" media="all">
    <link rel="stylesheet" href="../site/css/bootoast.css" media="all">

    <!--<link rel="stylesheet" href="../layui/css/layui.css" media="all">-->
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <style>
        .required {
            color: red;
        }
        .error {
            color: red;
        }
        label.control-label{
            text-align: left !important;
        }
    </style>
</head>
<body>

<div class="row" id="mainBody">
    <div class="col-md-10 col-md-offset-1">
        <form class="form-horizontal" id="frm">


            <div class="panel panel-default" style="margin-top: 20px;">
                <div class="panel-heading">
                    <h3 class="panel-title">General information</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Country<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <select name="countryId" required class="form-control" lay-verify="" id="countryId"
                                        style="display: block;width:200px;">
                                </select>
                            </div>

                            <label for="" class="col-sm-3 control-label">Temperature </label>
                            <div class="col-sm-3">
                                <select class="form-control" lay-verify="" id="temperature" name="temperature"
                                        style="display: block;width:200px;">
                                </select>
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">City</label>
                            <div class="col-sm-3">
                                <select name="cityId"  class="form-control" lay-verify="" id="cityId"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Humidity </label>
                            <div class="col-sm-3">
                                <select class="form-control" lay-verify="" id="humidity" name="humidity"
                                        style="display: block;width:200px;">
                                </select>
                            </div>


                        </div>

                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Discount rate(%)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" required name="discountRate" id="discountRate" placeholder=""
                                       style="width:200px;" value="${inputData.discount_rate!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Altitude/slope </label>
                            <div class="col-sm-3">
                                <select class="form-control" lay-verify="" id="slope" name="slope"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Social discount rate(%)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" required name="socialDiscountRate" id="socialDiscountRate" placeholder=""
                                       style="width:200px;" value="${inputData.social_discount_rate!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Inflation rate(%)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" disabled name="inflationRate" id="inflationRate" placeholder=""
                                       style="width:200px;" value="${inputData.inflation_rate!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label style="display: none;" for="" class="col-sm-2 control-label">Year<span class="required">*</span></label>
                            <div class="col-sm-2" style="display: none;">
                                <select name="modelYear"  class="form-control" lay-verify="" id="modelYear" name="modelYear"
                                        style="display: block;width:200px;">
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
                            <label for="" class="col-sm-3 control-label">Bus Size<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" required lay-verify="" id="vehicleType" name="vehicleType"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Number of bus<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="busNumber" name="busNumber" placeholder=""
                                       style="width:200px;" value="${busFleet.bus_number!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Fuel type<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" required lay-verify="" id="fuelType" name="fuelType"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Replacement ratio</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" disabled id="replacementRatio" name="replacementRatio" placeholder=""
                                       style="width:200px;" value="${busFleet.replacement_ratio!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Emission standard<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" required lay-verify="" id="emissionStd" name="emissionStd"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Annual distance traveled
                                (VKT)(km/year/bus)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="vkt" placeholder="" name="vkt"
                                       style="width:200px;" value="${busFleet.vkt!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Average speed </label>
                            <div class="col-sm-3">
                                <select class="form-control"  lay-verify="" id="opSpeed" name="opSpeed"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Operational years(Year)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="operationalYears" id="operationalYears" placeholder=""
                                       style="width:200px;" value="${busFleet.operational_years!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Load </label>
                            <div class="col-sm-3">
                                <select class="form-control"  lay-verify="" id="feLoad" name="feLoad"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Fuel efficiency(<span id="fuelUnit">L/100km</span>)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="fuelEfficiency" name="fuelEfficiency" placeholder=""
                                       style="width:200px;" value="${busFleet.fuel_efficiency!}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Air condition </label>
                            <div class="col-sm-3">
                                <select class="form-control"  lay-verify="" id="ac" name="ac"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"> Cost Factors <button class="btn btn-primary" style="margin-left: 20px;" type="button" id="fillCostFactor">Fill default values</button>
                        <a style="float:right;color: #337ab7;text-decoration: underline;" class="openPanel" role="button" data-toggle="collapse"  href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">unfold
                       </a></h3>
                </div>
                <div class="panel-body panel-collapse collapse" id="collapseOne" >
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label style="text-align: left;font-weight:800;font-size:16px;" for="" class="col-sm-6 control-label">PROCUREMENT</label>
                            <label style="text-align: left;font-weight:800;font-size:16px;" for="" class="col-sm-6 control-label">OPERATION</label>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Purchase price($/bus)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="purchasePrice" placeholder="" name="purchasePrice"
                                       style="width:200px;"  required value="${costFactor.purchase_price!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Annual total labor cost($/bus/year)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="annualLaborCost" placeholder="" name="annualLaborCost"
                                       style="width:200px;"  required value="${costFactor.annual_labor_cost!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Procurement subsidy($/bus)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="procurementSubsidy" id="procurementSubsidy" placeholder=""
                                       style="width:200px;"  required value="${costFactor.procurement_subsidy!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Fuel price(<span class="fuelPriceUnit">$/L</span>)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="fuelPrice" id="fuelPrice" placeholder=""
                                       style="width:200px;"  required value="${costFactor.fuel_price!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Residual value(%)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="residualValue" id="residualValue" placeholder=""
                                       style="width:200px;"  required value="${costFactor.residual_value!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Fuel cost projection(%)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control"  name="fuelCostProjection" id="fuelCostProjection" placeholder=""
                                       style="width:200px;"  required value="${costFactor.fuel_cost_projection!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Down payment(%)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="downPaymentRate" placeholder=""
                                       style="width:200px;" name="downPaymentRate"  required value="${costFactor.down_payment_rate!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Additional fuel price(<span class="fuelPriceUnit">$/L</span>)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="additionalFuelPrice" id="additionalFuelPrice" placeholder=""
                                       style="width:200px;"  required value="${costFactor.additional_fuel_price!}">
                            </div>


                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Loan interest rate(%)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="loanInterestRate" id="loanInterestRate" placeholder=""
                                       style="width:200px;"  required value="${costFactor.loan_interest_rate!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Additional operational costs to
                                include($/bus)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="additionalOperationalCost" id="additionalOperationalCost" placeholder=""
                                       style="width:200px;"  required value="${costFactor.additional_operation_cost!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Loan time(years)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text"  required class="form-control" name="loanTime" id="loanTime" placeholder=""
                                       style="width:200px;" value="${costFactor.loan_time!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Insurance($/bus)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text"  required class="form-control" name="insurance" id="insurance" placeholder=""
                                       style="width:200px;" value="${costFactor.insurance!}">
                            </div>
                        </div>


                    </div>
                    <hr/>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label style="text-align: left;font-weight:800;font-size:16px;" for="" class="col-sm-6 control-label">MAINTENANCE</label>
                            <label style="text-align: left;font-weight:800;font-size:16px;" for="" class="col-sm-6 control-label">ADDITIONAL</label>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Annual general maintenance
                                cost($/bus/year)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="annualMaintenanceCost" id="annualMaintenanceCost" placeholder=""
                                       style="width:200px;"   value="${costFactor.annual_maintenance_cost!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Administration($/year)</label>
                            <div class="col-sm-3">
                                <input type="text"  class="form-control"  name="administration" id="administration" placeholder=""
                                       style="width:200px;" value="${costFactor.administration!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Annual maintenance labor
                                cost($/bus/year)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="annualMaintenanceLaborCost" id="annualMaintenanceLaborCost" placeholder=""
                                       style="width:200px;"   value="${costFactor.annual_maintenance_labor_cost!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Other tax and fee($/bus/year)</label>
                            <div class="col-sm-3">
                                <input type="text"  class="form-control" name="otherTaxFee" id="otherTaxFee" placeholder=""
                                       style="width:200px;" value="${costFactor.other_tax_fee!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Additional maintenance costs to
                                include($/bus/year) </label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="additionalMaintenanceCost" id="additionalMaintenanceCost" placeholder=""
                                       style="width:200px;"   value="${costFactor.additional_maintenance_cost!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">One time overhaul cost($/bus)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="onetimeOverhaulCost" id="onetimeOverhaulCost" placeholder=""
                                       style="width:200px;"   value="${costFactor.onetime_overhaul_cost!}">
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label style="text-align: left;font-weight:800;font-size:16px;" for="" class="col-sm-6 control-label">Infrastructure (optional)</label>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Charger construction($)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="chargerConstruction" name="chargerConstruction"placeholder=""
                                       style="width:200px;" value="${inputData.charger_construction!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Number of chargers</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="chargersNumber" id="chargersNumber" placeholder=""
                                       style="width:200px;" value="${inputData.chargers_number!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Procurement cost($)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="procurementCost" id="procurementCost" placeholder=""
                                       style="width:200px;" value="${inputData.procurement_cost!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Operational cost($/year)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="operationalCost" id="operationalCost" placeholder=""
                                       style="width:200px;" value="${inputData.operational_cost!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Maintenance cost($/year)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="maintenanceCost" id="maintenanceCost" placeholder=""
                                       style="width:200px;" value="${inputData.maintenance_cost!}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Emissions Factors <button type="button" class="btn btn-primary" style="margin-left: 20px;" id="fillEmissionCostFactor">Fill default values</button><a style="float:right;color: #337ab7;text-decoration: underline;" class="openPanel" role="button" data-toggle="collapse"  href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">unfold
                    </a>
                    </h3>
                </div>
                <div class="panel-body panel-collapse collapse" id="collapseTwo" >
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label style="text-align: center;" for="" class="col-sm-6 control-label">TAILPIPE</label>
                            <label style="text-align: center;" for="" class="col-sm-6 control-label">UPSTREAM</label>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Carbon Monoxide (CO)(g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="coFactor"  id="coFactor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Particulate Matter 2.5 (PM 2.5)(g/kwh)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="pm25Factor2" id="pm25Factor2" placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm25_up!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Total Hydrocarbons (THC)(g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="thcFactor" id="thcFactor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.thc!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Particulate Matter 10 (PM 10)(g/kwh)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="pm10Factor2" id="pm10Factor2"  placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm10_up!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Nitrogen Oxide (Nox)(g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="noxFactor" id="noxFactor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.nox!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Carbon Dioxide (CO2)(g/kwh)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="co2Factor2" id="co2Factor2" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co2_up!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Particulate Matter 2.5 (PM 2.5)(g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="pm25Factor" id="pm25Factor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm25!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Greenhouse Gases (GHG/CO2e)(g/kwh)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="co2eFactor2" id="co2eFactor2" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co2e_up!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Particulate Matter 10 (PM 10)(g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="pm10Factor" id="pm10Factor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm10!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Carbon Dioxide (CO2)(g/L)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="co2Factor" id="co2Factor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co2!}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Greenhouse Gases (GHG/CO2e)(g/L)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="co2eFactor" id="co2eFactor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co2e!}">
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Social cost factors  <button class="btn btn-primary" style="margin-left: 20px;" type="button" id="fillSocialCostFactor">Fill default values</button> <a style="float:right;color: #337ab7;text-decoration: underline;" class="openPanel" role="button" data-toggle="collapse"  href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">unfold
                    </a></h3>
                </div>
                <div class="panel-body panel-collapse collapse" id="collapseThree" >
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Carbon Monoxide (CO)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="coFactor3" id="coFactor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.co!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Total Hydrocarbons (THC)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="thcFactor3" id="thcFactor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.thc!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Nitrogen Oxide (Nox)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="noxFactor3" id="noxFactor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.nox!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Particulate Matter 2.5 (PM 2.5)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="pm25Factor3" id="pm25Factor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.pm25!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Particulate Matter 10 (PM 10)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="pm10Factor3" id="pm10Factor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.pm10!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Carbon Dioxide (CO2)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="co2Factor3" id="co2Factor3"placeholder=""
                                       style="width:200px;" value="${socialCostFactor.co2!}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="form-horizontal">
                <div class="form-group" style="margin-left: 0px;">
                    <button type="button" id="btnCalc" class="btn btn-success">Calculate</button>
                    <button type="button" id="btnCompare" class="btn btn-warning">Compare</button>
                    <button type="button" style="margin-left: 100px;" id="btnAdd" class="btn btn-primary">Add Fleet</button>
                    <button type="button" id="btnAdd2" class="btn btn-primary">Add Cost Factor</button>
                    <button type="button" id="btnAdd3" class="btn btn-primary">Add Infrastructure</button>

                </div>
            </div>
            <div class="form-horizontal">
                <table class="table-bordered  table">
                    <thead>
                    <tr>
                        <td style="width: 50px;"></td>
                        <td>Number</td>
                        <td>Name</td>
                        <td>Action</td>
                    </tr>
                    </thead>
                    <tbody id="tbody">

                    </tbody>

            </div>


        </form>
    </div>
</div>

<table id="hidFleetButton" style="display: none;">
    <tr>
        <td>
            <input type="checkbox" name="checkbox" value="#RecordId#" style="zoom:150%">
        </td>
        <td>
        #Number#
       </td>
        <td>
            <span>#Name#</span>
        </td>
        <td><a href="/child?id=#RecordId#" target="_blank" class="btn btn-primary editFleet" value="#RecordId#">edit</a>
            <button type="button" class="btn btn-danger delFleet" value="#RecordId#">delete</button></td>
    </tr>
</table>
<div class="modal fade large" tabindex="-1" role="dialog"  id="myModal">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Input Your data</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="frm2">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Name<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input class="form-control" required lay-verify="" id="name2" name="name2"
                                    >
                            </input>
                        </div>
                        <label for="" class="col-sm-4 control-label">Bus Size<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <select class="form-control" required lay-verify="" id="vehicleType2" name="vehicleType2"
                                    >
                            </select>
                        </div>
                        <label for="" class="col-sm-4 control-label">Number of bus<span
                                class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" required class="form-control" id="busNumber2" name="busNumber2" placeholder=""
                                   >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Fuel type<span
                                class="required">*</span></label>
                        <div class="col-sm-2">
                            <select class="form-control" required lay-verify="" id="fuelType2" name="fuelType2"
                                    >
                            </select>
                        </div>
                        <label for="" class="col-sm-4 control-label">Annual distance traveled
                            (VKT)(km/year/bus)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" required class="form-control" id="vkt2" name="vkt2" placeholder=""
                                    >
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Emission standard<span
                                class="required">*</span></label>
                        <div class="col-sm-2">
                            <select class="form-control" required lay-verify="" id="emissionStd2" name="emissionStd2"
                                   >
                            </select>
                        </div>
                        <label for="" class="col-sm-4 control-label">Operational years(Year)<span
                                class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" required class="form-control" id="operationalYears2" name="operationalYears2" placeholder=""
                                    >
                        </div>
                    </div>
            </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-close" data-dismiss="modal">Close</button>
                <button id="btnSave" type="button" class="btn btn-primary">Save Data</button>
                <input type="hidden" id="hidChildId" value="">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade large" tabindex="-1" role="dialog"  id="myModal3">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Input Your data</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="frm3">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Name<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input class="form-control" required lay-verify="" id="name3" name="name3"
                                    >
                            </input>
                        </div>
                        <label for="" class="col-sm-4 control-label">Procurement subsidy($/bus)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="procurementSubsidy2" placeholder="" name="procurementSubsidy2"
                                    required >
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Residual value(%)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="residualValue2" placeholder="" name="residualValue2"
                                    required value="${costFactor.residual_value!}">
                        </div>
                        <label for="" class="col-sm-4 control-label">Down payment(%)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="downPaymentRate2" placeholder="" name="downPaymentRate2"
                                   required ">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Loan interest rate(%)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="loanInterestRate2" placeholder="" name="loanInterestRate2"
                                    required ">
                        </div>
                        <label for="" class="col-sm-4 control-label">Loan time(years)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text"  required class="form-control" id="loanTime2" placeholder="" name="loanTime2"
                                    >
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-close" data-dismiss="modal">Close</button>
                <button id="btnSave3" type="button" class="btn btn-primary">Save Data</button>
                <input type="hidden" id="hidChildId3" value="">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div class="modal fade large" tabindex="-1" role="dialog"  id="myModal4">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Input Your data</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="frm4">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Name<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input class="form-control" required lay-verify="" id="name4" name="name4"
                                    style="display: block;width:200px;">
                            </input>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Charger construction($)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="chargerConstruction2" placeholder="" name="chargerConstruction2"
                                   style="width:200px;" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Number of chargers</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="chargersNumber2" placeholder="" name="chargersNumber2"
                                   style="width:200px;" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Procurement cost($)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="procurementCost2" placeholder="" name="procurementCost2"
                                   style="width:200px;" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Operational cost($/year)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="operationalCost2" placeholder="" name="operationalCost2"
                                   style="width:200px;" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Maintenance cost($/year)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="maintenanceCost2" placeholder="" name="maintenanceCost2"
                                   style="width:200px;" >
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-close" data-dismiss="modal">Close</button>
                <button id="btnSave4" type="button" class="btn btn-primary">Save Data</button>
                <input type="hidden" id="hidChildId4" value="">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div class="modal fade " tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="delModal">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Message</h4>
            </div>
            <div class="modal-body">
                Are you sure to delete it?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button id="btnDeleteFleet" type="button" class="btn btn-primary">Delete</button>
                <input type="hidden" id="hidDeleteId" value="">
            </div>
        </div>
    </div>
</div>

<input type="hidden" class="myInt" id="hidRecordId" value="${inputData.record_id!}">
<input type="hidden" class="myInt" id="hidModelYear" value="${inputData.calc_year!}">
<input type="hidden" class="myInt" id="hidCountryId" value="${inputData.country_id!}">
<input type="hidden" class="myInt" id="hidCityId" value="${inputData.city_id!}">
<input type="hidden" id="hidTemperature" value="${inputData.temperature!}">
<input type="hidden" id="hidHumidity" value="${inputData.humidity!}">
<input type="hidden" id="hidSlope" value="${inputData.slope!}">

<input type="hidden" class="myInt" id="hidVehicleType" value="${busFleet.vehicle_type!}">
<input type="hidden" class="myInt" id="hidFuelType" value="${busFleet.fuel_type!}">
<input type="hidden" class="myInt"  id="hidEmissionStd" value="${busFleet.emission_std!}">
<input type="hidden" class="myInt" id="hidAc" value="${busFleet.ac!}">
<input type="hidden" class="myInt" id="hidOpSpeed" value="${busFleet.op_speed!}">
<input type="hidden" class="myInt" id="hidFeLoad" value="${busFleet.fe_load!}">


</body>


<script src="../site/js/jquery-2.1.1.min.js"></script>
<script src="../bootstrap-3.3.7/js/bootstrap.js"></script>
<script src="../jquery-validation-1.19.0/dist/jquery.validate.js"></script>
<script src="../site/js/bootoast.js"></script>
<!--<script dtv="../layui/layui.js" ></script>-->
<script src="../site/js/index.js?v=3"></script>
</html>