package com.lw.crm.crmcompany.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmcompany.entity.CrmCompany;
import com.lw.crm.crmcompany.service.ICrmCompanyService;

@Controller("CrmCompanyAction")
@RequestMapping(value = "/manage/crmcompany")
@SuppressWarnings("all")
public class CrmCompanyAction extends BaseAction {
	@Autowired
	private ICrmCompanyService crmCompanyService;
	
	//信息列表
			@RequestMapping("/crmcompany_list")
			public String list(){
				instantPage(20);
				List<CrmCompany> list=crmCompanyService.getList();
				int total=crmCompanyService.getCount();
				Pager pager=new Pager(super.getPage(),super.getRows(),total);
				pager.setDatas(list);
				getRequest().setAttribute("pager",pager);
				return  "/WEB-INF/crmcompany/crmcompany_list";
			}
			
			@RequestMapping(value="/post",method=RequestMethod.GET)
			public String addcrmcompany(){
				
				return "/WEB-INF/crmcompany/crmcompany_add";
			}
			
			//新增信息
			@RequestMapping(value="/post",method=RequestMethod.POST)
			public String addcrmcompany(CrmCompany crmCompany){
				crmCompanyService.save(crmCompany);
				return "redirect:crmcompany_list";
			}
			
			//删除信息
			@RequestMapping(value="/del/{id}")
			public String deletecrmcompany(@PathVariable("id")int id,HttpServletResponse response){
				crmCompanyService.del(id);
				return "redirect:../crmcompany_list";
			}
			
			//修改信息
			@RequestMapping(value="/edit",method=RequestMethod.POST)
			public String updatecrmcompany(CrmCompany crmCompany,HttpServletResponse response){
				crmCompanyService.edit(crmCompany);
				return "redirect:crmcompany_list";
			}
			
			//编辑前根据id获取信息
			@RequestMapping(value="/{id}")
			public String viewcrmcompany(@PathVariable("id")int id)
			{
				CrmCompany crmCompany=crmCompanyService.get(id);
				getRequest().setAttribute("crmCompany",crmCompany);
				return "/WEB-INF/crmcompany/crmcompany_detail";
			}

}
