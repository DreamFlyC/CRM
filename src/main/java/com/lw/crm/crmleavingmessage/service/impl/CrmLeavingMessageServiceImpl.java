package com.lw.crm.crmleavingmessage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmleavingmessage.entity.CrmLeavingMessage;
import com.lw.crm.crmleavingmessage.persistence.CrmLeavingMessageMapper;
import com.lw.crm.crmleavingmessage.service.ICrmLeavingMessageService;

@Service
@Transactional
public class CrmLeavingMessageServiceImpl extends BaseServiceImpl<CrmLeavingMessage> implements ICrmLeavingMessageService{
	@Autowired
	private CrmLeavingMessageMapper crmLeavingMessageMapper;
}
