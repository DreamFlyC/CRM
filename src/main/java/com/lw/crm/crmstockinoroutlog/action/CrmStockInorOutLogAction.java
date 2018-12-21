package com.lw.crm.crmstockinoroutlog.action;

import com.alibaba.fastjson.JSONObject;
import com.lw.acommon.util.JsonMsgStatusEntity;
import com.lw.common.page.Pager;
import com.lw.common.util.ContextUtil;
import com.lw.common.util.ResponseUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmname.service.ICrmNameService;
import com.lw.crm.crmstockinoroutlog.entity.CrmStockInorOutLog;
import com.lw.crm.crmstockinoroutlog.service.ICrmStockInorOutLogService;
import com.lw.crm.crmstockinoroutlog.utils.ExportExcelUtil;
import com.lw.crm.crmstockinoroutlogitem.entity.CrmStockInorOutLogItem;
import com.lw.crm.crmstockinoroutlogitem.service.ICrmStockInorOutLogItemService;
import com.lw.crm.crmstocktype.entity.CrmStockType;
import com.lw.crm.crmstocktype.service.ICrmStockTypeService;
import com.lw.duty.entity.DutyUsername;
import com.lw.duty.service.IDutyUsernameService;
import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;
import com.lw.shiroaction.usersgroup.service.IShiroActionUsersGroupService;
import com.lw.weixin.users.entity.Users;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("CrmStockInorOutLogAction")
@RequestMapping(value="/manage/crmstockinoroutlog")
public class CrmStockInorOutLogAction extends BaseAction{
	private static Logger log=Logger.getLogger(CrmStockInorOutLogAction.class);

	@Autowired
	private ICrmStockInorOutLogService crmStockInorOutLogService;
	@Autowired
	private ICrmStockInorOutLogItemService crmStockInorOutLogItemService;
	@Autowired
	private ICrmNameService crmNameService;
	@Autowired
	private IDutyUsernameService dutyUsernameService;
	@Autowired
	private IShiroActionUsersGroupService shiroActionUsersGroupService;
	@Autowired
	private ICrmStockTypeService crmStockTypeService;
	//信息列表
	@RequestMapping(value= {"","/crmstockinoroutlog_list"})
	public String list(HttpServletRequest request,HttpServletResponse response){
		instantPage(20);
		List<CrmStockInorOutLog> list=crmStockInorOutLogService.getList();
		int total=crmStockInorOutLogService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		
		//清除cookie为pid的值
				Cookie[] cookies = request.getCookies();
				for(Cookie cookie : cookies){
				    if(cookie.getName().equals("pid")){
				    	 cookie.setValue(null);  
		                 cookie.setMaxAge(0);
		                 cookie.setPath("/");  
		                 response.addCookie(cookie); 
				    }
				}	  
		return  "/WEB-INF/crmstockinoroutlog/crmstockinoroutlog_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addcrmstockinoroutlog(){
		List<CrmName> crmNameList = crmNameService.getList();
		getRequest().setAttribute("crmNameList", crmNameList);
		
		List<ShiroActionUsersGroup> shiroActionUsersGroupList = shiroActionUsersGroupService.getList();
		getRequest().setAttribute("shiroActionUsersGroupList", shiroActionUsersGroupList);

		List<DutyUsername> dutyUsernameList = dutyUsernameService.getList();
		getRequest().setAttribute("dutyUsernameList", dutyUsernameList);
		
		List<CrmStockType> crmStockTypeList = crmStockTypeService.getList();
		getRequest().setAttribute("crmStockTypeList", crmStockTypeList);
		return "/WEB-INF/crmstockinoroutlog/crmstockinoroutlog_add";
	}
	
	//新增信息
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addcrmstockinoroutlog(CrmStockInorOutLog crmStockInorOutLog){
		Users user=ContextUtil.getContextLoginUser();//登录账号的信息
		if(null!=String.valueOf(user.getId())) {
		crmStockInorOutLog.setUid(String.valueOf(user.getId()));
		}
		crmStockInorOutLogService.save(crmStockInorOutLog);
		return "redirect:crmstockinoroutlog_list";
	}
	
	//删除信息
	@RequestMapping(value="/del/{id}")
	public String deletecrmstockinoroutlog(@PathVariable("id")int id,HttpServletResponse response){
		
	//	CrmStockInorOutLog obj=crmStockInorOutLogService.get(id);
		//String number=obj.getNumber();
		int i=crmStockInorOutLogService.delete(id);
	//	crmStockInorOutLogItemService.delByNumber(number);
		System.err.println("哈哈哈哈--i="+i);
		return "redirect:../crmstockinoroutlog_list";
	}
	
	//修改信息
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatecrmstockinoroutlog(CrmStockInorOutLog crmStockInorOutLog,HttpServletResponse response){
		crmStockInorOutLogService.edit(crmStockInorOutLog);
		return "redirect:crmstockinoroutlog_list";
	}
	
	//编辑前根据id获取信息
	@RequestMapping(value="/{id}")
	public String viewcrmstockinoroutlog(@PathVariable("id")int id)
	{
		CrmStockInorOutLog crmStockInorOutLog=crmStockInorOutLogService.get(id);
		getRequest().setAttribute("crmStockInorOutLog",crmStockInorOutLog);
		
		List<CrmName> crmNameList = crmNameService.getList();
		getRequest().setAttribute("crmNameList", crmNameList);
		
		List<ShiroActionUsersGroup> shiroActionUsersGroupList = shiroActionUsersGroupService.getList();
		getRequest().setAttribute("shiroActionUsersGroupList", shiroActionUsersGroupList);
		
		List<DutyUsername> dutyUsernameList = dutyUsernameService.getList();
		getRequest().setAttribute("dutyUsernameList", dutyUsernameList);
		
		List<CrmStockType> crmStockTypeList = crmStockTypeService.getList();
		getRequest().setAttribute("crmStockTypeList", crmStockTypeList);
		
		//查询用户添加过的所有明细
		if(null !=crmStockInorOutLog.getNumber()) {
			String  number=crmStockInorOutLog.getNumber();
			Map<String, Object> param=new HashMap<String, Object>();
			param.put("number",number);
			List<CrmStockInorOutLogItem> itemlist=crmStockInorOutLogItemService.getList(param);
			getRequest().setAttribute("itemlist", itemlist);
		}
		return "/WEB-INF/crmstockinoroutlog/crmstockinoroutlog_detail";
	}

	//打印view
	@RequestMapping(value="/view/{id}")
	public String printlog(@PathVariable("id")int id ) {
		CrmStockInorOutLog crmStockInorOutLog= crmStockInorOutLogService.get(id);
		getRequest().setAttribute("log", crmStockInorOutLog);
		if(null !=crmStockInorOutLog.getNumber()) {
			String  number=crmStockInorOutLog.getNumber();
			Map<String, Object> param=new HashMap<String, Object>();
			param.put("number",number);
			List<CrmStockInorOutLogItem> itemlist=crmStockInorOutLogItemService.getList(param);
			getRequest().setAttribute("logitemlist", itemlist);
		}
		return "/WEB-INF/crmstockinoroutlog/crmstockinoroutlog_view";
	}
	
	//查看display
	@RequestMapping(value="/display/{id}")
	public String displayLog(@PathVariable("id")int id ) {
		CrmStockInorOutLog crmStockInorOutLog= crmStockInorOutLogService.get(id);
		getRequest().setAttribute("log", crmStockInorOutLog);
		
		if(null !=crmStockInorOutLog.getNumber()) {
			String  number=crmStockInorOutLog.getNumber();
			Map<String, Object> param=new HashMap<String, Object>();
			param.put("number",number);
			List<CrmStockInorOutLogItem> itemlist=crmStockInorOutLogItemService.getList(param);
			getRequest().setAttribute("logitemlist", itemlist);
		}
		return "/WEB-INF/crmstockinoroutlog/crmstockinoroutlog_display";
	}


	@RequestMapping("/crmstockinoroutlog_statistics")
	public String statistics(){
		return  "/WEB-INF/crmstockinoroutlog/crmstockinoroutlog_statistics";
	}


	/*
	 * create by: CZP
	 * description:进出货统计
	 * create time: 10:35 2018/11/30
	 * @return
	 */
	@RequestMapping(value = "/crmstockinoroutlog_getstatistics",method = RequestMethod.POST)
	@ResponseBody
	public JsonMsgStatusEntity getStatistics(@RequestParam(value = "type",required = false) String[] type, HttpServletResponse response,
											 @RequestParam(value = "sDate",required = false)String sDate,
											 @RequestParam(value = "eDate",required = false)String eDate){
		Map<String,Object> map=new HashMap<>(3);
		if(ArrayUtils.isNotEmpty(type)){
			map.put("type",type);
		}
		if(sDate!=null){
			map.put("sDate",sDate);
		}
		if(eDate!=null){
			map.put("eDate",eDate);
		}
		List<CrmStockInorOutLog> list= crmStockInorOutLogService.getStatisticsByType(map);
		JSONObject json = new JSONObject();
		if (!list.isEmpty()) {
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
	
	/*
	 * create by: CZP
	 * description:导出EXCEL
	 * create time: 12:14 2018/12/7
	 * @return 
	 */
	@RequestMapping(value = "/export")
	@ResponseBody
	public void Export(@RequestParam(value = "ids", defaultValue = "") Integer[] ids, HttpServletResponse response) throws Exception {
		Map map = new HashMap();
		if (ids.length > 0) {
			map.put("ids", ids);
		}
		List<CrmStockInorOutLog> dataList = crmStockInorOutLogService.getList(map);
		String sheetName = "进出货详情";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String prefix = sdf.format(new Date());
		String fileName = prefix + sheetName;
		ExportExcelUtil.exportExcel(response, dataList, sheetName, fileName);
	}
}
