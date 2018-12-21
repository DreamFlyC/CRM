package com.lw.weixin.users.persistence;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.weixin.users.entity.Users;


/**
 * 用户持久层接口
 * @author 胡礼波-Andy
 * @2014年11月10日上午10:39:31
 *
 */
public interface UserMapper extends BaseMapper<Users> {

	/**
	 * 添加用户
	 * @author 胡礼波
	 * 2012-5-13 下午04:50:07
	 * @param user
	 * @return
	 */
	//public int saveUser(Users user);
	
	/**
	 * 编辑用户
	 * @author 胡礼波
	 * 2012-5-13 下午04:50:07
	 * @param user
	 * @return
	 */
	//public int editById(Users user);
	
	/**
	 * 根据用户名查找用户
	 * @author 胡礼波
	 * 2012-5-18 下午07:33:24
	 * @param userName
	 * @return
	 */
	public Users getUserByName(String userName);
	
	/**
	 * 跟新用户密码 
	 * @author 胡礼波
	 * 2012-6-7 下午01:27:49
	 * @param map
	 * @return
	 */
	public int updatePassword(Map<String,Object> map);
	
	/**
	 * 判断用户名是否存在
	 * @author 胡礼波
	 * 2012-5-18 下午07:48:50
	 * @param userName
	 * @return
	 */
	public int getCountByName(String userName);
	
	
	/**
	 * 更新用户登录信息
	 * @author 胡礼波
	 * 2012-5-18 下午11:34:49
	 * @param userName
	 * @param last最后登录时间
	 * @param lastIp 最后登录IP
	 */
	public void updateLoginInfo(Map<String,Object> map);
	
	/**
	 * 修改帐号状态
	 * @author 胡礼波-Andy
	 * @2014年11月12日下午1:15:10
	 * 
	 * @param userId
	 * @param enable
	 * @return
	 */
	public int updateUserEnable(@Param("userId")int userId,@Param("enable")boolean enable);
}
