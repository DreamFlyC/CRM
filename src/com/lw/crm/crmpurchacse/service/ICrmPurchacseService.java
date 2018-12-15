package com.lw.crm.crmpurchacse.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.crmpurchacse.entity.CrmPurchacse;

import java.util.List;

public interface ICrmPurchacseService extends IBaseService<CrmPurchacse>{

	List<CrmPurchacse> getAll(CrmPurchacse obj);

	public int  getCount(CrmPurchacse obj);

	//删除所有信息
	public int delete(int[]  id);

	public boolean saveOrder(int[] ids,int[] nums,String[] notes,String title,String number,String address);

}
