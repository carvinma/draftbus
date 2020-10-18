package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/*
emission factor data
 */

@Entity
@Table(name = "ef_tail")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EfTail {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer ef_id;
    private Integer  country_id;
    private Integer city_id;
    private Integer fuel_type;
    private Integer  vehicle_type;
    private Integer ac;
    private Integer op_speed;
    private Integer ef_load;
    private String unit;
    private Integer std;
    private String emission;
    private Double ef_value;


}
