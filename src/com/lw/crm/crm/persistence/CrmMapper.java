package com.lw.crm.crm.persistence;

import java.util.List;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.crm.entity.Crm;

public interface CrmMapper extends BaseMapper<Crm>{
	       //根据产品编号和日期查询
			public List<Crm> getAll(Crm obj);
			
			//获取总数
			public int getCount(Crm obj);

			//批量删除信息
			public int delete(int[]  id);
			
			//批量导出
			public List<Crm> getListOut(Crm obj);
}
