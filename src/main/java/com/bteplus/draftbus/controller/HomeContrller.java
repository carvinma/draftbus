package com.bteplus.draftbus.controller;

import com.bteplus.draftbus.entity.*;
import com.bteplus.draftbus.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

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
        if(id!=null){
            inputData=inputDataRepository.getOne(id);
            busFleet=inputBusFleetRepository.getOne(id);
        }
        model.addAttribute("inputData",inputData);
        model.addAttribute("busFleet",busFleet);
        return "/index";
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
        if(id!=null){
            inputData=inputDataRepository.getOne(id);
            busFleet=inputBusFleetRepository.getOne(id);
            emissionFactor=inputEmissionFactorRepository.getOne(id);
            socialCostFactor=inputSocialCostFactorRepository.getOne(id);
            costFactor=inputCostFactorRepository.getOne(id);

            resultData=resultDataRepository.getOne(id);
            resultEmissionData=resultEmissionDataRepository.getOne(id);
            resultSocialCostData=resultSocialCostDataRepository.getOne(id);
        }
        ItemInfo country=itemInfoRepository.getOne(inputData.getCountry_id());
        ItemInfo city=itemInfoRepository.getOne(inputData.getCountry_id());

        model.addAttribute("inputData",inputData);
        model.addAttribute("busFleet",busFleet);
        model.addAttribute("emissionFactor",emissionFactor);
        model.addAttribute("socialCostFactor",socialCostFactor);
        model.addAttribute("costFactor",costFactor);
        model.addAttribute("resultData",resultData);
        model.addAttribute("resultEmissionData",resultEmissionData);
        model.addAttribute("resultSocialCostData",resultSocialCostData);

        return "/result";
    }

}
