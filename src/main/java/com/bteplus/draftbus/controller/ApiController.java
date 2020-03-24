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
    public Map<String,Object> calcData(Integer id,Integer modelYear,Integer countryId,Integer cityId,Double discountRate,Double socialDiscountRate,Double inflationRate,Integer verticleType,Integer fuelType,  Double purchasePrice,Integer busNumber,Double downPaymentRate, Double procurementSubsidy, Double residualValue,Double operationalYear,Double annualInterestRate,Integer loanTime,double chargerConstruction,double procurementCost,Integer chargersNumber,double vkt,double coFactor,double thcFactor,double noxFactor,double pm25Factor,double pm10Factor,double co2Factor,double co2eFactor,double pm25Factor2,double pm10Factor2,double co2Factor2,double co2eFactor2 ){
        Map<String,Object> map= new HashMap<>();
        double totalBusCost=purchasePrice*busNumber;
        double downPayment=purchasePrice*downPaymentRate/100;
        double busResidualValue=purchasePrice*residualValue/100;
        double busResidualNPV=busResidualValue/Math.pow(1+discountRate/100,operationalYear);
        Integer numberOfPayment=loanTime;

        double subsidy=procurementSubsidy*busNumber;
        double infrastructureCost=(chargerConstruction+procurementCost)*chargersNumber;
        double loanAmout=totalBusCost-downPayment-subsidy;
        double annualPayment=PMTCalcUtils.calculatePMT(annualInterestRate,numberOfPayment*12,loanAmout);
        double totalCostLoan=annualPayment*numberOfPayment;
        double totalInterest=totalCostLoan-loanAmout;

        double financialNPV=NPVCalcUtils.calcNPV(discountRate,AverageCapitalPlusInterestUtils.getPerYearInterest(loanAmout,annualInterestRate,numberOfPayment));
        double capitalNPV=NPVCalcUtils.calcNPV(discountRate,AverageCapitalPlusInterestUtils.getPerYearPrincipal(loanAmout,annualInterestRate,numberOfPayment));
        double procurementNPV=financialNPV+capitalNPV;
        double annualizedFinancialCost=financialNPV/operationalYear;
        double annualizedCapitalCost=capitalNPV/operationalYear;
        double annualizedTotalProcurementCost=annualizedFinancialCost+annualizedCapitalCost;

        double coTotal=coFactor*vkt*busNumber*operationalYear;
        double thcTotal=thcFactor*vkt*busNumber*operationalYear;
        double noxTotal=noxFactor*vkt*busNumber*operationalYear;
        double pm25Total=pm25Factor*vkt*busNumber*operationalYear;
        double pm10Total=pm10Factor*vkt*busNumber*operationalYear;
        double co2Total=co2Factor*vkt*busNumber*operationalYear;
        double co2eTotal=co2eFactor*vkt*busNumber*operationalYear;

        double pm25Total2=pm25Factor2*vkt*busNumber*operationalYear;
        double pm10Tota2l=pm10Factor2*vkt*busNumber*operationalYear;
        double co2Total2=co2Factor2*vkt*busNumber*operationalYear;
        double co2eTotal2=co2eFactor2*vkt*busNumber*operationalYear;

        InputData inputData=new InputData();
        ResultData resultData=new ResultData();
        ResultEmissionData resultEmissionData=new ResultEmissionData();
        ResultSocialCostData resultSocialCostData=new ResultSocialCostData();
        if(id==null){

        }else{
            inputData=inputDataRepository.getOne(id);
            resultData=resultDataRepository.getOne(id);
            resultEmissionData=resultEmissionDataRepository.getOne(id);
            resultSocialCostData=resultSocialCostDataRepository.getOne(id);
            inputData=inputDataRepository.save(inputData);
        }
        resultData.setRecord_id(inputData.getRecord_id());
        resultEmissionData.setRecord_id(inputData.getRecord_id());
        resultSocialCostData.setRecord_id(inputData.getRecord_id());


        resultDataRepository.save(resultData);
        resultEmissionDataRepository.save(resultEmissionData);
        resultSocialCostDataRepository.save(resultSocialCostData);

        map.put("code",0);
        map.put("data",inputData.getRecord_id());
        return map;
    }






}
