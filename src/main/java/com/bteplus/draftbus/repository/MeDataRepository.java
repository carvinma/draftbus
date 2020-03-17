package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.MeData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public interface MeDataRepository extends JpaRepository<MeData,Integer>,Serializable {
    @Query(value = "select * from macro_economic where is_delete=0 and country_Id=?1 and (?2 is null or city_id=?2) and economic_year=?3",nativeQuery = true)
    List<MeData> getMeData(Integer countryId,Integer cityId,Integer year);

}
