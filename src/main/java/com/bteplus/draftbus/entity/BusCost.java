package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/*
bus cost data
 */

@Entity
@Table(name = "bus_cost")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BusCost {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer cost_id;
    private Integer  country_id;
    private Integer city_id;
    private Integer  vehicle_type;
    private Integer fuel_type;
    private Integer emission_std;
    private Double purchase_price;
    //单位是  %
    private Double residual_value;
    private Double labor_total;
    private Double life_time;
    private Double fuel_price;
    private Double fuel_price_add;
    private Double additional_operation;
    private Double maintenance_total;
    private Double insurance;
    private Double administration;
    private Double other_tax_fee;

}
