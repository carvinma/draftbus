package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.InputData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public interface InputDataRepository extends JpaRepository<InputData,Integer>,Serializable {
    @Query(value = "select record_id from input_data where  parent_id=?1 order by record_id ",nativeQuery = true)
    List<Integer> getChildren(Integer parentId);

    @Query(value = "select * from input_data where  parent_id=?1 order by record_id ",nativeQuery = true)
    List<InputData> getChildrenData(Integer parentId);

    @Query(value = "select * from record_id  in ( ?1 ) order by record_id",nativeQuery = true)
    List<InputData> getCompareData(List<Integer> ids);
}
