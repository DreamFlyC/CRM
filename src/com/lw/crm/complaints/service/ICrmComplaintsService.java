package com.lw.crm.complaints.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.complaints.entity.CrmComplaints;

import java.util.List;
import java.util.Map;

public interface ICrmComplaintsService extends IBaseService<CrmComplaints>{
//	//投诉统计
//	public List<FeedBack> getMonth(Map<String, Object> map);
	//complaints数据
	List<CrmComplaints> getDateAndTypeList(Map<String, Object> map);

	int getTypeCount();
}
