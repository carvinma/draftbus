package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.CostBase;
import com.bteplus.draftbus.entity.GeneralBase;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Repository
public interface GeneralInfoRepository extends JpaRepository<GeneralBase,Integer>,Serializable {

    @Query(value = "select ifnull(avg(if(purchase_price=0,null,purchase_price)),0) as purchase_price,ifnull(avg(if(fuel_annual=0,null,fuel_annual)),0) as fuel_annual ,ifnull(avg(if(maintenance_annual=0,null,maintenance_annual)),0) as maintenance_annual from cost_base where  (?1 is null or country_Id=?1) and (?2 is null or city_id=?2) and (?3 is null or vehicle_type=?3) and (?4 is null or fuel_type=?4)   ",nativeQuery = true)
    List<Map<String,Object>> getCostBase(Integer countryId, Integer cityId, Integer vehicleType, Integer fuelType);

    @Query(value = "select ifnull(avg(if(discount_rate=0,null,discount_rate)),0) as discount_rate," +
            "ifnull(avg(if(social_discount_rate=0,null,social_discount_rate)),0) as social_discount_rate ," +
            "ifnull(avg(if(inflation_rate=0,null,inflation_rate)),0) as inflation_rate," +
            "ifnull(avg(if(bank_lending_rate=0,null,bank_lending_rate)),0) as bank_lending_rate," +
            "ifnull(avg(if(labor_cost=0,null,labor_cost)),0) as labor_cost," +
            "ifnull(avg(if(charger_construction=0,null,charger_construction)),0) as charger_construction," +
            "ifnull(avg(if(charger_procurement=0,null,charger_procurement)),0) as charger_procurement," +
            "ifnull(avg(if(charger_operation=0,null,charger_operation)),0) as charger_operation," +
            "ifnull(avg(if(charger_maintenance=0,null,charger_maintenance)),0) as charger_maintenance," +
            "ifnull(avg(if(residual_value=0,null,residual_value)),0) as residual_value," +
            "ifnull(avg(if(other_fuel_cost=0,null,other_fuel_cost)),0) as other_fuel_cost from general_base where  (?1 is null or country_Id=?1) and (?2 is null or city_id=?2)  ",nativeQuery = true)
    List<Map<String,Object>> getGeneralBase(Integer countryId, Integer cityId);


    @Query(value = "select ifnull(avg(if(vkt=0,null,vkt)),0) as vkt,ifnull(avg(if(fuel_price=0,null,fuel_price)),0) as fuel_price  from fleet_base where  (?1 is null or country_Id=?1) and (?4 is null or fuel_type=?4)   ",nativeQuery = true)
    List<Map<String,Object>> getFleetBase(Integer countryId, Integer fuelType);


    @Query(value = "select  emission,ifnull(avg(if(ef_value=0,null,ef_value)),0) as avg_value from ef_tail where (?1 is null or country_Id=?1) and (?2 is null or city_id=?2) and (?3 is null or vehicle_type=?3) and (?4 is null or fuel_type=?4)  and  (?5 is null or ac=?5) and (?6 is null or ef_load=?6) and (?7 is null or op_speed=?7) and (?8 is null or std=?8) group by emission",nativeQuery = true)
    List<Map<String,Object>> getEfTailData(Integer countryId, Integer cityId, Integer vehicleType, Integer fuelType, Integer ac,Integer load,Integer opSpeed,Integer std);

    @Query(value = "select  emission,ifnull(avg(if(ef_value=0,null,ef_value)),0) as avg_value from ef_up where (?1 is null or country_Id=?1) and (?2 is null or city_id=?2)  and (?3 is null or fuel_type=?3)  and (?4 is null or std=?4) group by emission",nativeQuery = true)
    List<Map<String,Object>> getEfUpData(Integer countryId, Integer cityId, Integer fuelType, Integer std);


    @Query(value = "select  ifnull(avg(if(fe_value=0,null,fe_value)),0) as avg_value from fe_base where (?1 is null or country_Id=?1) and (?2 is null or city_id=?2) and (?3 is null or vehicle_type=?3) and (?4 is null or fuel_type=?4)  and  (?5 is null or ac=?5) and (?6 is null or ef_load=?6) and (?7 is null or op_speed=?7) and (?8 is null or std=?8) ",nativeQuery = true)
    List<Map<String,Object>> getFeBase(Integer countryId, Integer cityId, Integer vehicleType, Integer fuelType, Integer ac,Integer load,Integer opSpeed,Integer std);


}
