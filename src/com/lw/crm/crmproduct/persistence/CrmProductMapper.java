package com.lw.crm.crmproduct.persistence;

import java.util.List;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.crmproduct.entity.CrmProduct;

public interface CrmProductMapper extends BaseMapper<CrmProduct>{
	       //根据产品编号和日期查询
			public List<CrmProduct> getAll(CrmProduct obj);
			
			//获取总数
			public int getCount(CrmProduct obj);

			//批量删除信息
			public int delete(int[]  id);
			
			// 修改信息
			public CrmProduct getById(int id);

			public void update(CrmProduct obj);
			
			//批量导出
			public List<CrmProduct> getListOut(CrmProduct obj);
}
