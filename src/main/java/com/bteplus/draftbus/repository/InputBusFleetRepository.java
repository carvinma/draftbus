package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.InputBusFleet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Repository
public interface InputBusFleetRepository extends JpaRepository<InputBusFleet,Integer>,Serializable {
    @Query(value = "select ifnull(avg(if(vkt=0,null,vkt)),0) as vkt,ifnull(avg(if(fuel_price=0,null,fuel_price)),0) as fuel_price  from fleet_base where  (?1 is null or country_Id=?1) and (?2 is null or fuel_type=?2)   ",nativeQuery = true)
    Map<String,Object> getFleetBase(Integer countryId, Integer fuelType);
}
