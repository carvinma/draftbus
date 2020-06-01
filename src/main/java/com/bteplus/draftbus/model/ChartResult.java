package com.bteplus.draftbus.model;

import lombok.Data;

import java.util.List;

@Data
public class ChartResult {
    private List<String> legendData;
    private List<String> categoryData;
    private List<BarResult> data;
}
