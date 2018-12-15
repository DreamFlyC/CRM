package com.lw.crm.crmreceipttype.action;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmreceipttype.entity.CrmReceiptType;
import com.lw.crm.crmreceipttype.service.ICrmReceiptTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller("CrmReceiptTypeAction")
@RequestMapping(value="/manage/crmreceipttype")
public class CrmReceiptTypeAction extends BaseAction{
	@Autowired
    private ICrmReceiptTypeService crmReceiptTypeService;
			
        @RequestMapping(value= "")
   		public String list(){
   			instantPage(20);
   			List<CrmReceiptType> list= crmReceiptTypeService.getList();
   			int total= crmReceiptTypeService.getCount();
   			Pager pager=new Pager(super.getPage(),super.getRows(),total);
   			pager.setDatas(list);
   			getRequest().setAttribute("pager",pager);
   			return  "/WEB-INF/crmreceipttype/crmreceipttype_list";
   		}	
   		
   		@RequestMapping(value="/post",method=RequestMethod.GET)
   		public String addCrmPayment(){
   			return "/WEB-INF/crmreceipttype/crmreceipttype_add";
   		}
   		
   		//增加
   		@RequestMapping(value="/post",method=RequestMethod.POST)
   		public String addCrmPayment(CrmReceiptType crmReceiptType){
   			crmReceiptTypeService.save(crmReceiptType);
   			return "redirect:/manage/crmreceipttype";
   		}
   		
   		//删除
   		@RequestMapping(value="/del/{id}")
   		public String deleteCrmPayment(@PathVariable("id")int id,HttpServletResponse response){
   			System.out.println("id="+id+"---------");
   			crmReceiptTypeService.del(id);
   			return "redirect:/manage/crmreceipttype";
   		}
   		
   		@RequestMapping(value="/edit",method=RequestMethod.POST)
   		public String updateCrmPayment(CrmReceiptType crmReceiptType, HttpServletResponse response){
   			crmReceiptTypeService.edit(crmReceiptType);
   			return "redirect:/manage/crmreceipttype";
   		}
   		@RequestMapping(value="/{id}")
   		public String viewCrmPayment(@PathVariable("id")int id)
   		{
   			CrmReceiptType crmReceiptType= crmReceiptTypeService.get(id);
   			getRequest().setAttribute("crmReceiptType",crmReceiptType);
   			return "/WEB-INF/crmreceipttype/crmreceipttype_detail";
   		}	
}
