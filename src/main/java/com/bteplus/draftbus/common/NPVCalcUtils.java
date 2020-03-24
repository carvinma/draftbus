package com.bteplus.draftbus.common;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public class NPVCalcUtils {
    public static double calcNPV(double r, Map<Integer,BigDecimal> netCash){
        double npv = 0;

        if (netCash.size() != 0) {
            for (int count = 0; count < netCash.size(); count++) {
                npv += netCash.get(count+1).doubleValue() / Math.pow(1 + r, count);
            }
            return npv;
        }
        return Double.NaN;

    }
}
