package com.lw.wxkf.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.wxkf.service.IWxkfService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("WxkfServiceImpl")
@Transactional
public class WxkfServiceImpl extends BaseServiceImpl<com.lw.wxkf.entity.Wxkf> implements IWxkfService {

}

