package com.lw.shiroaction.model.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.shiroaction.model.entity.ShiroActionModel;
import com.lw.shiroaction.model.service.IShiroActionModelService;

/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:24:18
*类说明
*/
@Controller("ShiroActionModelAction")
@RequestMapping(value="/manage/shiroaction/model")
public class ShiroActionModelAction extends BaseAction{
	@Autowired
	private IShiroActionModelService shiroActionModelService;
	
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<ShiroActionModel> list=shiroActionModelService.getList();
		int total=shiroActionModelService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "WEB-INF/shiroaction_model/shiroaction_model_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addModel(){
		
		return "WEB-INF/shiroaction_model/shiroaction_model_add";
	}
	
	
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addModel(ShiroActionModel shiroActionModel){
		shiroActionModelService.save(shiroActionModel);
		return "redirect:/manage/shiroaction/model.html";
	}
	
	
	@RequestMapping(value="/del/{id}")
	public String deleteModel(@PathVariable("id")int id,HttpServletResponse response){
		shiroActionModelService.del(id);
		return "redirect:/manage/shiroaction/model.html";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updateModel(ShiroActionModel shiroActionModel,HttpServletResponse response){
		shiroActionModelService.edit(shiroActionModel);
		return "redirect:/manage/shiroaction/model.html";
	}
	@RequestMapping(value="/{id}")
	public String viewModel(@PathVariable("id")int id)
	{
		ShiroActionModel shiroActionModel=shiroActionModelService.get(id);
		getRequest().setAttribute("shiroActionModel",shiroActionModel);
		return "WEB-INF/shiroaction_model/shiroaction_model_detail";
	}
}
