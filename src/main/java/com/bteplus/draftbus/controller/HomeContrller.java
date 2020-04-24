package com.bteplus.draftbus.controller;

import com.bteplus.draftbus.entity.*;
import com.bteplus.draftbus.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;

@Controller
public class HomeContrller {

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

    @RequestMapping(value="/")
    public String index(HttpServletRequest request, Model model, Integer id){
        InputData inputData=new InputData();
        InputBusFleet busFleet=new InputBusFleet();
        InputEmissionFactor emissionFactor=new InputEmissionFactor();
        InputSocialCostFactor socialCostFactor=new InputSocialCostFactor();
        InputCostFactor costFactor=new InputCostFactor();
        if(id==null) {
            inputData=inputDataRepository.save(inputData);
            busFleet.setRecord_id(inputData.getRecord_id());
            socialCostFactor.setRecord_id(inputData.getRecord_id());
            emissionFactor.setRecord_id(inputData.getRecord_id());
            costFactor.setRecord_id(inputData.getRecord_id());

            busFleet=inputBusFleetRepository.save(busFleet);
            emissionFactor=inputEmissionFactorRepository.save(emissionFactor);
            socialCostFactor=inputSocialCostFactorRepository.save(socialCostFactor);
            costFactor=inputCostFactorRepository.save(costFactor);
            return "redirect:/?id="+String.valueOf(inputData.getRecord_id());
        }else{
            inputData=inputDataRepository.getOne(id);
            busFleet=inputBusFleetRepository.getOne(id);
            emissionFactor=inputEmissionFactorRepository.getOne(id);
            socialCostFactor=inputSocialCostFactorRepository.getOne(id);
            costFactor=inputCostFactorRepository.getOne(id);
        }
        model.addAttribute("inputData",inputData);
        model.addAttribute("busFleet",busFleet);
        model.addAttribute("emissionFactor",emissionFactor);
        model.addAttribute("socialCostFactor",socialCostFactor);
        model.addAttribute("costFactor",costFactor);

        System.out.println(costFactor);
        return "/index";
    }

    @RequestMapping(value="/child")
    public String child(HttpServletRequest request, Model model, Integer id) {
        InputData inputData = new InputData();
        InputBusFleet busFleet = new InputBusFleet();
        InputEmissionFactor emissionFactor = new InputEmissionFactor();
        InputSocialCostFactor socialCostFactor = new InputSocialCostFactor();
        InputCostFactor costFactor = new InputCostFactor();

        inputData = inputDataRepository.getOne(id);
        busFleet = inputBusFleetRepository.getOne(id);
        emissionFactor = inputEmissionFactorRepository.getOne(id);
        socialCostFactor = inputSocialCostFactorRepository.getOne(id);
        costFactor = inputCostFactorRepository.getOne(id);

        model.addAttribute("inputData", inputData);
        model.addAttribute("busFleet", busFleet);
        model.addAttribute("emissionFactor", emissionFactor);
        model.addAttribute("socialCostFactor", socialCostFactor);
        model.addAttribute("costFactor", costFactor);

        return "/child";
    }

    @RequestMapping(value="/result")
    public String result(HttpServletRequest request, Model model, Integer id){

        InputData inputData=new InputData();
        InputBusFleet busFleet=new InputBusFleet();
        InputEmissionFactor emissionFactor=new InputEmissionFactor();
        InputSocialCostFactor socialCostFactor=new InputSocialCostFactor();
        InputCostFactor costFactor=new InputCostFactor();
        ResultData resultData=new ResultData();
        ResultEmissionData resultEmissionData=new ResultEmissionData();
        ResultSocialCostData resultSocialCostData=new ResultSocialCostData();

        ResultData resultData2=new ResultData();
        ResultEmissionData resultEmissionData2=new ResultEmissionData();
        ResultSocialCostData resultSocialCostData2=new ResultSocialCostData();
        if(id!=null){
            inputData=inputDataRepository.getOne(id);
            busFleet=inputBusFleetRepository.getOne(id);
            emissionFactor=inputEmissionFactorRepository.getOne(id);
            socialCostFactor=inputSocialCostFactorRepository.getOne(id);
            costFactor=inputCostFactorRepository.getOne(id);

            resultData=resultDataRepository.getOne(id);
            resultEmissionData=resultEmissionDataRepository.getOne(id);
            resultSocialCostData=resultSocialCostDataRepository.getOne(id);

            resultData2=getResultData2(inputData.getDiscount_rate()/100,busFleet.getOp_speed(),resultData);
            resultEmissionData2=getResultEmissionData2(busFleet.getOperational_years(),resultEmissionData);
            resultSocialCostData2=getResultSocialCostData2(inputData.getSocial_discount_rate()/100,busFleet.getOperational_years(),resultSocialCostData);

        }
        ItemInfo country=itemInfoRepository.getOne(inputData.getCountry_id());
        ItemInfo city=itemInfoRepository.getOne(inputData.getCity_id());
        ItemInfo vehicleType=itemInfoRepository.getOne(busFleet.getVehicle_type());
        ItemInfo fuelType=itemInfoRepository.getOne(busFleet.getFuel_type());
        ItemInfo emissionStd=itemInfoRepository.getOne(busFleet.getEmission_std());

        model.addAttribute("inputData",inputData);
        model.addAttribute("busFleet",busFleet);
        model.addAttribute("emissionFactor",emissionFactor);
        model.addAttribute("socialCostFactor",socialCostFactor);
        model.addAttribute("costFactor",costFactor);
        model.addAttribute("resultData",resultData);
        model.addAttribute("resultEmissionData",resultEmissionData);
        model.addAttribute("resultSocialCostData",resultSocialCostData);
        model.addAttribute("resultData2",resultData2);
        model.addAttribute("resultEmissionData2",resultEmissionData2);
        model.addAttribute("resultSocialCostData2",resultSocialCostData2);

        model.addAttribute("country",country);
        model.addAttribute("city",city);
        model.addAttribute("vehicleType",vehicleType);
        model.addAttribute("city",city);
        model.addAttribute("fuelType",fuelType);
        model.addAttribute("emissionStd",emissionStd);

        return "/result";
    }

    private ResultData getResultData2(double r,Integer n,ResultData resultData){
        ResultData result=new ResultData();
        double mutil=r/(1-Math.pow(1+r,-1*n));
        result.setOthers_operational_cost_npv(getDouble2(resultData.getOthers_operational_cost_npv()*mutil));
        result.setOverhaul_cost_npv(getDouble2(resultData.getOverhaul_cost_npv()*mutil));
        result.setMaintenance_cost_npv(getDouble2(resultData.getMaintenance_cost_npv()*mutil));
        result.setLabor_cost_npv(getDouble2(resultData.getLabor_cost_npv()*mutil));
        result.setFuel_cost_npv(getDouble2(resultData.getFuel_cost_npv()*mutil));
        result.setCapital_cost_npv(getDouble2(resultData.getCapital_cost_npv()*mutil));
        result.setFinancial_cost_npv(getDouble2(resultData.getFinancial_cost_npv()*mutil));
        return  result;

    }
    private ResultEmissionData getResultEmissionData2(Integer n,ResultEmissionData resultEmissionData){
        ResultEmissionData result=new ResultEmissionData();
        result.setNox(getDouble2(resultEmissionData.getNox()/n));
        result.setCo(getDouble2(resultEmissionData.getCo()/n));
        result.setCo2(getDouble2(resultEmissionData.getCo2()/n));
        result.setCo2_up(getDouble2(resultEmissionData.getCo2_up()/n));
        result.setCo2e(getDouble2(resultEmissionData.getCo2e()/n));
        result.setCo2e_up(getDouble2(resultEmissionData.getCo2e()/n));
        result.setPm10(getDouble2(resultEmissionData.getPm10()/n));
        result.setPm10_up(getDouble2(resultEmissionData.getPm10()/n));
        result.setPm25(getDouble2(resultEmissionData.getPm25()/n));
        result.setPm25_up(getDouble2(resultEmissionData.getPm25_up()/n));
        result.setThc(getDouble2(resultEmissionData.getThc()/n));
        return  result;
    }

    private Double getDouble2(Double d){
        BigDecimal bd = new BigDecimal(d);
        Double d2 = bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        return d2;
    }

    private ResultSocialCostData getResultSocialCostData2(double r,Integer n,ResultSocialCostData resultSocialCostData) {
        ResultSocialCostData result = new ResultSocialCostData();
        double mutil = r / (1 - Math.pow(1 + r, -1 * n));
        System.out.println("ResultSocialCostData mutil"+String.valueOf(mutil));
        result.setCo(getDouble2(resultSocialCostData.getCo()*mutil));
        result.setCo2(getDouble2(resultSocialCostData.getCo2()*mutil));
        result.setNox(getDouble2(resultSocialCostData.getNox()*mutil));
        result.setPm10(getDouble2(resultSocialCostData.getPm10()*mutil));
        result.setPm25(getDouble2(resultSocialCostData.getPm25()*mutil));
        result.setThc(getDouble2(resultSocialCostData.getThc()*mutil));
        return result;
    }

}
