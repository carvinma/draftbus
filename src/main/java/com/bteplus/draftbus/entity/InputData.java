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
    private String name;
    private Integer calc_year;
    private Integer country_id;
    private Integer city_id;
    private Double discount_rate;
    private Double social_discount_rate;
    private Double inflation_rate;
    private Double exchange_rate;
    private Integer temperature;
    private Integer humidity;
    private Integer slope;
    private Double charger_construction;
    private Integer chargers_number;
    private Double procurement_cost;
    private Double operational_cost;
    private Double maintenance_cost;
    private Integer parent_id;

}
