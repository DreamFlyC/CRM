package com.lw.shiroaction.usersgroup.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.shiroaction.model.entity.ShiroActionModel;
import com.lw.shiroaction.model.service.IShiroActionModelService;
import com.lw.shiroaction.rolevalue.entity.ShiroActionRoleValue;
import com.lw.shiroaction.rolevalue.service.IShiroActionRoleValueService;
import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;
import com.lw.shiroaction.usersgroup.service.IShiroActionUsersGroupService;

/**
*@author qw
*@version 创建时间:2018年1月9日 上午9:31:38
*类说明
*/
@Controller("ShiroActionUsersGroupAction")
@RequestMapping(value="/manage/shiroaction/usersgroup")
public class ShiroActionUsersGroupAction extends BaseAction{
	@Autowired
	private IShiroActionUsersGroupService shiroActionUsersGroupService;
	@Autowired
	private IShiroActionModelService shiroActionModelService;
	@Autowired
	private IShiroActionRoleValueService shiroActionRoleValueService;
	
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<ShiroActionUsersGroup> list=shiroActionUsersGroupService.getList();
		int total=shiroActionUsersGroupService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "WEB-INF/shiroaction_usersgroup/shiroaction_usersgroup_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addUsersGroup(){
		
		return "WEB-INF/shiroaction_usersgroup/shiroaction_usersgroup_add";
	}
	
	
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addUsersGroup(ShiroActionUsersGroup shiroActionUsersGroup){
		shiroActionUsersGroupService.save(shiroActionUsersGroup);
		return "redirect:/manage/shiroaction/usersgroup.html";
	}
	
	
	@RequestMapping(value="/del/{id}")
	public String deleteUsersGroup(@PathVariable("id")int id,HttpServletResponse response){
		shiroActionUsersGroupService.del(id);
		return "redirect:/manage/shiroaction/usersgroup.html";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updateUsersGroup(ShiroActionUsersGroup shiroActionUsersGroup,ShiroActionRoleValue shiroActionRoleValue,HttpServletResponse response,HttpServletRequest req){
		Map<String, Object> map=new HashMap<String,Object>();
		String[] action_model_id_j = req.getParameterValues("action_model_id");
		shiroActionRoleValueService.delByUsersId(shiroActionUsersGroup.getId());
		for(int j = 0; j < action_model_id_j.length; j++) {
			int action_model_id = Integer.parseInt(action_model_id_j[j]);
			String[] action_model_type_i = req.getParameterValues("action_model_type"+action_model_id_j[j]);
			for (int i = 0; i < action_model_type_i.length; i++) {
				map.put("action_model_id", action_model_id);
				map.put("action_users_group_id", shiroActionUsersGroup.getId());
				map.put("action_type", action_model_type_i[i]);
				int total=shiroActionRoleValueService.getCount(map);
					if(total>0) {
		
					}else {
						shiroActionRoleValue.setAction_model_id(action_model_id);
						shiroActionRoleValue.setAction_type(action_model_type_i[i]);
						shiroActionRoleValue.setAction_users_group_id(shiroActionUsersGroup.getId());
						shiroActionRoleValueService.save(shiroActionRoleValue);
					}				
			}		
		}		
		return "redirect:/manage/shiroaction/usersgroup.html";
	}

	@RequestMapping(value="/{id}")
	public String viewUsersGroup(@PathVariable("id")int id)
	{
		ShiroActionUsersGroup shiroActionUsersGroup=shiroActionUsersGroupService.get(id);
		instantPage(20);
		List<ShiroActionModel> list=shiroActionModelService.getList();
		for (ShiroActionModel shiroActionModel : list) {
			Map<String, Object> params=new HashMap<String,Object>();
			params.put("action_model_id", shiroActionModel.getId());
			params.put("action_users_group_id", id);
			shiroActionRoleValueService.getCount(params);
			 
		}
		
		int total=shiroActionModelService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		getRequest().setAttribute("shiroActionUsersGroup",shiroActionUsersGroup);
		return "WEB-INF/shiroaction_usersgroup/shiroaction_usersgroup_detail";
	}

}
