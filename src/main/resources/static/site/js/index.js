$(function () {

    getYears();
    getCountryIds();
    //getItemIdsByItemType(3,"#vehicleType","#hidVehicleType")
    //getItemIdsByItemType(4,"#fuelType","#hidFuelType")
    //getItemIdsByItemType(8,"#feLoad","#hidFeLoad")
    //getItemIdsByItemType(6,"#opSpeed","#hidOpSpeed")
    //getItemIdsByItemType(7,"#ac","#hidAc")
    getItemIdsByItemType(9,"#temperature","#hidTemperature")
    getItemIdsByItemType(10,"#humidity","#hidHumidity")
    getItemIdsByItemType(11,"#slope","#hidSlope")

    loadData();
    getChildren();
    function loadData()
    {
        var countryId=$("#hidCountryId").val();
        if(countryId!=""){
            getItemIdsByParentIdAndItemType(countryId,5,"#emissionStd","#hidEmissionStd");
        }
    }
    $('#mainBody').on("change", "#countryId", function() {
        var countryId=$("#countryId").val();
        if(countryId!=null){
            getCityIds(countryId);
            getItemIdsByParentIdAndItemType(countryId,5,"#emissionStd","#hidEmissionStd");
        }
    });
    $('#mainBody').on("change", "#cityId", function() {
        var countryId=$("#countryId").val();
        var cityId=$("#cityId").val();
        if(cityId!=null){
            getVehicleList(countryId,cityId);
        }
    });
    $('#mainBody').on("change", "#vehicleType", function() {
        var countryId=$("#countryId").val();
        var cityId=$("#cityId").val();
        var vehicleType=$("#vehicleType").val();
        if(vehicleType!=null){
            getFuelTypeList(countryId,cityId,vehicleType);
        }
    });
    $('#mainBody').on("change", "#fuelType", function() {
        var countryId=$("#countryId").val();
        var cityId=$("#cityId").val();
        var vehicleType=$("#vehicleType").val();
        var fuelType=$("#fuelType").val();
        if(fuelType!=null){
            getSpeedList(countryId,cityId,vehicleType,fuelType);
        }
    });
    $('#mainBody').on("change", "#opSpeed", function() {
        var countryId=$("#countryId").val();
        var cityId=$("#cityId").val();
        var vehicleType=$("#vehicleType").val();
        var fuelType=$("#fuelType").val();
        var opSpeed=$("#opSpeed").val();
        if(opSpeed!=null){
            getLoadList(countryId,cityId,vehicleType,fuelType,opSpeed);
        }
    });

    $('#emissionStd').change(function(){
        getEfData();
        getFeData();
    });

    $('#mainBody').on("click", "#btnCalc", function() {
        if($("#frm").valid()) {
            calcData(false);
            return;
        }
    });
    $('#mainBody').on("click", "#btnAdd", function() {
        if($("#frm").valid()){
            calcData(true,1);
            return;
        };
    });
    $('#mainBody').on("click", "#btnAdd2", function() {
        if($("#frm").valid()){
            calcData(true,2);
            return;
        };
    });
    $('#mainBody').on("click", "#btnAdd3", function() {
        if($("#frm").valid()){
            calcData(true,3);
            return;
        };
    });



    function getYears() {
        $.ajax({
            type: "POST",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/api/getYears", // 请求发送到TestServlet处
            data: {

            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                if (data.code == 0) {
                    $("#modelYear").html("");
                    var str = "";
                    var length=data.details.length;
                    for (var i = 0; i < data.details.length; i++) {
                        var y=data.details[i];
                        str=str+"<option value='"+y+"'>"+y+"</option>";
                    }
                    $("#modelYear").html(str);
                    $("#modelYear").val(data.details[0]);
                }
            }
        });
    }

    function getCountryIds() {
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            //url: "../api/getItemsByItemType", // 请求发送到TestServlet处
            url:"../api/getCountryList",
            data: {
                //itemType:1
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                var html = "";
                if (data.code == 0) {
                    for (var i = 0; i < data.details.length; i++) {
                        var detail = data.details[i];
                        var option = "<option  value='" + detail.item_id + "'>"
                            + detail.item_name + "</option>";
                        html = html + option;
                    }
                }
                $("#countryId").html(html);
                var curId=$("#hidCountryId").val();
                if(curId!=null){
                    $("#countryId").val(curId);
                }
                var countryId=$("#countryId").val();
                if(countryId!=null){
                    getCityIds(countryId)
                    getItemIdsByParentIdAndItemType(countryId,5,"#emissionStd","#hidEmissionStd");
                }
            }
        });
    }

    function getCityIds(countryId) {
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            //url: "../api/getItemsByParentIdAndItemType", // 请求发送到TestServlet处
            url: "../api/getCityList",
            data: {
                //itemType:2,
                //parentId:countryId
                countryId:countryId
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                var html = "";
                if (data.code == 0) {
                    for (var i = 0; i < data.details.length; i++) {
                        var detail = data.details[i];
                        var option = "<option  value='" + detail.item_id + "'>"
                            + detail.item_name + "</option>";
                        html = html + option;
                    }
                }
                $("#cityId").html(html);
                var cityId=$("#hidCityId").val();
                if(cityId!=""){
                    $("#cityId").val(cityId);
                }
                getMeData();
                getVehicleList(countryId,cityId)
            }
        });
    }

    function getMeData() {
        var countryId=$("#countryId").val();
        var cityId=$("#cityId").val();
        var modelYear=$("#modelYear").val();
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "../api/getMeData", // 请求发送到TestServlet处
            data: {
                countryId: countryId,
                cityId:cityId,
                year:modelYear
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                var discountRate=$("#discountRate").val();
                var socialDiscountRate=$("#socialDiscountRate").val();
                var inflationRate=$("#inflationRate").val();

                if (data.code == 0&& data.details.length>0) {
                    var detail=data.details[0];
                    if(discountRate==""){
                        $("#discountRate").val(detail.discount_rate);
                    }
                    if(socialDiscountRate==""){
                        $("#socialDiscountRate").val(detail.social_discount_rate);
                    }
                    if(inflationRate==""){
                        $("#inflationRate").val(detail.inflation_rate);
                    }
                }
            }
        })
    }


    function getItemIdsByItemType(itemType,elementName,hidElementName) {
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "../api/getItemsByItemType", // 请求发送到TestServlet处
            data: {
                itemType:itemType
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                var html = "";
                if (data.code == 0) {
                    for (var i = 0; i < data.details.length; i++) {
                        var detail = data.details[i];
                        var option = "<option  value='" + detail.item_id + "' data-value='"+detail.item_value+"'>"
                            + detail.item_name + "</option>";
                        html = html + option;
                    }
                }
                $(elementName).html(html);
                var eId=$(hidElementName).val();
                if(eId!=null){
                    $(elementName).val(eId);
                }
            }
        });
    }

    function getItemIdsByParentIdAndItemType(parentId,itemType,elementName,hidElementName) {
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "../api/getItemsByItemType", // 请求发送到TestServlet处
            data: {
                itemType:itemType,
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                var html = "";
                if (data.code == 0) {
                    for (var i = 0; i < data.details.length; i++) {
                        var detail = data.details[i];
                        var option = "<option  value='" + detail.item_id + "' data-value='"+detail.item_value+"'>"
                            + detail.item_name + "</option>";
                        html = html + option;
                    }
                }
                $(elementName).html(html);
                var eId=$(hidElementName).val();
                if(eId!=null){
                    $(elementName).val(eId);
                }
            }
        });
    }


    function getFeData() {
        var countryId=$("#countryId").val();
        var cityId=$("#cityId").val();
        var vehicleType=$("#vehicleType").val();
        var fuelType=$("#fuelType").val();
        var load=$("#feLoad").val();
        var ac=$("#ac").val();
        var opSpeed=$("#opSpeed").val();
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "../api/getFeData", // 请求发送到TestServlet处
            data: {
                countryId: countryId,
                cityId:cityId,
                vehicleType:vehicleType,
                fuelType:fuelType,
                load:load,
                ac:ac,
                opSpeed:opSpeed
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                if (data.code == 0&& data.details.length>0) {
                    var std=$("#emissionStd").find("option:selected").data("value");
                    var i=0;
                    for( i=0;i<data.details.length;i++){
                        var detail=data.details[i];
                        var efficiency=getFuelEfficiency(detail,std);
                        $("#fuelEfficiency").val(efficiency);
                    }

                }
            }
        })
    }

    function getFuelEfficiency(detail,std){
        var result=0;
        if(std=="pre_std"){
            return detail.pre_std;
        }else if(std=="std1"){
            return detail.std1;
        }else if(std=="std2"){
            return detail.std2;
        }else if(std=="std3"){
            return detail.std3;
        }else if(std=="std4"){
            return detail.std4;
        }else if(std=="std5"){
            return detail.std5;
        }else if(std=="std6"){
            return detail.std6;
        }
    }


    function getEfData() {
        var countryId=$("#countryId").val();
        var cityId=$("#cityId").val();
        var vehicleType=$("#vehicleType").val();
        var fuelType=$("#fuelType").val();
        var load=$("#feLoad").val();
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "../api/getEfData", // 请求发送到TestServlet处
            data: {
                countryId: countryId,
                cityId:cityId,
                vehicleType:vehicleType,
                fuelType:fuelType,
                load:load
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                var coFactor=$("#coFactor").val();
                var thcFactor=$("#thcFactor").val();
                var noxFactor=$("#noxFactor").val();
                var pm25Factor=$("#coFactor").val();
                var pm10Factor=$("#thcFactor").val();

                if (data.code == 0&& data.details.length>0) {
                    var std=$("#emissionStd").find("option:selected").data("value");
                    var i=0;
                    for( i=0;i<data.details.length;i++){
                        var detail=data.details[i];
                        var factor=getEfFactor(detail,std);
                        if(detail.emission=="co"){
                            $("#coFactor").val(factor);
                        }
                        if(detail.emission=="thc"){
                            $("#thcFactor").val(factor);
                        }
                        if(detail.emission=="nox"){
                            $("#noxFactor").val(factor);
                        }
                        if(detail.emission=="pm25"){
                            $("#pm25Factor").val(factor);
                        }
                        if(detail.emission=="pm10"){
                            $("#pm10Factor").val(factor);
                        }
                    }

                }
            }
        })
    }

    function getEfFactor(detail,std){
        var result=0;
        if(std=="pre_std"){
            return detail.pre_std;
        }else if(std=="std1"){
            return detail.std1;
        }else if(std=="std2"){
            return detail.std2;
        }else if(std=="std3"){
            return detail.std3;
        }else if(std=="std4"){
            return detail.std4;
        }else if(std=="std5"){
            return detail.std5;
        }else if(std=="std6"){
            return detail.std6;
        }
    }

    function calcData(isAddChild,childType) {
        var url="../api/calc";
        if(isAddChild){
            url="../api/addChild";
        }
        var id = $("#hidRecordId").val();
        var countryId = $("#countryId").val();
        var cityId = $("#cityId").val();
        var modelYear = $("#modelYear").val();

        var temperature = $("#temperature").val();
        var humidity = $("#humidity").val();
        var slope = $("#slope").val();

        var feLoad = $("#feLoad").val();
        var ac = $("#ac").val();

        var vehicleType = $("#vehicleType").val();
        var fuelType = $("#fuelType").val();
        var emissionStd = $("#emissionStd").val();

        var discountRate = delcommafy($("#discountRate").val());
        var socialDiscountRate = delcommafy($("#socialDiscountRate").val());
        var inflationRate = delcommafy($("#inflationRate").val());
        var busNumber = delcommafy($("#busNumber").val());
        var replacementRatio = delcommafy($("#replacementRatio").val());
        var loanTime = delcommafy($("#loanTime").val());
        var vkt = delcommafy($("#vkt").val());
        var operationalYears = delcommafy($("#operationalYears").val());
        var opSpeed = delcommafy($("#opSpeed").val());
        var maintenance = delcommafy($("#maintenance").val());
        var fuelEfficiency = delcommafy($("#fuelEfficiency").val());
       


        var purchasePrice = delcommafy($("#purchasePrice").val());
        var residualValue = delcommafy($("#residualValue").val());
        var downPaymentRate = delcommafy($("#downPaymentRate").val());
        var loanInterestRate = delcommafy($("#loanInterestRate").val());
        var loanTime = delcommafy($("#loanTime").val());
        var procurementSubsidy = delcommafy($("#procurementSubsidy").val());
        var batteryPrice = delcommafy($("#batteryPrice").val());
        var batteryLeasingPrice = delcommafy($("#batteryLeasingPrice").val());
        var batteryContent = delcommafy($("#batteryContent").val());
        var annualLaborCost = delcommafy($("#annualLaborCost").val());
        var fuelPrice = delcommafy($("#fuelPrice").val());
        var fuelCostProjection = delcommafy($("#fuelCostProjection").val());
        var additionalFuelPrice = delcommafy($("#additionalFuelPrice").val());
        var additionalOperationalCost = delcommafy($("#additionalOperationalCost").val());


        var annualMaintenanceCost = delcommafy($("#annualMaintenanceCost").val());
        var annualMaintenanceLaborCost = delcommafy($("#annualMaintenanceLaborCost").val());
        var tires = delcommafy($("#tires").val());
        var tiresFrequency = delcommafy($("#tiresFrequency").val());
        var engineOverhaul = delcommafy($("#engineOverhaul").val());
        var engineOverhaulFrequency = delcommafy($("#engineOverhaulFrequency").val());
        var transmissionOverhaul = delcommafy($("#transmissionOverhaul").val());
        var transmissionOverhaulFrequency = delcommafy($("#transmissionOverhaulFrequency").val());
        var batteryOverhaul = delcommafy($("#batteryOverhaul").val());
        var batteryOverhaulFrequency = delcommafy($("#batteryOverhaulFrequency").val());
        var vehicleRetrofits = delcommafy($("#vehicleRetrofits").val());
        var vehicleRetrofitsFrequency = delcommafy($("#vehicleRetrofitsFrequency").val());

        var additionalMaintenanceCost = delcommafy($("#additionalMaintenanceCost").val());
        var insurance = delcommafy($("#insurance").val());
        var administration = delcommafy($("#administration").val());
        var otherTaxFee = delcommafy($("#otherTaxFee").val());
        var onetimeOverhaulCost=delcommafy($("#onetimeOverhaulCost").val());


        var coFactor = delcommafy($("#coFactor").val());
        var thcFactor = delcommafy($("#thcFactor").val());
        var noxFactor = delcommafy($("#noxFactor").val());
        var pm25Factor = delcommafy($("#pm25Factor").val());
        var pm10Factor = delcommafy($("#pm10Factor").val());
        var co2Factor = delcommafy($("#co2Factor").val());
        var co2eFactor = delcommafy($("#co2eFactor").val());
        var pm25Factor2 = delcommafy($("#pm25Factor2").val());
        var pm10Factor2 = delcommafy($("#pm10Factor2").val());
        var co2Factor2 = delcommafy($("#co2Factor2").val());
        var co2eFactor2 = delcommafy($("#co2eFactor2").val());
        var coFactor3 = delcommafy($("#coFactor3").val());
        var thcFactor3 = delcommafy($("#thcFactor3").val());
        var noxFactor3 = delcommafy($("#noxFactor3").val());
        var pm25Factor3 = delcommafy($("#pm25Factor3").val());
        var pm10Factor3 = delcommafy($("#pm10Factor3").val());
        var co2Factor3 = delcommafy($("#co2Factor3").val());

        var chargerConstruction = delcommafy($("#chargerConstruction").val());
        var chargersNumber = delcommafy($("#chargersNumber").val());
        var procurementCost = delcommafy($("#procurementCost").val());
        var operationalCost = delcommafy($("#operationalCost").val());
        var maintenanceCost = delcommafy($("#maintenanceCost").val());
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: url, // 请求发送到TestServlet处
            data: {
                id:id,
                countryId: countryId,
                cityId: cityId,
                modelYear: modelYear,
                discountRate:discountRate,
                socialDiscountRate:socialDiscountRate,
                inflationRate:inflationRate,
                temperature:temperature,
                humidity:humidity,
                slope:slope,

                ac:ac,
                vehicleType: vehicleType,
                fuelType: fuelType,
                emissionStd: emissionStd,
                busNumber:busNumber,
                replacementRatio:replacementRatio,
                vkt:vkt,
                operationalYears:operationalYears,
                opSpeed:opSpeed,
                maintenance:maintenance,
                feLoad:feLoad,
                fuelEfficiency:fuelEfficiency,


                purchasePrice: purchasePrice,
                residualValue: residualValue,
                downPaymentRate: downPaymentRate,
                loanInterestRate:loanInterestRate,
                loanTime:loanTime,
                procurementSubsidy:procurementSubsidy,
                batteryPrice:batteryPrice,
                batteryLeasingPrice:batteryLeasingPrice,
                batteryContent:batteryContent,
                annualLaborCost:annualLaborCost,
                fuelPrice: fuelPrice,
                fuelCostProjection: fuelCostProjection,
                additionalFuelPrice: additionalFuelPrice,
                additionalOperationalCost:additionalOperationalCost,
                annualMaintenanceCost:annualMaintenanceCost,
                annualMaintenanceLaborCost:annualMaintenanceLaborCost,
                tires: tires,
                tiresFrequency: tiresFrequency,
                engineOverhaul: engineOverhaul,
                engineOverhaulFrequency:engineOverhaulFrequency,
                transmissionOverhaul:transmissionOverhaul,
                transmissionOverhaulFrequency:transmissionOverhaulFrequency,
                batteryOverhaul:batteryOverhaul,
                batteryOverhaulFrequency:batteryOverhaulFrequency,
                vehicleRetrofits:vehicleRetrofits,
                vehicleRetrofitsFrequency:vehicleRetrofitsFrequency,
                additionalMaintenanceCost:additionalMaintenanceCost,
                insurance:insurance,
                administration:administration,
                otherTaxFee:otherTaxFee,


                coFactor: coFactor,
                thcFactor: thcFactor,
                noxFactor: noxFactor,
                pm25Factor:pm25Factor,
                pm10Factor:pm10Factor,
                co2Factor:co2Factor,
                co2eFactor:co2eFactor,
                pm25Factor2:pm25Factor2,
                pm10Factor2:pm10Factor2,
                co2Factor2:co2Factor2,
                co2eFactor2:co2eFactor2,

                coFactor3: coFactor3,
                thcFactor3: thcFactor3,
                noxFactor3: noxFactor3,
                pm25Factor3:pm25Factor3,
                pm10Factor3:pm10Factor3,
                co2Factor3:co2Factor3,

                chargersNumber: chargersNumber,
                procurementCost: procurementCost,
                operationalCost: operationalCost,
                maintenanceCost:maintenanceCost,
                chargerConstruction:chargerConstruction,
                onetimeOverhaulCost:onetimeOverhaulCost

            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                if(data.code==0){
                    if(isAddChild){

                        if(childType==1) {
                            $("#hidChildId").val(data.id);
                            $("#name2").val(data.name);
                            $("#vehicleType2").html($("#vehicleType").html());
                            $("#emissionStd2").html($("#emissionStd").html());
                            $("#fuelType2").html($("#fuelType").html());

                            $("#vkt2").val($("#vkt").val());
                            $("#operationalYears2").val($("#operationalYears").val());
                            $("#busNumber2").val($("#busNumber").val());
                            $("#myModal").modal("show");
                        }else if(childType==2) {
                            $("#hidChildId3").val(data.id);
                            $("#name3").val(data.name);
                            $("#procurementSubsidy2").val($("#procurementSubsidy").val());
                            $("#residualValue2").val($("#residualValue").val());
                            $("#downPaymentRate2").val($("#downPaymentRate").val());
                            $("#loanInterestRate2").val($("#loanInterestRate").val());
                            $("#loanTime2").val($("#loanTime").val());
                            $("#myModal3").modal("show");
                        }else if(childType==3) {
                            $("#hidChildId4").val(data.id);
                            $("#name4").val(data.name);
                            $("#chargersNumber2").val($("#chargersNumber").val());
                            $("#chargerConstruction2").val($("#chargerConstruction").val());
                            $("#procurementCost2").val($("#procurementCost2").val());
                            $("#operationalCost2").val($("#operationalCost").val());
                            $("#maintenanceCost2").val($("#maintenanceCost").val());
                            $("#myModal4").modal("show");
                        }
                }else {
                        var ids="";
                        $("input[name='checkbox']:checked").each(function(){
                            ids=ids+","+$(this).val();
                        });
                        if(ids.length==0){
                            $("#tbody input[name='checkbox']").each(function(){
                                ids=ids+","+$(this).val();
                            });
                        }
                        ids=$("#hidRecordId").val()+ids;
                        window.open("/chart?ids="+ids);

                    }
                }
            }
        })
    }

    function delcommafy(num){
        if(num==undefined || num==null||(num+"").trim()==""){
            return "0";
        }
        num=num.replace(/,/gi,'');
        return num;
        
    }

    function getChildren() {
        var id = $("#hidRecordId").val();
        $.ajax({
            type: "POST",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "/api/getChildren", // 请求发送到TestServlet处
            data: {
                parentId:id
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                if (data.code == 0) {
                    var str = "";
                    var length=data.details.length;
                    $("#tbody").html("");
                    for (var i = 0; i < data.details.length; i++) {
                        var detail=data.details[i];
                        var rId=detail.record_id;
                        var name=detail.name;
                        var hrHtml=$("#hidFleetButton").html();
                        hrHtml=hrHtml.replace(/#Number#/g,i+1);
                        hrHtml=hrHtml.replace(/#RecordId#/g,rId);

                        if(name==""||name==null){
                            hrHtml=hrHtml.replace(/#Name#/g,"Fleet"+(i+1));
                        }else{
                            hrHtml=hrHtml.replace(/#Name#/g,name);
                        }
                        hrHtml=hrHtml.replace("<tbody>","");
                        hrHtml=hrHtml.replace("</tbody>","");
                        $("#tbody").append(hrHtml)
                    }
                }
            }
        });
    }

    $('#mainBody').on("click", "#btnSave", function() {
        if($("#frm2").valid()) {
            saveChildData();
        }
        getChildren();
    });

    $('#mainBody').on("click", "#btnSave3", function() {
        if($("#frm3").valid()) {
            saveChildData2();
        }
        getChildren();
    });

    $('#mainBody').on("click", "#btnSave4", function() {
        if($("#frm4").valid()) {
            saveChildData3();
        }
        getChildren();
    });

    $('#mainBody').on("click", "#btnCompare", function() {
        //var selectCheckbox=$("input[type='checkbox']:checked");
        var arr=$("input[name='checkbox']:checked");
        if(arr.length==0){
            bootoast({
                message: 'please select compare data',
                position:'right-bottom',
                timeout:2
            });
        }else{
            calcData(false);
        }


    });
    $('#mainBody').on("click", ".btn-close", function() {
        getChildren();
    });

    $('#mainBody').on("click", ".delFleet", function() {
        var id=$(this).attr("value");
        $("#hidDeleteId").val(id);
        $("#delModal").modal("show");
    });
    $('#delModal').on("click", "#btnDeleteFleet", function() {
        var id=$("#hidDeleteId").val();
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "../api/delFleet", // 请求发送到TestServlet处
            data: {
                id: id,
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                if(data.code==0){
                    $("#delModal").modal("hide");
                    bootoast({
                        message: 'delete successfully',
                        position:'right-bottom',
                        timeout:2
                    });
                }else{
                    bootoast({
                        message: 'delete failed',
                        position:'right-bottom',
                        timeout:2
                    });
                }
                getChildren();
            }
        });
    });

    function saveChildData() {
        var name = $("#name2").val();
        var vehicleType = $("#vehicleType2").val();
        var fuelType = $("#fuelType2").val();
        var emissionStd = $("#emissionStd2").val();
        var busNumber = delcommafy($("#busNumber2").val());
        var vkt = delcommafy($("#vkt2").val());
        var operationalYears = delcommafy($("#operationalYears2").val());
        var id = $("#hidChildId").val();
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "./api/saveChildData", // 请求发送到TestServlet处
            data: {
                id: id,
                name:name,
                vehicleType: vehicleType,
                fuelType: fuelType,
                emissionStd: emissionStd,
                busNumber:busNumber,
                vkt:vkt,
                operationalYears:operationalYears,
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                if (data.code == 0) {
                    $("#myModal").modal("hide");
                    bootoast({
                        message: 'save successfully',
                        position:'right-bottom',
                        timeout:2
                    });
                }
            }
        });
    }

    function saveChildData2() {
        var name = $("#name3").val();
        var residualValue = delcommafy($("#residualValue2").val());
        var downPaymentRate = delcommafy($("#downPaymentRate2").val());
        var loanInterestRate = delcommafy($("#loanInterestRate2").val());
        var loanTime = delcommafy($("#loanTime2").val());
        var procurementSubsidy = delcommafy($("#procurementSubsidy2").val());
        var id = $("#hidChildId3").val();
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "./api/saveChildData2", // 请求发送到TestServlet处
            data: {
                id: id,
                name:name,
                residualValue: residualValue,
                downPaymentRate: downPaymentRate,
                loanInterestRate:loanInterestRate,
                loanTime:loanTime,
                procurementSubsidy:procurementSubsidy,
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                if (data.code == 0) {
                    $("#myModal3").modal("hide");
                    bootoast({
                        message: 'save successfully',
                        position:'right-bottom',
                        timeout:2
                    });
                }
            }
        });
    }

    function saveChildData3() {
        var name = $("#name4").val();
        var chargerConstruction = delcommafy($("#chargerConstruction2").val());
        var chargersNumber = delcommafy($("#chargersNumber2").val());
        var procurementCost = delcommafy($("#procurementCost2").val());
        var operationalCost = delcommafy($("#operationalCost2").val());
        var maintenanceCost = delcommafy($("#maintenanceCost2").val());
        var id = $("#hidChildId4").val();
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "./api/saveChildData3", // 请求发送到TestServlet处
            data: {
                id: id,
                name:name,
                chargersNumber: chargersNumber,
                procurementCost: procurementCost,
                operationalCost: operationalCost,
                maintenanceCost:maintenanceCost,
                chargerConstruction:chargerConstruction,
            },
            dataType: "json", // 返回数据形式为json
            success: function (data) {
                if (data.code == 0) {
                    $("#myModal4").modal("hide");
                    bootoast({
                        message: 'save successfully',
                        position:'right-bottom',
                        timeout:2
                    });
                }
            }
        });
    }

    function getVehicleList(countryId,cityId) {
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "./api/getVehicleTypeList", // 请求发送到TestServlet处
            data: {
                countryId:countryId,
                cityId:cityId,
            },
            success: function (data) {
                loadListData(data,"#vehicleType","#hidVehicleType");
                var vehicleType=$("#vehicleType").val();
                getFuelTypeList(countryId,cityId,vehicleType);
            }
        });

    }

    function getFuelTypeList(countryId,cityId,vehicleType) {
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "./api/getFuelTypeList", // 请求发送到TestServlet处
            data: {
                countryId:countryId,
                cityId:cityId,
                vehicleType:vehicleType
            },
            success: function (data) {
                loadListData(data,"#fuelType","#hidFuelType");
                var fuelType=$("#fuelType").val();
                getSpeedList(countryId,cityId,vehicleType,fuelType)
            }
        });

    }

    function getSpeedList(countryId,cityId,vehicleType,fuelType) {
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "./api/getSpeedList", // 请求发送到TestServlet处
            data: {
                countryId:countryId,
                cityId:cityId,
                vehicleType:vehicleType,
                fuelType:fuelType
            },
            success: function (data) {
                loadListData(data,"#opSpeed","#hidOpSpeed");
                var opSpeed=$("#opSpeed").val();
                getLoadList(countryId,cityId,vehicleType,fuelType,opSpeed)
            }
        });

    }

    function getLoadList(countryId,cityId,vehicleType,fuelType,opSpeed) {
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "./api/getLoadList", // 请求发送到TestServlet处
            data: {
                countryId:countryId,
                cityId:cityId,
                vehicleType:vehicleType,
                fuelType:fuelType,
                opSpeed:opSpeed
            },
            success: function (data) {
                loadListData(data,"#feLoad","#hidFeLoad");
                var load=$("#feLoad").val();
                getAcList(countryId,cityId,vehicleType,fuelType,opSpeed,load);
            }
        });

    }
    function getAcList(countryId,cityId,vehicleType,fuelType,opSpeed,load) {
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "./api/getAcList", // 请求发送到TestServlet处
            data: {
                countryId:countryId,
                cityId:cityId,
                vehicleType:vehicleType,
                fuelType:fuelType,
                opSpeed:opSpeed,
                load:load
            },
            success: function (data) {
                loadListData(data,"#ac","#hidAc");

            }
        });

    }



    function loadListData(data,elementName,hidElementName){
        var html = "";
        if (data.code == 0) {
            for (var i = 0; i < data.details.length; i++) {
                var detail = data.details[i];
                var option = "<option  value='" + detail.item_id + "' data-value='"+detail.item_value+"'>"
                    + detail.item_name + "</option>";
                html = html + option;
            }
        }
        $(elementName).html(html);
        var eId=$(hidElementName).val();
        if(eId!=null){
            $(elementName).val(eId);
        }
    }
});