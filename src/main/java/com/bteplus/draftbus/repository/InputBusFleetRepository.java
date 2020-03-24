package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.InputBusFleet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public interface InputBusFleetRepository extends JpaRepository<InputBusFleet,Integer>,Serializable {

}
