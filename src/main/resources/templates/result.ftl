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
                <h3 class="panel-title">Base info</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">
                    <div class="col-md-12">
                        <div class="col-md-12">
                            <table class="table-bordered  table">
                                <tr>
                                    <td>Year</td>
                                    <td><label type="text" class="" placeholder=""
                                               style="width:200px;">${inputData.calc_year!}</td>
                                    <td>Country</td>
                                    <td><label type="text" class="" placeholder=""
                                               style="width:200px;">${country.item_name!}</td>
                                    <td>City</td>
                                    <td><label type="text" class="" placeholder=""
                                               style="width:200px;">${city.item_name!}</td>
                                </tr>
                                <tr>
                                    <td>Bus Size</td>
                                    <td><label type="text" class="" placeholder=""
                                               style="width:200px;">${vehicleType.item_name!}</td>
                                    <td>Fuel type</td>
                                    <td><label type="text" class="" placeholder=""
                                               style="width:200px;">${fuelType.item_name!}</td>
                                    <td>Emission standard</td>
                                    <td><label type="text" class="" placeholder=""
                                               style="width:200px;">${emissionStd.item_name!}</td>
                                </tr>
                                <tr>
                                    <td class="nowrap">Number of bus</td>
                                    <td><label type="text" class="" placeholder=""
                                               style="width:200px;">${busFleet.bus_number!}</td>
                                    <td>Annual distance traveled (VKT)(km/year/bus)</td>
                                    <td><label type="text" class="" placeholder=""
                                               style="width:200px;">${busFleet.vkt!}</td>
                                    <td>Operational years</td>
                                    <td><label type="text" class="" placeholder=""
                                               style="width:200px;">${busFleet.operational_years!}</td>
                                </tr>
                                <tr>
                                    <td>Fuel efficiency(L/100 km)</td>
                                    <td><label type="text" class="" placeholder=""
                                               style="width:200px;">${busFleet.fuel_efficiency!}</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Cost Output</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal">

                    <div class="col-md-6">
                        <table class="table-bordered  table">
                            <tr>
                                <th>Lifetime PV</th>
                                <th>Fleet1</th>
                            </tr>
                            <tr>
                                <td>Labor Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData.labor_cost_npv!}</td>
                            </tr>
                            <tr>
                                <td>Fuel Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData.fuel_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Other operating cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData.others_operational_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Maintenance Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData.maintenance_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Overhaul Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData.overhaul_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Capital (Upfront Procurement) Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData.capital_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Financing Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData.financial_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Total Capital-Financing Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData.capital_cost_npv!+resultData.financial_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Total O&M Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData.labor_cost_npv!+resultData.labor_cost_npv!+resultData.others_operational_cost_npv!+resultData.maintenance_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Total Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;"></td>

                            </tr>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <table class="table-bordered  table">
                            <tr>
                                <th>Annualized Lifetime PV</th>
                                <th>Fleet1</th>
                            </tr>
                            <tr>
                                <td>Labor Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData2.labor_cost_npv!}</td>
                            </tr>
                            <tr>
                                <td>Fuel Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData2.fuel_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Other operating cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData2.others_operational_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Maintenance Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData2.maintenance_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Overhaul Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData2.overhaul_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Capital (Upfront Procurement) Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData2.capital_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Financing Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData2.financial_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Total Capital-Financing Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData2.capital_cost_npv!+resultData.financial_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Total O&M Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;">${resultData2.labor_cost_npv!+resultData.labor_cost_npv!+resultData.others_operational_cost_npv!+resultData.maintenance_cost_npv!}</td>

                            </tr>
                            <tr>
                                <td>Total Cost</td>
                                <td><label type="text" class=""  placeholder=""
                                           style="width:200px;"></td>

                            </tr>
                        </table>
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
                            <table class="table-bordered  table">
                                <tr>
                                    <th>Emissions (Unit: Lifetime Tonnes)</th>
                                    <th>Fleet1</th>

                                </tr>
                                <tr>
                                    <td style="font-weight: bold">TAILPIPE</td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td>Carbon Monoxide (CO)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.co!}</td>

                                </tr>
                                <tr>
                                    <td>Total Hydrocarbons (THC)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.thc!}</td>

                                </tr>
                                <tr>
                                    <td>Nitrogen Oxide (Nox)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.nox!}</td>

                                </tr>
                                <tr>
                                    <td>Particulate Matter 2.5 (PM 2.5)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.pm25!}</td>

                                </tr>
                                <tr>
                                    <td>Particulate Matter 10 (PM 10)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.pm10!}</td>

                                </tr>
                                <tr>
                                    <td>Carbon Dioxide (CO2)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.co2!}</td>

                                </tr>
                                <tr>
                                    <td>Greenhouse Gases (GHG/CO2e)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.co2e!}</td>

                                </tr>
                                <tr>
                                    <td style="font-weight: bold">UPSTREAM</td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td>Particulate Matter 2.5 (PM 2.5)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.pm25_up!}</td>

                                </tr>
                                <tr>
                                    <td>Particulate Matter 10 (PM 10)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.pm10_up!}</td>

                                </tr>
                                <tr>
                                    <td>Carbon Dioxide (CO2)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.co2_up!}</td>

                                </tr>
                                <tr>
                                    <td>Greenhouse Gases (GHG/CO2e)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.co2e_up!}</td>

                                </tr>
                                <tr>
                                    <td style="font-weight: bold">Total</td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td>Carbon Dioxide (CO2)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.co2!+resultEmissionData.co2_up!}</td>

                                </tr>
                                <tr>
                                    <td>Greenhouse Gases (GHG/CO2e)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData.co2e!+resultEmissionData.co2e_up!}</td>

                                </tr>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <table class="table-bordered  table">
                                <tr>
                                    <th>Annualized Emissions (Unit: Lifetime Tonnes)</th>
                                    <th>Fleet1</th>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold">TAILPIPE</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Carbon Monoxide (CO)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.co!}</td>

                                </tr>
                                <tr>
                                    <td>Total Hydrocarbons (THC)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.thc!}</td>

                                </tr>
                                <tr>
                                    <td>Nitrogen Oxide (Nox)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.nox!}</td>

                                </tr>
                                <tr>
                                    <td>Particulate Matter 2.5 (PM 2.5)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.pm25!}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Particulate Matter 10 (PM 10)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.pm10!}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Carbon Dioxide (CO2)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.co2!}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Greenhouse Gases (GHG/CO2e)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.co2e!}</td>

                                </tr>
                                <tr>
                                    <td style="font-weight: bold">UPSTREAM</td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td>Particulate Matter 2.5 (PM 2.5)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.pm25_up!}</td>

                                </tr>
                                <tr>
                                    <td>Particulate Matter 10 (PM 10)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.pm10_up!}</td>

                                </tr>
                                <tr>
                                    <td>Carbon Dioxide (CO2)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.co2_up!}</td>

                                </tr>
                                <tr>
                                    <td>Greenhouse Gases (GHG/CO2e)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.co2e_up!}</td>

                                </tr>
                                <tr>
                                    <td style="font-weight: bold">Total</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Carbon Dioxide (CO2)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.co2!+resultEmissionData2.co2_up!}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Greenhouse Gases (GHG/CO2e)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultEmissionData2.co2e!+resultEmissionData2.co2e_up!}</td>

                                </tr>
                            </table>
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
                            <table class="table-bordered  table">
                                <tr>
                                    <th>Lifetime PV</th>
                                    <th>Fleet1</th>

                                </tr>
                                <tr>
                                    <td>Carbon Monoxide (CO)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData.co!}</td>

                                </tr>
                                <tr>
                                    <td>Total Hydrocarbons (THC)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData.thc!}</td>

                                </tr>
                                <tr>
                                    <td>Nitrogen Oxide (Nox)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData.nox!}</td>

                                </tr>
                                <tr>
                                    <td>Particulate Matter 2.5 (PM 2.5)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData.pm25!}</td>

                                </tr>
                                <tr>
                                    <td>Particulate Matter 10 (PM 10)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData.pm10!}</td>

                                </tr>
                                <tr>
                                    <td>Carbon Dioxide (CO2)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData.co2!}</td>

                                </tr>
                                <tr>
                                    <td>Greenhouse Gases (GHG/CO2e)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData.co2e!}</td>

                                </tr>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <table class="table-bordered table">
                                <tr>
                                    <th>Annualized PV</th>
                                    <th>Fleet1</th>
                                </tr>
                                <tr>
                                    <td>Carbon Monoxide (CO)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData2.co!}</td>

                                </tr>
                                <tr>
                                    <td>Total Hydrocarbons (THC)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData2.thc!}</td>

                                </tr>
                                <tr>
                                    <td>Nitrogen Oxide (Nox)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData2.nox!}</td>

                                </tr>
                                <tr>
                                    <td>Particulate Matter 2.5 (PM 2.5)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData2.pm25!}</td>

                                </tr>
                                <tr>
                                    <td>Particulate Matter 10 (PM 10)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData2.pm10!}</td>

                                </tr>
                                <tr>
                                    <td>Carbon Dioxide (CO2)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData2.co2_up!}</td>

                                </tr>
                                <tr>
                                    <td>Greenhouse Gases (GHG/CO2e)</td>
                                    <td><label type="text" class=""  placeholder=""
                                               style="width:200px;">${resultSocialCostData2.co2e_up!}</td>

                                </tr>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div id="childFleets" class="form-horizontal" style="display: none;">
            <table class="table-bordered  table">
                <thead>
                <tr>
                    <td>Number</td>
                    <td>Fleet</td>
                </tr>
                </thead>
                <tbody id="tbody">

                </tbody>

        </div>
    </div>
</div>

<input type="hidden" id="hidRecordId" value="${inputData.record_id!}">
<table id="hidFleetButton" style="display: none;">
    <tr>
        <td>
            #Number#
        </td>
        <td>
            <a href="/result?id=#RecordId#" target="_blank" class="btn btn-warning btn-fleet">Fleet#Number#</a>
        </td>
    </tr>
</table>
</body>


<script src="../site/js/jquery-2.1.1.min.js"></script>
<script src="../bootstrap-3.3.7/js/bootstrap.js"></script>
<script src="../site/js/result.js?v=1"></script>
</html>