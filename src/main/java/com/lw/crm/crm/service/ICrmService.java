package com.lw.crm.crm.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.crm.entity.Crm;

import java.util.List;

public interface ICrmService extends IBaseService<Crm>{
	
	//根据产品编号和日期查询
	public List<Crm> getAll(Crm obj);
	
	//获取总数
	public int getCount(Crm obj);

	//删除所有信息
	public int delete(int[]  id);
	
	
	//批量导出
	public List<Crm> getListOut(Crm obj);

}
