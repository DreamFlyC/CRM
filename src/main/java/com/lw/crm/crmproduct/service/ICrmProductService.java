package com.lw.crm.crmproduct.service;

import java.util.List;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.crmproduct.entity.CrmProduct;

public interface ICrmProductService extends IBaseService<CrmProduct>{
	
	//根据产品编号和日期查询
	public List<CrmProduct> getAll(CrmProduct obj);
	
	//获取总数
	public int getCount(CrmProduct obj);

	//删除所有信息
	public int delete(int[]  id);
	
	// 修改信息
	public CrmProduct getById(int id);

	public void update(CrmProduct obj);
	
	//批量导出
	public List<CrmProduct> getListOut(CrmProduct obj);

}
