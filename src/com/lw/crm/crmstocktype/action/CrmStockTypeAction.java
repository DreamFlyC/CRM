package com.lw.crm.crmstocktype.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.common.util.ContextUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmstocktype.entity.CrmStockType;
import com.lw.crm.crmstocktype.service.ICrmStockTypeService;
import com.lw.weixin.users.entity.Users;

@Controller("CrmStockTypeAction")
@RequestMapping(value="manage/crmstocktype")
public class CrmStockTypeAction extends BaseAction{
	@Autowired
	private ICrmStockTypeService crmStockTypeService;
	//信息列表
	@RequestMapping("/crmstocktype_list")
	public String list(){
		instantPage(20);
		List<CrmStockType> list=crmStockTypeService.getList();
		int total=crmStockTypeService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/crmstocktype/crmstocktype_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addcrmstocktype(){
		
		return "/WEB-INF/crmstocktype/crmstocktype_add";
	}
	
	//新增信息
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addcrmstocktype(CrmStockType crmStockType){
		Users user = ContextUtil.getContextLoginUser();// 登录账号的信息
	    crmStockType.setUid(String.valueOf(user.getId()));
		crmStockTypeService.save(crmStockType);
		return "redirect:crmstocktype_list";
	}
	
	//删除信息
	@RequestMapping(value="/del/{id}")
	public String deletecrmstocktype(@PathVariable("id")int id,HttpServletResponse response){
		crmStockTypeService.del(id);
		return "redirect:../crmstocktype_list";
	}
	
	//修改信息
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatecrmstocktype(CrmStockType crmStockType,HttpServletResponse response){
		crmStockTypeService.edit(crmStockType);
		return "redirect:crmstocktype_list";
	}
	
	//编辑前根据id获取信息
	@RequestMapping(value="/{id}")
	public String viewcrmstocktype(@PathVariable("id")int id)
	{
		CrmStockType crmStockType=crmStockTypeService.get(id);
		getRequest().setAttribute("crmStockType",crmStockType);
		return "/WEB-INF/crmstocktype/crmstocktype_detail";
	}


}
