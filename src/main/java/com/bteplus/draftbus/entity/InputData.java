package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "input_data")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InputData {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer record_id;
    private Integer calc_year;
    private Integer country_id;
    private Integer city_id;
    private double discount_rate;
    private double social_discount_rate;
    private double inflation_rate;
    private double exchange_rate;
    private Integer temperature;
    private Integer humidity;
    private Integer slope;
    private double charger_construction;
    private double chargers_number;
    private double procurement_cost;
    private double operational_cost;
    private double maintenance_cost;

}
