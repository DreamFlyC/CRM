package com.lw.shiroaction.util;

import com.lw.shiroaction.model.service.IShiroActionModelService;
import com.lw.shiroaction.rolevalue.service.IShiroActionRoleValueService;
import com.lw.weixin.users.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;


public class chekhaveshiro {
	
 
	@Autowired
	private static IShiroActionRoleValueService shiroActionRoleValueService;
	
	@Autowired
	private static IShiroActionModelService shiroActionModelService;
	
 
	
	
	public static boolean ishaveshiro(String CanonicalName,String action_type ,Users user){

//		 System.out.println("ishaveshiro>>>>"+CanonicalName+"="+action_type+"="+user.getName()+"===");
		  try{
				
			 // Users user=(Users)ContextUtil.getHttpServletRequest().getSession().getAttribute(SysConst.LOGIN_FLAG);
			  if(user!=null){
				//  user.setGroupid(groupid);
//				  System.out.println(this.getClass().getCanonicalName()+"=");
//				  System.out.println(this.getClass().getName()+"==");
//				  System.out.println(Thread.currentThread().getStackTrace()[1].getMethodName()+"===");
			
				  Map<String,Object> param1=new  HashMap<String, Object>();
				 // param1.put("sys_model",this.getClass().getCanonicalName());
				  param1.put("sys_model",CanonicalName);
				  //List<ShiroActionModel> list=shiroActionModelService.getList(param1);

				  int action_model_id=0;
//						if(list!=null && list.size()!=0 && !list.isEmpty()){
//							
//							action_model_id=list.get(0).getId();
//							 System.out.println(list.get(0).getName()+">>====");
//							  Map<String,Object> param=new  HashMap<String, Object>();
//							  param.put("action_model_id",action_model_id);
//							  param.put("action_users_group_id",user.getGroupid());
//							  param.put("action_type",action_type);// Add  View  Del  Edit
//							 // param.put("action_url","/manage/livevideo/account");
//							  int total=shiroActionRoleValueService.getCount(param);
//							  if(total>0){
//						 
//								  return true;//
//							  }else{
//						  
//							  }
//							 
//							 
//						}else{
//							  System.out.println("没有数据====");	
//						}
				  System.out.println(action_model_id+"====");

			  }else{
					//return "redirect:/manage/index.html";  
				}
		  } catch (Exception e) {
			    System.out.println("ishaveshiro  ERR "+e.getMessage()+"=====");

		  }
		
		return false;
	}
	
	
	
}
