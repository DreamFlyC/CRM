package com.lw.duty.action;

import com.alibaba.fastjson.JSONObject;
import com.lw.common.page.Pager;
import com.lw.common.util.DataConvertUtils;
import com.lw.common.util.ResponseUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.duty.entity.*;
import com.lw.duty.service.*;
import com.lw.duty.utils.ExportExcelUtil;
import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;
import com.lw.shiroaction.usersgroup.service.IShiroActionUsersGroupService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller("dutyAction")
@RequestMapping(value = "/duty")
@SuppressWarnings("all")
/**
 *
 * @Desc dutyAction 工单系统
 * @author CZP
 * @Date 2018年10月18日 上午11:33:01
 */
public class dutyAction extends BaseAction {

    @Autowired
    private IDutyService dutyService;
    @Autowired
    private IDutyUserService dutyUserService;
    @Autowired
    private IDutyUsernameService dutyUsernameService;
    @Autowired
    private IDutyLogService dutyLogService;
    @Autowired
    private IDutyDepartService dutyDepartService;
    @Autowired
    private IShiroActionUsersGroupService shiroActionUsersGroupService;


    /**
     * 1.
     *
     * @param number
     * @param title
     * @param sdate
     * @param edate
     * @param model
     * @param type
     * @param dkey
     * @return
     * @Desc 根据任务编号，任务名称,日期查询
     * @author CZP
     * @Date 2018年10月18日 上午11:33:21
     */
    @RequestMapping(value = {"","/duty_list"})
    public String query(String number, String title, String sdate, String edate, Model model, String type,
                        String dkey) {
        instantPage(20);
		/*Duty obj = new Duty();
		if (dkey != null) {
			obj.setDkey(Integer.parseInt(dkey));
		} else {
			dkey = 0 + "";
			obj.setDkey(0);
		}*/
        Map param = new HashMap();
        param.put("dkey", dkey);
        if (number != null) {
            param.put("number", number);
        }
        if (title != null) {
            param.put("title", title.trim());
        }
        if (sdate != null && sdate != "") {
            param.put("sdate", sdate);
        }
        if (edate != null && edate != "") {
            param.put("edate", edate);
        }
        //Users user=ContextUtil.getContextLoginUser();//登录账号的信息
        param.put("usersgroupid", 1);

        getRequest().setAttribute("dkey", dkey); // 防止前台没有记录dkey的值 ，导航栏出现问题
        List<Duty> dutyList = dutyService.getList(param);
        int total = dutyService.getCount(param);
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(dutyList);
        getRequest().setAttribute("pager", pager);
		
	/*	//将user的","替换为<br> ,让执行人单行显示
		String user=null;
		for (Duty duty : dutyList) {
			user=duty.getUser().replaceAll(",", "<br>");
			duty.setUser(user);
			System.err.println("user为："+user);
			getRequest().setAttribute("user", user);
		}*/
        getRequest().setAttribute("number", number);
        getRequest().setAttribute("title", title);
        getRequest().setAttribute("sdate", sdate);
        getRequest().setAttribute("edate", edate);
        getRequest().setAttribute("dkey", dkey);

        getRequest().setAttribute("total", total); // 查询当前一共几条记录
        return "/WEB-INF/duty/duty_list2";
    }

    /**
     * @param model
     * @return
     * @Desc 新建任务
     * @author CZP
     * @Date 2018年10月18日 上午11:33:37
     */
    @RequestMapping(value = "/duty_add")
    public String add(Model model) {

        List<DutyUsername> dutyUsernameList = dutyUsernameService.getList();
        getRequest().setAttribute("dutyUsernameList", dutyUsernameList);

        List<ShiroActionUsersGroup> shiroActionUsersGroupList = shiroActionUsersGroupService.getList();
        getRequest().setAttribute("shiroActionUsersGroupList", shiroActionUsersGroupList);

        return "/WEB-INF/duty/duty_add2";
    }

    /**
     * @param request
     * @param response
     * @return
     * @Desc 根据部门获取人员
     * @author CZP
     * @Date 2018年10月18日 上午11:16:11
     */
    @RequestMapping(value = "/getuser")
    public String getuserBydepartId(HttpServletRequest request, HttpServletResponse response) {
        String dataStr = request.getParameter("ids");
        if (dataStr == null || dataStr == "" || dataStr.equals("")) {
            dataStr = "0,";
        }

        String[] datas = StringUtils.split(dataStr, ",");
        Integer[] ids = DataConvertUtils.convertToInteger(datas);

        List<DutyUsername> list = dutyUsernameService.getListByUsersGroupids(ids);
        JSONObject json = new JSONObject();

        if (list != null) {
            json.put("code", 200);
            json.put("msg", list);
            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "没有数据");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;

    }

    /**
     * @param obj
     * @param request
     * @param response
     * @return
     * @throws Exception
     * @Desc 保存数据
     * @author CZP
     * @Date 2018年10月18日 上午11:34:10
     */
    @RequestMapping(value = "/save")
    public String Save(Duty obj, HttpServletRequest request, HttpServletResponse response) throws Exception {
        // String appendix=upload.upload(request, pic);//返回路径给appendix
        String userstxt = request.getParameter("users");
        String ids = request.getParameter("ids");
        //String groupids=request.getParameter("groupid");

        //String departIds=request.getParameter("departId");

        String departIds = request.getParameter("groupid");

        //Users user=ContextUtil.getContextLoginUser();//登录账号的信息
        obj.setUser(userstxt);
        obj.setUid(ids);
        //obj.setPublisherid(1);//发布者
        //obj.setUsersgroupid(groupids);
        // obj.setAppendix(appendix);
        obj.setDepartId(departIds);
        int id = dutyService.save(obj);
        if (id > 0) {
            // 将多个执行人拆分，插入到dutyuser表
            DutyUser obj2 = new DutyUser();
            if (StringUtils.isNotBlank(userstxt)) {
                //录入了执行人
                for (int i = 0; i < userstxt.split(",").length; i++) {
                    obj2.setDutyid(obj.getId());
                    obj2.setUserid(Integer.parseInt(ids.split(",")[i]));
                    obj2.setStartdate(obj.getStartdate());
                    obj2.setEnddate(obj.getEnddate());
                    obj2.setContent(obj.getContent());
                    obj2.setDkey(obj.getDkey());
                    dutyUserService.save(obj2);
                }
            }
        }
        return "redirect:duty_list";
    }


    /**
     * @param request
     * @return
     * @Desc 编辑任务
     * @author CZP
     * @Date 2018年10月18日 上午11:16:38
     */
    @RequestMapping(value = "/edit_detail_duty", method = RequestMethod.GET)
    public String editDuty(HttpServletRequest request) {

        String id = request.getParameter("id");
        Duty duty = dutyService.get(Integer.parseInt(id));

        //
	/*	Users user = ContextUtil.getContextLoginUser();// 登录账号的信息
		List<DutyUsername> dutyUsernameList = null;
		if (duty.getPublisherid() == user.getId()) {// 当前登录账号是发布者时，可以显示所有部门用户
			String[] datas = StringUtils.split(duty.getUsersgroupid(), ",");
			Integer[] ids = DataConvertUtils.convertToInteger(datas);
			dutyUsernameList = dutyUsernameService.getListByUsersGroupids(ids);
			// dutyUsernameList = dutyUsernameService.getList();
		} else {
			dutyUsernameList = dutyUsernameService.getListByUsersGroupids(user.getGroupid());
		}
	*/
        String ids = "1,2,3,4,5,6,7";
        List<DutyUsername> dutyUsernameList = dutyUsernameService.getUsersGroupList(ids);
        getRequest().setAttribute("dutyUsernameList", dutyUsernameList);

        Map<String, Object> param = new HashMap<String, Object>();
        param.put("dutyid", id);
        param.put("type", 1);// 记录类型: 0为任务进度 1为接授任务
        List<DutyLog> dutyLogUserAccepList = dutyLogService.getList(param);// 查询接授任务的用户

        getRequest().setAttribute("dutyLogUserAccepList", dutyLogUserAccepList);

        //usersgroupid
        Map userGroupMap = new HashMap();
        userGroupMap.put("id", duty.getUsersgroupid());
        List<ShiroActionUsersGroup> shiroActionUsersGroupList = shiroActionUsersGroupService.getListByGroupid(userGroupMap);
        getRequest().setAttribute("shiroActionUsersGroupList", shiroActionUsersGroupList);

        getRequest().setAttribute("duty", duty);

        //dutyUserList
        Map usermap = new HashMap();
        usermap.put("dutyid", Integer.parseInt(id));
        List<DutyUser> dutyUserList = dutyUserService.getList(usermap);
        getRequest().setAttribute("dutyUserList", dutyUserList);
        return "/WEB-INF/duty/duty_detail";
    }


    /**
     * @param duty
     * @param request
     * @param response
     * @return
     * @Desc 保存编辑
     * @author CZP
     * @Date 2018年10月18日 上午11:17:07
     */
    @RequestMapping(value = "/edit_detail_duty", method = RequestMethod.POST)
    public String saveEditDuty(Duty duty, HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String users = request.getParameter("users");
        String ids = request.getParameter("ids");
        String olduserid = request.getParameter("olduserid");
        String uid = ids;
        String note = request.getParameter("note");
        int level = Integer.parseInt(request.getParameter("level"));

        String groupids = request.getParameter("groupid");
        duty.setId(Integer.parseInt(id));
        if (null != users && !users.equals("")) {
            duty.setUser(users);
        }
        if (null != ids && !ids.equals("")) {
            duty.setUid(ids);
        }
        duty.setUsersgroupid(groupids);
        duty.setNote(note);
        duty.setStartdate(duty.getStartdate());
        duty.setEnddate(duty.getEnddate());
        // duty.setContent(duty.getContent());
        duty.setLevel(level);
        dutyService.edit(duty);

        DutyUser obj2 = new DutyUser();

        if (StringUtils.isBlank(olduserid)) {
            if (null != ids && !ids.equals("") && ids.split(",").length > 0) {
                for (int i = 0; i < ids.split(",").length; i++) {
                    obj2.setDutyid(Integer.parseInt(id));
                    obj2.setUserid(Integer.parseInt(ids.split(",")[i].trim()));
                    obj2.setStartdate(duty.getStartdate());
                    obj2.setEnddate(duty.getEnddate());
                    obj2.setNote(note);
                    obj2.setContent(duty.getContent());
                    obj2.setDkey(3);// 3初始
                    dutyUserService.save(obj2);
                }
            }

        } else {
            int[] newUid = new int[uid.split(",").length]; // 代表新获取的uid
            int[] oldUid = new int[olduserid.split(",").length]; // 数据库的id
            if (StringUtils.isNotBlank(ids)) {
                for (int i = 0; i < uid.split(",").length; i++) {
                    newUid[i] = Integer.parseInt(uid.split(",")[i]);
                }
                for (int i = 0; i < olduserid.split(",").length; i++) {
                    oldUid[i] = Integer.parseInt(olduserid.split(",")[i]);
                }
            }
            /*
             * 当选择执行人有变化时，获取uid，查询数据库user表， 删除无uid的记录，并插入新增uid的记录，已有的uid记录不做变化
             * 根据id查询duty表的数据
             */
            Duty obj3 = dutyService.get(Integer.parseInt(id));
            // 获取新增的id，插入到数据库
            for (int o : newUid) {
                // 筛选出两个数组中相同的值，>= 0 表示相同，< 0 表示不同 。
                if (Arrays.binarySearch(oldUid, o) < 0) { // o代表新增的userid
                    obj2.setDutyid(Integer.parseInt(id));
                    obj2.setUserid(o);
                    obj2.setStartdate(obj3.getStartdate());
                    obj2.setEnddate(obj3.getEnddate());
                    obj2.setNote(note);
                    obj2.setContent(obj3.getContent());
                    obj2.setDkey(3); //新增加的人总是3
                    dutyUserService.save(obj2);
                }
            }

            // 获取要删除的id，向user表删除记录
            for (int o : oldUid) {
                /*
                 * 筛选出两个数组中相同的值，>= 0 表示相同，< 0 表示不同 。 有相同值是返回元素的下标值。 此处采用的是 "二分搜索法来搜索指定数组"。
                 */
                if (Arrays.binarySearch(newUid, o) < 0) { // o代表要删除的userid
                    DutyUser dutyUser = dutyUserService.getByUserId(o, Integer.parseInt(id));
                    if (dutyUser != null) {
                        dutyUserService.delByUserid(o);
                    }
                }
            }

        }

        return "redirect:duty_list";
    }

    /**
     * @param id
     * @return
     * @Desc 执行人管理，根据dutyid查询dutyuser表
     * @author CZP
     * @Date 2018年10月18日 上午11:17:28
     */
    @RequestMapping(value = "/usermanag")
    public String userManag(int id) {
        Map param = new HashMap();
        param.put("dutyid", id);
        List<DutyUser> dutyUserList = dutyUserService.getList(param); // 是一个list
        getRequest().setAttribute("dutyUserList", dutyUserList);
        return "/WEB-INF/duty/duty_usermanag";
    }


    /**
     * @param ids
     * @return
     * @Desc 清理数据
     * @author CZP
     * @Date 2018年10月18日 上午11:35:01
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public @ResponseBody
    String Update(Integer[] ids) {
        //删除所有数据(不包括log表）
        int aa = dutyService.delete(ids);
        if (aa > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * @param id
     * @param user
     * @param sdate
     * @param edate
     * @param model
     * @return
     * @Desc 执行人管理查询
     * @author CZP
     * @Date 2018年10月18日 上午11:35:11
     */
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
        return "/WEB-INF/duty/duty_usermanag";
    }

    /**
     * @param id
     * @param uid
     * @param model
     * @return
     * @Desc 录入信息页面
     * @author CZP
     * @Date 2018年10月18日 上午11:35:23
     */
    @RequestMapping(value = "/log/{id}/{uid}.html")
    public String log(@PathVariable("id") int id, @PathVariable("uid") int uid, Model model) {
        Duty obj = dutyService.get(id);
        getRequest().setAttribute("duty", obj);
        getRequest().setAttribute("uid", uid);
        return "/WEB-INF/duty/log";
    }

    /**
     * @param id
     * @param uid
     * @param model
     * @return
     * @Desc 进行录入信息处理
     * @author CZP
     * @Date 2018年10月18日 上午11:35:31
     */
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
        return "/WEB-INF/duty/dolog";
    }

    /**
     * @param obj
     * @param obj3
     * @param note
     * @param id
     * @param uid
     * @param model
     * @param request
     * @return
     * @throws Exception
     * @Desc 保存录入进度 修改duty表的progress,content和note
     * @author CZP
     * @Date 2018年10月18日 上午11:35:40
     */
    @RequestMapping(value = "/savelog")
    public String savelog(Duty obj, DutyLog obj3, String note, String id, int uid, Model model, HttpServletRequest request) throws Exception {
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
        obj3.setContent(obj.getContent());
        obj3.setNote(note);
        dutyLogService.save(obj3);
        obj2.setDutyid(Integer.parseInt(id));
        obj2.setUserid(uid);
        obj2.setAppendix(appendix);

        // 根据uid查询每个人的总进度,当个人的进度大于等于100时，修改dkey为1，并向duty表插入stoptime
        Map param = new HashMap();
        param.put("dutyid", id);
        param.put("uid", uid);
        DutyLog dutyLog = dutyLogService.get(param);
        if (dutyLog.getProgress() != null && dutyLog.getProgress() + "" != "") {
            if (dutyLog.getProgress() >= 100) {
                // 某个人完成进度大于等于100
                int dkey = 1;
                obj2.setDkey(dkey); // 完成进度
                obj2.setNote(note);
                obj2.setStoptime(sdf.format(new Date()));
                dutyUserService.edit(obj2);
                System.out.println("uid=" + uid + "完成任务！--Dkey=" + obj2.getDkey() + "  ");
            } else if (dutyLog.getProgress() < 100 && dutyLog.getProgress() > 0) {
                int dkey = 2;
                obj2.setDkey(dkey); // 完成进度
                obj2.setNote(note);
                dutyUserService.edit(obj2);
            }
        }

        // 当sumProgress为100时，修改duty表的dkey为1，修改stoptime
        float progress = dutyService.getProgress(Integer.parseInt(id));
        System.out.println("任务总进度：" + progress);
        if (progress >= 100) {
            obj.setDkey(1);
            obj.setStoptime(sdf.format(new Date()));
            obj.setId(Integer.parseInt(id));
            dutyService.edit(obj);
            System.out.println("-------成功！-------");
        }
        return "redirect:duty_list";

    }

    /**
     * @param id
     * @param model
     * @return
     * @Desc 任务管理
     * @author CZP
     * @Date 2018年10月18日 上午11:35:51
     */
    @RequestMapping(value = "/logmanager")
    public String logManager(int id, Model model) {
        Duty obj = dutyService.get(id);
        getRequest().setAttribute("duty", obj);
        List<Duty> dutyList = dutyService.getDuty(obj);
        getRequest().setAttribute("dutyList", dutyList);
        return "/WEB-INF/duty/logmanager";
    }

    /**
     * @param dutyid
     * @param uid
     * @param model
     * @return
     * @Desc 查看历史录入进度, dutyid--duty表的id，uid--username表的id
     * @author CZP
     * @Date 2018年10月18日 上午11:35:59
     */
    @RequestMapping(value = "/loghistory/{dutyid}/{uid}.html")
    public String loghistory(@PathVariable("dutyid") int dutyid, @PathVariable("uid") int uid, Model model) {
        int progress = 0;
        Map param = new HashMap();
        param.put("dutyid", dutyid);
        param.put("uid", uid);
        List<DutyLog> dutyLogList = dutyLogService.getList(param);
        getRequest().setAttribute("dutyLogList", dutyLogList);
        return "/WEB-INF/duty/loghistory";
    }

    /**
     * @param id
     * @param model
     * @param obj2
     * @return
     * @Desc 修改dkey(1 - - - 已完成 2 - - - 进行中 3 - - - 进行中)
     * @author CZP
     * @Date 2018年10月18日 上午11:36:09
     */
    @RequestMapping(value = "/editDkey")
    @ResponseBody
    public String editDkey(int id, Model model, DutyUser obj2) {
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        Date now = new Date();
        String begintime = sdf.format(now);
        Duty obj = new Duty();
        if (id + "" != null && id + "" != "") {
            obj.setId(id);
            obj.setDkey(2);
            obj.setBegintime(begintime);
        }
        dutyService.edit(obj);
        dutyUserService.editDkey(id);
        return "2";

    }

    /**
     * @param type
     * @param sdate
     * @param edate
     * @param model
     * @return
     * @Desc 跳转投诉统计页面
     * @author CZP
     * @Date 2018年10月18日 上午11:36:20
     */
    @RequestMapping(value = "/feedback")
    public String feedBack(int[] type, String sdate, String edate, Model model) {
        if ((StringUtils.isBlank(sdate) && StringUtils.isBlank(edate))) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date(); // 取时间
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(date);
            calendar.add(Calendar.DATE, -7); // 把日期往后增加一天,整数 往后推,负数往前移动
            Map param = new HashMap();
            param.put("sdate", sdf.format(calendar.getTime()));
            param.put("edate", sdf.format(date));
            param.put("type", type);
            List<FeedBack> dutyList = dutyService.getMonth(param);
            getRequest().setAttribute("dutyList", dutyList);
            getRequest().setAttribute("sdate", sdate);
            getRequest().setAttribute("edate", edate);
            getRequest().setAttribute("type", type);
        }
        return "/WEB-INF/duty/feedback";
    }

    /**
     * @param response
     * @return
     * @Desc 投诉统计返回统计JSON数据
     * @author CZP
     * @Date 2018年10月24日 下午3:08:49
     */
    @RequestMapping(value = "/getmonth")
    @ResponseBody
    public String getBack(int[] type, String sdate, String edate, HttpServletResponse response) {
        Map param = new HashMap();
        param.put("sdate", sdate);
        param.put("edate", edate);
        param.put("type", type);
        List<FeedBack> dutyList = dutyService.getMonth(param);
        String days = null;
        JSONObject json = new JSONObject();
        if (dutyList != null) {
            json.put("code", 200);
            json.put("msg", dutyList);

            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "没有数据");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;
    }

    /**
     * @param type
     * @param sdate
     * @param edate
     * @return
     * @Desc 投诉统计，按date查询
     * @author CZP
     * @Date 2018年10月18日 上午11:36:34
     */
    @RequestMapping(value = "/doFeedBack")
    public String doFeedBack(int[] type, String sdate, String edate) {
		/*Duty obj = new Duty();
		obj.setIds(type);
		obj.setSdate(sdate);
		obj.setEdate(edate);*/
        Map param = new HashMap();
        param.put("sdate", sdate);
        param.put("edate", edate);
        param.put("type", type);
        List<FeedBack> dutyList = dutyService.getMonth(param);
        getRequest().setAttribute("dutyList", dutyList);
        getRequest().setAttribute("sdate", sdate);
        getRequest().setAttribute("edate", edate);
        getRequest().setAttribute("type", type);
        return "/WEB-INF/duty/feedback";

    }

    // 16.地址
    @RequestMapping(value = "/address")
    public String Address() {
        return "/WEB-INF/duty/address";
    }

    /**
     * @param model
     * @param stime
     * @param etime
     * @param username
     * @return
     * @Desc 受理工单 ,根据时间周期查询总数
     * @author CZP
     * @Date 2018年10月18日 上午11:36:44
     */
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
        if (userid == 0) {
            //我的工单
            Map userMap = new HashMap();
            userMap.put("dkey", 3);
            userMap.put("stime", stime);
            userMap.put("etime", etime);
            List<DutyUser> dutyList = dutyUserService.getListAllTwo(userMap);
            for (int i = 0; i < dutyList.size(); i++) {
                getRequest().setAttribute("dutyUserList", dutyList);
            }
			/*List<DutyUser> dutyUserList=dutyUserService.getListAll(userMap);
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
					//getRequest().setAttribute("dutyUserList", dutyUserList);
					getRequest().setAttribute("date", date);
					//System.out.println("时间为：" + date + "----------");
				}
				userid=0;
			}*/

            // 信息提醒,根据当前查询当前dkey=3的，返回一个列表,返回的是duty表的内容
            Map dkeyMap = new HashMap();
            dkeyMap.put("ndkey", 3);
            List<DutyUser> dutyDkeyList = dutyUserService.getListAllTwo(dkeyMap);
            //for (int i = 0; i < dutyDkeyList.size(); i++) {
            getRequest().setAttribute("dutyDkeyList", dutyDkeyList);
            //}

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
        // 根据uid查询log表的最后一条记录，返回一个对象
        if (userid != 0) {
            // 信息提醒,根据当前uid查询当前dkey=3的，返回一个列表
            List<DutyUser> dutyUserDkeyList = dutyUserService.getListByDkey(user);
            for (int i = 0; i < dutyUserDkeyList.size(); i++) {
                getRequest().setAttribute("dutyUserDkeyList", dutyUserDkeyList);
            }
            //查询今日总工单
            Map param = new HashMap();
            param.put("date", new Date());
            param.put("stime", stime);
            param.put("etime", etime);
            if (userid != 0) {
                param.put("userid", userid);
            }
            int nowCount = dutyService.getCountUid(param);
            System.out.println("今天的总工单为：" + nowCount + "------");

            // 查询今天的工单,工单要查询duty表的id
            Map param1 = new HashMap();
            param1.put("begintime", begintime);
            param1.put("stime", stime);
            param1.put("etime", etime);
            if (userid != 0) {
                param1.put("userid", userid);
            }
            int now = dutyService.getCountUid(param1);
            System.out.println("今天的工单为：" + now + "------");
            // 查询所有工单，增加时间查询
            Map param2 = new HashMap();
            param2.put("stime", stime);
            param2.put("etime", etime);
            if (userid != 0) {
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
            if (userid != 0) {
                param3.put("userid", userid);
            }
            int urgentCount = dutyService.getCountUid(param3);
            // 查询已受理的紧急工单
            Map param4 = new HashMap();
            param4.put("level", level);
            param4.put("ndkey", 3); // 已受理包括进行中和已完成
            param4.put("stime", stime);
            param4.put("etime", etime);
            if (userid != 0) {
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
            if (userid != 0) {
                param5.put("userid", userid);
            }
            int commonCount = dutyService.getCountUid(param5); //
            // 查询已受理的普通工单(包括已完成的)
            Map param6 = new HashMap();
            param6.put("level", level);
            param6.put("ndkey", 3);
            param6.put("stime", stime);
            param6.put("etime", etime);
            if (userid != 0) {
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
            if (userid != 0) {
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
        } else { //当useid=0，也就是管理员时，根据id查询duty表所有数据
            //查询总工单
            int count = dutyService.getCount();
            //查询今日总工单
            Map param1 = new HashMap();
            //  param1.put("date",sdf.format(new Date()));
            param1.put("stime", stime);
            param1.put("etime", etime);
            int nowCount = dutyService.getCountAll(param1);
            System.out.println("今天的总工单为：" + nowCount + "------"); //查询所有工单，增加时间查询
            //查询今日已受理工单
            Map param2 = new HashMap();
            param2.put("stime", stime);
            param2.put("etime", etime);
            param2.put("begintime", begintime);
            int now = dutyService.getCountAll(param2);
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

        return "/WEB-INF/duty/case";
    }

    /**
     * @param ids
     * @param response
     * @throws Exception
     * @Desc 导出excel
     * @author CZP
     * @Date 2018年10月18日 下午2:19:05
     */
    @RequestMapping(value = "/export")
    @ResponseBody
    public void Export(int[] ids, HttpServletResponse response) throws Exception {
        Duty obj = new Duty();
        obj.setIds(ids);
        List<Duty> dataList = dutyService.getAllDuty(obj);
        String sheetName = "任务统计单";
        String fileName = "任务统计单1";
        String[] columnName = {"ID", "工单编号", "工单名称", "类型", "执行部门", "执行人", "开始时期", "结束时期", "进度", "工单描述", "附件", "状态", "发起时间", "uid"};
        ExportExcelUtil.ExportWithResponse(sheetName, columnName, dataList, response);
    }

    //18.查看工单内容
    @RequestMapping(value = "/dutycontent/{id}")
    public String dutyContent(@PathVariable("id") int id) {
        //根据id获取内容
        Duty obj = dutyService.get(id);
        getRequest().setAttribute("duty", obj);
        return "/WEB-INF/duty/dutycontent";
    }

}
