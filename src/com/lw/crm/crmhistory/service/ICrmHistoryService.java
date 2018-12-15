package com.lw.crm.crmhistory.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.crmhistory.entity.CrmHistory;

public interface ICrmHistoryService extends IBaseService<CrmHistory>{

	/**
	 * @param id
	 * @return
	 */
	public int getCount(int id);

}
