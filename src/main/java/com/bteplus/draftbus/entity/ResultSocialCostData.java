package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "result_social_cost_data")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultSocialCostData {
    @Id
    private Integer record_id;
    private Double co=0.0;
    private Double thc=0.0;
    private Double nox=0.0;
    private Double pm25=0.0;
    private Double pm10=0.0;
    private Double co2=0.0;
  
}
