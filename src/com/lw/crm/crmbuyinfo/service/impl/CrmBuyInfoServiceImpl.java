package com.lw.crm.crmbuyinfo.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmbuyinfo.entity.CrmBuyInfo;
import com.lw.crm.crmbuyinfo.persistence.CrmBuyInfoMapper;
import com.lw.crm.crmbuyinfo.service.ICrmBuyInfoService;

@Service("CrmBuyInfoServiceImpl")
@Transactional
public class CrmBuyInfoServiceImpl extends BaseServiceImpl<CrmBuyInfo> implements ICrmBuyInfoService{
@Autowired
private CrmBuyInfoMapper crmBuyInfoMapper;

	public CrmBuyInfo getAll(int id){
		return crmBuyInfoMapper.getAll(id);
	}
	
	public int delete(int[] ids) {
		return crmBuyInfoMapper.delete(ids);
	}
}
