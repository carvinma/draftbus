package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/*
macro_economic data
 */

@Entity
@Table(name = "macro_economic")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MeData {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer economic_id;
    private Integer  country_id;
    private Integer economic_year;
    private Double discount_rate;
    private Double social_discount_rate;
    private Double inflation_rate;
    private Double exchange_rate;
    private Integer  is_delete=0;
}
