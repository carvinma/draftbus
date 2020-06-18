package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.MeData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Repository
public interface MeDataRepository extends JpaRepository<MeData,Integer>,Serializable {
    @Query(value = "select ifnull(avg(discount_rate),0) as discount_rate,  ifnull(avg(social_discount_rate),0) as social_discount_rate, ifnull(avg(inflation_rate),0) as inflation_rate, ifnull(avg(exchange_rate),0) as exchange_rate from macro_economic where is_delete=0 and country_Id=?1 and (?2 is null or city_id=?2) and (?3 is null or economic_year=?3)",nativeQuery = true)
    List<Map<String,Double>> getMeData(Integer countryId, Integer cityId, Integer year);

}
