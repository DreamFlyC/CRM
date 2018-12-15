package com.lw.weixin.users.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.constant.SysConst;
import com.lw.common.page.Pager;
import com.lw.common.util.DataConvertUtils;
import com.lw.common.util.ResponseUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.weixin.users.entity.Users;
import com.lw.weixin.users.service.IUserService;


/**
 * 后台管理用户Action
 * @author 胡礼波-Andy
 * @2014年11月10日上午10:30:23
 *
 */
@Controller("UserAction")
@RequestMapping(value="/manage/user")
public class UserAction extends BaseAction {

	@Autowired
	private IUserService userService;
	
	
	/**
	 * 用户列表
	 * @author 胡礼波-Andy
	 * @2014年11月11日下午2:53:53
	 * 
	 * @return
	 */
	@RequestMapping(value="")
	public String list(HttpServletResponse response)
	{
		instantPage(20);
		List<Users> list=userService.getList();
		int total=userService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "WEB-INF/users/user_list";
	}
	
	/**
	 * 添加用户
	 * @author 胡礼波-Andy
	 * @2015年1月20日下午1:52:11
	 * @param user
	 * @return
	 */
	@RequestMapping(value="post",method=RequestMethod.GET)
	public String userAdd()
	{
		return "WEB-INF/users/user_add";
	}
	
	/**
	 * 添加用户
	 * @author 胡礼波-Andy
	 * @2014年11月12日上午11:15:40
	 * 
	 * @param response
	 * @return
	 */
	@RequestMapping(value="post",method=RequestMethod.POST)
	public String addUsers(HttpServletResponse response,Users user)
	{
		userService.addUser(user);
		return "redirect:/manage/user.html";
	}
	
	/**
	 * 查看用户
	 * @author 胡礼波-Andy
	 * @2015年1月20日下午4:35:32
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/{userId}")
	public String viewUser(@PathVariable("userId")int userId)
	{
		Users user=userService.get(userId);
		getRequest().setAttribute("user",user);
		return "WEB-INF/users/user_detail";
	}
	
	/**
	 * 用户编辑
	 * @author 胡礼波-Andy
	 * @2015年1月20日下午1:54:51
	 * @param user
	 * @return
	 */
	@RequestMapping(value="edit",method=RequestMethod.POST)
	public String editUsers(HttpServletResponse response,Users user)
	{
		userService.editUser(user);
		return "redirect:/manage/user.html";
	}
	
	/**
	 * 删除系统日志
	 * @author 胡礼波-Andy
	 * @2014年11月12日上午9:36:15
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/del")
	public String delUsers(HttpServletResponse response)
	{
		String dataStr=getRequest().getParameter("data");
		String[] datas=StringUtils.split(dataStr, ",");
		Integer[] ids=DataConvertUtils.convertToInteger(datas);	
		int count=userService.del(ids);
		ResponseUtil.writeText(response,getDelTipMsg(count));
		return null;
	}

	/**
	 * 修改密码
	 * @author 胡礼波-Andy
	 * @2014年11月12日下午12:11:56
	 * 
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/editpwd",method=RequestMethod.GET)
	public String toEditPwd(HttpServletResponse response)
	{
		return "WEB-INF/users/edit_pwd";
	}
	
	/**
	 * 修改密码
	 * @author 胡礼波-Andy
	 * @2014年11月12日下午12:11:56
	 * 
	 * @param response
	 * @return
	 
	@RequestMapping(value="/editpwd",method=RequestMethod.POST)
	public String editPwd(HttpServletResponse response)
	{
		Users user=getLoginedUser();
		String password=getRequest().getParameter("password");
		try
		{
			userService.editPassword(user.getId(), password);
		}catch(Exception e)
		{
			getRequest().setAttribute("errorMsg",e.getMessage());
		}
		return "redirect:/manage/user/editpwd.html";
	}
	*/
	/**
	 * 修改帐号状态
	 * @author 胡礼波-Andy
	 * @2014年11月12日下午1:19:25
	 * @return
	 */
	@RequestMapping(value="/editenable/{userId}")
	public String editUserEnable(HttpServletResponse response,@PathVariable("userId")int userId)
	{
		boolean flag=userService.editUserEnable(userId);
		ResponseUtil.writeText(response,flag?SysConst.OP_SUCCESS:SysConst.OP_FAILD);
		return null;
	}
}
