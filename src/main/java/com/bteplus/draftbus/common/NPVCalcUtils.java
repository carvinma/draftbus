package com.bteplus.draftbus.common;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public class NPVCalcUtils {
    public static double calcNPV(double r, Map<Integer,BigDecimal> netCash){
        double npv = 0;
        /*for (int count = 1; count < netCash.size()+1; count++) {
            System.out.println("netCash:"+netCash.get(count));
        }*/
        if (netCash.size() != 0) {
            for (int count = 0; count < netCash.size(); count++) {
                npv += netCash.get(count+1).doubleValue() / Math.pow(1 + r, count);
            }
            //System.out.println("npv last:"+npv/(1+r));
            return npv/(1+r);
        }
        return Double.NaN;

    }

    public static double calcNPV(double r, Double[] netCash){
        double npv = 0;
        /*for (int count = 0; count < netCash.length; count++) {
            System.out.println("netCash:"+netCash[count]);
        }*/
        if (netCash.length != 0) {
            for (int count = 0; count < netCash.length; count++) {
                npv += netCash[count] / Math.pow(1 + r, count);
                //System.out.println("npv:"+npv);
            }
            //return npv;
            //System.out.println("npv last:"+npv/(1+r));
            return npv/(1+r);
        }
        return Double.NaN;

    }
}
