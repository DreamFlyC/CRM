/*package com.lw.weixin.users.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.core.logs.service.ILogService;
import com.lw.weixin.users.entity.Users;
import com.lw.weixin.users.persistence.UserMapper;
import com.lw.weixin.users.service.IUserService;

@Service("UserServiceImpl")
@Transactional(propagation=Propagation.SUPPORTS)
//@ActionModel(description="用户管理")
public class UserServiceImpl extends BaseServiceImpl<Users> implements IUserService {

	@Autowired
	private UserMapper userMapper;
	//@Autowired
	//private ILogService logService;
	
	/**
	 * 新增用户
	 * @author 胡礼波
	 * 2014-7-21 下午9:29:53
	 * @param user
	 * @return
	 

	@Override
	@Transactional
	@ActionModel(description="用户注册")	
	public boolean addUser(Users user)
	{
		checkUserProperty(user);
		user.setEnable(true);					//账号状态启用
		user.setRegistDate(new Date());
		String password=user.getPassword();
		String salt=StringUtil.getRandomString(9);					//产生9位的加密salt
		String pwd=new Md5PwdEncoder().encodePassword(password,salt);	//密码加密
		user.setPassword(pwd);
		user.setSalt(salt);
		user.setRegistIp(ContextUtil.getClientIp());
		Integer count=userMapper.saveUser(user);
		return count>0;
	}
	*/
	/**
	 * 编辑用户
	 * @author 胡礼波-Andy
	 * @2015年1月20日下午1:23:31
	 * @param user
	 * @return 
	
	@Transactional
	@ActionModel(description="编辑用户")
	@Override
	public boolean editUser(Users user)
	{	if(user.isEnable()!=true){
			user.setEnable(false);
		}else{
			user.setEnable(true);
		}
		Integer count=userMapper.editById(user);
		return count>0;
	}
	 */
	/**
	 * 对用户对象部分属性校验
	 * @author 胡礼波
	 * 2014-7-29 下午8:50:44
	 * @param user
	
	private void checkUserProperty(Users user)
	{
		if(user==null)
		{
			throw new NullPointerException("注册信息为空,请重新注册！");
		}
		if(StringUtils.isEmpty(user.getUserName()))
		{
			throw new NullPointerException("用户名为空,请输入用户名!");
		}
		if(usernameExist(user.getUserName()))		//用户名被占用 服务器端校验
		{
			throw new NullPointerException("用户名已存在,请更换用户名!");
		}
		if(StringUtils.isEmpty(StringUtil.trimHtmlTag(user.getPassword().trim())))
		{
			throw new NullPointerException("密码为空!");
		}
	}
	
	@Override
	@Transactional
	@ActionModel(description="修改密码")
	public boolean editPassword(int userId, String password) {
		Assert.hasText(password, "新密码为空！");
		Assert.isTrue(!password.contains(" "),"密码不能包含空格!");
		String salt=StringUtil.getRandomString(9);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("password",new Md5PwdEncoder().encodePassword(password,salt));
		map.put("salt",salt);
		return userMapper.updatePassword(map)>0;
	}

	@Override
	@ActionModel(description="用户登录")
	@Transactional
	public Users login(String userName, String password) {
		Users user=getUserByName(userName);
		if(user!=null)
		{
			if(new Md5PwdEncoder().isPasswordValid(user.getPassword(),password,user.getSalt()))	//密码判断
			{
				if(user.isEnable())								//账号启用
				{
					String ip=ContextUtil.getClientIp();
					logService.operating(user, ip, "用户管理", "用户登录",user.getUserName()+"用户登录成功");
					editLoginInfo(ip,user.getId());				//更新登录日志
					return user;
				}
			}
		}
		return null;
	}
	
	@Transactional
	@ActionModel(description="修改登录用户信息")
	public void editLoginInfo(String ip,int userId) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("lastip",ip);
		map.put("userId", userId);
		userMapper.updateLoginInfo(map);
	}

	@Override
	public Users getUserByName(String userName) {
		Assert.hasText(userName,"用户名为空!");
		return userMapper.getUserByName(userName);
	}

	@Override
	public boolean usernameExist(String username) {
		int flag=userMapper.getCountByName(username);
		return flag>0;
	}

	@Override
	@Transactional
	@ActionModel(description="删除用户")
	public int del(Integer... id) {
		if(ArrayUtils.isEmpty(id))
		{
			return 0;
		}
		Users user=ContextUtil.getContextLoginUser();
		for (Integer userId : id) {
			if(userId!=user.getId())		//不能删除当前登录用户
			{
				return super.del(id);
			}
		}
		return 0;
	}

	@Override
	@Transactional
	@ActionModel(description="修改帐号状态")
	public boolean editUserEnable(int userId) {
		Users user=get(userId);
		if(user==null)
		{
			return false;
		}
		if(user.getId()==ContextUtil.getContextLoginUser().getId())	//不能操作当前登录用户
		{
			return false;
		}
		return userMapper.updateUserEnable(userId,!user.isEnable())>0;
	}

}
 */