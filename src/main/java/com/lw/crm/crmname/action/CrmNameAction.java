package com.lw.crm.crmname.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmname.service.ICrmNameService;

@Controller("CrmNameAction")
@RequestMapping(value = "/manage/crmname")
@SuppressWarnings("all")
public class CrmNameAction extends BaseAction {
	@Autowired
	private ICrmNameService crmNameService;
	
	//信息列表
			@RequestMapping("/crmname_list")
			public String list(){
				instantPage(20);
				List<CrmName> list=crmNameService.getList();
				int total=crmNameService.getCount();
				Pager pager=new Pager(super.getPage(),super.getRows(),total);
				pager.setDatas(list);
				getRequest().setAttribute("pager",pager);
				return  "/WEB-INF/crmname/crmname_list";
			}
			
			@RequestMapping(value="/post",method=RequestMethod.GET)
			public String addcrmname(){
				
				return "/WEB-INF/crmname/crmname_add";
			}
			
			//新增信息
			@RequestMapping(value="/post",method=RequestMethod.POST)
			public String addcrmname(CrmName crmName){
				crmNameService.save(crmName);
				return "redirect:crmname_list";
			}
			
			//删除信息
			@RequestMapping(value="/del/{id}")
			public String deletecrmname(@PathVariable("id")int id,HttpServletResponse response){
				crmNameService.del(id);
				return "redirect:../crmname_list";
			}
			
			//修改信息
			@RequestMapping(value="/edit",method=RequestMethod.POST)
			public String updatecrmname(CrmName crmName,HttpServletResponse response){
				crmNameService.edit(crmName);
				return "redirect:crmname_list";
			}
			
			//编辑前根据id获取信息
			@RequestMapping(value="/{id}")
			public String viewcrmname(@PathVariable("id")int id)
			{
				CrmName crmName=crmNameService.get(id);
				getRequest().setAttribute("crmName",crmName);
				return "/WEB-INF/crmname/crmname_detail";
			}


}
