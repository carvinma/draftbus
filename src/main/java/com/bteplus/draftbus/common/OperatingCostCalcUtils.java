package com.bteplus.draftbus.common;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;

public class OperatingCostCalcUtils {
    public static Double[] calcFuelCosts(Double vkt,Integer busNumber,Double fuelEfficiency,Double fuelCostRate,Double fuelCostProject,Double fuelAdditive,Integer operationalYear){
        Double[] results=new Double[operationalYear];

        System.out.println("Fuel cost list");

        for(Integer i=0;i<operationalYear;i++) {
            double d=((fuelCostRate * Math.pow((1 + fuelCostProject), i)) + fuelAdditive);
            double result = vkt * busNumber * fuelEfficiency  * 0.01 *d ;
            DecimalFormat df = new DecimalFormat(".00");
            result=Double.valueOf(df.format(result));
            System.out.println(result);
            results[i]=result;
        }
        System.out.println("Fuel cost list end");
        return results;
    }


    public static Double[] calcOperatingCost(Double laborCost,Double fuelStationCostperationCost,Double insurance,Double additionalOperationalCost,Double[] fuelCosts){
        int length=fuelCosts.length;
        Double[] results=new Double[length];
        DecimalFormat df = new DecimalFormat(".00");
        System.out.println("Operating cost list");
        for(Integer i=0;i<length;i++) {
            double result=laborCost+fuelStationCostperationCost+insurance+additionalOperationalCost+fuelCosts[i];
            result=Double.valueOf(df.format(result));
            results[i]=result;
            System.out.println(result);
        }
        System.out.println("Operating cost list end");
        return results;
    }

    public  static double calcFixedMaintenanceCost(Double fixedAnnualMaintenanceCost,Double laborCost,Double addtionalMaintenanceCost,Double fuelStationMaintenance){
        double result= fixedAnnualMaintenanceCost+laborCost+addtionalMaintenanceCost+fuelStationMaintenance;
        DecimalFormat df = new DecimalFormat(".00");
        result=Double.valueOf(df.format(result));
        System.out.println("FixedMaintenanceCost"+String.valueOf(result));
        return result;
    }



    public static void main(String[] args) {
        double vkt=40000;
        int busNumber=500;
        double fuelCostRate=0.5;
        double fuelCostProject=0.05;
        double fuelAdditive=0.5;
        int operationalYear=8;
        double fixedAnnualMaintenanceCost=10000000;
        double laborCost=7500000;
        double additionalMaintenanceCost=0;
        double fuelStationMaintenance=5000;

        double fuelStationCostperationCost=5000;
        double insurance=50000;
        double additionalOperationalCost=200000;
        double discountRate=0.0225;
        Double[] fuelCostResults=calcFuelCosts(vkt,busNumber,Double.valueOf(30),fuelCostRate,fuelCostProject,fuelAdditive,operationalYear);
        double fixedMaintenanceCosts = calcFixedMaintenanceCost(fixedAnnualMaintenanceCost,laborCost,additionalMaintenanceCost,fuelStationMaintenance);
        Double[] operatingCostResults=calcOperatingCost(laborCost,fuelStationCostperationCost,insurance,additionalOperationalCost,fuelCostResults);

        Double[] laborCostResults=new Double[operationalYear];
        Double[] maintenanceCostResults=new Double[operationalYear];
        Double[] omCostResults=new Double[operationalYear];

        double totalOperatingCost=0;
        double totalLaborCost=0;
        double totalFuelCost=0;
        double totalMaintenceCost=0;
        double totalOMCost=0;
        System.out.println("operatingCostResults");
        for(int i=0;i<operationalYear;i++){

            totalOperatingCost=totalOperatingCost+operatingCostResults[i];
            System.out.println(operatingCostResults[i]);

            laborCostResults[i]=laborCost;
            maintenanceCostResults[i]=fixedMaintenanceCosts;
            omCostResults[i]=laborCost+fuelCostResults[i]+fixedMaintenanceCosts;
            //System.out.println( omCostResults[i]);
        }
        double operatingNPV=NPVCalcUtils.calcNPV(discountRate,operatingCostResults);
        //System.out.println(""+totalOperatingCost);


        System.out.println("operatingNPV"+String.valueOf(operatingNPV));

        System.out.println("laborCost"+String.valueOf(laborCost));

        double laborCostNPV=NPVCalcUtils.calcNPV(discountRate,laborCostResults);
        System.out.println("laborCostNPV"+String.valueOf(laborCostNPV));

        double fuelCostNPV=NPVCalcUtils.calcNPV(discountRate,fuelCostResults);
        System.out.println(fuelCostNPV);

        double maintenanceCostNPV=NPVCalcUtils.calcNPV(discountRate,maintenanceCostResults);
        System.out.println(maintenanceCostNPV);

        double omCostNPV=NPVCalcUtils.calcNPV(discountRate,omCostResults);
        System.out.println(omCostNPV);



    }
}
