package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.ResultEmissionData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public interface ResultEmissionDataRepository extends JpaRepository<ResultEmissionData,Integer>,Serializable {

}
