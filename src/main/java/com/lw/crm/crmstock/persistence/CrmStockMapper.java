package com.lw.crm.crmstock.persistence;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.crmstock.entity.CrmStock;
import com.lw.crm.crmstock.vo.CrmStockVo;

import java.util.List;
import java.util.Map;

public interface CrmStockMapper extends BaseMapper<CrmStock> {
    //删除所有信息
    int delete(int[] id);

    int getCount(int id);

    int getStockBySidAndSnumber(Map param);

    List<CrmStock> getStatisticsByType(Map<String, Object> map);


    List<CrmStockVo> getVoList(Map<String,Object> params);

}
