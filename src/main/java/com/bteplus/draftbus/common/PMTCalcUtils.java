package com.bteplus.draftbus.common;

public class PMTCalcUtils {
    /**
     *
     * 计算月供
     *
     * @param rate
     *            年利率 年利率除以12就是月利率
     * @param nper
     *            贷款期数，单位月 该项贷款的付款总数。
     * @param pv
     *            贷款金额,现值，或一系列未来付款的当前值的累积和，也称为本金。
     * @return
     *
     */
    public static double calculatePMT(double rate, double nper, double pv) {
        double v = (1 + (rate / 12));
        double t = (-(nper / 12) * 12);
        double result = (pv * (rate / 12)) / (1 - Math.pow(v, t));
        return result;
    }

    public static double calculatePMT2(double rate, double nper, double pv) {
        double v = (1 + (rate ));
        double t = -(nper);
        double result = (pv * (rate)) / (1 - Math.pow(v, t));
        return result;
    }


    public static void main(String[] args){
        double result=calculatePMT2(0.1,5,3100000);
        System.out.println(result);
    }

}
