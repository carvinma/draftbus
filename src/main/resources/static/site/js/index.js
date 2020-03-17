$(function () {

    getYears();
    getCountryIds();
    getItemIdsByItemType(3,"#verticleType","#hidVerticleType")
    getItemIdsByItemType(4,"#fuelType","#hidFuelType")
    getItemIdsByItemType(8,"#feLoad","#hidFeLoad")
    getItemIdsByItemType(6,"#opSpeed","#hidOpSpeed")
    getItemIdsByItemType(7,"#maintenance","#hidMaintenance")

    $('#mainBody').on("change", "#countryId", function() {
        var countryId=$("#countryId").val();
        if(countryId!=null){
            getCityIds(countryId);
            getItemIdsByParentIdAndItemType(5,countryId,"#emissionStd","#hidEmissionStd");
        }
    });

    $('#emissionStd').change(function(){
        getEfData();
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
            url: "../api/getItemsByItemType", // 请求发送到TestServlet处
            data: {
                itemType:1
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
            url: "../api/getItemsByParentIdAndItemType", // 请求发送到TestServlet处
            data: {
                itemType:2,
                parentId:countryId
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

    function getItemIdsByParentIdAndItemType(itemType,parentId,elementName,hidElementName) {
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "../api/getItemsByParentIdAndItemType", // 请求发送到TestServlet处
            data: {
                itemType:itemType,
                parentId:parentId
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


    function getEfData() {
        var countryId=$("#countryId").val();
        var cityId=$("#cityId").val();
        var verticleType=$("#verticleType").val();
        var fuelType=$("#fuelType").val();
        var load=$("#feLoad").val();
        $.ajax({
            type: "post",
            async: true, // 异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "../api/getEfData", // 请求发送到TestServlet处
            data: {
                countryId: countryId,
                cityId:cityId,
                verticleType:verticleType,
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
                        if(coFactor==""&&detail.emission=="co"){
                            $("#coFactor").val(factor);
                        }
                        if(thcFactor==""&&detail.emission=="thc"){
                            $("#thcFactor").val(factor);
                        }
                        if(noxFactor==""&&detail.emission=="nox"){
                            $("#noxFactor").val(factor);
                        }
                        if(pm25Factor==""&&detail.emission=="pm25"){
                            $("#pm25Factor").val(factor);
                        }
                        if(pm10Factor==""&&detail.emission=="pm10"){
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
});