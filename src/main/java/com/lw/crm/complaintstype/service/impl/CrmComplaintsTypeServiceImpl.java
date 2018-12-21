package com.lw.crm.complaintstype.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.complaintstype.entity.CrmComplaintsType;
import com.lw.crm.complaintstype.persistence.CrmComplaintsTypeMapper;
import com.lw.crm.complaintstype.service.ICrmComplaintsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("CrmComplaintsTypeServiceImpl")
@Transactional
public class CrmComplaintsTypeServiceImpl extends BaseServiceImpl<CrmComplaintsType> implements ICrmComplaintsTypeService  {
	@Autowired
	private CrmComplaintsTypeMapper crmComplaintsTypeMapper;
	
	public List<CrmComplaintsType> getNameByType(int[] type){
		return crmComplaintsTypeMapper.getNameByType(type);
	}
}
