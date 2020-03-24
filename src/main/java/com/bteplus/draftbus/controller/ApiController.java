package com.bteplus.draftbus.controller;

import com.bteplus.draftbus.common.AverageCapitalPlusInterestUtils;
import com.bteplus.draftbus.common.NPVCalcUtils;
import com.bteplus.draftbus.common.PMTCalcUtils;
import com.bteplus.draftbus.entity.*;
import com.bteplus.draftbus.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
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



    @RequestMapping(value="/abc")
    public String abc(){

        return "abc";
    }

    @RequestMapping(value="/getYears")
    public Map<String,Object> getYears(){
        Map<String,Object> map=new HashMap<String,Object>();
        Calendar calendar = Calendar.getInstance();
        Integer year=calendar.get(Calendar.YEAR);
        Integer i=year-50;
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
    @RequestMapping(value="/getItemsByParentIdAndItemType")
    public Map<String,Object> getItemsByParentId(Integer parentId,Integer itemType){
        Map<String,Object> map=new HashMap<String,Object>();
        List<ItemInfo> lst=itemInfoRepository.getItemsByParentIdAndItemType(parentId,itemType);
        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/getMeData")
    public Map<String,Object> getMeData(Integer countryId,Integer cityId,Integer year){
        Map<String,Object> map=new HashMap<String,Object>();
        List<MeData> lst=meDataRepository.getMeData(countryId,cityId,year);
        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/getEfData")
    public Map<String,Object> getEfData(Integer countryId,Integer cityId,Integer verticleType,Integer fuelType,Integer load){
        Map<String,Object> map= new HashMap<>();
        List<EfData> lst=efDataRepository.getEfData(countryId,cityId,verticleType,fuelType,load);
        map.put("code",0);
        map.put("details",lst);
        return map;
    }

    @RequestMapping(value="/calcData")
    public Map<String,Object> calcData(Integer id,Integer modelYear,Integer countryId,Integer cityId,Double discountRate,Double socialDiscountRate,Double inflationRate,Integer temperature,Integer humidity,Integer slope,Integer age,Integer verticleType,Integer fuelType, Integer emissionStd,Integer busNumber,Double replacementRatio, Double vkt,Integer operationalYears, Integer opSpeed,Integer maintenance,Double fuelEfficiency,Double  purchasePrice,Double downPaymentRate, Double procurementSubsidy, Double residualValue,Double loanInterestRate,Integer loanTime,double chargerConstruction,double procurementCost,Integer chargersNumber,Double batteryPrice,Double batteryLeasingPrice,Double batteryContent,
                                       Double annualLaborCost,Double fuelPrice,Double fuelCostProjection, Double additionalOperationalCost,Double additionalFuelPrice,
                                       Double annualMaintenanceCost, Double tires,Integer tiresFrequency,Double engineOverhaul,Integer engineOverhaulFrequency, Double transmissionOverhaul,Integer transmissionOverhaulFrequency,Double batteryOverhaul,Integer batteryOverhaulFrequency, Double vehicleRetrofits,Integer vehicleRetrofitsFrequency,Double additionalMaintenanceCost,Double insurance,Double administration,Double otherTaxFee,
                                       Double coFactor,Double thcFactor,Double noxFactor,Double pm25Factor,Double pm10Factor,Double co2Factor,Double co2eFactor,Double pm25Factor2,Double pm10Factor2,Double co2Factor2,Double co2eFactor2, Double coFactor3,Double thcFactor3,Double noxFactor3,Double pm25Factor3,Double pm10Factor3,Double co2Factor3,
                                       Double operationalCost,Double maintenanceCost
    ){
        Map<String,Object> map= new HashMap<>();
        double totalBusCost=purchasePrice*busNumber;
        double downPayment=purchasePrice*downPaymentRate/100;
        double busResidualValue=purchasePrice*residualValue/100;
        double busResidualNPV=busResidualValue/Math.pow(1+discountRate/100,operationalYears);
        Integer numberOfPayment=loanTime;

        double subsidy=procurementSubsidy*busNumber;
        double infrastructureCost=(chargerConstruction+procurementCost)*chargersNumber;
        double loanAmout=totalBusCost-downPayment-subsidy;
        double annualPayment=PMTCalcUtils.calculatePMT(loanInterestRate,numberOfPayment*12,loanAmout);
        double totalCostLoan=annualPayment*numberOfPayment;
        double totalInterest=totalCostLoan-loanAmout;

        double financialNPV=NPVCalcUtils.calcNPV(discountRate,AverageCapitalPlusInterestUtils.getPerYearInterest(loanAmout,loanInterestRate,numberOfPayment));
        double capitalNPV=NPVCalcUtils.calcNPV(discountRate,AverageCapitalPlusInterestUtils.getPerYearPrincipal(loanAmout,loanInterestRate,numberOfPayment));
        double procurementNPV=financialNPV+capitalNPV;
        double annualizedFinancialCost=financialNPV/operationalYears;
        double annualizedCapitalCost=capitalNPV/operationalYears;
        double annualizedTotalProcurementCost=annualizedFinancialCost+annualizedCapitalCost;

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

        InputData inputData=new InputData();
        InputBusFleet busFleet=new InputBusFleet();
        InputEmissionFactor emissionFactor=new InputEmissionFactor();
        InputSocialCostFactor socialCostFactor=new InputSocialCostFactor();
        InputCostFactor costFactor=new InputCostFactor();
        ResultData resultData=new ResultData();
        ResultEmissionData resultEmissionData=new ResultEmissionData();
        ResultSocialCostData resultSocialCostData=new ResultSocialCostData();
        if(id!=null){
            inputData=inputDataRepository.getOne(id);
            costFactor=inputCostFactorRepository.getOne(id);
            busFleet=inputBusFleetRepository.getOne(id);
            emissionFactor=inputEmissionFactorRepository.getOne(id);
            socialCostFactor=inputSocialCostFactorRepository.getOne(id);

            resultData=resultDataRepository.getOne(id);
            resultEmissionData=resultEmissionDataRepository.getOne(id);
            resultSocialCostData=resultSocialCostDataRepository.getOne(id);
        }
        inputData.setCalc_year(modelYear);
        inputData.setCharger_construction(chargerConstruction);
        inputData.setChargers_number(chargersNumber);
        inputData.setCity_id(cityId);
        inputData.setCountry_id(countryId);
        inputData.setDiscount_rate(discountRate);
        inputData.setInflation_rate(inflationRate);
        inputData.setMaintenance_cost(maintenanceCost);
        inputData.setOperational_cost(operationalCost);
        inputData.setProcurement_cost(procurementCost);
        inputData.setSocial_discount_rate(socialDiscountRate);
        inputData.setTemperature(temperature);
        inputData.setHumidity(humidity);
        inputData.setSlope(slope);
        inputData=inputDataRepository.save(inputData);

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
        busFleet.setVerticle_type(verticleType);
        busFleet.setEmission_std(emissionStd);
        busFleet.setFuel_efficiency(fuelEfficiency);
        busFleet.setFuel_type(fuelType);
        busFleet.setMaintenance(maintenance);
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
        costFactor.setBattery_content(batteryContent);
        costFactor.setBattery_leasing_price(batteryLeasingPrice);
        costFactor.setBattery_overhaul(batteryOverhaul);
        costFactor.setBattery_overhaul_frequency(batteryOverhaulFrequency);
        costFactor.setBattery_price(batteryPrice);
        costFactor.setDown_payment_rate(downPaymentRate);
        costFactor.setEngine_overhaul(engineOverhaul);
        costFactor.setEngine_overhaul_frequency(engineOverhaulFrequency);
        costFactor.setFuel_cost_projection(fuelCostProjection);
        costFactor.setFuel_price(fuelPrice);
        costFactor.setInsurance(insurance);
        costFactor.setLoan_interest_rate(loanInterestRate);
        costFactor.setLoan_time(loanTime);
        costFactor.setProcurement_subsidy(procurementSubsidy);
        costFactor.setPurchase_price(purchasePrice);
        costFactor.setResidual_value(residualValue);
        costFactor.setTires(tires);
        costFactor.setTires_frequency(tiresFrequency);
        costFactor.setTransmission_overhaul(transmissionOverhaul);
        costFactor.setTransmission_overhaul_frequency(transmissionOverhaulFrequency);
        costFactor.setVehicle_retrofits(vehicleRetrofits);
        costFactor.setVehicle_retrofits_frequency(vehicleRetrofitsFrequency);
        costFactor.setRecord_id(inputData.getRecord_id());
        inputCostFactorRepository.save(costFactor);


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


}
