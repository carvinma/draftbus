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
    private Double financial_npv;
    private Double capital_npv;
    private Double procurement_npv;
    private Double financial_cost;
    private Double capital_cost;
    private Double procurement_cost;
    private Double labor_cost;
    private Double fuel_cost;
    private Double operational_cost;
    private Double operational_cost_others;
    private Double additional_cost;

}
