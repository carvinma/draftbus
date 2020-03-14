package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.EfData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public interface EfDataRepository extends JpaRepository<EfData,Integer>,Serializable {


    @Query(value = "select * from macro_economic where is_delete=0 and country_Id=?1 and city_id=?2 and vehicle_type=?3 and fuel_type=?4 and speed_type=?5 and  ac=?6 and load=?7",nativeQuery = true)
    List<EfData> getEfData(Integer countryId, Integer cityId, Integer vehicleType,Integer fuelType,Integer speedType, Integer ac, Integer load);




}
