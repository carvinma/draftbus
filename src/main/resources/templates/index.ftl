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

<div class="row" id="mainBody" style="font-family: georgia,serif!important;">
    <div class="col-md-10 col-md-offset-1">
        <form class="form-horizontal" id="frm">
            <div class="form-horizontal" style="margin-top: 20px;">
                <div class="form-group">
                    <label data-toggle="tooltip" title="If your country is not listed, you can select a country as a resemblance." for="" class="col-sm-3 control-label">Country<span class="required">*</span></label>
                    <div class="col-sm-3">
                        <select name="countryId" required class="form-control" lay-verify="" id="countryId"
                                style="display: block;width:200px;">
                        </select>
                    </div>
                    <label data-toggle="tooltip" title="If your city is not listed, you can select one city or “general” as a resemblance." for="" class="col-sm-3 control-label">City</label>
                    <div class="col-sm-3">
                        <select name="cityId"  class="form-control" lay-verify="" id="cityId"
                                style="display: block;width:200px;">
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label data-toggle="tooltip" title="A discount rate is the rate of return used to discount future cash flows back to their present value." for="" class="col-sm-3 control-label">Discount rate (%)<span class="required">*</span></label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" required name="discountRate" id="discountRate" placeholder=""
                               style="width:200px;" value="${inputData.discount_rate!}">
                    </div>
                    <label data-toggle="tooltip" title="Social discount rate (SDR) is the discount rate used in computing the value of funds spent on social projects. There is wide diversity in SDRs, with developed nations typically applying a lower rate (3-7%) than developing nations (8-15%)."  for="" class="col-sm-3 control-label">Social discount rate (%)<span
                            class="required">*</span></label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" required name="socialDiscountRate" id="socialDiscountRate" placeholder=""
                               style="width:200px;" value="${inputData.social_discount_rate!}">
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Bus Fleet Information</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label data-toggle="tooltip" title="The available bus size in the drop-down list depends on available default data in the city or country selected. More will be included in next version. " for="" class="col-sm-3 control-label">Bus size<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" required lay-verify="" id="vehicleType" name="vehicleType"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label data-toggle="tooltip" title="Input the number for a certain fleet." for="" class="col-sm-3 control-label">Number of buses<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="busNumber" name="busNumber" placeholder=""
                                       style="width:200px;" value="${busFleet.bus_number!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="The available fuel type in the drop-down list depends on available default data in the city or country selected. More will be included in next version." for="" class="col-sm-3 control-label">Fuel type<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" required lay-verify="" id="fuelType" name="fuelType"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label data-toggle="tooltip" title="Input the typical useful life of the buses in this bus type. This should reflect the length of time after which buses must be retired or are sold for reuse." for="" class="col-sm-3 control-label">Operational years<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="operationalYears" id="operationalYears" placeholder=""
                                       style="width:200px;" value="${busFleet.operational_years!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="The Tool only specifies European emission standards based on data availability and to reduce the complexity of the Tool. Some countries may have their own emission standards but are not reflected in the Tool. Users can refer to 3.2.3 of the technical note for more information. " for="" class="col-sm-3 control-label">Emission standard<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <select class="form-control" required lay-verify="" id="emissionStd" name="emissionStd"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label data-toggle="tooltip" title="Input the (average) annual distance each bus travels for this bus type." for="" class="col-sm-3 control-label">Annual distance traveled
                                 (VKT)(km/year/bus)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="vkt" placeholder="" name="vkt"
                                       style="width:200px;" value="${busFleet.vkt!}">
                            </div>
                        </div>

                        <div class="form-group">

                            <label data-toggle="tooltip" title="Fuel consumption by certain distance traveled." for="" class="col-sm-3 control-label">Fuel efficiency (<span id="fuelUnit" >L/100 km</span>)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" id="fuelEfficiency" name="fuelEfficiency" placeholder=""
                                       style="width:200px;" value="${busFleet.fuel_efficiency!}">
                            </div>
                        </div>



                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"> Cost Factors <button class="btn btn-primary" style="margin-left: 60px;" type="button" id="fillCostFactor">Use default values</button>
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
                            <label data-toggle="tooltip" title="Input the cost to buy one of the buses in this bus type, including all taxes and deductions that may be applied toward the base price." for="" class="col-sm-3 control-label">Purchase price ($/bus)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="purchasePrice" placeholder="" name="purchasePrice"
                                       style="width:200px;"  required value="${costFactor.purchase_price!}">
                            </div>
                            <label data-toggle="tooltip" title="Input the total cost to hire drivers for this bus type. Any factors taken into account in this response should also be included in subsequent bus types and fleets to remain consistent." for="" class="col-sm-3 control-label">Annual total labor cost ($/bus/year)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="annualLaborCost" placeholder="" name="annualLaborCost"
                                       style="width:200px;"  required value="${costFactor.annual_labor_cost!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="Input the subsidies that can be applied to this type of bus, if not already included in the purchase price." for="" class="col-sm-3 control-label">Procurement subsidy ($/bus)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="procurementSubsidy" id="procurementSubsidy" placeholder=""
                                       style="width:200px;"  required value="${costFactor.procurement_subsidy!}">
                            </div>
                            <label data-toggle="tooltip" title="Input the current fuel cost for this bus type." for="" class="col-sm-3 control-label">Fuel price (<span class="fuelPriceUnit">$/L</span>)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="fuelPrice" id="fuelPrice" placeholder=""
                                       style="width:200px;"  required value="${costFactor.fuel_price!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="Input the expected residual value of this bus type." for="" class="col-sm-3 control-label">Residual value (%)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="residualValue" id="residualValue" placeholder=""
                                       style="width:200px;"  required value="${costFactor.residual_value!}">
                            </div>
                            <label data-toggle="tooltip" title="Input the projected annual increase or decrease of fuel for this bus type." for="" class="col-sm-3 control-label">Fuel cost projection (%)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control"  name="fuelCostProjection" id="fuelCostProjection" placeholder=""
                                       style="width:200px;"  required value="${costFactor.fuel_cost_projection!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="Input the percentage required as a down payment for a loan to finance this bus type." for="" class="col-sm-3 control-label">Down payment (%)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="downPaymentRate" placeholder=""
                                       style="width:200px;" name="downPaymentRate"  required value="${costFactor.down_payment_rate!}">
                            </div>
                            <label data-toggle="tooltip" title="Input the cost for any fuel additive, charging service fee, etc. " for="" class="col-sm-3 control-label">Additional fuel price (<span class="fuelPriceUnit">$/L</span>)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="additionalFuelPrice" id="additionalFuelPrice" placeholder=""
                                       style="width:200px;"  required value="${costFactor.additional_fuel_price!}">
                            </div>


                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="Input the yearly interest rate that this bus type's loan will have." for="" class="col-sm-3 control-label">Loan interest rate (%)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="loanInterestRate" id="loanInterestRate" placeholder=""
                                       style="width:200px;"  required value="${costFactor.loan_interest_rate!}">
                            </div>
                            <label data-toggle="tooltip" title="Input any other operations costs that weren't covered in the previous categories. Any factors included in this response should also be included in subsequent bus types and fleets to remain consistent.Battery leasing costs can be included in this category." for="" class="col-sm-3 control-label">Additional operational costs to
                                include ($/bus)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="additionalOperationalCost" id="additionalOperationalCost" placeholder=""
                                       style="width:200px;"  required value="${costFactor.additional_operation_cost!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="Input the expected term of the loan." for="" class="col-sm-3 control-label">Loan time (years)<span class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text"  required class="form-control" name="loanTime" id="loanTime" placeholder=""
                                       style="width:200px;" value="${costFactor.loan_time!}">
                            </div>
                            <label data-toggle="tooltip" title="Input any insurance for this bus type." for="" class="col-sm-3 control-label">Insurance ($/bus)<span class="required">*</span></label>
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
                            <label data-toggle="tooltip" title="Input the average maintenance cost for one bus under this bus type. If the maintenance is not in-house, but based on contract, then the contract costs should be included here." for="" class="col-sm-3 control-label">Annual general maintenance
                                cost ($/bus/year)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="annualMaintenanceCost" id="annualMaintenanceCost" placeholder=""
                                       style="width:200px;"   value="${costFactor.annual_maintenance_cost!}">
                            </div>
                            <label data-toggle="tooltip" title="Input any over-arching indirect costs that weren't covered in the previous categories, but are important to include for the correct cost calculation of a certain fleet. " for="" class="col-sm-3 control-label">Administration ($/year)</label>
                            <div class="col-sm-3">
                                <input type="text"  class="form-control"  name="administration" id="administration" placeholder=""
                                       style="width:200px;" value="${costFactor.administration!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="Input the total cost to hire maintenance labors for this bus type. Any factors taken into account in this response should also be included in subsequent bus types and fleets to remain consistent." for="" class="col-sm-3 control-label">Annual maintenance labor
                                cost ($/bus/year)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="annualMaintenanceLaborCost" id="annualMaintenanceLaborCost" placeholder=""
                                       style="width:200px;"   value="${costFactor.annual_maintenance_labor_cost!}">
                            </div>
                            <label data-toggle="tooltip" title="Input any additional tax and fees that weren't covered in the previous categories, but are important to include for the correct cost calculation of a certain fleet." for="" class="col-sm-3 control-label">Other taxes and fees ($/bus/year)</label>
                            <div class="col-sm-3">
                                <input type="text"  class="form-control" name="otherTaxFee" id="otherTaxFee" placeholder=""
                                       style="width:200px;" value="${costFactor.other_tax_fee!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="Input any other maintenance costs that weren't covered in the previous categories. " for="" class="col-sm-3 control-label">Additional maintenance costs to
                                include ($/bus/year) </label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="additionalMaintenanceCost" id="additionalMaintenanceCost" placeholder=""
                                       style="width:200px;"   value="${costFactor.additional_maintenance_cost!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="The Tool assumes only one overhaul during the total lifespan of a bus, if there is one needed. It largely depends on the operator’s contract with the manufacturer, and the operator’s decision of whether to replace key parts, or replace the whole vehicle at once.

The cost of battery replacement, or engine overhaul can be included here for electric bus, and other ICE buses.
" for="" class="col-sm-3 control-label">One-time overhaul cost ($/bus)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="onetimeOverhaulCost" id="onetimeOverhaulCost" placeholder=""
                                       style="width:200px;"   value="${costFactor.onetime_overhaul_cost!}">
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label style="text-align: left;font-weight:800;font-size:16px;" for="" class="col-sm-6 control-label">Infrastructure</label>
                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="" for="" class="col-sm-3 control-label">Charger construction costs ($)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="chargerConstruction" name="chargerConstruction"placeholder=""
                                       style="width:200px;" value="${inputData.charger_construction!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="" for="" class="col-sm-3 control-label">Number of chargers</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="chargersNumber" id="chargersNumber" placeholder=""
                                       style="width:200px;" value="${inputData.chargers_number!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="" for="" class="col-sm-3 control-label">Procurement costs ($)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="procurementCost" id="procurementCost" placeholder=""
                                       style="width:200px;" value="${inputData.procurement_cost!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="" for="" class="col-sm-3 control-label">Operation costs ($/year)</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="operationalCost" id="operationalCost" placeholder=""
                                       style="width:200px;" value="${inputData.operational_cost!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label data-toggle="tooltip" title="" for="" class="col-sm-3 control-label">Maintenance costs ($/year)</label>
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
                    <h3 data-toggle="tooltip" title="Emission factors (EFs) include tailpipe emissions (tank-to-wheel) and upstream (well-to-tank) emissions. "  class="panel-title">Emissions Factors <button type="button" class="btn btn-primary" style="margin-left: 20px;" id="fillEmissionCostFactor">Use default values</button><a style="float:right;color: #337ab7;text-decoration: underline;" class="openPanel" role="button" data-toggle="collapse"  href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">unfold
                    </a>
                    </h3>
                </div>
                <div class="panel-body panel-collapse collapse" id="collapseTwo" >
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label data-toggle="tooltip" title="The default data are collected by bus length, fuel type and emission standard, when such data are available for tailpipe emissions. Tailpipe emission factors cover air pollutants emissions and carbon emissions for all types of buses. Electric bus has zero tailpipe emissions in this Tool." style="text-align: center;" for="" class="col-sm-6 control-label">TAILPIPE</label>
                            <label data-toggle="tooltip" title="Upstream emission factors are collected for different fuels, including emission factors of fossil fuel production processes, and grid emission factors, which account for emissions generated by electricity used when operating electric buses. Upstream emission factors cover carbon emissions for all types of buses." style="text-align: center;" for="" class="col-sm-6 control-label">UPSTREAM</label>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Carbon monoxide (CO) (g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="coFactor"  id="coFactor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Greenhouse gases (GHGs/CO<sub>2</sub>e) (g/kWh)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="co2eFactor2" id="co2eFactor2" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co2e_up!}">
                            </div>
                            <label style="display: none" for="" class="col-sm-3 control-label">Fine particulate matter (PM2.5) (g/kWh)<span
                                    class="required">*</span></label>
                            <div style="display: none" class="col-sm-3">
                                <input type="text" required class="form-control" name="pm25Factor2" id="pm25Factor2" placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm25_up!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Total hydrocarbons (THC) (g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="thcFactor" id="thcFactor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.thc!}">
                            </div>
                            <label for="" class="col-sm-3 control-label">Carbon dioxide (CO<sub>2</sub>) (g/kWh)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="co2Factor2" id="co2Factor2" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co2_up!}">
                            </div>
                            <label style="display: none" for="" class="col-sm-3 control-label">Coarse particulate matter (PM10) (g/kWh)<span
                                    class="required">*</span></label>
                            <div style="display: none" class="col-sm-3">
                                <input type="text" required class="form-control" name="pm10Factor2" id="pm10Factor2"  placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm10_up!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Nitrogen oxides (NO<sub>x</sub>) (g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="noxFactor" id="noxFactor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.nox!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label  for="" class="col-sm-3 control-label">Fine particulate matter (PM2.5) (g/km)<span
                                    class="required">*</span></label>
                            <div  class="col-sm-3">
                                <input type="text" required class="form-control" name="pm25Factor" id="pm25Factor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm25!}">
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Coarse particulate matter (PM10) (g/km)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="pm10Factor" id="pm10Factor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.pm10!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Carbon dioxide (CO<sub>2</sub>) (g/L)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="co2Factor" id="co2Factor" placeholder=""
                                       style="width:200px;" value="${emissionFactor.co2!}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Greenhouse gases (GHGs/CO<sub>2</sub>e) (g/L)<span
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
                    <h3 data-toggle="tooltip" title="This Tool defines social cost as the costs of external impacts. Social costs factors are collected for each type of air pollutant and measure the total social cost per unit mass of each pollutant (in US$/tonne) at national level. " class="panel-title">Social Cost Factors  <button class="btn btn-primary" style="margin-left: 20px;" type="button" id="fillSocialCostFactor">Use default values</button> <a style="float:right;color: #337ab7;text-decoration: underline;" class="openPanel" role="button" data-toggle="collapse"  href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">unfold
                    </a></h3>
                </div>
                <div class="panel-body panel-collapse collapse" id="collapseThree" >
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Carbon monoxide (CO)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="coFactor3" id="coFactor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.co!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Total hydrocarbons (THC)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="thcFactor3" id="thcFactor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.thc!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Nitrogen oxides (NO<sub>x</sub>)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="noxFactor3" id="noxFactor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.nox!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Fine particulate matter (PM2.5)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="pm25Factor3" id="pm25Factor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.pm25!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Coarse particulate matter (PM10)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="pm10Factor3" id="pm10Factor3" placeholder=""
                                       style="width:200px;" value="${socialCostFactor.pm10!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Carbon dioxide (CO<sub>2</sub>)<span
                                    class="required">*</span></label>
                            <div class="col-sm-3">
                                <input type="text" required class="form-control" name="co2Factor3" id="co2Factor3"placeholder=""
                                       style="width:200px;" value="${socialCostFactor.co2!}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Advanced Features   <a style="float:right;color: #337ab7;text-decoration: underline;" class="openPanel" role="button" data-toggle="collapse"  href="#collapseFour" aria-expanded="true" aria-controls="collapseFour">unfold
                    </a></h3>
                </div>
                <div class="panel-body panel-collapse collapse" id="collapseFour" >
                    <div class="form-horizontal">
                        <div class="form-group" style="display: none;">
                            <label for="" class="col-sm-3 control-label">Temperature </label>
                            <div class="col-sm-3">
                                <select class="form-control" lay-verify="" id="temperature" name="temperature"
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
                            <label for="" class="col-sm-3 control-label">Average speed (km/h)</label>
                            <div class="col-sm-3">
                                <select class="form-control"  lay-verify="" id="opSpeed" name="opSpeed"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label data-toggle="tooltip" title="Replacement ratio refers to the ratio between electric bus - or a bus with more advanced technology - and the traditional ICE bus it replaced to get the same level of service. Ideally, the ratio is 1:1. We recommend users to use 1:1 – 2:1 to represent different scenarios and technology readiness." for="" class="col-sm-3 control-label">Replacement ratio</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control"  id="replacementRatio" name="replacementRatio" placeholder="" min="1" max="2"
                                       style="width:200px;" value="${busFleet.replacement_ratio!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">Load </label>
                            <div class="col-sm-3">
                                <select class="form-control"  lay-verify="" id="feLoad" name="feLoad"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                            <label for="" class="col-sm-3 control-label">Air conditioning </label>
                            <div class="col-sm-3">
                                <select class="form-control"  lay-verify="" id="ac" name="ac"
                                        style="display: block;width:200px;">
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div style="display: none" id="tempHiden">
                <label for="" class="col-sm-3 control-label">Altitude/slope </label>
                <div class="col-sm-3">
                    <select class="form-control" lay-verify="" id="slope" name="slope"
                            style="display: block;width:200px;">
                    </select>
                </div>

                <label for="" class="col-sm-3 control-label">Inflation rate(%)</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" disabled name="inflationRate" id="inflationRate" placeholder=""
                           style="width:200px;" value="${inputData.inflation_rate!}">
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
<table id="hidMaster" style="display: none">
    <tr>
        <td><input type="checkbox" name="checkbox" value="${masterId}" style="zoom:150%"></td>
        <td>
            1
        </td>
        <td>
            <span>${masterName}</span>
        </td>
        <td></td>
    </tr>
</table>


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
        <td><a href="/child?id=#RecordId#"  class="btn btn-primary editFleet" value="#RecordId#">edit</a>
            <button type="button" class="btn btn-danger delFleet" value="#RecordId#">delete</button></td>
    </tr>
</table>
<div class="modal fade large" tabindex="-1" role="dialog"  id="myModal">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Input Your Data</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="frm2">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Fleet name<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input class="form-control" required lay-verify="" id="name2" name="name2"
                                    >
                            </input>
                        </div>
                        <label for="" class="col-sm-4 control-label">Bus size<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <select class="form-control" required lay-verify="" id="vehicleType2" name="vehicleType2"
                                    >
                            </select>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Number of buses<span
                                class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" required class="form-control" id="busNumber2" name="busNumber2" placeholder=""
                            >
                        </div>
                        <label for="" class="col-sm-4 control-label">Operational years<span
                                class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" required class="form-control" id="operationalYears2" name="operationalYears2" placeholder=""
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
                <h4 class="modal-title">Input Your Data</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="frm3">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Fleet Name<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input class="form-control" required lay-verify="" id="name3" name="name3"
                                    >
                            </input>
                        </div>
                        <label for="" class="col-sm-4 control-label">Procurement subsidy ($/bus)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="procurementSubsidy2" placeholder="" name="procurementSubsidy2"
                                    required >
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Residual value (%)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="residualValue2" placeholder="" name="residualValue2"
                                    required value="${costFactor.residual_value!}">
                        </div>
                        <label for="" class="col-sm-4 control-label">Down payment (%)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="downPaymentRate2" placeholder="" name="downPaymentRate2"
                                   required ">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Loan interest rate (%)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="loanInterestRate2" placeholder="" name="loanInterestRate2"
                                    required ">
                        </div>
                        <label for="" class="col-sm-4 control-label">Loan time (years)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text"  required class="form-control" id="loanTime2" placeholder="" name="loanTime2"
                                    >
                        </div>
                    </div>
                    <div class="form-group">
                        <label  for="" class="col-sm-4 control-label">Additional operational costs to
                            include ($/bus)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="additionalOperationalCost2" id="additionalOperationalCost2" placeholder=""
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
                <h4 class="modal-title">Input Your Data</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="frm4">
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Fleet Name<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input class="form-control" required lay-verify="" id="name4" name="name4"
                                    >
                            </input>
                        </div>
                        <label for="" class="col-sm-4 control-label">Charger construction costs ($)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="chargerConstruction2" placeholder="" name="chargerConstruction2"
                                    >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Number of chargers</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="chargersNumber2" placeholder="" name="chargersNumber2"
                                    >
                        </div>
                        <label for="" class="col-sm-4 control-label">Procurement costs ($)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="procurementCost2" placeholder="" name="procurementCost2"
                                    >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">Operation costs ($/year)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="operationalCost2" placeholder="" name="operationalCost2"
                                    >
                        </div>
                        <label for="" class="col-sm-4 control-label">Maintenance costs ($/year)</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="maintenanceCost2" placeholder="" name="maintenanceCost2"
                                    >
                        </div>
                    </div>
                    <div class="form-group">
                        <label  for="" class="col-sm-4 control-label">Fuel price (<span class="fuelPriceUnit">$/L</span>)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="fuelPrice2" id="fuelPrice2" placeholder=""
                                     >
                        </div>
                        <label  for="" class="col-sm-4 control-label">Additional fuel price (<span class="fuelPriceUnit">$/L</span>)<span class="required">*</span></label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="additionalFuelPrice2" id="additionalFuelPrice2" placeholder=""
                                   >
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
<script src="../site/js/index.js?v=6"></script>
</html>