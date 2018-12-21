package com.lw.crm.complaintstype.persistence;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.complaintstype.entity.CrmComplaintsType;

import java.util.List;

public interface CrmComplaintsTypeMapper extends BaseMapper<CrmComplaintsType> {

	public List<CrmComplaintsType> getNameByType(int[] type);
	//根据type查询name
}
