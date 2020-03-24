package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "result_data")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultData {
    private Integer record_id;
    private double financial_npv;
    private double capital_npv;
    private double procurement_npv;
    private double financial_cost;
    private double capital_cost;
    private double procurement_cost;
    private double labor_cost;
    private double fuel_cost;
    private double operational_cost;
    private double operational_cost_others;
    private double additional_cost;

}
