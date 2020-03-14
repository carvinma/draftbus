package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.GhgData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public interface GhgDataRepository extends JpaRepository<GhgData,Integer>,Serializable {
    @Query(value = "select * from ghg_data where is_delete=0 and country_Id=?1 and (?2 is null or city_id=?2) and fuel_type=?3",nativeQuery = true)
    List<GhgData> getGhgData(Integer countryId, Integer cityId, Integer fuel_type);

}
