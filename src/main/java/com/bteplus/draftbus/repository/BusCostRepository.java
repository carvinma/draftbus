package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.BusCost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public interface BusCostRepository extends JpaRepository<BusCost,Integer>,Serializable {

}
