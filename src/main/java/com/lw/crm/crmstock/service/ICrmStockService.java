package com.lw.crm.crmstock.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.crmstock.entity.CrmStock;

import java.util.List;
import java.util.Map;

public interface ICrmStockService extends IBaseService<CrmStock>{

	//删除所有信息
	public int delete(int[]  id);

	/**
	 * @param id
	 * @return
	 */
	public int getCount(int id);

	/**
	 * @Desc
	 * @param param
	 * @return
	 * @author CZP
	 */
	public int getStockBySidAndSnumber(Map param);


	List<CrmStock> getStatisticsByType(Map<String, Object> map);

}
