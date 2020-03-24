package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "input_emission_factor")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InputEmissionFactor {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer record_id;
    private double co;
    private double thc;
    private double nox;
    private double pm25;
    private double pm10;
    private double co2;
    private double co2e;
    private double pm25_up;
    private double pm10_up;
    private double co2_up;
    private double co2e_up;

}
