package com.lw.crm.crmservicecustomer.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.common.util.ContextUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmservicecustomer.entity.CrmServiceCustomer;
import com.lw.crm.crmservicecustomer.service.ICrmServiceCustomerService;
import com.lw.duty.entity.DutyUsername;
import com.lw.duty.service.IDutyUsernameService;
import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;
import com.lw.shiroaction.usersgroup.service.IShiroActionUsersGroupService;
import com.lw.weixin.users.entity.Users;

@Controller("crmServiceCustomerService")
@RequestMapping(value = "/manage/crmsercustomer")
@SuppressWarnings("all")
public class CrmServiceCustomerAction extends BaseAction {
	@Autowired
	private ICrmServiceCustomerService crmServiceCustomerService;
	@Autowired
	private IDutyUsernameService dutyUsernameService;
	@Autowired
	private IShiroActionUsersGroupService shiroActionUsersGroupService;
	
	//信息列表
			@RequestMapping("/crmsercustomer_list")
			public String list(){
				instantPage(20);
				List<CrmServiceCustomer> list=crmServiceCustomerService.getList();
				int total=crmServiceCustomerService.getCount();
				Pager pager=new Pager(super.getPage(),super.getRows(),total);
				pager.setDatas(list);
				getRequest().setAttribute("pager",pager);
				return  "/WEB-INF/crmsercustomer/crmsercustomer_list";
			}
			
			@RequestMapping(value="/post",method=RequestMethod.GET)
			public String addcrmsercustomer(){
				List<ShiroActionUsersGroup> shiroActionUsersGroupList = shiroActionUsersGroupService.getList();
				getRequest().setAttribute("shiroActionUsersGroupList", shiroActionUsersGroupList);
				
				List<DutyUsername> dutyUsernameList = dutyUsernameService.getList();
				getRequest().setAttribute("dutyUsernameList", dutyUsernameList);
				
				return "/WEB-INF/crmsercustomer/crmsercustomer_add";
			}
			
			//新增信息
			@RequestMapping(value="/post",method=RequestMethod.POST)
			public String addcrmsercustomer(CrmServiceCustomer crmSerCustomer){
				Users user = ContextUtil.getContextLoginUser();// 登录账号的信息
				if(null!=String.valueOf(user.getId())) {
				crmSerCustomer.setUid(String.valueOf(user.getId()));
				}
				crmServiceCustomerService.save(crmSerCustomer);
				return "redirect:crmsercustomer_list";
			}
			
			//删除信息
			@RequestMapping(value="/del/{id}")
			public String deletecrmsercustomer(@PathVariable("id")int id,HttpServletResponse response){
				crmServiceCustomerService.del(id);
				return "redirect:../crmsercustomer_list";
			}
			
			//修改信息
			@RequestMapping(value="/edit",method=RequestMethod.POST)
			public String updatecrmsercustomer(CrmServiceCustomer crmSerCustomer,HttpServletResponse response){
				crmServiceCustomerService.edit(crmSerCustomer);
				return "redirect:crmsercustomer_list";
			}
			
			//编辑前根据id获取信息
			@RequestMapping(value="/{id}")
			public String viewcrmsercustomer(@PathVariable("id")int id)
			{
				List<ShiroActionUsersGroup> shiroActionUsersGroupList = shiroActionUsersGroupService.getList();
				getRequest().setAttribute("shiroActionUsersGroupList", shiroActionUsersGroupList);
				
				List<DutyUsername> dutyUsernameList = dutyUsernameService.getList();
				getRequest().setAttribute("dutyUsernameList", dutyUsernameList);
				
				CrmServiceCustomer crmSerCustomer=crmServiceCustomerService.get(id);
				getRequest().setAttribute("crmSerCustomer",crmSerCustomer);
				
				return "/WEB-INF/crmsercustomer/crmsercustomer_detail";
			}

}
