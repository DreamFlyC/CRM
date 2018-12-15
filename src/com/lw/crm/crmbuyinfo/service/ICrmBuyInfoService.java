package com.lw.crm.crmbuyinfo.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.crmbuyinfo.entity.CrmBuyInfo;

public interface ICrmBuyInfoService extends IBaseService<CrmBuyInfo>{
	public CrmBuyInfo getAll(int id);

	/**
	 * @param ids
	 * @return
	 */
	public int delete(int[] ids);

}
