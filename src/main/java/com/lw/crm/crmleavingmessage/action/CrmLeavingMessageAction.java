package com.lw.crm.crmleavingmessage.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmleavingmessage.entity.CrmLeavingMessage;
import com.lw.crm.crmleavingmessage.service.ICrmLeavingMessageService;

@Controller("CrmLeavingMessageAction")
@RequestMapping(value="/manage/crmleavingmessage")
public class CrmLeavingMessageAction extends BaseAction{
	@Autowired
	private ICrmLeavingMessageService crmLeavingMessageService;
	
	//信息列表
	@RequestMapping("/crmleavingmessage_list")
	public String list(){
		instantPage(20);
		List<CrmLeavingMessage> list=crmLeavingMessageService.getList();
		int total=crmLeavingMessageService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/crmleavingmessage/crmleavingmessage_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addcrmleavingmessage(){
		
		return "/WEB-INF/crmleavingmessage/crmleavingmessage_add";
	}
	
	//新增信息
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addcrmleavingmessage(CrmLeavingMessage crmLeavingMessage){
		crmLeavingMessageService.save(crmLeavingMessage);
		//return "redirect:crmleavingmessage_list";
		return "/success";
	}
	
	//删除信息
	@RequestMapping(value="/del/{id}")
	public String deletecrmleavingmessage(@PathVariable("id")int id,HttpServletResponse response){
		crmLeavingMessageService.del(id);
		return "redirect:../crmleavingmessage_list";
	}
	
	//修改信息
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatecrmleavingmessage(CrmLeavingMessage crmLeavingMessage,HttpServletResponse response){
		crmLeavingMessageService.edit(crmLeavingMessage);
		return "redirect:crmleavingmessage_list";
	}
	
	//编辑前根据id获取信息
	@RequestMapping(value="/{id}")
	public String viewcrmleavingmessage(@PathVariable("id")int id)
	{
		CrmLeavingMessage crmLeavingMessage=crmLeavingMessageService.get(id);
		getRequest().setAttribute("crmLeavingMessage",crmLeavingMessage);
		return "/WEB-INF/crmleavingmessage/crmleavingmessage_detail";
	}



}
