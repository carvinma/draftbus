package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/*
emission factor data
 */

@Entity
@Table(name = "ef_up")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EfUp {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer ef_id;
    private Integer  country_id;
    private Integer city_id;
    private Integer fuel_type;
    private String unit;
    private String emission;
    private Double ef_value;


}
