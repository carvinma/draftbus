package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.BusCost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Repository
public interface BusCostRepository extends JpaRepository<BusCost,Integer>,Serializable {

    @Query(value = "select ifnull(avg(purchase_price),0) as purchase_price,ifnull(avg(residual_value),0) as residual_value ,ifnull(avg(life_time),0) as life_time,ifnull(avg(labor_total),0) as labor_total,ifnull(avg(fuel_total),0) as fuel_total,ifnull(avg(fuel_price),0) as fuel_price,ifnull(avg(fuel_price_add),0) as fuel_price_add, ifnull(avg(maintenance_total),0) as maintenance_total,ifnull(avg(additional_operation),0) as additional_operation,ifnull(avg(insurance),0) as insurance,ifnull(avg(administration),0) as administration,ifnull(avg(other_tax_fee),0) as other_tax_fee from bus_cost where  (?1 is null or country_Id=?1) and (?2 is null or city_id=?2) and (?3 is null or vehicle_type=?3) and (?4 is null or fuel_type=?4)   ",nativeQuery = true)
    List<Map<String,Object>> getBusCost(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType);
}
