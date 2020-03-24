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
    private Integer bus_size;
    private Integer fuel_type;
    private Integer emission_std;
    private Integer bus_number;
    private Integer replacement_ratio;
    private Integer vkt;
    private Integer operational_years;
    private double fuel_efficiency;
    private Integer age;
    private Integer maintenance;
    private Integer op_speed;
}
