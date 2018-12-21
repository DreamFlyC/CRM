package com.lw.crm.crmpurchacse.persistence;

import java.util.List;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.crmpurchacse.entity.CrmPurchacse;

public interface CrmPurchacseMapper extends BaseMapper<CrmPurchacse>{
	List<CrmPurchacse> getAll(CrmPurchacse obj);
	
	public int  getCount(CrmPurchacse obj);

	//批量删除信息
			public int delete(int[]  id);


}
