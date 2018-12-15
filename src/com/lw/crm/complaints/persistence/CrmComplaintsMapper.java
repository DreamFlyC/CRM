package com.lw.crm.complaints.persistence;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.complaints.entity.CrmComplaints;

import java.util.List;
import java.util.Map;

public interface CrmComplaintsMapper extends BaseMapper<CrmComplaints> {
//	    //投诉统计
//		List<FeedBack> getMonth(Map<String, Object> map);
		//complaints数据
		List<CrmComplaints> getDateAndTypeList(Map<String, Object> map);

    int getTypeCount();
}
