package com.lw.crm.crmprice.action;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmprice.entity.CrmPrice;
import com.lw.crm.crmprice.service.ICrmPriceService;

@Controller("CrmPriceAction")
@RequestMapping(value="/manage/crmprice")
public class CrmPriceAction extends BaseAction{
	@Autowired
    private ICrmPriceService crmPriceService;
 @RequestMapping(value= {"","/crmprice_list"})
	public String list(){
		instantPage(20); //20代表一页显示20条数据
		List<CrmPrice> list=crmPriceService.getList();  //获取列表
		int total=crmPriceService.getCount();   //获取总数
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);  //绑定数据到前台
		return  "/WEB-INF/crmprice/crmprice_list";
	}	
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addCrmPrice(){
		return "/WEB-INF/crmprice/crmprice_add";
	}
	
	//增加
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addCrmPrice(CrmPrice crmprice){
		crmPriceService.save(crmprice);
		return "redirect:crmprice_list";
	}
	
	//删除
	@RequestMapping(value="/del/{id}")
	public String deleteCrmPrice(@PathVariable("id")int id,HttpServletResponse response){
		System.out.println("id="+id+"---------");
		crmPriceService.del(id);
		return "redirect:../crmprice_list";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updateCrmPrice(CrmPrice crmprice,HttpServletResponse response){
		crmPriceService.edit(crmprice);
		return "redirect:crmprice_list";
	}
	@RequestMapping(value="/{id}")
	public String viewCrmPrice(@PathVariable("id")int id)
	{
		CrmPrice crmprice=crmPriceService.get(id);
		getRequest().setAttribute("crmprice",crmprice);
		return "/WEB-INF/crmprice/crmprice_detail";
	}	
}
