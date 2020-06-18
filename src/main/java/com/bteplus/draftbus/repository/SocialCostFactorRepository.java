package com.bteplus.draftbus.repository;


import com.bteplus.draftbus.entity.SocialCostFactor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public interface SocialCostFactorRepository extends JpaRepository<SocialCostFactor,Integer>,Serializable {
    @Query(value = "select * from social_cost_factor where country_id=?1",nativeQuery = true)
    List<SocialCostFactor> findSocialCostFactorsByCountryId(Integer countryId);
}
