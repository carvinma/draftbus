package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.EfData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Repository
public interface EfDataRepository extends JpaRepository<EfData,Integer>,Serializable {


    @Query(value = "select  emission,ifnull(avg(if(avg_value=0,null,avg_value)),0) as avg_value,ifnull(avg(if(pre_std=0,null,pre_std)),0) as pre_std ,ifnull(avg(if(std1=0,null,std1)),0) as std1,ifnull(avg(if(std2=0,null,std2)),0) as std2,ifnull(avg(if(std3=0,null,std3)),0) as std3,ifnull(avg(if(std4=0,null,std4)),0) as std4,ifnull(avg(if(std5=0,null,std5)),0) as std5, ifnull(avg(if(std6=0,null,std6)),0) as std6,ifnull(avg(if(eev=0,null,eev)),0) as eev from ef_data where is_delete=0 and (?1 is null or country_Id=?1) and (?2 is null or city_id=?2) and (?3 is null or vehicle_type=?3) and (?4 is null or fuel_type=?4)  and  (?5 is null or ac=?5) and (?6 is null or ef_load=?6) and (?7 is null or op_speed=?7) group by emission",nativeQuery = true)
    List<Map<String,Object>> getEfData(Integer countryId, Integer cityId, Integer vehicleType, Integer fuelType, Integer ac,Integer load,Integer opSpeed);


    @Query(value = "select  emission,ifnull(avg(if(ef_value=0,null,ef_value)),0) as avg_value from ef_tail where (?1 is null or country_Id=?1) and (?2 is null or city_id=?2) and (?3 is null or vehicle_type=?3) and (?4 is null or fuel_type=?4)  and  (?5 is null or ac=?5) and (?6 is null or ef_load=?6) and (?7 is null or op_speed=?7) and (?8 is null or std=?8) group by emission",nativeQuery = true)
    List<Map<String,Object>> getEfTailData(Integer countryId, Integer cityId, Integer vehicleType, Integer fuelType, Integer ac,Integer load,Integer opSpeed,Integer std);

    @Query(value = "select  emission,ifnull(avg(if(ef_value=0,null,ef_value)),0) as avg_value from ef_up where (?1 is null or country_Id=?1) and (?2 is null or city_id=?2)  and (?3 is null or fuel_type=?3)  group by emission",nativeQuery = true)
    List<Map<String,Object>> getEfUpData(Integer countryId, Integer cityId, Integer fuelType, Integer std);


}
