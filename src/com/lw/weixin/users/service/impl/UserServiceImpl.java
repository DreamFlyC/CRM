package com.lw.weixin.users.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.weixin.users.entity.Users;
import com.lw.weixin.users.persistence.UserMapper;
import com.lw.weixin.users.service.IUserService;

@Service("UserServiceImpl")
public class UserServiceImpl extends BaseServiceImpl<Users> implements IUserService{
	@Autowired
	private UserMapper userMapper;

	@Override
	public boolean addUser(Users user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean editUser(Users user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean editPassword(int userId, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Users login(String userName, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Users getUserByName(String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean usernameExist(String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void editLoginInfo(String ip, int userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean editUserEnable(int userId) {
		// TODO Auto-generated method stub
		return false;
	}
}
