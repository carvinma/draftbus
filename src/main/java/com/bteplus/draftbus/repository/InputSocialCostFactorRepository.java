package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.InputSocialCostFactor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public interface InputSocialCostFactorRepository extends JpaRepository<InputSocialCostFactor,Integer>,Serializable {

}
