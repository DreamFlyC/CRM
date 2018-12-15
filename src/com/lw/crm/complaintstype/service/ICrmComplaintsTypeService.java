package com.lw.crm.complaintstype.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.complaintstype.entity.CrmComplaintsType;

import java.util.List;

public interface ICrmComplaintsTypeService extends IBaseService<CrmComplaintsType> {
	//根据type查询name
		public List<CrmComplaintsType> getNameByType(int[] type);
}
