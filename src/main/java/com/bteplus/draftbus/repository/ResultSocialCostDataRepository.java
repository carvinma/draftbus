package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.ResultSocialCostData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public interface ResultSocialCostDataRepository extends JpaRepository<ResultSocialCostData,Integer>,Serializable {

}
