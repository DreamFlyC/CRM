package com.lw.duty.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.taglibs.standard.lang.jstl.Literal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.duty.entity.DutyUser;
import com.lw.duty.persistence.DutyUserMapper;
import com.lw.duty.service.IDutyUserService;
import com.sun.org.apache.regexp.internal.recompile;

@Service("DutyUserServiceImpl")
@Transactional
public class DutyUserServiceImpl extends BaseServiceImpl<DutyUser> implements IDutyUserService {
	@Autowired
	private DutyUserMapper dutyUserMapper;


	// 修改信息
	public void update(DutyUser dutyUser) {
		dutyUserMapper.update(dutyUser);
	}

	/*// 根据dutyid查询
	public List<DutyUser> getList(String dutyid) {
		return dutyUserMapper.getList(dutyid);
	}*/

	// 修改dkey
	public void editDkey(int dutyid) {
		dutyUserMapper.editDkey(dutyid);
	}

	public List<DutyUser> getDuty(int id) {
		return dutyUserMapper.getDuty(id);
	}
	
	public DutyUser getByUserId(@Param("userid")int uid,@Param("dutyid")int dutyid) {
		return dutyUserMapper.getByUserId(uid,dutyid);
	}
	
	public List<DutyUser> getListByUid(@Param("userid")Map userid){
		return dutyUserMapper.getListByUid(userid);
	}
	
	public List<DutyUser> getListByDkey(@Param("userid")Map userid){
		return dutyUserMapper.getListByDkey(userid);
	}
	
	public List<DutyUser> getListAll(Map userMap){
		return dutyUserMapper.getListAll(userMap);
	}
	
	public List<DutyUser> getListAllTwo(Map dkeyMap){
		return dutyUserMapper.getListAllTwo(dkeyMap);
	}
	
	public int delByUserid(int o) {
		return dutyUserMapper.delByUserid(o);
	}
	
	public int getByDutyid(Integer integer) {
		return dutyUserMapper.getByDutyid(integer);
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public int delByDutyid(Integer integer) {
		return dutyUserMapper.delByDutyid(integer);
	}
}

