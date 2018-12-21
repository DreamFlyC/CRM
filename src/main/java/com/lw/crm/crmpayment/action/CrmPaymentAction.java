package com.lw.crm.crmpayment.action;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmpayment.entity.CrmPayment;
import com.lw.crm.crmpayment.service.ICrmPaymentService;
@Controller("CrmPaymentAction")
@RequestMapping(value="/manage/crmpayment")
public class CrmPaymentAction extends BaseAction{
			@Autowired
           private ICrmPaymentService crmPaymentService;
			
        @RequestMapping(value= {"","/crmpayment_list"})
   		public String list(){
   			instantPage(20); //20代表一页显示20条数据
   			List<CrmPayment> list=crmPaymentService.getList();  //获取列表
   			int total=crmPaymentService.getCount();   //获取总数
   			Pager pager=new Pager(super.getPage(),super.getRows(),total);
   			pager.setDatas(list);
   			getRequest().setAttribute("pager",pager);  //绑定数据到前台
   			return  "/WEB-INF/crmpayment/crmpayment_list";
   		}	
   		
   		@RequestMapping(value="/post",method=RequestMethod.GET)
   		public String addCrmPayment(){
   			return "/WEB-INF/crmpayment/crmpayment_add";
   		}
   		
   		//增加
   		@RequestMapping(value="/post",method=RequestMethod.POST)
   		public String addCrmPayment(CrmPayment crmpayment){
   			crmPaymentService.save(crmpayment);
   			return "redirect:crmpayment_list";
   		}
   		
   		//删除
   		@RequestMapping(value="/del/{id}")
   		public String deleteCrmPayment(@PathVariable("id")int id,HttpServletResponse response){
   			System.out.println("id="+id+"---------");
   			crmPaymentService.del(id);
   			return "redirect:../crmpayment";
   		}
   		
   		@RequestMapping(value="/edit",method=RequestMethod.POST)
   		public String updateCrmPayment(CrmPayment crmpayment,HttpServletResponse response){
   			crmPaymentService.edit(crmpayment);
   			return "redirect:crmpayment_list";
   		}
   		@RequestMapping(value="/{id}")
   		public String viewCrmPayment(@PathVariable("id")int id)
   		{
   			CrmPayment crmpayment=crmPaymentService.get(id);
   			getRequest().setAttribute("crmpayment",crmpayment);
   			return "/WEB-INF/crmpayment/crmpayment_detail";
   		}	
}
