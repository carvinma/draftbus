package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.ResultData;
import com.bteplus.draftbus.entity.ResultEmissionData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Repository
public interface ResultEmissionDataRepository extends JpaRepository<ResultEmissionData,Integer>,Serializable {

    @Query(value = "select result.*,input.name from result_emission_data result inner join input_data input on result.record_id=input.record_id where result.record_id  in ( ?1 ) order by result.record_id",nativeQuery = true)
    List<Map<String,Object>> getCompareData(List<Integer> ids);
}
