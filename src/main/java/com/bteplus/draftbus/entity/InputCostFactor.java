package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "input_cost_factor")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InputCostFactor {
    @Id
    private Integer record_id;
    private Double purchase_price;
    private Double residual_value;
    private Double down_payment_rate;
    private Double loan_interest_rate;
    private Integer loan_time=0;
    private Double procurement_subsidy;

    private Double battery_price;
    private Double battery_leasing_price;
    private Double battery_content;

    private Double annual_labor_cost;
    private Double fuel_price;
    private Double fuel_cost_projection;
    private Double additional_fuel_price;
    private Double additional_operation_cost;
    private Double annual_maintenance_cost;
    private Double annual_maintenance_labor_cost;
    private Double insurance;
    private Double administration;
    private Double other_tax_fee;

    private Double tires;
    private Integer tires_frequency;
    private Double engine_overhaul;
    private Integer engine_overhaul_frequency;
    private Double transmission_overhaul;
    private Integer transmission_overhaul_frequency;
    private Double battery_overhaul;
    private Integer battery_overhaul_frequency;

    private Double vehicle_retrofits;
    private Integer vehicle_retrofits_frequency;
    private Double additional_maintenance_cost;
    private Double onetime_overhaul_cost;


}
