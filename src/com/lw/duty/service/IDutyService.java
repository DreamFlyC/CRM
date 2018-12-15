package com.lw.duty.service;

import java.util.List;
import java.util.Map;

import com.lw.core.base.service.IBaseService;
import com.lw.duty.entity.Duty;
import com.lw.duty.entity.DutyUser;
import com.lw.duty.entity.FeedBack;

public interface IDutyService extends IBaseService<Duty> {

	// 根据任务编号和任务名称查询
	public List<Duty> getAll(Duty obj);

	public List<Duty> getDuty(Duty obj);

	public int getCount(Duty obj);
	
	//删除所有信息
	
	public int delete(Integer[]  id);

	//修改dkey
			public void editDkey(int id);


			//按月份統計
			public List<FeedBack> getMonth(Map param);

			public List<Duty> getAllDuty(Duty obj);

			/**
			 * @param obj
			 * @return
			 */
		//	public List<Duty> getList(Duty obj);

			/**
			 * 
			 */
			public List<Duty> getLevel(Duty obj);

			/**
			 * @param parseInt
			 */
			public float getProgress(int id);

			/**
			 * @param param1
			 * @return
			 */
			
			public int getCountUid(Map param1);
			
			public int getCountAll(Map param1);
			
			public List<DutyUser> getListAll(Map userMap);

			/**
			 * @param dkeyMap
			 * @return
			 */
			public List<Duty> getListAllTwo(Map dkeyMap);
			






}
