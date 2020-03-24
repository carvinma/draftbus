package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "input_social_cost_factor")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InputSocialCostFactor {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer record_id;
    private double co;
    private double thc;
    private double nox;
    private double pm25;
    private double pm10;
    private double co2;

}
