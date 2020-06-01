package com.bteplus.draftbus.model;

import lombok.Data;

import java.util.List;

@Data
public class BarResult {
    private String name;
    private String type="bar";
    private String stack="";
    private List<Object> data;
}
