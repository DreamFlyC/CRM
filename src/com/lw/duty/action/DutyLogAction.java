package com.lw.duty.action;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.duty.entity.Duty;
import com.lw.duty.entity.DutyLog;
import com.lw.duty.entity.DutyUser;
import com.lw.duty.entity.DutyUsername;
import com.lw.duty.service.IDutyLogService;
import com.lw.duty.service.IDutyService;
import com.lw.duty.service.IDutyUserService;
import com.lw.duty.service.IDutyUsernameService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("dutyLogAction")
@RequestMapping(value = "/manage/dutylog")
@SuppressWarnings("all")
public class DutyLogAction extends BaseAction {

	@Autowired
	private IDutyService dutyService;
	@Autowired
	private IDutyUserService dutyUserService;
	@Autowired
	private IDutyUsernameService dutyUsernameService;
	@Autowired
	private IDutyLogService dutyLogService;


	// 1. 根据任务编号，任务名称,日期查询
	@RequestMapping(value = "/index")
	public String query(String number, String title, String sdate, String edate, Model model, String type,
			String dkey) {
		instantPage(20); // 每页几条记录
		Map param = new HashMap();
		param.put("dkey", dkey);
		if (number != null) {
			param.put("number", number);
		}
		if (title != null) {
			param.put("title", title);
		}
		if (StringUtils.isNotBlank(sdate)) {
			param.put("sdate", sdate);
		}
		if (StringUtils.isNotBlank(edate)) {
			param.put("edate", edate);
		}
		getRequest().setAttribute("dkey", dkey); // 防止前台没有记录dkey的值 ，导航栏出现问题
		List<Duty> dutyList = dutyService.getList(param);
		int total = dutyService.getCount(param);
		Pager pager = new Pager(super.getPage(), super.getRows(), total);
		pager.setDatas(dutyList);
		getRequest().setAttribute("pager", pager);
		for (int i = 0; i < dutyList.size(); i++) {
			getRequest().setAttribute("dutyList", dutyList);
			getRequest().setAttribute("number", number);
			getRequest().setAttribute("title", title);
			getRequest().setAttribute("sdate", sdate);
			getRequest().setAttribute("edate", edate);
			getRequest().setAttribute("dkey", dkey);

		}
		getRequest().setAttribute("total", total); // 查询当前一共几条记录
		return "WEB-INF/duty/index";
	}

	// 2.新建任务
	@RequestMapping(value = "/add")
	public String add(Model model) {
		List<DutyUsername> dutyUsernameList = dutyUsernameService.getList();
		getRequest().setAttribute("dutyUsernameList", dutyUsernameList);
		return "WEB-INF/duty/add";
	}

	@RequestMapping(value = "/save")
	public String Save( // @RequestParam("file")MultipartFile pic,
			@ModelAttribute Duty obj, @ModelAttribute DutyUser obj2, String users, String ids,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// String appendix=upload.upload(request, pic);//返回路径给appendix

		if (StringUtils.isNotBlank(users)) {
			obj.setUser(users);
			obj.setUid(ids);
			int id = dutyService.save(obj);
			// 将多个执行人拆分，插入到dutyuser表
			if(id>0){
				for (int i = 0; i < users.split(",").length; i++) {
					obj2.setDutyid(obj.getId());
					obj2.setUserid(Integer.parseInt(ids.split(",")[i]));
					dutyUserService.save(obj2);
				}
			}
		}
		return "redirect:index";
	}

	// 3.编辑任务

	@RequestMapping(value = "/update")
	public String Update(int id, Model model) {
		Duty obj = dutyService.get(id);
		getRequest().setAttribute("duty", obj);
		return "WEB-INF/duty/update";
	}

	@RequestMapping(value = "/saveUpdate")
	public String saveUpdate(@ModelAttribute Duty obj) {
		dutyService.edit(obj);
		return "redirect:index";
	}

	// 4.执行人管理，根据dutyid查询dutyuser表
	@RequestMapping(value = "/usermanager")
	public String Manager(int id, Model model) {
		Map param = new HashMap();
		param.put("dutyid", id);
		List<DutyUser> dutyUserList = dutyUserService.getList(param); // 是一个list
		for (int i = 0; i < dutyUserList.size(); i++) {
			getRequest().setAttribute("dutyUserList", dutyUserList);
		}
		return "WEB-INF/duty/usermanager";
	}

	// 5.清理数据
	@RequestMapping(value = "/delete", method = RequestMethod.GET)

	public @ResponseBody String Update(Integer[] ids) {
		int i = dutyService.delete(ids);

		if (i != 0) {
			return "success";
		} else {
			return "error";
		}
	}



	// 8.执行人管理查询
	@RequestMapping(value = "/managerquery")
	public String Mq(Integer id, String user, String sdate, String edate, Model model) {
		Duty obj = new Duty();
		obj.setSdate(sdate);
		obj.setEdate(edate);
		obj.setUser(user);
		List<Duty> dutyList = dutyService.getDuty(obj);
		getRequest().setAttribute("dutyList", dutyList);
		getRequest().setAttribute("sdate", sdate);
		getRequest().setAttribute("edate", edate);
		// getRequest().setAttribute("dkey", dkey);
		getRequest().setAttribute("user", user);
		getRequest().setAttribute("id", id);
		return "WEB-INF/duty/usermanager";
	}

	// 9.录入信息页面
	@RequestMapping(value = "/log/{id}/{uid}.html")
	public String log(@PathVariable("id") int id, @PathVariable("uid") int uid, Model model) {
		Duty obj = dutyService.get(id);
		getRequest().setAttribute("duty", obj);
		getRequest().setAttribute("uid", uid);
		return "WEB-INF/duty/log";
	}

	// 10.进行录入信息处理
	@RequestMapping(value = "/dolog/{id}/{uid}.html")
	public String dolog(@PathVariable("id") int id, @PathVariable("uid") int uid, Model model) {
		Duty obj = dutyService.get(id);
		Map param = new HashMap();
		param.put("dutyid", id);
		param.put("uid", uid);
		DutyLog dutyLog = dutyLogService.get(param); // 根据dutyid和uid查询个人的总进度
		getRequest().setAttribute("dutyLog", dutyLog);
		getRequest().setAttribute("duty", obj);
		getRequest().setAttribute("uid", uid);
		return "WEB-INF/duty/dolog";
	}

	/*
	 * 保存录入进度 修改duty表的progress,content和note
	 * 
	 */
	@RequestMapping(value = "/savelog")
	public String savelog(@ModelAttribute Duty obj, @ModelAttribute DutyLog obj3, String id, int uid, Model model, HttpServletRequest request) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		System.out.println("id=" + id + "-------uid=" + uid + "");
		String appendix = "";// 返回路径给appendix
		DutyUser obj2 = new DutyUser();
		// 插入log表
		obj = dutyService.get(Integer.parseInt(id));
		// 将uid赋值给dutylog表的uid
		obj3.setUid(uid);
		obj3.setDutyid(obj.getId());
		obj3.setAppendix(appendix);
		dutyLogService.save(obj3);
		obj2.setDutyid(Integer.parseInt(id));
		obj2.setUserid(uid);
		obj2.setAppendix(appendix);
		/*
		 * obj2=dutyUserService.getByUserId(uid,Integer.parseInt(id)); if
		 * (obj2.getBegintime() == null || obj2.getBegintime() == "") { //
		 * 修改dutyuser表的begintimme时间 obj2.setBegintime(sdf.format(new Date()));
		 * dutyUserService.edit(obj2); }
		 */
		// 根据uid查询每个人的总进度,当个人的进度大于等于100时，修改dkey为1，并向duty表插入stoptime
		Map param = new HashMap();
		param.put("dutyid", id);
		param.put("uid", uid);
		DutyLog dutyLog = dutyLogService.get(param);
		if (StringUtils.isNotBlank(dutyLog.getProgress()+"")) {
			if (dutyLog.getProgress() >= 100) {
				// 某个人完成进度大于等于100
				int dkey = 1;
				obj2.setDkey(dkey); // 完成进度
				obj2.setStoptime(sdf.format(new Date()));
				dutyUserService.edit(obj2);
				///System.out.println("uid=" + uid + "完成任务！--Dkey=" + obj2.getDkey() + "  ");
			} else if (dutyLog.getProgress() < 100 && dutyLog.getProgress() > 0) {
				int dkey = 2;
				obj2.setDkey(dkey); // 完成进度
				dutyUserService.edit(obj2);
			}
		}
		// 当sumProgress为100时，修改duty表的dkey为1，修改stoptime
		float progress = dutyService.getProgress(Integer.parseInt(id));
		//System.out.println("任务总进度：" + progress);
		if (progress >= 100) {
			obj.setDkey(1);
			obj.setStoptime(sdf.format(new Date()));
			obj.setId(Integer.parseInt(id));
			dutyService.edit(obj);
			//System.out.println("-------成功！-------");
		}
		return "redirect:index";

	}

	// 11.任务管理
	@RequestMapping(value = "/logmanager")
	public String logManager(int id, Model model) {
		Duty obj = dutyService.get(id);
		getRequest().setAttribute("duty", obj);
		List<Duty> dutyList = dutyService.getDuty(obj);
		getRequest().setAttribute("dutyList", dutyList);
		return "WEB-INF/duty/logmanager";
	}

	// 12.查看历史录入进度,dutyid--duty表的id，uid--username表的id
	@RequestMapping(value = "/loghistory/{dutyid}/{uid}.html")
	public String loghistory(@PathVariable("dutyid") int dutyid, @PathVariable("uid") int uid, Model model) {
		Map param = new HashMap();
		param.put("dutyid", dutyid);
		param.put("uid", uid);
		List<DutyLog> dutyLogList = dutyLogService.getList(param);
		getRequest().setAttribute("dutyLogList", dutyLogList);
		return "WEB-INF/duty/loghistory";
	}

	// 13.修改dkey(1---已完成 2---进行中 3---进行中)
	@RequestMapping(value = "/editDkey")
	@ResponseBody
	public String editDkey(int id, Model model, DutyUser obj2) {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		Date now = new Date();
		String begintime = sdf.format(now);
		Duty obj = new Duty();
		if (StringUtils.isNotBlank(id+"")) {
			obj.setId(id);
			obj.setDkey(2);
			obj.setBegintime(begintime);
		}
		dutyService.edit(obj);
		dutyUserService.editDkey(id);
		return "2";

	}

	// 14.跳转投诉统计页面
	/*@RequestMapping(value = "/feedback")
	public String feedBack(int[] type, String sdate, String edate, Model model) {
		Duty obj = new Duty();
		if ((null == sdate && null == edate) || (sdate == "" && edate == "")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(); // 取时间
			Calendar calendar = new GregorianCalendar();
			calendar.setTime(date);
			calendar.add(calendar.DATE, -7); // 把日期往后增加一天,整数 往后推,负数往前移动
			// date = calendar.getTime(); // 时间日期往后推
			obj.setSdate(sdf.format(calendar.getTime()));
			obj.setEdate(sdf.format(date));
			List<Duty> dutyList = dutyService.getMonth(obj);
			getRequest().setAttribute("dutyList", dutyList);
			getRequest().setAttribute("sdate", sdate);
			getRequest().setAttribute("edate", edate);
			getRequest().setAttribute("type", type);
		} else {
			obj.setSdate(sdate);
			obj.setEdate(edate);
		}

		return "WEB-INF/duty/feedback";
	}*/

	// 15.投诉统计，按date查询

	/*@RequestMapping(value = "/doFeedBack")
	public String doFeedBack(int[] type, String sdate, String edate, Model model) {
		Duty obj = new Duty();
		obj.setIds(type);
		obj.setSdate(sdate);
		obj.setEdate(edate);
		List<Duty> dutyList = dutyService.getMonth(obj);
		getRequest().setAttribute("dutyList", dutyList);
		getRequest().setAttribute("sdate", sdate);
		getRequest().setAttribute("edate", edate);
		getRequest().setAttribute("type", type);
		return "WEB-INF/duty/feedback";

	}*/

	// 16.地址
	@RequestMapping(value = "/address")
	public String Address() {
		return "WEB-INF/duty/address";
	}

	// 17.受理工单 ,根据时间周期查询总数
	@RequestMapping(value = "/case")
	public String Case(Model model, String stime, String etime, String username) {
		// 根据username查询username表，获取id
		int userid = 0; // userid=0为查询所有，根据userid去查询dutyuser表的所有任务，返回一个list,增加时间段查询
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String begintime = sdf.format(new Date());
		int level = 0; // 1代表普通，2代表紧急
		int dkey = 0; // 1代表完成，2代表进行中，3代表未接受
		Date date = null;
		/*
		 *管理员查询时，我的工单显示每个人的进行中和已完成的记录,即dkey！=3的 
		 * */
		if(userid==0) {
			//我的工单
			Map userMap=new HashMap();
			userMap.put("dkey", 3);
			userMap.put("stime", stime);
			userMap.put("etime", etime);
			List<Duty> dutyList=dutyService.getListAllTwo(userMap);
			for (int i = 0; i < dutyList.size(); i++) {
				getRequest().setAttribute("dutyList", dutyList);
			}
			List<DutyUser> dutyUserList=dutyUserService.getListAll(userMap);
			//foreach遍历dutyUserList，获取dutyid
			for (DutyUser dutyUser : dutyUserList) {
				int id=dutyUser.getDutyid();
				 userid=dutyUser.getUserid();
				//System.out.println("dutyUserList的dutyid为："+id+"-------------"); //370
				//System.out.println("dutyUserList的userid为："+userid+"-------------");
				// 查询最后更新时间，根据每个dutyid分组，获取uid,查询log表的最后一条记录，返回一个对象
				DutyLog obj = dutyLogService.getLast(userid);
				if (obj != null) {
					 date = obj.getDate();
					//System.out.println("最后更新时间为：" + date + "-------");
				}
				for (int i = 0; i < dutyUserList.size(); i++) {
					getRequest().setAttribute("dutyUserList", dutyUserList);
					getRequest().setAttribute("date", date);
					//System.out.println("时间为：" + date + "----------");
				}
				userid=0;
			}
			
			// 信息提醒,根据当前查询当前dkey=3的，返回一个列表,返回的是duty表的内容
			Map dkeyMap=new HashMap();
			dkeyMap.put("ndkey",3);
			List<Duty> dutyDkeyList = dutyService.getListAllTwo(dkeyMap);
			for (int i = 0; i < dutyDkeyList.size(); i++) {
				getRequest().setAttribute("dutyDkeyList", dutyDkeyList);
			}
			
		}
		
		if (username != null && !username.equals("")) {
			DutyUsername userobj = dutyUsernameService.getByName(username); // 获取userid
			if (userobj != null) {
				userid = userobj.getId();
			}
		}
		System.out.println("用户ID为：" + userid);

		// 我的工单，显示进行中和已完成的,dkey!=3的
		Map user = new HashMap();
		user.put("userid", userid);
		user.put("dkey", 3);
		user.put("stime", stime);
		user.put("etime", etime);
		List<DutyUser> dutyUserList = dutyUserService.getListByUid(user);
		// 根据uid查询log表的最后一条记录，返回一个对象
		if (userid != 0) {
			//System.out.println("进入判断的userid为：" + userid);
			DutyLog obj = dutyLogService.getLast(userid);
			if (obj != null) {
				date = obj.getDate();
			//	System.out.println("最后更新时间为：" + date + "-------");
			}
			for (int i = 0; i < dutyUserList.size(); i++) {
				getRequest().setAttribute("dutyUserList", dutyUserList);
				getRequest().setAttribute("date", date);
			//	System.out.println("时间为：" + date + "----------");
			}
			// 信息提醒,根据当前uid查询当前dkey=3的，返回一个列表
			List<DutyUser> dutyUserDkeyList = dutyUserService.getListByDkey(user);
			for (int i = 0; i < dutyUserDkeyList.size(); i++) {
				getRequest().setAttribute("dutyUserDkeyList", dutyUserDkeyList);
			}
			 //查询今日总工单 
			  Map param=new HashMap();
			  param.put("date",date); 
			  param.put("stime", stime);
			  param.put("etime", etime); 
			  if(userid!=0) {
					param.put("userid", userid);
				}
			  int nowCount=dutyService.getCountUid(param);
			 // System.out.println("今天的总工单为："+nowCount+"------");

			// 查询今天的工单,工单要查询duty表的id
			Map param1 = new HashMap();
			param1.put("begintime", begintime);
			param1.put("stime", stime);
			param1.put("etime", etime);
			if(userid!=0) {
				param1.put("userid", userid);
			}
			int now = dutyService.getCountUid(param1);
			System.out.println("今天的工单为：" + now + "------");
			// 查询所有工单，增加时间查询
			Map param2 = new HashMap();
			param2.put("stime", stime);
			param2.put("etime", etime);
			if(userid!=0) {
				param2.put("userid", userid);
			}
			int count = dutyService.getCountUid(param2);
			//System.out.println("时间段为：" + stime + "至" + etime + "总工单为：" + count);

			// 查询紧急的工单，增加时间段查询
			level = 2;// 1代表普通，2代表紧急
			// dkey=1; //1代表完成，2代表进行中，3代表未接受
			Map param3 = new HashMap();
			param3.put("level", level);
			param3.put("stime", stime);
			param3.put("etime", etime);
			if(userid!=0) {
				param3.put("userid", userid);
			}
			int urgentCount = dutyService.getCountUid(param3);
			// 查询已受理的紧急工单
			Map param4 = new HashMap();
			param4.put("level", level);
			param4.put("ndkey", 3); // 已受理包括进行中和已完成
			param4.put("stime", stime);
			param4.put("etime", etime);
			if(userid!=0) {
				param4.put("userid", userid);
			}
			int urgent = dutyService.getCountUid(param4);
			//System.out.println("已受理的紧急工单：" + urgent + "总的紧急工单:" + urgentCount);

			// 查询普通的工单
			level = 1; // 1代表普通，2代表紧急
			// dkey=1; //1.已完成 2.进行中 3.未接受
			Map param5 = new HashMap();
			param5.put("level", level);
			param5.put("stime", stime);
			param5.put("etime", etime);
			if(userid!=0) {
				param5.put("userid", userid);
			}
			int commonCount = dutyService.getCountUid(param5); //
			// 查询已受理的普通工单(包括已完成的)
			Map param6 = new HashMap();
			param6.put("level", level);
			param6.put("ndkey", 3);
			param6.put("stime", stime);
			param6.put("etime", etime);
			if(userid!=0) {
				param6.put("userid", userid);
			}
			int common = dutyService.getCountUid(param6);
			//System.out.println("已受理的普通工单：" + common + "总的普通工单:" + commonCount);

			// 查询完成的工单
			dkey = 1;
			Map param7 = new HashMap();
			param7.put("dkey", dkey);
			param7.put("stime", stime);
			param7.put("etime", etime);
			if(userid!=0) {
				param7.put("userid", userid);
			}
			int complete = dutyService.getCountUid(param7);

			getRequest().setAttribute("count", count); // 总工单
			getRequest().setAttribute("nowCount", nowCount); // 今日总工单
			getRequest().setAttribute("now", now); // 今日受理工单
			getRequest().setAttribute("urgent", urgent);// 紧急受理工单
			getRequest().setAttribute("common", common);// 普通受理工单
			getRequest().setAttribute("complete", complete);// 普通受理工单
			getRequest().setAttribute("urgentCount", urgentCount); // 已受理的紧急工单
			getRequest().setAttribute("commonCount", commonCount); // 已受理的普通工单
			getRequest().setAttribute("stime", stime); // 已受理的紧急工单
			getRequest().setAttribute("etime", etime);
			getRequest().setAttribute("username", username);
		}   
			  else { //当useid=0，也就是管理员时，根据id查询duty表所有数据 
			  //查询总工单
			  int count=dutyService.getCount();
			  //查询今日总工单 
			  Map param1=new HashMap();
			  param1.put("date",date); 
			  param1.put("stime", stime);
			  param1.put("etime", etime); 
			  int nowCount=dutyService.getCountAll(param1);
			 // System.out.println("今天的总工单为："+nowCount+"------"); //查询所有工单，增加时间查询 
			  //查询今日已受理工单
			  Map param2=new HashMap(); 
			  param2.put("stime", stime);
			  param2.put("etime", etime);
			  param2.put("begintime", begintime); 
			  int now=dutyService.getCountAll(param2);
			  //System.out.println("今日已受理工单为："+now);
			  //查询总紧急工单,增加时间段查询
		      level = 2;// 1代表普通，2代表紧急
			  Map param3 = new HashMap();
			  param3.put("level", level);
		      param3.put("stime", stime);
			  param3.put("etime", etime);
			  int urgentCount = dutyService.getCountAll(param3);
			  // 查询已受理的紧急工单
			  Map param4 = new HashMap();
			  param4.put("level", level);
		      param4.put("ndkey", 3); // 已受理包括进行中和已完成
				param4.put("stime", stime);
				param4.put("etime", etime);
				int urgent = dutyService.getCountAll(param4);
				//System.out.println("已受理的紧急工单：" + urgent + "总的紧急工单:" + urgentCount);
		
				// 查询普通的工单
				level = 1; // 1代表普通，2代表紧急
				// dkey=1; //1.已完成 2.进行中 3.未接受
				Map param5 = new HashMap();
				param5.put("level", level);
				param5.put("stime", stime);
				param5.put("etime", etime);
				int commonCount = dutyService.getCountAll(param5); //
				// 查询已受理的普通工单(包括已完成的)
				Map param6 = new HashMap();
				param6.put("level", level);
				param6.put("ndkey", 3);
				param6.put("stime", stime);
				param6.put("etime", etime);
				int common = dutyService.getCountAll(param6);
			//	System.out.println("已受理的普通工单：" + common + "总的普通工单:" + commonCount);
		
				// 查询完成的工单
				dkey = 1;
				Map param7 = new HashMap();
				param7.put("dkey", dkey);
				param7.put("stime", stime);
				param7.put("etime", etime);
				int complete = dutyService.getCountAll(param7);
			 
			  	getRequest().setAttribute("count", count); // 总工单
			  	getRequest().setAttribute("nowCount", nowCount); // 今日总工单
				getRequest().setAttribute("now", now); // 今日受理工单
				getRequest().setAttribute("urgent", urgent);// 紧急受理工单
				getRequest().setAttribute("common", common);// 普通受理工单
				getRequest().setAttribute("complete", complete);// 普通受理工单
				getRequest().setAttribute("urgentCount", urgentCount); // 已受理的紧急工单
				getRequest().setAttribute("commonCount", commonCount); // 已受理的普通工单
				getRequest().setAttribute("stime", stime); // 已受理的紧急工单
				getRequest().setAttribute("etime", etime);
				getRequest().setAttribute("username", username);
			 }
			 
		return "WEB-INF/duty/case";
	}

}
