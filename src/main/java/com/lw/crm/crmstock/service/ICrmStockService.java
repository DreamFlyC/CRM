package com.lw.crm.crmstock.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.crmstock.entity.CrmStock;
import com.lw.crm.crmstock.vo.CrmStockVo;

import java.util.List;
import java.util.Map;

public interface ICrmStockService extends IBaseService<CrmStock> {

    int delete(int[] id);

    int getCount(int id);

    int getStockBySidAndSnumber(Map param);

    List<CrmStock> getStatisticsByType(Map<String, Object> map);

    List<CrmStockVo> getVoList(Map<String, Object> params);

}
