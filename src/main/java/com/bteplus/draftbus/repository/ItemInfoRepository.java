package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.ItemInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public interface ItemInfoRepository extends JpaRepository<ItemInfo,Integer>,Serializable {
    @Query(value = "select * from item_info where is_delete=0 and item_type=?1 order by item_name ",nativeQuery = true)
    List<ItemInfo> getItemsByItemType(Integer itemType);

    @Query(value = "select * from item_info where is_delete=0 and item_unit=?1 and item_type=?2 order by item_name ",nativeQuery = true)
    List<ItemInfo> getItemsByUnitAndItemType(String unit,Integer itemType);

    @Query(value = "select * from item_info where is_delete=0 and parent_id=?1 and item_type=?2 order by item_name ",nativeQuery = true)
    List<ItemInfo> getItemsByParentIdAndItemType(Integer parentId,Integer itemType);

    @Query(value = "select item.* from item_info item where item_id in (select country_id from fe_data fe group by country_id)",nativeQuery = true)
    List<ItemInfo> getCountryList();



    @Query(value = "select * from item_info item where item_id in (select city_id from fe_data fe where country_id=?1 group by city_id )",nativeQuery = true)
    List<ItemInfo> getCityList(Integer countryId);

    @Query(value = "select * from item_info item where item_id in (select vehicle_type from fe_data fe where country_id=?1 and (?2 is null or city_id=?2) group by vehicle_type )",nativeQuery = true)
    List<ItemInfo> getVehicleTypeList(Integer countryId,Integer cityId);

    @Query(value = "select * from item_info item where item_id in (select fuel_type from fe_data fe where country_id=?1 and (?2 is null or city_id=?2) and (?3 is null or vehicle_type=?3) group by fuel_type )",nativeQuery = true)
    List<ItemInfo> getFuelTypeList(Integer countryId,Integer cityId,Integer vehicleType);

    @Query(value = "select * from item_info item where item_id in (select op_speed from fe_data fe where country_id=?1 and (?2 is null or city_id=?2) and (?3 is null or vehicle_type=?3) and fuel_type=?4 group by op_speed )",nativeQuery = true)
    List<ItemInfo> getSpeedList(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType);

    @Query(value = "select * from item_info item where item_id in (select fe_load from fe_data fe where country_id=?1 and (?2 is null or city_id=?2)  and (?3 is null or vehicle_type=?3) and fuel_type=?4 and (?5 is null or op_speed=?5) group by fe_load )",nativeQuery = true)
    List<ItemInfo> getLoadList(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType,Integer opSpeed);

    @Query(value = "select * from item_info item where item_id in (select ac from fe_data fe where country_id=?1 and (?2 is null or city_id=?2) and   (?3 is null or vehicle_type=?3) and fuel_type=?4 and (?5 is null or op_speed=?5) and (?6 is null or fe_load=?6) group by ac )",nativeQuery = true)
    List<ItemInfo> getAcList(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType,Integer opSpeed,Integer load);


    //-------------------------------new db------------------

    @Query(value = "select item.* from item_info item where item_id in (select country_id from general_base group by country_id) order by item_name",nativeQuery = true)
    List<ItemInfo> getCountryList2();

    @Query(value = "select * from item_info item where item_id in (select city_id from general_base  where country_id=?1 group by city_id ) order by item_name",nativeQuery = true)
    List<ItemInfo> getCityList2(Integer countryId);

    @Query(value = "select * from item_info item where item_id in (select vehicle_type from ef_tail  where country_id=?1 and (?2 is null or city_id=?2) group by vehicle_type )",nativeQuery = true)
    List<ItemInfo> getVehicleTypeList2(Integer countryId,Integer cityId);

    @Query(value = "select * from item_info item where item_id in (select fuel_type from ef_tail  where country_id=?1 and (?2 is null or city_id=?2) and (?3 is null or vehicle_type=?3) group by fuel_type )",nativeQuery = true)
    List<ItemInfo> getFuelTypeList2(Integer countryId,Integer cityId,Integer vehicleType);


    @Query(value = "select * from item_info item where item_id in (select op_speed from ef_tail  where country_id=?1 and (?2 is null or city_id=?2) and (?3 is null or vehicle_type=?3) and fuel_type=?4 group by op_speed )",nativeQuery = true)
    List<ItemInfo> getSpeedList2(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType);

    @Query(value = "select * from item_info item where item_id in (select ef_load from ef_tail  where country_id=?1 and (?2 is null or city_id=?2)  and (?3 is null or vehicle_type=?3) and fuel_type=?4 and (?5 is null or op_speed=?5) group by ef_load )",nativeQuery = true)
    List<ItemInfo> getLoadList2(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType,Integer opSpeed);

    @Query(value = "select * from item_info item where item_id in (select ac from ef_tail  where country_id=?1 and (?2 is null or city_id=?2) and   (?3 is null or vehicle_type=?3) and fuel_type=?4 and (?5 is null or op_speed=?5) and (?6 is null or ef_load=?6) group by ac )",nativeQuery = true)
    List<ItemInfo> getAcList2(Integer countryId,Integer cityId,Integer vehicleType,Integer fuelType,Integer opSpeed,Integer load);

}
