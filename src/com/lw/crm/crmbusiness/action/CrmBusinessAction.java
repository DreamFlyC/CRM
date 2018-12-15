package com.lw.crm.crmbusiness.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmbusiness.entity.CrmBusiness;
import com.lw.crm.crmbusiness.service.ICrmBusinessService;

@Controller("CrmBusinessAction")
@RequestMapping(value = "/manage/crmbusiness")
@SuppressWarnings("all")
public class CrmBusinessAction extends BaseAction {
	@Autowired
	private ICrmBusinessService crmBusinessService;
	
	//信息列表
			@RequestMapping("/crmbusiness_list")
			public String list(){
				instantPage(20);
				List<CrmBusiness> list=crmBusinessService.getList();
				int total=crmBusinessService.getCount();
				Pager pager=new Pager(super.getPage(),super.getRows(),total);
				pager.setDatas(list);
				getRequest().setAttribute("pager",pager);
				return  "/WEB-INF/crmbusiness/crmbusiness_list";
			}
			
			@RequestMapping(value="/post",method=RequestMethod.GET)
			public String addcrmbusiness(){
				
				return "/WEB-INF/crmbusiness/crmbusiness_add";
			}
			
			//新增信息
			@RequestMapping(value="/post",method=RequestMethod.POST)
			public String addcrmbusiness(CrmBusiness crmBusiness){
				crmBusinessService.save(crmBusiness);
				return "redirect:crmbusiness_list";
			}
			
			//删除信息
			@RequestMapping(value="/del/{id}")
			public String deletecrmbusiness(@PathVariable("id")int id,HttpServletResponse response){
				crmBusinessService.del(id);
				return "redirect:../crmbusiness_list";
			}
			
			//修改信息
			@RequestMapping(value="/edit",method=RequestMethod.POST)
			public String updatecrmbusiness(CrmBusiness crmBusiness,HttpServletResponse response){
				crmBusinessService.edit(crmBusiness);
				return "redirect:crmbusiness_list";
			}
			
			//编辑前根据id获取信息
			@RequestMapping(value="/{id}")
			public String viewcrmbusiness(@PathVariable("id")int id)
			{
				CrmBusiness crmBusiness=crmBusinessService.get(id);
				getRequest().setAttribute("crmBusiness",crmBusiness);
				return "/WEB-INF/crmbusiness/crmbusiness_detail";
			}


}
