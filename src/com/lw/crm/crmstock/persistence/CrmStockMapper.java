package com.lw.crm.crmstock.persistence;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.crmstock.entity.CrmStock;

import java.util.List;
import java.util.Map;

public interface CrmStockMapper extends BaseMapper<CrmStock>{
	//删除所有信息
		public int delete(int[]  id);
		
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
