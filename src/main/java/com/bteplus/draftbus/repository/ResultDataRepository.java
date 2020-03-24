package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.ResultData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public interface ResultDataRepository extends JpaRepository<ResultData,Integer>,Serializable {

}
