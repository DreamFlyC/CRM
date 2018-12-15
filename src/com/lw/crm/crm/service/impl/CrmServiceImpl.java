package com.lw.crm.crm.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crm.entity.Crm;
import com.lw.crm.crm.persistence.CrmMapper;
import com.lw.crm.crm.service.ICrmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("CrmServiceImpl")
@Transactional
public class CrmServiceImpl extends BaseServiceImpl<Crm> implements ICrmService {
	@Autowired
	private CrmMapper crmMapper;

	// 根据产品编号和日期查询
	public List<Crm> getAll(Crm obj) {
		return crmMapper.getAll(obj);

	}

	// 获取总数
	public int getCount(Crm obj) {
		return crmMapper.getCount(obj);
	}

	// 删除所有信息
	public int delete(int[] id) {
		return crmMapper.delete(id);
	}

	// 批量导出
	public List<Crm> getListOut(Crm obj) {
		return crmMapper.getListOut(obj);
	}


}
