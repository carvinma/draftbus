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
    private Double purchase_price=0.0;
    //单位是  %
    private Double residual_value=0.0;
    private Double labor_total=0.0;
    private Double life_time=0.0;
    private Double fuel_price=0.0;
    private Double fuel_price_add=0.0;
    private Double additional_operation=0.0;
    private Double maintenance_total=0.0;
    private Double insurance=0.0;
    private Double administration=0.0;
    private Double other_tax_fee=0.0;

}
