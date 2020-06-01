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
    private Double discount_rate=0.0;
    private Double social_discount_rate=0.0;
    private Double inflation_rate=0.0;
    private Double exchange_rate=0.0;
    private Integer temperature;
    private Integer humidity;
    private Integer slope;
    private Double charger_construction=0.0;
    private Integer chargers_number=0;
    private Double procurement_cost=0.0;
    private Double operational_cost=0.0;
    private Double maintenance_cost=0.0;
    private Integer parent_id;

}
