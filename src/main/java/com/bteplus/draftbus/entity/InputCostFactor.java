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
    private double purchase_price;
    private double residual_value;
    private double down_payment;
    private double loan_interest_rate;
    private Integer loan_time;
    private double procurement_subsidy;

    private double battery_price;
    private double battery_leasing_price;
    private double battery_content;

    private double annual_labor_cost;
    private double fuel_price;
    private double fuel_cost_projection;
    private double additional_fuel_price;
    private double additional_operation_cost;
    private double annual_maintenance_cost;
    private double insurance;
    private double administration;

    private double tires;
    private Integer tires_frequency;
    private double engine_overhaul;
    private Integer engine_overhaul_frequency;
    private double transmission_overhaul;
    private Integer transmission_overhaul_frequency;
    private double battery_overhaul;
    private Integer battery_overhaul_frequency;

    private double vehicle_retrofits;
    private Integer vehicle_retrofits_frequency;
    private double additional_maintenance_cost;






    private Integer maintenance;

}
