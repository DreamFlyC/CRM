package com.lw.shiroaction.rolevalue.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.shiroaction.rolevalue.entity.ShiroActionRoleValue;
import com.lw.shiroaction.rolevalue.service.IShiroActionRoleValueService;

/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:30:23
*类说明
*/
@Controller("ShiroActionRoleValueAction")
@RequestMapping(value="/manage/shiroaction/rolevalue")
public class ShiroActionRoleValueAction extends BaseAction{
	@Autowired
	private IShiroActionRoleValueService shiroActionRoleValueService;
	
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<ShiroActionRoleValue> list=shiroActionRoleValueService.getList();
		int total=shiroActionRoleValueService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "WEB-INF/shiroaction_rolevalue/shiroaction_rolevalue_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addRoleValue(){
		
		return "WEB-INF/shiroaction_rolevalue/shiroaction_rolevalue_add";
	}
	
	
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addRoleValue(ShiroActionRoleValue shiroActionRoleValue){
		shiroActionRoleValueService.save(shiroActionRoleValue);
		return "redirect:/manage/shiroaction/rolevalue.html";
	}
	
	
	@RequestMapping(value="/del/{id}")
	public String deleteRoleValue(@PathVariable("id")int id,HttpServletResponse response){
		shiroActionRoleValueService.del(id);
		return "redirect:/manage/shiroaction/rolevalue.html";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updateRoleValue(ShiroActionRoleValue shiroActionRoleValue,HttpServletResponse response){
		shiroActionRoleValueService.edit(shiroActionRoleValue);
		return "redirect:/manage/shiroaction/rolevalue.html";
	}
	@RequestMapping(value="/{id}")
	public String viewRoleValue(@PathVariable("id")int id)
	{
		ShiroActionRoleValue shiroActionRoleValue=shiroActionRoleValueService.get(id);
		getRequest().setAttribute("shiroActionRoleValue",shiroActionRoleValue);
		return "WEB-INF/shiroaction_rolevalue/shiroaction_rolevalue_detail";
	}

}
