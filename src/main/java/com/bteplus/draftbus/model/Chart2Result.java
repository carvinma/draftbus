package com.bteplus.draftbus.model;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import lombok.Data;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：2020/10/13 19:17
 */
@Data
public class Chart2Result {
    private JSONObject dataset;
    private JSONArray types;
}
