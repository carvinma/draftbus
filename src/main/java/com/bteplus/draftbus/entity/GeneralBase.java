package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/*
emission factor data
 */

@Entity
@Table(name = "general_base")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GeneralBase {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer general_id;
    private Integer  country_id;
    private Integer city_id;
    private Integer  temperature;
    private Integer humidity;
    private Integer slope;
    private Double discount_rate;
    private Integer discount_year;
    private Double social_discount_rate;
    private Integer social_discount_year;
    private Double bank_lending_rate;
    private Integer bank_lending_year;
    private Double inflation_rate;
    private Double labor_cost;
    private Double charger_construction;
    private Double charger_procurement;
    private Double charger_operation;
    private Double charger_maintenance;
    private Double residual_value;
    private Double other_fuel_cost;
}
