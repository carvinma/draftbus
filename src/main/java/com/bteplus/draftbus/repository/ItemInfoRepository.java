package com.bteplus.draftbus.repository;

import com.bteplus.draftbus.entity.ItemInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

@Repository
public interface ItemInfoRepository extends JpaRepository<ItemInfo,Integer>,Serializable {
    @Query(value = "select * from item_info where is_delete=0 and item_type=?1 order by sort_no ",nativeQuery = true)
    List<ItemInfo> getItemsByItemType(Integer itemType);

    @Query(value = "select * from item_info where is_delete=0 and parent_id=?1 and item_type=?2 order by sort_no ",nativeQuery = true)
    List<ItemInfo> getItemsByParentIdAndItemType(Integer parentId,Integer itemType);
}
