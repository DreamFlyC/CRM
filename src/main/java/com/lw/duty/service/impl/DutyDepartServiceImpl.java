package com.lw.duty.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.duty.entity.DutyDepart;
import com.lw.duty.persistence.DutyDepartMapper;
import com.lw.duty.service.IDutyDepartService;


@Service("DutyDepartServiceImpl")
@Transactional
public class DutyDepartServiceImpl extends BaseServiceImpl<DutyDepart> implements IDutyDepartService{
	@Autowired
	private DutyDepartMapper departMapper;
	
	
}
