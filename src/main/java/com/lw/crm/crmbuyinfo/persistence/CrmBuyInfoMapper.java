package com.lw.crm.crmbuyinfo.persistence;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.crmbuyinfo.entity.CrmBuyInfo;

public interface CrmBuyInfoMapper extends BaseMapper<CrmBuyInfo>{
	
	public CrmBuyInfo getAll(int id);
	
	public int delete(int[] ids); 

}
