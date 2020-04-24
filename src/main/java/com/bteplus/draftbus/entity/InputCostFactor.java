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
    private Double purchase_price=0.0;
    private Double residual_value=0.0;
    private Double down_payment_rate=0.0;
    private Double loan_interest_rate=0.0;
    private Integer loan_time=0;
    private Double procurement_subsidy=0.0;

    private Double battery_price=0.0;
    private Double battery_leasing_price=0.0;
    private Double battery_content=0.0;

    private Double annual_labor_cost=0.0;
    private Double fuel_price=0.0;
    private Double fuel_cost_projection=0.0;
    private Double additional_fuel_price=0.0;
    private Double additional_operation_cost=0.0;
    private Double annual_maintenance_cost=0.0;
    private Double annual_maintenance_labor_cost=0.0;
    private Double insurance=0.0;
    private Double administration=0.0;
    private Double other_tax_fee=0.0;

    private Double tires=0.0;
    private Integer tires_frequency=0;
    private Double engine_overhaul=0.0;
    private Integer engine_overhaul_frequency=0;
    private Double transmission_overhaul=0.0;
    private Integer transmission_overhaul_frequency=0;
    private Double battery_overhaul=0.0;
    private Integer battery_overhaul_frequency=0;

    private Double vehicle_retrofits=0.0;
    private Integer vehicle_retrofits_frequency=0;
    private Double additional_maintenance_cost=0.0;
    private Double onetime_overhaul_cost=0.0;


}
