package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.InputEmissionFactor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public interface InputEmissionFactorRepository extends JpaRepository<InputEmissionFactor,Integer>,Serializable {

}
