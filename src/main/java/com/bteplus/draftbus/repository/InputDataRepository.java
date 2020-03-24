package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.InputData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public interface InputDataRepository extends JpaRepository<InputData,Integer>,Serializable {

}
