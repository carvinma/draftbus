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
    private Double replacement_ratio;
    private Double vkt;
    private Integer operational_years;
    private Double fuel_efficiency;
    private Integer age;
    private Integer ac;
    private Integer op_speed;
    private Integer fe_load;
}
