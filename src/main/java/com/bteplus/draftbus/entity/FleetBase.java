package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：2020/10/18 14:25
 */
@Entity
@Table(name = "fleet_base")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FleetBase {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer fleet_id;
    private Integer  country_id;
    private Integer fuel_type;
    private Integer op_speed;
    private String unit;
    private Double vkt;
    private Double fuel_price;
}
