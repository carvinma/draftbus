package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/*
fuel effciency
 */

@Entity
@Table(name = "ef_data")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FeData {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer fe_id;
    private Integer  country_id;
    private Integer city_id;
    private Integer  vehicle_type;
    private Integer fuel_type;
    private Integer emission;
    private Double fe_load;
    private Double avg_value;
    private Double pre_std;
    private Double std1;
    private Double std2;
    private Double std3;
    private Double std4;
    private Double std5;
    private Double std6;




}
