package com.lw.duty.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.duty.entity.DutyUser;

public interface DutyUserMapper extends BaseMapper<DutyUser>{
	       
	//修改信息			
			public DutyUser getDutyUserById(int id);	 		
			
			public void update(DutyUser dutyUser);

           /* //根据dutyid查询
			public List<DutyUser> getList(String dutyid);*/
			
			//修改dkey
			public void editDkey(int dutyid);
			
			public List<DutyUser> getDuty(int id);
			
			public DutyUser getByUserId(@Param("userid")int uid,@Param("dutyid")int dutyid);

			/**
			 * @param param
			 * @return
			 */
			public List<DutyUser> getListByUid(Map user);
			/**
			 * @param userid
			 * @return
			 */
			public List<DutyUser> getListByDkey(Map user);

			/**
			 * @param userMap
			 * @return
			 */
			public List<DutyUser> getListAll(Map userMap);
			
			public List<DutyUser> getListAllTwo(Map dkeyMap);
			
			public int delByUserid(@Param("userid")int o);
			
			public int getByDutyid(Integer integer);
			
			public int delByDutyid(Integer integer);
}
