package com.lw.crm.crmpurchacseitem.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.crmpurchacseitem.entity.CrmPurchacseItem;

import javax.servlet.http.HttpServletResponse;

/**
* @author 作者:qw
* @createDate 创建时间：2018年12月6日 上午10:34:33
*/
public interface ICrmPurchacseItemService extends IBaseService<CrmPurchacseItem>{

    String saveAll(String data, String crmPurchacse, HttpServletResponse response);
}
