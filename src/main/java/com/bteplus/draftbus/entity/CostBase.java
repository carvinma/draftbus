package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/*
emission factor data
 */

@Entity
@Table(name = "cost_base")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CostBase {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer cost_id;
    private Integer  country_id;
    private Integer city_id;
    private Integer  vehicle_type;
    private Integer fuel_type;
    private Integer purchase_year;
    private Double purchase_price;
    private Double fuel_annual;
    private Double maintenance_annual;



}
