package com.lw.crm.crmcontact.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmcontact.entity.CrmContact;
import com.lw.crm.crmcontact.service.ICrmContactService;

@Controller("CrmContactAction")
@RequestMapping(value = "/manage/crmcontact")
@SuppressWarnings("all")
public class CrmContactAction extends BaseAction {
	@Autowired
	private ICrmContactService crmContactService;
	
	//信息列表
			@RequestMapping("/crmcontact_list")
			public String list(){
				instantPage(20);
				List<CrmContact> list=crmContactService.getList();
				int total=crmContactService.getCount();
				Pager pager=new Pager(super.getPage(),super.getRows(),total);
				pager.setDatas(list);
				getRequest().setAttribute("pager",pager);
				return  "/WEB-INF/crmcontact/crmcontact_list";
			}
			
			@RequestMapping(value="/post",method=RequestMethod.GET)
			public String addcrmcontact(){
				
				return "/WEB-INF/crmcontact/crmcontact_add";
			}
			
			//新增信息
			@RequestMapping(value="/post",method=RequestMethod.POST)
			public String addcrmcontact(CrmContact crmContact){
				crmContactService.save(crmContact);
				return "redirect:crmcontact_list";
			}
			
			//删除信息
			@RequestMapping(value="/del/{id}")
			public String deletecrmcontact(@PathVariable("id")int id,HttpServletResponse response){
				crmContactService.del(id);
				return "redirect:../crmcontact_list";
			}
			
			//修改信息
			@RequestMapping(value="/edit",method=RequestMethod.POST)
			public String updatecrmcontact(CrmContact crmContact,HttpServletResponse response){
				crmContactService.edit(crmContact);
				return "redirect:crmcontact_list";
			}
			
			//编辑前根据id获取信息
			@RequestMapping(value="/{id}")
			public String viewcrmcontact(@PathVariable("id")int id)
			{
				CrmContact crmContact=crmContactService.get(id);
				getRequest().setAttribute("crmContact",crmContact);
				return "/WEB-INF/crmcontact/crmcontact_detail";
			}

}
