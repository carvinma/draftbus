<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bus Draft</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.css" media="all">
    <link rel="stylesheet" href="../site/css/bootoast.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <style>
        .required {
            color: red;
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
                            <label for="" class="col-sm-2 control-label">Year<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <select name="modelYear" required class="form-control" lay-verify="" id="modelYear"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-2 control-label">Temperature </label>
                            <div class="col-sm-2">
                                <select class="form-control" lay-verify="" id="temperature"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-2 control-label">Discount rate(%)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" required id="discountRate" placeholder=""
                                       style="width:200px;" value="${inputData.discount_rate!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">Country<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <select name="countryId" required class="form-control" lay-verify="" id="countryId"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-2 control-label">Humidity </label>
                            <div class="col-sm-2">
                                <select class="form-control" lay-verify="" id="humidity"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-2 control-label">Social discount rate(%)<span
                                    class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" required id="socialDiscountRate" placeholder=""
                                       style="width:200px;" value="${inputData.social_discount_rate!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">City<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <select name="cityId" required class="form-control" lay-verify="" id="cityId"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-2 control-label">Altitude/slope </label>
                            <div class="col-sm-2">
                                <select class="form-control" lay-verify="" id="slope"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-2 control-label">Inflation rate(%)</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" disabled id="inflationRate" placeholder=""
                                       style="width:200px;" value="${inputData.inflation_rate!}">
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
                                <select class="form-control" required lay-verify="" id="vehicleType"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Number of bus<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="busNumber" placeholder=""
                                       style="width:200px;" value="${busFleet.bus_number!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Fuel type<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" required lay-verify="" id="fuelType"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Replacement ratio</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" disabled id="replacementRatio" placeholder=""
                                       style="width:200px;" value="${busFleet.replacement_ratio!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Emission standard<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" required lay-verify="" id="emissionStd"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Annual distance traveled
                                (VKT)(km/year/bus)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="vkt" placeholder=""
                                       style="width:200px;" value="${busFleet.vkt!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Average speed <span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" required lay-verify="" id="opSpeed"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Operational years(Year)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="operationalYears" placeholder=""
                                       style="width:200px;" value="${busFleet.operational_years!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Load <span class="required">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" required lay-verify="" id="feLoad"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Fuel efficiency(L/100 km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="fuelEfficiency" placeholder=""
                                       style="width:200px;" value="${busFleet.fuel_efficiency!}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Air condition <span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" required lay-verify="" id="ac"
                                        style="display: block;width:200px;">
                                </select>
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
                            <label style="text-align: center;" for="" class="col-sm-4 control-label">PROCUREMENT</label>
                            <label style="text-align: center;" for="" class="col-sm-4 control-label">OPERATION</label>
                            <label style="text-align: center;" for="" class="col-sm-4 control-label">MAINTENANCE</label>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">Purchase price($/bus)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="purchasePrice" placeholder=""
                                       style="width:200px;"  required value="${costFactor.purchase_price!}">
                            </div>
                            <label for="" class="col-sm-2 control-label">Annual total labor cost($/bus/year)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="annualLaborCost" placeholder=""
                                       style="width:200px;"  required value="${costFactor.annual_labor_cost!}">
                            </div>
                            <label for="" class="col-sm-2 control-label">Annual general maintenance
                                cost($/bus/year)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="annualMaintenanceCost" placeholder=""
                                       style="width:200px;"  required value="${costFactor.annual_maintenance_cost!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">Procurement subsidy($/bus)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="procurementSubsidy" placeholder=""
                                       style="width:200px;"  required value="${costFactor.procurement_subsidy!}">
                            </div>
                            <label for="" class="col-sm-2 control-label">Fuel price($)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="fuelPrice" placeholder=""
                                       style="width:200px;"  required value="${costFactor.fuel_price!}">
                            </div>
                            <label for="" class="col-sm-2 control-label">Annual maintenance labor
                                cost($/bus/year)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="annualMaintenanceLaborCost" placeholder=""
                                       style="width:200px;"  required value="${costFactor.annual_maintenance_labor_cost!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">Residual value(%)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="residualValue" placeholder=""
                                       style="width:200px;"  required value="${costFactor.residual_value!}">
                            </div>
                            <label for="" class="col-sm-2 control-label">Fuel cost projection(%)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="fuelCostProjection" placeholder=""
                                       style="width:200px;"  required value="${costFactor.fuel_cost_projection!}">
                            </div>
                            <label for="" class="col-sm-2 control-label">Additional maintenance costs to
                                include($/bus/year) <span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="additionalMaintenanceCost" placeholder=""
                                       style="width:200px;"  required value="${costFactor.additional_maintenance_cost!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">Down payment(%)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="downPaymentRate" placeholder=""
                                       style="width:200px;"  required value="${costFactor.down_payment_rate!}">
                            </div>
                            <label for="" class="col-sm-2 control-label">Additional fuel price($/year)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="additionalFuelPrice" placeholder=""
                                       style="width:200px;"  required value="${costFactor.additional_fuel_price!}">
                            </div>
                            <label for="" class="col-sm-2 control-label">One time overhaul cost($/bus)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="additionalFuelPrice" placeholder=""
                                       style="width:200px;"  required value="${costFactor.onetime_overhaul_cost!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">Loan interest rate(%)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="loanInterestRate" placeholder=""
                                       style="width:200px;"  required value="${costFactor.loan_interest_rate!}">
                            </div>
                            <label for="" class="col-sm-2 control-label">Additional operational costs to
                                include($/bus)</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="additionalOperationalCost" placeholder=""
                                       style="width:200px;"  required value="${costFactor.additional_operation_cost!}">
                            </div>
                            <label style="text-align: center;" for="" class="col-sm-4 control-label">ADDITIONAL</label>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">Loan time(years)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text"  required class="form-control" id="loanTime" placeholder=""
                                       style="width:200px;" value="${costFactor.loan_time!}">
                            </div>
                            <label for="" class="col-sm-2 control-label">Insurance($/bus)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text"  required class="form-control" id="insurance" placeholder=""
                                       style="width:200px;" value="${costFactor.insurance!}">
                            </div>
                            <label for="" class="col-sm-2 control-label">Administration($/year)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text"  required class="form-control" disabled id="administration" placeholder=""
                                       style="width:200px;" value="${costFactor.administration!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label col-sm-offset-8">Other tax and fee($/bus/year)<span class="required">*</span></label>
                            <div class="col-sm-2">
                                <input type="text" required class="form-control" disabled id="otherTaxFee" placeholder=""
                                       style="width:200px;" value="${costFactor.other_tax_fee!}">
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
                            <label style="text-align: center;" for="" class="col-sm-6 control-label">TAILPIPE</label>
                            <label style="text-align: center;" for="" class="col-sm-6 control-label">UPSTREAM</label>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Carbon Monoxide (CO)(g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="coFactor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Particulate Matter 2.5 (PM 2.5)(g/kwh)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="pm25Factor2" placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm25_up!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Total Hydrocarbons (THC)(g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="thcFactor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.thc!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Particulate Matter 10 (PM 10)(g/kwh)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="pm10Factor2" placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm10_up!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Nitrogen Oxide (Nox)(g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="noxFactor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.nox!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Carbon Dioxide (CO2)(g/kwh)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="co2Factor2" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co2_up!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Particulate Matter 2.5 (PM 2.5)(g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="pm25Factor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm25!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Greenhouse Gases (GHG/CO2e)(g/kwh)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="co2eFactor2" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co2e_up!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Particulate Matter 10 (PM 10)(g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="pm10Factor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm10!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Carbon Dioxide (CO2)(g/L)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="co2Factor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co2!}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Greenhouse Gases (GHG/CO2e)(g/L)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="co2eFactor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co2e!}">
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
                            <label for="" class="col-sm-3 control-label">Carbon Monoxide (CO)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="coFactor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.co!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Total Hydrocarbons (THC)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="thcFactor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.thc!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Nitrogen Oxide (Nox)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="noxFactor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.nox!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Particulate Matter 2.5 (PM 2.5)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="pm25Factor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.pm25!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Particulate Matter 10 (PM 10)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="pm10Factor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.pm10!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Carbon Dioxide (CO2)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="co2Factor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.co2!}">
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
                            <label for="" class="col-sm-3 control-label">Charger construction($)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="chargerConstruction" placeholder=""
                                       style="width:200px;" value="${inputData.charger_construction!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Number of chargers</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="chargersNumber" placeholder=""
                                       style="width:200px;" value="${inputData.chargers_number!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Procurement cost($)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="procurementCost" placeholder=""
                                       style="width:200px;" value="${inputData.procurement_cost!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Operational cost($/year)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="operationalCost" placeholder=""
                                       style="width:200px;" value="${inputData.operational_cost!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Maintenance cost($/year)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="maintenanceCost" placeholder=""
                                       style="width:200px;" value="${inputData.maintenance_cost!}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-horizontal">
                <div class="form-group">
                    <button type="button" id="btnCalc" class="btn btn-success">Save</button>
                </div>
            </div>

        </form>
    </div>
</div>


<input type="hidden" id="hidRecordId" value="${inputData.record_id!}">
<input type="hidden" id="hidModelYear" value="${inputData.calc_year!}">
<input type="hidden" id="hidCountryId" value="${inputData.country_id!}">
<input type="hidden" id="hidCityId" value="${inputData.city_id!}">
<input type="hidden" id="hidTemperature" value="${inputData.temperature!}">
<input type="hidden" id="hidHumidity" value="${inputData.humidity!}">
<input type="hidden" id="hidSlope" value="${inputData.slope!}">

<input type="hidden" id="hidVehicleType" value="${busFleet.vehicle_type!}">
<input type="hidden" id="hidFuelType" value="${busFleet.fuel_type!}">
<input type="hidden" id="hidEmissionStd" value="${busFleet.emission_std!}">
<input type="hidden" id="hidAc" value="${busFleet.ac!}">
<input type="hidden" id="hidOpSpeed" value="${busFleet.op_speed!}">


</body>


<script src="../site/js/jquery-2.1.1.min.js"></script>
<script src="../bootstrap-3.3.7/js/bootstrap.js"></script>
<script src="../jquery-validation-1.19.0/dist/jquery.validate.js"></script>
<script src="../site/js/bootoast.js"></script>
<script src="../site/js/child.js?v=1"></script>
</html>