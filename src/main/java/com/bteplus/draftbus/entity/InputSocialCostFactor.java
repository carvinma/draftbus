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
    private Double co=0.0;
    private Double thc=0.0;
    private Double nox=0.0;
    private Double pm25=0.0;
    private Double pm10=0.0;
    private Double co2=0.0;

}
