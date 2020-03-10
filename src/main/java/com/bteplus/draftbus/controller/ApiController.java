package com.bteplus.draftbus.controller;

import com.bteplus.draftbus.entity.ItemInfo;
import com.bteplus.draftbus.entity.MeData;
import com.bteplus.draftbus.repository.ItemInfoRepository;
import com.bteplus.draftbus.repository.MeDataRepository;
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

    @RequestMapping(value="/getMeDataByCountryIdAndCityIdAndYear")
    public Map<String,Object> getMeDataByCountryIdAndCityIdAndYear(Integer countryId,Integer cityId,Integer year){
        Map<String,Object> map=new HashMap<String,Object>();
        List<MeData> lst=meDataRepository.getMeDataByCountryIdAndCityIdAndYear(countryId,cityId,year);
        map.put("code",0);
        map.put("details",lst);
        return map;
    }
}
