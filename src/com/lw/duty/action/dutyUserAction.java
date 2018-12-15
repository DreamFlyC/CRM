package com.lw.duty.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lw.core.base.action.BaseAction;
import com.lw.duty.entity.Duty;
import com.lw.duty.entity.DutyLog;
import com.lw.duty.entity.DutyUser;
import com.lw.duty.service.IDutyLogService;
import com.lw.duty.service.IDutyService;
import com.lw.duty.service.IDutyUserService;

@Controller("dutyUserAction")

@RequestMapping(value = "/dutyUser")
@SuppressWarnings("all")
public class dutyUserAction extends BaseAction{
	
	@Autowired
	private IDutyService dutyService;
	@Autowired
	private IDutyUserService dutyUserService;
	@Autowired
	private IDutyLogService dutyLogService;
	
	//1.根据dutyid和userid唯一确定一条记录，修改dkey
	@RequestMapping(value="/editDkey/{userid}/{dutyid}")
	public @ResponseBody String edit(@PathVariable("userid")int userid,@PathVariable("dutyid")int dutyid,Model model) {
		//当userid为userid时，修改dutyuser表的dkey和begintime
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		Date now = new Date();
		String begintime = sdf.format(now);
		
		DutyUser obj2=new DutyUser();
		if(String.valueOf(userid) != null && String.valueOf(dutyid) != null && String.valueOf(userid)!="" && String.valueOf(dutyid)!="") {
			obj2.setUserid(userid);
			obj2.setDutyid(dutyid);
			obj2.setDkey(2);
			obj2.setBegintime(begintime);
			
		}
		//修改duty表的begintime和dkey
		Duty obj=dutyService.get(dutyid);
		//System.out.println("开始时间="+begintime);
		if(obj.getBegintime()==null || obj.getBegintime()=="") {
		//	System.out.println("进入判断了！");
			obj.setBegintime(begintime);
			obj.setDkey(2);
		}
		dutyService.edit(obj);
		dutyUserService.edit(obj2);
		//向log表插入一一条记录
		 obj2=dutyUserService.getByUserId(userid, dutyid);
		DutyLog obj3=new DutyLog();
		obj3.setUid(userid);
		obj3.setDate(new Date());
		obj3.setDutyid(dutyid);
		obj3.setDuid(obj2.getDutyid());
		obj3.setContent(obj2.getContent());
		obj3.setAppendix(obj2.getAppendix());
		obj3.setNote(obj2.getNote());
		dutyLogService.save(obj3);
		
		return "2";
	}
	
}