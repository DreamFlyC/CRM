package com.lw.duty.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.duty.entity.Duty;
import com.lw.duty.entity.DutyUser;
import com.lw.duty.entity.FeedBack;
import com.lw.duty.persistence.DutyMapper;
import com.lw.duty.persistence.DutyUserMapper;
import com.lw.duty.service.IDutyService;

@Transactional
@Service("DutyServiceImpl")
public class DutyServiceImpl extends BaseServiceImpl<Duty> implements IDutyService{
	@Autowired
	private DutyMapper dutyMapper;
	@Autowired
	private DutyUserMapper dutyUserMapper;
	//根据手机号或姓名查询
		public List<Duty> getAll(Duty obj) {
			
			return dutyMapper.getAll(obj);
		}
		
		//获取总数
		public int getCount(Duty obj){
			return dutyMapper.getCount(obj);
		}

		//删除所有信息
		@Transactional( propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
		public int delete(Integer[]  id){
			
			 int bob=dutyMapper.delete(id);
			 //根据id查询user表数据
			 int i=0;
			 if(bob>0) {
				 for(int j=0;j<id.length;j++) {
					  i =dutyUserMapper.delByDutyid(id[j]);
				 }
				 if(i!=0) {
					 return i;
				 }else {
					 return bob;
				 }
			 }
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			 return 0;
			 
		}
		
		
		public List<Duty> getDuty(Duty obj){
			return dutyMapper.getDuty(obj);
		}
		
		public List<Duty> getAllDuty(Duty obj){
			
		return dutyMapper.getAllDuty(obj);
		}
		
        //修改dkey
		public void editDkey(int id){
			dutyMapper.editDkey(id);
		}
		//按月份統計
		public List<FeedBack> getMonth(Map param){
			return dutyMapper.getMonth(param);
		}
		
		public List<Duty> getLevel(Duty obj) {
			return dutyMapper.getLevel(obj);
			
		}
		
		public float getProgress(int id) {
			return dutyMapper.getProgress(id);
		}
		
		public int getCountUid(Map param1) {
			return dutyMapper.getCountUid(param1);
		}
		
		public int getCountAll(Map param1) {
			return dutyMapper.getCountAll(param1);
		}
		
		public List<DutyUser> getListAll(Map userMap){
			return dutyMapper.getListAll(userMap);
		}
		
		public List<Duty> getListAllTwo(Map dkeyMap){
			return dutyMapper.getListAllTwo(dkeyMap);
		}
				
}
