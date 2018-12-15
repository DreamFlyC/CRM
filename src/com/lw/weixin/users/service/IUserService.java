package com.lw.weixin.users.service;

import com.lw.core.base.service.IBaseService;
import com.lw.weixin.users.entity.Users;


/**
 * 用户业务层接口
 * @author 胡礼波-Andy
 * @2014年11月10日上午10:38:36
 *
 */
public interface IUserService extends IBaseService<Users> {

	/**
	 * 添加用户
	 * @author 胡礼波-Andy
	 * @2014年11月10日上午11:48:03
	 * 
	 * @param user
	 * @return
	 */
	public boolean addUser(Users user);
	
	/**
	 * 编辑用户
	 * @author 胡礼波-Andy
	 * @2014年11月10日上午11:48:03
	 * 
	 * @param user
	 * @return
	 */
	public boolean editUser(Users user);
	
	/**
	 * 更新密码
	 * @author 胡礼波
	 * 2012-6-7 下午01:24:25
	 * @param password
	 * @return
	 */
	public boolean editPassword(int userId,String password);
	
	/**
	 * 用户登录
	 * @author 胡礼波
	 * 2012-5-18 下午07:52:41
	 * @param userName
	 * @param password
	 * @return
	 */
	public Users login(String userName,String password);
	
	/**
	 * 根据用户名得到用户对象
	 * @author 胡礼波
	 * 2013-5-20 下午5:15:46
	 * @param userName
	 * @return
	 */
	public Users getUserByName(String userName);
	
	/**
	 * 判断用户名是否存在
	 * @author 胡礼波
	 * 2012-4-26 下午06:21:31
	 * @param username 用户名
	 * @return 存在返回true 反之
	 */
	public boolean usernameExist(String username);
	
	/**
	 * 修改登录信息
	 * @author 胡礼波-Andy
	 * @2014年11月10日上午11:42:19
	 * 
	 * @param ip
	 * @param userId
	 */
	public void editLoginInfo(String ip,int userId);
	
	/**
	 * 修改用户帐号状态
	 * @author 胡礼波-Andy
	 * @2014年11月12日下午1:12:14
	 * 
	 * @return
	 */
	public boolean editUserEnable(int userId);
}
