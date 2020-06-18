package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "social_cost_factor")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SocialCostFactor {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer factor_id;
    private Integer country_id;
    private String emission;
    private Double scf=0.0;


}
