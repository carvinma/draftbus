package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/*
fuel effciency
 */

@Entity
@Table(name = "ef_base")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FeBase {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer fe_id;
    private Integer  country_id;
    private Integer city_id;
    private Integer  vehicle_type;
    private Integer fuel_type;
    private Integer ac;
    private Integer op_speed;
    private Integer fe_load;
    private Integer std;
    private Double fe_value;
    private String state;
    private String unit;


}
