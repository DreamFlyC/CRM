package com.lw.crm.complaintstype.action;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.complaintstype.entity.CrmComplaintsType;
import com.lw.crm.complaintstype.service.ICrmComplaintsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller("CrmComplaintsTypeAction")
@RequestMapping(value="/manage/crmcomplaintstype")
public class CrmComplaintsTypeAction extends BaseAction {
	@Autowired
    private ICrmComplaintsTypeService crmComplaintsTypeService;
 @RequestMapping(value="")
	public String list(){
		instantPage(20); //20代表一页显示20条数据
		List<CrmComplaintsType> list=crmComplaintsTypeService.getList();  //获取列表
		int total=crmComplaintsTypeService.getCount();   //获取总数
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);  //绑定数据到前台
		return  "/WEB-INF/crmcomplaintstype/crmcomplaintstype_list";
	}	
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addCrmComplaintsType(){
		return "/WEB-INF/crmcomplaintstype/crmcomplaintstype_add";
	}
	
	//增加
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addCrmComplaintsType(CrmComplaintsType crmComplaintsType){
		crmComplaintsTypeService.save(crmComplaintsType);
		return "redirect:/manage/crmcomplaintstype.html";
	}
	
	//删除
	@RequestMapping(value="/del/{id}")
	public String deleteCrmComplaintsType(@PathVariable("id")int id,HttpServletResponse response){
		System.out.println("id="+id+"---------");
		crmComplaintsTypeService.del(id);
		return "redirect:/manage/crmcomplaintstype.html";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updateCrmComplaintsType(CrmComplaintsType crmComplaintsType,HttpServletResponse response){
		crmComplaintsTypeService.edit(crmComplaintsType);
		return "redirect:/manage/crmcomplaintstype.html";
	}
	@RequestMapping(value="/{id}")
	public String viewCrmComplaintsType(@PathVariable("id")int id)
	{
		CrmComplaintsType crmComplaintsType=crmComplaintsTypeService.get(id);
		getRequest().setAttribute("crmComplaintsType",crmComplaintsType);
		return "/WEB-INF/crmcomplaintstype/crmcomplaintstype_detail";
	}	
}
