package com.bteplus.draftbus.controller;

import com.bteplus.draftbus.entity.InputData;
import com.bteplus.draftbus.entity.ItemInfo;
import com.bteplus.draftbus.entity.ResultData;
import com.bteplus.draftbus.repository.InputDataRepository;
import com.bteplus.draftbus.repository.ItemInfoRepository;
import com.bteplus.draftbus.repository.ResultDataRepository;
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
    InputDataRepository inputDataRepository;

    @Autowired
    ResultDataRepository resultDataRepository;

    @RequestMapping(value="/")
    public String index(HttpServletRequest request, Model model, Integer id){
        InputData inputData=new InputData();
        if(id!=null){
            inputData=inputDataRepository.getOne(id);
            if(inputData!=null){

            }
        }
        model.addAttribute("inputData",inputData);
        return "/index";
    }

    @RequestMapping(value="/result")
    public String result(HttpServletRequest request, Model model, Integer id){
        InputData inputData=new InputData();
        ResultData resultData=new ResultData();
        if(id!=null){
            inputData=inputDataRepository.getOne(id);
            model.addAttribute("inputData",inputData);

            ItemInfo country=itemInfoRepository.getOne(inputData.getCountry_id());
            ItemInfo city=itemInfoRepository.getOne(inputData.getCountry_id());

            resultData=resultDataRepository.getOne(id);
        }
        model.addAttribute("inputData",inputData);
        model.addAttribute("resultData",resultData);
        return "/result";
    }

}
