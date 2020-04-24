package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "result_data")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultData {
    @Id
    private Integer record_id;
    private Double financial_cost_npv=0.0;
    private Double capital_cost_npv=0.0;
    private Double labor_cost_npv=0.0;
    private Double fuel_cost_npv=0.0;
    private Double maintenance_cost_npv=0.0;
    private Double others_operational_cost_npv=0.0;
    private Double overhaul_cost_npv=0.0;

}
