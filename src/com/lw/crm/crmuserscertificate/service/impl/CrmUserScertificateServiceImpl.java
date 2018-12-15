/**
 * 
 */
package com.lw.crm.crmuserscertificate.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmuserscertificate.entity.CrmUserScertificate;
import com.lw.crm.crmuserscertificate.service.ICrmUserScertificateService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("CrmUserScertificateServiceImpl")
public class CrmUserScertificateServiceImpl extends BaseServiceImpl<CrmUserScertificate> implements ICrmUserScertificateService{

}
