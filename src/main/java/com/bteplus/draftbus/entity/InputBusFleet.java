package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "input_bus_fleet")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InputBusFleet {
    @Id
    private Integer record_id;
    private Integer vehicle_type;
    private Integer fuel_type;
    private Integer emission_std;
    private Integer bus_number=0;
    private Double replacement_ratio=0.0;
    private Double vkt=0.0;
    private Integer operational_years=0;
    private Double fuel_efficiency=0.0;
    private Integer age=0;
    private Integer ac;
    private Integer op_speed;
}
