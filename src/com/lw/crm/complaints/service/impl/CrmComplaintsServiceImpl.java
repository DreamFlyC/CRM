package com.lw.crm.complaints.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.complaints.entity.CrmComplaints;
import com.lw.crm.complaints.persistence.CrmComplaintsMapper;
import com.lw.crm.complaints.service.ICrmComplaintsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("CrmComplaintsServiceImpl")
@Transactional(rollbackFor = Exception.class)
public class CrmComplaintsServiceImpl extends BaseServiceImpl<CrmComplaints> implements ICrmComplaintsService {
	@Autowired
	CrmComplaintsMapper crmComplaintsMapper;

	@Override
	public List<CrmComplaints> getDateAndTypeList(Map<String,Object> map){
		return crmComplaintsMapper.getDateAndTypeList(map);
	}
	@Override
	public int getTypeCount(){
			return crmComplaintsMapper.getTypeCount();
		}
}
