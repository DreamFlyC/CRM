package com.lw.duty.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lw.core.base.service.IBaseService;
import com.lw.duty.entity.Duty;
import com.lw.duty.entity.DutyUser;

public interface IDutyUserService extends IBaseService<DutyUser>{

		public void update(DutyUser dutyUser);
		
	   /* //根据dutyid查询
		public List<DutyUser> getList(String dutyid);*/
				
				//修改dkey
				public void editDkey(int dutyid);

				public List<DutyUser> getDuty(int id);

				/**
				 * @param uid
				 */
				public DutyUser getByUserId(@Param("userid")int uid,@Param("dutyid")int dutyid);

				/**
				 * @param param
				 */
				public List<DutyUser> getListByUid(Map user);

				/**
				 * @param user 
				 * @return
				 */
				public List<DutyUser> getListByDkey(Map user);

				/**
				 * @param userMap
				 * @return
				 */
				public List<DutyUser> getListAll(Map userMap);

				/**
				 * @param dkeyMap
				 * @return
				 */
				public List<DutyUser> getListAllTwo(Map dkeyMap);

				public int delByUserid(@Param("userid")int o);

				public int getByDutyid(Integer integer);

				public int delByDutyid(Integer integer);

				

}
