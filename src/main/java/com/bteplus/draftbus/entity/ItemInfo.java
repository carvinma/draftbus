package com.bteplus.draftbus.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "item_info")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemInfo {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer item_id;
    private String  item_name;
    private Integer  item_type;
    private String  item_unit;
    private Integer  parent_id;
    private Integer  is_delete;
    private String  item_value;
    private Integer  sort_no;
}
