package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.FeData;
import com.bteplus.draftbus.entity.ItemInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Repository
public interface FeDataRepository extends JpaRepository<FeData,Integer>,Serializable {


    @Query(value = "select ifnull(avg(avg_value),0) as avg_value,ifnull(avg(pre_std),0) as pre_std ,ifnull(avg(std1),0) as std1,ifnull(avg(std2),0) as std2,ifnull(avg(std3),0) as std3,ifnull(avg(std4),0) as std4,ifnull(avg(std5),0) as std5, ifnull(avg(std6),0) as std6,ifnull(avg(eev),0) as eev from fe_data where is_delete=0 and (?1 is null or country_Id=?1) and (?2 is null or city_id=?2) and (?3 is null or vehicle_type=?3) and (?4 is null or fuel_type=?4)  and  (?5 is null or ac=?5) and (?6 is null or fe_load=?6) and (?7 is null or op_speed=?7)",nativeQuery = true)
    List<Map<String,Object>> getFeData(Integer countryId, Integer cityId, Integer vehicleType, Integer fuelType, Integer ac, Integer load, Integer opSpeed);

}
