package com.lw.crm.crmunit.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmunit.entity.CrmUnit;
import com.lw.crm.crmunit.service.ICrmUnitService;

@Controller("CrmUnitAction")
@RequestMapping(value = "/manage/crmunit")
@SuppressWarnings("all")
public class CrmUnitAction extends BaseAction {
	@Autowired
	private ICrmUnitService crmUnitService;
	//信息列表
			@RequestMapping(value= {"","/crmunit_list"})
			public String list(){
				instantPage(20);
				List<CrmUnit> list=crmUnitService.getList();
				int total=crmUnitService.getCount();
				Pager pager=new Pager(super.getPage(),super.getRows(),total);
				pager.setDatas(list);
				getRequest().setAttribute("pager",pager);
				return  "/WEB-INF/crmunit/crmunit_list";
			}
			
			@RequestMapping(value="/post",method=RequestMethod.GET)
			public String addcrmunit(){
				
				return "/WEB-INF/crmunit/crmunit_add";
			}
			
			//新增信息
			@RequestMapping(value="/post",method=RequestMethod.POST)
			public String addcrmunit(CrmUnit crmUnit){
				crmUnitService.save(crmUnit);
				return "redirect:crmunit_list";
			}
			
			//删除信息
			@RequestMapping(value="/del/{id}")
			public String deletecrmunit(@PathVariable("id")int id,HttpServletResponse response){
				crmUnitService.del(id);
				return "redirect:../crmunit_list";
			}
			
			//修改信息
			@RequestMapping(value="/edit",method=RequestMethod.POST)
			public String updatecrmunit(CrmUnit crmUnit,HttpServletResponse response){
				crmUnitService.edit(crmUnit);
				return "redirect:crmunit_list";
			}
			
			//编辑前根据id获取信息
			@RequestMapping(value="/{id}")
			public String viewcrmunit(@PathVariable("id")int id)
			{
				CrmUnit crmUnit=crmUnitService.get(id);
				getRequest().setAttribute("crmUnit",crmUnit);
				return "/WEB-INF/crmunit/crmunit_detail";
			}


}
