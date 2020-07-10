package com.bteplus.draftbus.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bteplus.draftbus.common.AverageCapitalPlusInterestUtils;
import com.bteplus.draftbus.common.NPVCalcUtils;
import com.bteplus.draftbus.common.OperatingCostCalcUtils;
import com.bteplus.draftbus.common.PMTCalcUtils;
import com.bteplus.draftbus.entity.*;
import com.bteplus.draftbus.model.BarResult;
import com.bteplus.draftbus.model.ChartResult;
import com.bteplus.draftbus.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
@RequestMapping(value="/api")
public class ApiController {

    @Autowired
    ItemInfoRepository itemInfoRepository;

    @Autowired
    MeDataRepository meDataRepository;

    @Autowired
    EfDataRepository efDataRepository;

    @Autowired
    FeDataRepository feDataRepository;

    @Autowired
    InputDataRepository inputDataRepository;

    @Autowired
    InputBusFleetRepository inputBusFleetRepository;

    @Autowired
    InputCostFactorRepository inputCostFactorRepository;

    @Autowired
    InputEmissionFactorRepository inputEmissionFactorRepository;

    @Autowired
    InputSocialCostFactorRepository inputSocialCostFactorRepository;

    @Autowired
    ResultDataRepository resultDataRepository;

    @Autowired
    ResultEmissionDataRepository resultEmissionDataRepository;

    @Autowired
    ResultSocialCostDataRepository resultSocialCostDataRepository;

    @Autowired
    BusCostRepository busCostRepository;

    @Autowired
    SocialCostFactorRepository socialCostFactorRepository;

    @Autowired
    GhgDataRepository ghgDataRepository;

    @RequestMapping(value="/abc")
    public String abc(){

        return "abc";
    }

    @RequestMapping(value="/getYears")
    public Map<String,Object> getYears(){
        Map<String,Object> map=new HashMap<String,Object>();
        Calendar calendar = Calendar.getInstance();
        Integer year=calendar.get(Calendar.YEAR);
        Integer i=year-2;
        List<Integer> lst=new ArrayList<>();
        while(year>=i){
            lst.add(year);
            year--;
        }
        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/getItemsByItemType")
    public Map<String,Object> getItemsByItemType(Integer itemType){
        Map<String,Object> map=new HashMap<String,Object>();
        List<ItemInfo> lst=itemInfoRepository.getItemsByItemType(itemType);
        map.put("code",0);
        map.put("details",lst);
        return map;
    }
    @RequestMapping(value="/getItemIdsByParentIdAndItemType")
    public Map<String,Object> getItemsByParentId(Integer parentId,Integer itemType){
        Map<String,Object> map=new HashMap<String,Object>();
        String unit="CN";
        List<ItemInfo> lst=itemInfoRepository.getItemsByParentIdAndItemType(parentId,itemType);
        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/getItemIdsByUnitAndItemType")
    public Map<String,Object> getItemsByParentId(String unit,Integer itemType){
        Map<String,Object> map=new HashMap<String,Object>();
        //String unit="CN";
        List<ItemInfo> lst=itemInfoRepository.getItemsByUnitAndItemType(unit,itemType);
        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/getMeData")
    public Map<String,Object> getMeData(Integer countryId,Integer cityId,Integer year){
        Map<String,Object> map=new HashMap<String,Object>();
        List<Map<String,Double>> lst=meDataRepository.getMeData(countryId,cityId,year);
        if (lst.isEmpty()) {
            lst=meDataRepository.getMeData(countryId,null,null);
        }else{
            Map<String,Double> detail=lst.get(0);
            if(detail.get("discount_rate").doubleValue()<=0){
                lst=meDataRepository.getMeData(countryId,null,null);
            }
        }
        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/getEfData")
    public Map<String,Object> getEfData(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType, Integer ac,Integer load,Integer opSpeed){
        Map<String,Object> map= new HashMap<>();
        List<Map<String,Object>> lst=efDataRepository.getEfData(countryId,cityId,vehicleType,fuelType,ac,load,opSpeed);
        if(lst.size()==0){
            lst=efDataRepository.getEfData(countryId,cityId,vehicleType,fuelType,null,null,null);
            if(lst.size()==0){
                lst=efDataRepository.getEfData(countryId,cityId,null,fuelType,null,null,null);
                if(lst.size()==0){
                    lst=efDataRepository.getEfData(countryId,null,null,fuelType,null,null,null);
                }
            }
        }
        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/getFeData")
    public Map<String,Object> getFeData(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType,Integer ac,Integer load,Integer opSpeed,String std){
        Map<String,Object> map=new HashMap<String,Object>();
        List<Map<String,Object>> lst=feDataRepository.getFeData(countryId,cityId,vehicleType,fuelType,ac,load,opSpeed);
        System.out.println("11111111111111");
        if(lst.isEmpty()){
            System.out.println("222222222222222222");
            lst=feDataRepository.getFeData(countryId,cityId,vehicleType,fuelType,null,null,null);
            if(lst.isEmpty()){
                System.out.println("333333333333333333333333");
                lst=feDataRepository.getFeData(countryId,cityId,null,fuelType,null,null,null);
                if(lst.isEmpty()){
                    System.out.println("44444444444444444");
                    lst=feDataRepository.getFeData(countryId,null,null,fuelType,null,null,null);
                }
            }
        }
        Double result=0.0;
        if(!lst.isEmpty()){
            System.out.println("5555555555555555555");
            System.out.println(lst.size());
            result=getFuelEfficiency(lst.get(0),std);
        }
        map.put("code",0);
        map.put("result",result);
        return map;
    }
    private Double getFuelEfficiency(Map<String,Object> detail,String std){
        System.out.println(JSON.toJSON(detail));

        Double result=0.0;
        result=Double.parseDouble(detail.get(std).toString());
        if(result<=0){
            result=Double.parseDouble(detail.get("avg_value").toString());
            System.out.println("avg_value:"+result);
        }
        if(result<=0){
            int ct=0;

            double preStd=Double.parseDouble(detail.get("pre_std").toString());
            double std1=Double.parseDouble(detail.get("std1").toString());
            double std2=Double.parseDouble(detail.get("std2").toString());
            double std3=Double.parseDouble(detail.get("std3").toString());
            double std4=Double.parseDouble(detail.get("std4").toString());
            double std5=Double.parseDouble(detail.get("std5").toString());
            double std6=Double.parseDouble(detail.get("std6").toString());
            double eev=Double.parseDouble(detail.get("eev").toString());
            double avg=Double.parseDouble(detail.get("avg_value").toString());

            if(preStd>0){
                ct=ct+1;
            }
            if(std1>0){
                ct=ct+1;
            }
            if(std2>0){
                ct=ct+1;
            }
            if(std3>0){
                ct=ct+1;
            }
            if(std4>0){
                ct=ct+1;
            }
            if(std5>0){
                ct=ct+1;
            }
            if(std6>0){
                ct=ct+1;
            }
            if(eev>0){
                ct=ct+1;
            }
            if(avg>0){
                ct=ct+1;
            }
            double sum=preStd+std1+std2+std3+std4+std5+std6+eev+avg;
            if(ct>0){
                result=sum/ct;
            }
            System.out.println("sum:"+sum);
            System.out.println("ct:"+ct);
            System.out.println("avg_value2:"+result);
        }

        return result;
    }


    @RequestMapping(value="/calc")
    public Map<String,Object> calcAllData(Integer id,Integer modelYear,Integer countryId,Integer cityId,Double discountRate,Double socialDiscountRate,Double inflationRate,Integer temperature,Integer humidity,Integer slope,Integer age,Integer vehicleType,Integer fuelType, Integer emissionStd,Integer busNumber,Double replacementRatio, Double vkt,Integer operationalYears, Integer opSpeed,Integer ac,Integer feLoad,Double fuelEfficiency,Double  purchasePrice,Double downPaymentRate, Double procurementSubsidy, Double residualValue,Double loanInterestRate,Integer loanTime,Double chargerConstruction,Double procurementCost,Integer chargersNumber,Double batteryPrice,Double batteryLeasingPrice,Double batteryContent,
                                       Double annualLaborCost,Double fuelPrice,Double fuelCostProjection, Double additionalOperationalCost,Double additionalFuelPrice,Double annualMaintenanceLaborCost,
                                       Double annualMaintenanceCost, Double tires,Integer tiresFrequency,Double engineOverhaul,Integer engineOverhaulFrequency, Double transmissionOverhaul,Integer transmissionOverhaulFrequency,Double batteryOverhaul,Integer batteryOverhaulFrequency, Double vehicleRetrofits,Integer vehicleRetrofitsFrequency,Double additionalMaintenanceCost,Double insurance,Double administration,Double otherTaxFee,
                                       Double coFactor,Double thcFactor,Double noxFactor,Double pm25Factor,Double pm10Factor,Double co2Factor,Double co2eFactor,Double pm25Factor2,Double pm10Factor2,Double co2Factor2,Double co2eFactor2, Double coFactor3,Double thcFactor3,Double noxFactor3,Double pm25Factor3,Double pm10Factor3,Double co2Factor3,
                                       Double operationalCost,Double maintenanceCost,Double onetimeOverhaulCost
    ){
        Map<String,Object> map= new HashMap<>();


        calcData(id,modelYear,countryId,cityId,discountRate,socialDiscountRate,inflationRate,temperature,humidity,slope,age,vehicleType,fuelType, emissionStd,busNumber,replacementRatio, vkt,operationalYears, opSpeed,ac,feLoad,fuelEfficiency, purchasePrice,downPaymentRate, procurementSubsidy, residualValue,loanInterestRate,loanTime,chargerConstruction,procurementCost,chargersNumber,batteryPrice,batteryLeasingPrice,batteryContent,
                annualLaborCost,fuelPrice,fuelCostProjection, additionalOperationalCost,additionalFuelPrice,annualMaintenanceLaborCost,
                annualMaintenanceCost, tires,tiresFrequency,engineOverhaul,engineOverhaulFrequency, transmissionOverhaul,transmissionOverhaulFrequency,batteryOverhaul,batteryOverhaulFrequency, vehicleRetrofits,vehicleRetrofitsFrequency,additionalMaintenanceCost,insurance,administration,otherTaxFee,
                coFactor,thcFactor,noxFactor,pm25Factor,pm10Factor,co2Factor,co2eFactor,pm25Factor2,pm10Factor2,co2Factor2,co2eFactor2, coFactor3,thcFactor3,noxFactor3,pm25Factor3,pm10Factor3,co2Factor3,
                operationalCost,maintenanceCost,onetimeOverhaulCost
        );

        List<Integer> lst=inputDataRepository.getChildren(id);
        System.out.println("children:"+lst.size());
        for(int i=0;i<lst.size();i++){
            InputData inputData=inputDataRepository.getOne(lst.get(i));
            InputBusFleet busFleet=inputBusFleetRepository.getOne(lst.get(i));
            InputCostFactor costFactor=inputCostFactorRepository.getOne(lst.get(i));
            InputSocialCostFactor socialCostFactor=inputSocialCostFactorRepository.getOne(lst.get(i));
            InputEmissionFactor emissionFactor=inputEmissionFactorRepository.getOne(id);

            modelYear=inputData.getCalc_year();
            countryId=inputData.getCountry_id();
            cityId=inputData.getCity_id();
            discountRate=inputData.getDiscount_rate();
            socialDiscountRate=inputData.getSocial_discount_rate();
            inflationRate=inputData.getInflation_rate();
            temperature=inputData.getTemperature();
            humidity=inputData.getHumidity();
            slope=inputData.getSlope();

            age=busFleet.getAge();
            vehicleType=busFleet.getVehicle_type();
            fuelType=busFleet.getFuel_type();
            emissionStd=busFleet.getEmission_std();
            busNumber=busFleet.getBus_number();
            replacementRatio=busFleet.getReplacement_ratio();
            vkt=busFleet.getVkt();
            operationalYears=busFleet.getOperational_years();
            opSpeed=busFleet.getOp_speed();
            ac=busFleet.getAc();
            fuelEfficiency=busFleet.getFuel_efficiency();

            purchasePrice=costFactor.getPurchase_price();
            downPaymentRate=costFactor.getDown_payment_rate();
            procurementSubsidy=costFactor.getProcurement_subsidy();
            residualValue=costFactor.getResidual_value();
            loanInterestRate=costFactor.getLoan_interest_rate();
            loanTime=costFactor.getLoan_time();
            chargerConstruction=inputData.getCharger_construction();
            procurementCost=inputData.getProcurement_cost();
            chargersNumber=inputData.getChargers_number();
            batteryPrice=0.0;
            batteryLeasingPrice=0.0;
            batteryContent=0.0;
            annualLaborCost=costFactor.getAnnual_labor_cost();
            fuelPrice=costFactor.getFuel_price();
            fuelCostProjection=costFactor.getFuel_cost_projection();
            additionalOperationalCost=costFactor.getAdditional_operation_cost();
            additionalFuelPrice=costFactor.getAdditional_fuel_price();

            annualMaintenanceLaborCost=costFactor.getAnnual_maintenance_labor_cost();
            annualMaintenanceCost=costFactor.getAnnual_maintenance_cost();
            tires=0.0;
            tiresFrequency=0;
            engineOverhaul=0.0;
            engineOverhaulFrequency=0;
            transmissionOverhaul=0.0;
            transmissionOverhaulFrequency=0;
            batteryOverhaul=0.0;
            batteryOverhaulFrequency=0;
            vehicleRetrofits=0.0;
            vehicleRetrofitsFrequency=0;

            additionalMaintenanceCost=costFactor.getAdditional_maintenance_cost();
            insurance=costFactor.getInsurance();
            administration=costFactor.getAdministration();
            otherTaxFee=costFactor.getOther_tax_fee();

            coFactor=emissionFactor.getCo();
            thcFactor=emissionFactor.getThc();
            noxFactor=emissionFactor.getNox();
            pm25Factor=emissionFactor.getPm25();
            pm10Factor=emissionFactor.getPm10();
            co2Factor=emissionFactor.getCo2();
            co2eFactor=emissionFactor.getCo2e();
            pm25Factor2=emissionFactor.getPm25_up();
            pm10Factor2=emissionFactor.getPm10_up();
            co2Factor2=emissionFactor.getCo2_up();
            co2eFactor2=emissionFactor.getCo2e_up();

            coFactor3=socialCostFactor.getCo();
            thcFactor3=socialCostFactor.getThc();
            noxFactor3=socialCostFactor.getNox();
            pm25Factor3=socialCostFactor.getPm25();
            pm10Factor3=socialCostFactor.getPm10();
            co2Factor3=socialCostFactor.getCo2();

            operationalCost=inputData.getOperational_cost();
            maintenanceCost=inputData.getOperational_cost();
            onetimeOverhaulCost=costFactor.getOnetime_overhaul_cost();

            calcData(inputData.getRecord_id(),modelYear,countryId,cityId,discountRate,socialDiscountRate,inflationRate,temperature,humidity,slope,age,vehicleType,fuelType, emissionStd,busNumber,replacementRatio, vkt,operationalYears, opSpeed,ac,feLoad,fuelEfficiency, purchasePrice,downPaymentRate, procurementSubsidy, residualValue,loanInterestRate,loanTime,chargerConstruction,procurementCost,chargersNumber,batteryPrice,batteryLeasingPrice,batteryContent,
                    annualLaborCost,fuelPrice,fuelCostProjection, additionalOperationalCost,additionalFuelPrice,annualMaintenanceLaborCost,
                    annualMaintenanceCost, tires,tiresFrequency,engineOverhaul,engineOverhaulFrequency, transmissionOverhaul,transmissionOverhaulFrequency,batteryOverhaul,batteryOverhaulFrequency, vehicleRetrofits,vehicleRetrofitsFrequency,additionalMaintenanceCost,insurance,administration,otherTaxFee,
                    coFactor,thcFactor,noxFactor,pm25Factor,pm10Factor,co2Factor,co2eFactor,pm25Factor2,pm10Factor2,co2Factor2,co2eFactor2, coFactor3,thcFactor3,noxFactor3,pm25Factor3,pm10Factor3,co2Factor3,
                    operationalCost,maintenanceCost,onetimeOverhaulCost);
        }
        map.put("code",0);
        map.put("id",id);
        return map;
    }
    
    
    
    


    private Map<String,Object> calcData(Integer id,Integer modelYear,Integer countryId,Integer cityId,Double discountRate,Double socialDiscountRate,Double inflationRate,Integer temperature,Integer humidity,Integer slope,Integer age,Integer vehicleType,Integer fuelType, Integer emissionStd,Integer busNumber,Double replacementRatio, Double vkt,Integer operationalYears, Integer opSpeed,Integer ac,Integer feLoad,Double fuelEfficiency,Double  purchasePrice,Double downPaymentRate, Double procurementSubsidy, Double residualValue,Double loanInterestRate,Integer loanTime,Double chargerConstruction,Double procurementCost,Integer chargersNumber,Double batteryPrice,Double batteryLeasingPrice,Double batteryContent,
                                        Double annualLaborCost,Double fuelPrice,Double fuelCostProjection, Double additionalOperationalCost,Double additionalFuelPrice,Double annualMaintenanceLaborCost,
                                        Double annualMaintenanceCost, Double tires,Integer tiresFrequency,Double engineOverhaul,Integer engineOverhaulFrequency, Double transmissionOverhaul,Integer transmissionOverhaulFrequency,Double batteryOverhaul,Integer batteryOverhaulFrequency, Double vehicleRetrofits,Integer vehicleRetrofitsFrequency,Double additionalMaintenanceCost,Double insurance,Double administration,Double otherTaxFee,
                                        Double coFactor,Double thcFactor,Double noxFactor,Double pm25Factor,Double pm10Factor,Double co2Factor,Double co2eFactor,Double pm25Factor2,Double pm10Factor2,Double co2Factor2,Double co2eFactor2, Double coFactor3,Double thcFactor3,Double noxFactor3,Double pm25Factor3,Double pm10Factor3,Double co2Factor3,
                                        Double operationalCost,Double maintenanceCost,Double onetimeOverhaulCost
    ){
        Map<String,Object> map= new HashMap<>();
        inflationRate=inflationRate/100;
        downPaymentRate=downPaymentRate/100;
        residualValue=residualValue/100;
        discountRate=discountRate/100;
        loanInterestRate=loanInterestRate/100;
        socialDiscountRate=socialDiscountRate/100;
        fuelCostProjection=fuelCostProjection/100;

        double totalBusCost=purchasePrice*busNumber;
        double downPayment=totalBusCost*downPaymentRate;
        double busResidualValue=purchasePrice*residualValue;
        double busResidualNPV=busResidualValue/Math.pow(1+discountRate,operationalYears);
        Integer numberOfPayment=loanTime;

        double subsidy=procurementSubsidy*busNumber;
        double infrastructureCost=(chargerConstruction+procurementCost)*chargersNumber;
        double loanAmout=totalBusCost-downPayment-subsidy;
        double annualPayment=PMTCalcUtils.calculatePMT(loanInterestRate,numberOfPayment*12,loanAmout);
        double totalCostLoan=annualPayment*numberOfPayment;
        double totalInterest=totalCostLoan-loanAmout;

        System.out.println("totalBusCost:"+String.valueOf(totalBusCost));
        System.out.println("downPayment:"+String.valueOf(downPayment));
        System.out.println("subsidy:"+String.valueOf(subsidy));
        System.out.println("loanAmout:"+String.valueOf(loanAmout));
        System.out.println("loanInterestRate:"+String.valueOf(loanInterestRate));
        System.out.println("numberOfPayment:"+String.valueOf(numberOfPayment));

        double financialNPV=NPVCalcUtils.calcNPV(discountRate,AverageCapitalPlusInterestUtils.getPerYearInterest(loanAmout,loanInterestRate,numberOfPayment));
        double capitalNPV=NPVCalcUtils.calcNPV(discountRate,AverageCapitalPlusInterestUtils.getPerYearPrincipal(loanAmout,loanInterestRate,numberOfPayment));
        double procurementNPV=financialNPV+capitalNPV;
        double annualizedFinancialCost=financialNPV/operationalYears;
        double annualizedCapitalCost=capitalNPV/operationalYears;
        double annualizedTotalProcurementCost=annualizedFinancialCost+annualizedCapitalCost;

        System.out.println("financialNPV:"+String.valueOf(financialNPV));
        System.out.println("capitalNPV:"+String.valueOf(capitalNPV));

        //operation
        double laborCost=annualLaborCost*busNumber;
        double fixedAnnualMaintenanceCost=annualMaintenanceCost*busNumber;
        double fuelCostRate=fuelPrice;
        double fuelAdditive=additionalFuelPrice;
        double fuelStationMaintenance=maintenanceCost;
        double fuelStationCostperationCost=operationalCost;
        double insuranceTotal=insurance*busNumber;
        double additionalOperationalCostTotal=additionalOperationalCost*busNumber;
        double additionalMaintenanceCostTotal=additionalMaintenanceCost*busNumber;
        Double[] fuelCostResults=OperatingCostCalcUtils.calcFuelCosts(vkt,busNumber,fuelEfficiency,fuelCostRate,fuelCostProjection,fuelAdditive,operationalYears);
        double fixedMaintenanceCosts = OperatingCostCalcUtils.calcFixedMaintenanceCost(fixedAnnualMaintenanceCost,laborCost,additionalMaintenanceCostTotal,fuelStationMaintenance);
        Double[] operatingCostResults=OperatingCostCalcUtils.calcOperatingCost(laborCost,fuelStationCostperationCost,insuranceTotal,additionalOperationalCostTotal,fuelCostResults);

        Double[] laborCostResults=new Double[operationalYears];
        Double[] maintenanceCostResults=new Double[operationalYears];
        Double[] omCostResults=new Double[operationalYears];
        double totalOperatingCost=0;
        double totalLaborCost=0;
        double totalFuelCost=0;
        double totalMaintenceCost=0;
        double totalOMCost=0;

        for(int i=0;i<operationalYears;i++){
            totalOperatingCost=totalOperatingCost+operatingCostResults[i];
            laborCostResults[i]=laborCost;
            maintenanceCostResults[i]=fixedMaintenanceCosts;
            omCostResults[i]=laborCost+fuelCostResults[i]+fixedMaintenanceCosts;
        }
        double operatingNPV=NPVCalcUtils.calcNPV(discountRate,operatingCostResults);
        System.out.println("operatingNPV"+String.valueOf(operatingNPV));

        double laborCostNPV=NPVCalcUtils.calcNPV(discountRate,laborCostResults);
        System.out.println("laborCostNPV"+String.valueOf(laborCostNPV));

        double fuelCostNPV=NPVCalcUtils.calcNPV(discountRate,fuelCostResults);
        System.out.println("fuelCostNPV"+String.valueOf(fuelCostNPV));

        double maintenanceCostNPV=NPVCalcUtils.calcNPV(discountRate,maintenanceCostResults);
        System.out.println("maintenanceCostNPV"+String.valueOf(maintenanceCostNPV));

        double omCostNPV=NPVCalcUtils.calcNPV(discountRate,omCostResults);
        System.out.println("omCostNPV"+String.valueOf(omCostNPV));





        double coTotal=coFactor*vkt*busNumber*operationalYears;
        double thcTotal=thcFactor*vkt*busNumber*operationalYears;
        double noxTotal=noxFactor*vkt*busNumber*operationalYears;
        double pm25Total=pm25Factor*vkt*busNumber*operationalYears;
        double pm10Total=pm10Factor*vkt*busNumber*operationalYears;
        double co2Total=co2Factor*vkt*busNumber*operationalYears;
        double co2eTotal=co2eFactor*vkt*busNumber*operationalYears;

        double pm25Total2=pm25Factor2*vkt*busNumber*operationalYears;
        double pm10Total2=pm10Factor2*vkt*busNumber*operationalYears;
        double co2Total2=co2Factor2*vkt*busNumber*operationalYears;
        double co2eTotal2=co2eFactor2*vkt*busNumber*operationalYears;

        ResultData resultData=new ResultData();
        ResultEmissionData resultEmissionData=new ResultEmissionData();
        ResultSocialCostData resultSocialCostData=new ResultSocialCostData();

        InputData inputData=inputDataRepository.getOne(id);
        InputCostFactor costFactor=inputCostFactorRepository.getOne(id);
        InputBusFleet busFleet=inputBusFleetRepository.getOne(id);
        InputEmissionFactor emissionFactor=inputEmissionFactorRepository.getOne(id);
        InputSocialCostFactor socialCostFactor=inputSocialCostFactorRepository.getOne(id);

        inputData.setCalc_year(modelYear);
        inputData.setCharger_construction(chargerConstruction);
        inputData.setChargers_number(chargersNumber);
        inputData.setCity_id(cityId);
        inputData.setCountry_id(countryId);
        inputData.setDiscount_rate(discountRate*100);
        inputData.setInflation_rate(inflationRate*100);
        inputData.setMaintenance_cost(maintenanceCost);
        inputData.setOperational_cost(operationalCost);
        inputData.setProcurement_cost(procurementCost);
        inputData.setSocial_discount_rate(socialDiscountRate*100);
        inputData.setTemperature(temperature);
        inputData.setHumidity(humidity);
        inputData.setSlope(slope);
        inputData.setExchange_rate(0.0);
        System.out.println("before id ="+id);
        inputData=inputDataRepository.save(inputData);
        System.out.println("after id ="+inputData.getRecord_id());

        emissionFactor.setCo(coFactor);
        emissionFactor.setCo2(co2Factor);
        emissionFactor.setThc(thcFactor);
        emissionFactor.setPm25(pm25Factor);
        emissionFactor.setPm10(pm10Factor);
        emissionFactor.setCo2e(co2eFactor);
        emissionFactor.setNox(noxFactor);
        emissionFactor.setPm25_up(pm25Factor2);
        emissionFactor.setPm10_up(pm10Factor2);
        emissionFactor.setCo2_up(co2Factor2);
        emissionFactor.setCo2e_up(co2eFactor2);
        emissionFactor.setRecord_id(inputData.getRecord_id());
        inputEmissionFactorRepository.save(emissionFactor);

        socialCostFactor.setCo(coFactor3);
        socialCostFactor.setCo2(co2Factor3);
        socialCostFactor.setThc(thcFactor3);
        socialCostFactor.setPm25(pm25Factor3);
        socialCostFactor.setPm10(pm10Factor3);
        socialCostFactor.setNox(noxFactor3);
        socialCostFactor.setRecord_id(inputData.getRecord_id());
        inputSocialCostFactorRepository.save(socialCostFactor);

        busFleet.setBus_number(busNumber);
        busFleet.setAge(age);
        busFleet.setVehicle_type(vehicleType);
        busFleet.setEmission_std(emissionStd);
        busFleet.setFuel_efficiency(fuelEfficiency);
        busFleet.setFuel_type(fuelType);
        busFleet.setAc(ac);
        busFleet.setFe_load(feLoad);
        busFleet.setOp_speed(opSpeed);
        busFleet.setOperational_years(operationalYears);
        busFleet.setVkt(vkt);
        busFleet.setReplacement_ratio(replacementRatio);
        busFleet.setRecord_id(inputData.getRecord_id());
        inputBusFleetRepository.save(busFleet);

        costFactor.setAdditional_fuel_price(additionalFuelPrice);
        costFactor.setAdditional_maintenance_cost(additionalMaintenanceCost);
        costFactor.setAdditional_operation_cost(additionalOperationalCost);
        costFactor.setAdministration(administration);
        costFactor.setAnnual_labor_cost(annualLaborCost);
        costFactor.setAnnual_maintenance_cost(annualMaintenanceCost);
        costFactor.setAnnual_maintenance_labor_cost(annualMaintenanceLaborCost);
        costFactor.setBattery_content(batteryContent);
        costFactor.setBattery_leasing_price(batteryLeasingPrice);
        costFactor.setBattery_overhaul(batteryOverhaul);
        costFactor.setBattery_overhaul_frequency(batteryOverhaulFrequency);
        costFactor.setBattery_price(batteryPrice);
        costFactor.setDown_payment_rate(downPaymentRate*100);
        costFactor.setEngine_overhaul(engineOverhaul);
        costFactor.setEngine_overhaul_frequency(engineOverhaulFrequency);
        costFactor.setFuel_cost_projection(fuelCostProjection*100);
        costFactor.setFuel_price(fuelPrice);
        costFactor.setInsurance(insurance);
        costFactor.setLoan_interest_rate(loanInterestRate*100);
        costFactor.setLoan_time(loanTime);
        costFactor.setProcurement_subsidy(procurementSubsidy);
        costFactor.setPurchase_price(purchasePrice);
        costFactor.setResidual_value(residualValue*100);
        costFactor.setTires(tires);
        costFactor.setTires_frequency(tiresFrequency);
        costFactor.setTransmission_overhaul(transmissionOverhaul);
        costFactor.setTransmission_overhaul_frequency(transmissionOverhaulFrequency);
        costFactor.setVehicle_retrofits(vehicleRetrofits);
        costFactor.setVehicle_retrofits_frequency(vehicleRetrofitsFrequency);
        costFactor.setOther_tax_fee(otherTaxFee);
        costFactor.setRecord_id(inputData.getRecord_id());
        costFactor.setOnetime_overhaul_cost(onetimeOverhaulCost);
        inputCostFactorRepository.save(costFactor);

        System.out.println(financialNPV);
        System.out.println(capitalNPV);
        resultData.setFinancial_cost_npv(financialNPV);
        resultData.setCapital_cost_npv(capitalNPV);
        resultData.setFuel_cost_npv(fuelCostNPV);
        resultData.setLabor_cost_npv(laborCostNPV);
        resultData.setMaintenance_cost_npv(maintenanceCostNPV);
        resultData.setOverhaul_cost_npv(0.00);
        resultData.setOthers_operational_cost_npv(operatingNPV-laborCostNPV-fuelCostNPV);
        resultData.setRecord_id(inputData.getRecord_id());
        resultDataRepository.save(resultData);

        resultEmissionData.setCo(coTotal);
        resultEmissionData.setCo2(co2Total);
        resultEmissionData.setPm10(pm10Total);
        resultEmissionData.setPm25(pm25Total);
        resultEmissionData.setThc(thcTotal);
        resultEmissionData.setNox(noxTotal);
        resultEmissionData.setCo2e(co2eTotal);
        resultEmissionData.setCo2_up(co2Total2);
        resultEmissionData.setCo2e_up(co2eTotal2);
        resultEmissionData.setPm10_up(pm10Total2);
        resultEmissionData.setPm25_up(pm25Total2);
        resultEmissionData.setRecord_id(inputData.getRecord_id());
        resultEmissionDataRepository.save(resultEmissionData);

        resultSocialCostData.setCo(coTotal*coFactor3);
        resultSocialCostData.setCo2(co2Total*co2Factor3);
        resultSocialCostData.setPm10(pm10Total*pm10Factor3);
        resultSocialCostData.setPm25(pm25Total*pm25Factor3);
        resultSocialCostData.setThc(thcTotal*thcFactor3);
        resultSocialCostData.setNox(noxTotal*noxFactor3);
        resultSocialCostData.setRecord_id(inputData.getRecord_id());
        resultSocialCostDataRepository.save(resultSocialCostData);

        map.put("code",0);
        map.put("id",inputData.getRecord_id());
        return map;
    }

    @RequestMapping(value="/getChildren")
    public Map<String,Object> getChildren(Integer parentId){
        Map<String,Object> map= new HashMap<>();
        List<InputData> lst=inputDataRepository.getChildrenData(parentId);
        map.put("code",0) ;
        map.put("details" ,lst);
        return map;
    }
    @RequestMapping(value="/addChild")
    public Map<String,Object> addChild(Integer id,Integer modelYear,Integer countryId,Integer cityId,Double discountRate,Double socialDiscountRate,Double inflationRate,Integer temperature,Integer humidity,Integer slope,Integer age,Integer vehicleType,Integer fuelType, Integer emissionStd,Integer busNumber,Double replacementRatio, Double vkt,Integer operationalYears, Integer opSpeed,Integer ac,Integer feLoad,Double fuelEfficiency,Double  purchasePrice,Double downPaymentRate, Double procurementSubsidy, Double residualValue,Double loanInterestRate,Integer loanTime,Double chargerConstruction,Double procurementCost,Integer chargersNumber,Double batteryPrice,Double batteryLeasingPrice,Double batteryContent,
                                       Double annualLaborCost,Double fuelPrice,Double fuelCostProjection, Double additionalOperationalCost,Double additionalFuelPrice,Double annualMaintenanceLaborCost,
                                       Double annualMaintenanceCost, Double tires,Integer tiresFrequency,Double engineOverhaul,Integer engineOverhaulFrequency, Double transmissionOverhaul,Integer transmissionOverhaulFrequency,Double batteryOverhaul,Integer batteryOverhaulFrequency, Double vehicleRetrofits,Integer vehicleRetrofitsFrequency,Double additionalMaintenanceCost,Double insurance,Double administration,Double otherTaxFee,
                                       Double coFactor,Double thcFactor,Double noxFactor,Double pm25Factor,Double pm10Factor,Double co2Factor,Double co2eFactor,Double pm25Factor2,Double pm10Factor2,Double co2Factor2,Double co2eFactor2, Double coFactor3,Double thcFactor3,Double noxFactor3,Double pm25Factor3,Double pm10Factor3,Double co2Factor3,
                                       Double operationalCost,Double maintenanceCost,Double onetimeoverhoulCost)
    {
        calcData(id,modelYear,countryId,cityId,discountRate,socialDiscountRate,inflationRate,temperature,humidity,slope,age,vehicleType,fuelType, emissionStd,busNumber,replacementRatio, vkt,operationalYears, opSpeed,ac,feLoad,fuelEfficiency, purchasePrice,downPaymentRate, procurementSubsidy, residualValue,loanInterestRate,loanTime,chargerConstruction,procurementCost,chargersNumber,batteryPrice,batteryLeasingPrice,batteryContent,
                annualLaborCost,fuelPrice,fuelCostProjection, additionalOperationalCost,additionalFuelPrice,annualMaintenanceLaborCost,
                annualMaintenanceCost, tires,tiresFrequency,engineOverhaul,engineOverhaulFrequency, transmissionOverhaul,transmissionOverhaulFrequency,batteryOverhaul,batteryOverhaulFrequency, vehicleRetrofits,vehicleRetrofitsFrequency,additionalMaintenanceCost,insurance,administration,otherTaxFee,
                coFactor,thcFactor,noxFactor,pm25Factor,pm10Factor,co2Factor,co2eFactor,pm25Factor2,pm10Factor2,co2Factor2,co2eFactor2, coFactor3,thcFactor3,noxFactor3,pm25Factor3,pm10Factor3,co2Factor3,
                operationalCost,maintenanceCost,onetimeoverhoulCost
        );
        Map<String,Object> map= new HashMap<>();
        List<Integer> lst=inputDataRepository.getChildren(id);
        InputData inputDat2=inputDataRepository.getOne(id);
        String strJson= JSON.toJSONString(inputDat2);
        JSONObject json=JSONObject.parseObject(strJson);
        json.put("record_id",null);
        InputData inputData=JSON.parseObject(json.toJSONString(),InputData.class);
        inputData.setParent_id(id);
        inputData.setName("Fleet"+(lst.size()+2));
        inputData=inputDataRepository.save(inputData);


        InputBusFleet busFleet2=inputBusFleetRepository.getOne(id);
        strJson= JSON.toJSONString(busFleet2);
        json=JSONObject.parseObject(strJson);
        json.put("record_id",null);
        InputBusFleet busFleet=JSON.parseObject(json.toJSONString(),InputBusFleet.class);

        InputEmissionFactor emissionFactor2=inputEmissionFactorRepository.getOne(id);
        strJson= JSON.toJSONString(emissionFactor2);
        json=JSONObject.parseObject(strJson);
        json.put("record_id",null);
        InputEmissionFactor emissionFactor=JSON.parseObject(json.toJSONString(),InputEmissionFactor.class);

        InputSocialCostFactor socialCostFactor2=inputSocialCostFactorRepository.getOne(id);
        strJson= JSON.toJSONString(socialCostFactor2);
        json=JSONObject.parseObject(strJson);
        json.put("record_id",null);
        InputSocialCostFactor socialCostFactor=JSON.parseObject(json.toJSONString(),InputSocialCostFactor.class);

        InputCostFactor costFactor2=inputCostFactorRepository.getOne(id);
        strJson= JSON.toJSONString(costFactor2);
        json=JSONObject.parseObject(strJson);
        json.put("record_id",null);
        InputCostFactor costFactor=JSON.parseObject(json.toJSONString(),InputCostFactor.class);

        busFleet.setRecord_id(inputData.getRecord_id());
        socialCostFactor.setRecord_id(inputData.getRecord_id());
        emissionFactor.setRecord_id(inputData.getRecord_id());
        costFactor.setRecord_id(inputData.getRecord_id());

        busFleet=inputBusFleetRepository.save(busFleet);
        emissionFactor=inputEmissionFactorRepository.save(emissionFactor);
        socialCostFactor=inputSocialCostFactorRepository.save(socialCostFactor);
        costFactor=inputCostFactorRepository.save(costFactor);


        map.put("code",0) ;
        map.put("id" ,inputData.getRecord_id());
        map.put("number",lst.size()+2);
        map.put("name",inputData.getName());
        return map;
    }
    @RequestMapping(value="/saveChildData")
    public Map<String,Object> saveChild(Integer id,String name,Integer vehicleType,Integer fuelType, Integer emissionStd,Integer busNumber, Double vkt,Integer operationalYears) {
        Map<String,Object> map= new HashMap<>();
        if(id!=null) {
            InputBusFleet busFleet = inputBusFleetRepository.getOne(id);
            busFleet.setVehicle_type(vehicleType);
            busFleet.setFuel_type(fuelType);
            busFleet.setEmission_std(emissionStd);
            busFleet.setVkt(vkt);
            busFleet.setOperational_years(operationalYears);
            busFleet.setBus_number(busNumber);
            inputBusFleetRepository.save(busFleet);

            InputData inputData=inputDataRepository.getOne(id);
            inputData.setName(name);
            inputDataRepository.save(inputData);
        }

        map.put("code",0) ;
        return map;
    }
    @RequestMapping(value="/saveChildData2")
    public Map<String,Object> saveChild2(Integer id,String name,Double downPaymentRate, Double procurementSubsidy, Double residualValue,Double loanInterestRate,Integer loanTime) {
        Map<String,Object> map= new HashMap<>();
        if(id!=null) {
            InputCostFactor costFactor=inputCostFactorRepository.getOne(id);
            costFactor.setLoan_interest_rate(loanInterestRate*100);
            costFactor.setLoan_time(loanTime);
            costFactor.setProcurement_subsidy(procurementSubsidy);
            costFactor.setResidual_value(residualValue*100);
            costFactor.setDown_payment_rate(downPaymentRate);
            inputCostFactorRepository.save(costFactor);

            InputData inputData=inputDataRepository.getOne(id);
            inputData.setName(name);
            inputDataRepository.save(inputData);
        }

        map.put("code",0) ;
        return map;
    }

    @RequestMapping(value="/saveChildData3")
    public Map<String,Object> saveChild3(Integer id,String name,Double chargerConstruction,Double procurementCost,Integer chargersNumber,Double operationalCost,Double maintenanceCost) {
        Map<String,Object> map= new HashMap<>();
        if(id!=null) {
            InputData inputData=inputDataRepository.getOne(id);
            inputData.setName(name);
            inputData.setCharger_construction(chargerConstruction);
            inputData.setChargers_number(chargersNumber);
            inputData.setMaintenance_cost(maintenanceCost);
            inputData.setOperational_cost(operationalCost);
            inputData.setProcurement_cost(procurementCost);
            inputDataRepository.save(inputData);
        }

        map.put("code",0) ;
        return map;
    }

    @RequestMapping(value="/delFleet")
    public Map<String,Object> delFleet(Integer id){
        Map<String,Object> map= new HashMap<>();
        map.put("code",0) ;
        try{
            InputData inputData=inputDataRepository.getOne(id);
            if(inputData!=null) {
                inputDataRepository.deleteById(id);
                inputBusFleetRepository.deleteById(id);
                inputCostFactorRepository.deleteById(id);
                inputSocialCostFactorRepository.deleteById(id);
                inputEmissionFactorRepository.deleteById(id);
                ResultData resultData = resultDataRepository.findById(id).orElse(null);
                System.out.println(resultData);
                if (resultData != null) {
                    resultDataRepository.deleteById(id);
                    resultSocialCostDataRepository.deleteById(id);
                    resultEmissionDataRepository.deleteById(id);
                }
            }
        }catch (Exception ex){
            map.put("code",1);
            System.out.println(ex.getMessage());
        }
        return map;
    }

    @RequestMapping(value="/getCompareData")
    public Map<String,Object> getCompareData(String ids) {
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        List<Integer> lst=new ArrayList<>();
        String[] strs=ids.split(",");
        for (String item:strs) {
            lst.add(Integer.valueOf(item));
        }



        map.put("data1",getResultData(lst,1));
        map.put("data2",getResultData(lst,2));
        map.put("data3",getResultData(lst,3));
        return map;
    }


    private ChartResult getResultData(List<Integer> ids,Integer resultType){
        ChartResult chartResult=new ChartResult();
        List<String> legendList=new ArrayList<>();
        List<String> categoryList=new ArrayList<>();
        List<BarResult> dataList=new ArrayList<>();
        List<Map<String,Object>> resultDataList=null;
        if(resultType.intValue()==1){
            resultDataList=resultDataRepository.getCompareData(ids);
        }else if(resultType.intValue()==2){
            resultDataList=resultEmissionDataRepository.getCompareData(ids);
        }else if(resultType.intValue()==3){
            resultDataList=resultSocialCostDataRepository.getCompareData(ids);
        }
        int length=ids.size();

        Map<String,Object> result1=resultDataList.get(0);
        for (String key:result1.keySet()) {
            legendList.add(key);
        }
        legendList.remove("name");
        legendList.remove("record_id");
        for(int i=0;i<length;i++){
            Map<String,Object> result=resultDataList.get(i);
            categoryList.add(result.get("name").toString());
        }

        int legendSize=legendList.size();
        for(int i=0;i<legendSize;i++){
            String name=legendList.get(i);
            BarResult barResult=new BarResult();
            barResult.setName(name);
            List<Object> lst=new ArrayList<>();
            for(int j=0;j<length;j++){
                Map<String,Object> result=resultDataList.get(j);
                lst.add(result.get(name));
            }
            barResult.setData(lst);
            if(resultType.intValue()==3){
                barResult.setStack("cc3");
            }

            dataList.add(barResult);
        }



        chartResult.setCategoryData(categoryList);
        chartResult.setLegendData(legendList);
        chartResult.setData(dataList);
        return chartResult;

    }

    @RequestMapping(value="/getCountryList")
    public Map<String,Object> getCountryList(){
        Map<String,Object> map=new HashMap<String,Object>();
        List<ItemInfo> lst=itemInfoRepository.getCountryList();
        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/getCityList")
    public Map<String,Object> getCityList(Integer countryId){
        Map<String,Object> map=new HashMap<String,Object>();
        List<ItemInfo> lst=itemInfoRepository.getCityList(countryId);
        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/getVehicleTypeList")
    public Map<String,Object> getVehicleTypeList(Integer countryId,Integer cityId){
        Map<String,Object> map=new HashMap<String,Object>();
        List<ItemInfo> lst=itemInfoRepository.getVehicleTypeList(countryId,cityId);
        if(lst.isEmpty()){
            lst=itemInfoRepository.getVehicleTypeList(countryId,null);
        }
        map.put("code",0);
        map.put("details",lst);
        return map;
    }
    @RequestMapping(value="/getFuelTypeList")
    public Map<String,Object> getFuelTypeList(Integer countryId,Integer cityId,Integer vehicleType){
        Map<String,Object> map=new HashMap<String,Object>();
        List<ItemInfo> lst=itemInfoRepository.getFuelTypeList(countryId,cityId,vehicleType);
        if(lst.isEmpty()){
            lst=itemInfoRepository.getFuelTypeList(countryId,null,null);
        }
        map.put("code",0);
        map.put("details",lst);
        return map;
    }
    @RequestMapping(value="/getSpeedList")
    public Map<String,Object> getSpeedList(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType){
        Map<String,Object> map=new HashMap<String,Object>();
        List<ItemInfo> lst=itemInfoRepository.getSpeedList(countryId,cityId,vehicleType,fuelType);
        if(lst.isEmpty()){
            lst=itemInfoRepository.getSpeedList(countryId,null,null,fuelType);
        }
        map.put("code",0);
        map.put("details",lst);
        return map;
    }
    @RequestMapping(value="/getLoadList")
    public Map<String,Object> getLoadList(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType,Integer opSpeed){
        Map<String,Object> map=new HashMap<String,Object>();
        List<ItemInfo> lst=itemInfoRepository.getLoadList(countryId,cityId,vehicleType,fuelType,opSpeed);
        if(lst.isEmpty()){
            lst=itemInfoRepository.getLoadList(countryId,null,null,fuelType,null);
        }
        map.put("code",0);
        map.put("details",lst);
        return map;
    }
    @RequestMapping(value="/getAcList")
    public Map<String,Object> getAcList(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType,Integer opSpeed,Integer load){
        Map<String,Object> map=new HashMap<String,Object>();
        List<ItemInfo> lst=itemInfoRepository.getAcList(countryId,cityId,vehicleType,fuelType,opSpeed,load);
        if(lst.isEmpty()){
            lst=itemInfoRepository.getAcList(countryId,null,null,fuelType,null,null);
        }
        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/getBusCost")
    public Map<String,Object> getBusCost(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType){
        Map<String,Object> map=new HashMap<String,Object>();
        List<Map<String,Object>> lst=busCostRepository.getBusCost(countryId,cityId,vehicleType,fuelType);
        if(lst.isEmpty()){
            lst=busCostRepository.getBusCost(countryId,null,vehicleType,fuelType);
            if (lst.isEmpty()) {
                lst=busCostRepository.getBusCost(countryId,null,null,fuelType);
            }
        }
        map.put("code",0);
        map.put("details",lst);
        return map;
    }
    @RequestMapping(value="/getSocialCostFactor")
    public Map<String,Object> getSocialCostFactor(Integer countryId){
        Map<String,Object> map=new HashMap<String,Object>();
        List<SocialCostFactor> lst=socialCostFactorRepository.findSocialCostFactorsByCountryId(countryId);

        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/getGhgData")
    public Map<String,Object> getGhgFactor(Integer countryId,Integer cityId,Integer fuelType){
        Map<String,Object> map=new HashMap<String,Object>();
        List<Map<String,Double>> lst=ghgDataRepository.getGhgData(countryId,cityId,fuelType);
        if(lst.isEmpty()){
            lst=ghgDataRepository.getGhgData(countryId,null,fuelType);
        }

        map.put("code",0);
        map.put("details",lst);
        return map;
    }



}
