package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.InputCostFactor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public interface InputCostFactorRepository extends JpaRepository<InputCostFactor,Integer>,Serializable {

}
