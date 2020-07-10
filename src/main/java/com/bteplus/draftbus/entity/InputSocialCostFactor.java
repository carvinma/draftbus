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
    private Integer record_id;
    private Double co;
    private Double thc;
    private Double nox;
    private Double pm25;
    private Double pm10;
    private Double co2;

}
