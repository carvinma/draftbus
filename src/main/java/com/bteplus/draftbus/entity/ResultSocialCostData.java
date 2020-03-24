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
    private Double co;
    private Double thc;
    private Double nox;
    private Double pm25;
    private Double pm10;
    private Double co2;
  
}
