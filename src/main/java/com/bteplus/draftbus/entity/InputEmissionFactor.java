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
    private Integer record_id;
    private Double co=0.0;
    private Double thc=0.0;
    private Double nox=0.0;
    private Double pm25=0.0;
    private Double pm10=0.0;
    private Double co2=0.0;
    private Double co2e=0.0;
    private Double pm25_up=0.0;
    private Double pm10_up=0.0;
    private Double co2_up=0.0;
    private Double co2e_up=0.0;

}
