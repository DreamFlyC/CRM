package com.lw.duty.service;

import java.util.List;
import java.util.Map;

import com.lw.core.base.service.IBaseService;
import com.lw.duty.entity.DutyLog;

public interface IDutyLogService extends IBaseService<DutyLog>{
	
	public DutyLog getAll(int dutyid);

	/**
	 * @param param
	 * @return
	 */
	public DutyLog get(Map param);

	/**
	 * @param userid
	 * @return
	 */
	public DutyLog getLast(int userid);

	/**
	 * @param userid
	 * @return
	 */

}
