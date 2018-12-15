package com.lw.crm.crmuser.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmuser.entity.CrmUser;
import com.lw.crm.crmuser.service.ICrmUserService;

@Controller("CrmUserAction")
@RequestMapping(value = "/manage/crmuser")
@SuppressWarnings("all")
public class CrmUserAction extends BaseAction{
	@Autowired
	private ICrmUserService crmUserService;
	
	//信息列表
		@RequestMapping("crmuser_list")
		public String list(){
			instantPage(20);
			List<CrmUser> list=crmUserService.getList();
			int total=crmUserService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
			return  "/WEB-INF/crmuser/crmuser_list";
		}
		
		@RequestMapping(value="/post",method=RequestMethod.GET)
		public String addcrmuser(){
			
			return "/WEB-INF/crmuser/crmuser_add";
		}
		
		//新增信息
		@RequestMapping(value="/post",method=RequestMethod.POST)
		public String addcrmuser(CrmUser crmUser){
			crmUserService.save(crmUser);
			return "redirect:crmuser_list";
		}
		
		//删除信息
		@RequestMapping(value="/del/{id}")
		public String deletecrmuser(@PathVariable("id")int id,HttpServletResponse response){
			crmUserService.del(id);
			return "redirect:../crmuser_list";
		}
		
		//修改信息
		@RequestMapping(value="/edit",method=RequestMethod.POST)
		public String updatecrmuser(CrmUser crmUser,HttpServletResponse response){
			crmUserService.edit(crmUser);
			return "redirect:crmuser_list";
		}
		
		//编辑前根据id获取信息
		@RequestMapping(value="/{id}")
		public String viewcrmuser(@PathVariable("id")int id)
		{
			CrmUser crmUser=crmUserService.get(id);
			getRequest().setAttribute("crmUser",crmUser);
			return "/WEB-INF/crmuser/crmuser_detail";
		}

}
