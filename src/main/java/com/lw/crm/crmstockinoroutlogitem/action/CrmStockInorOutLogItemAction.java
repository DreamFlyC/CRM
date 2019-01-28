package com.lw.crm.crmstockinoroutlogitem.action;

import com.alibaba.fastjson.JSONObject;
import com.lw.acommon.util.JsonMsgStatusEntity;
import com.lw.common.page.Pager;
import com.lw.common.util.ContextUtil;
import com.lw.common.util.DateUtil;
import com.lw.common.util.ResponseUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmname.service.ICrmNameService;
import com.lw.crm.crmstock.entity.CrmStock;
import com.lw.crm.crmstock.service.ICrmStockService;
import com.lw.crm.crmstockinoroutlog.entity.CrmStockInorOutLog;
import com.lw.crm.crmstockinoroutlog.service.ICrmStockInorOutLogService;
import com.lw.crm.crmstockinoroutlogitem.entity.CrmStockInorOutLogItem;
import com.lw.crm.crmstockinoroutlogitem.service.ICrmStockInorOutLogItemService;
import com.lw.crm.crmstockinoroutlogitem.utils.ExportExcelUtil;
import com.lw.crm.crmstocktype.entity.CrmStockType;
import com.lw.crm.crmstocktype.service.ICrmStockTypeService;
import com.lw.duty.entity.DutyUsername;
import com.lw.duty.service.IDutyUsernameService;
import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;
import com.lw.shiroaction.usersgroup.service.IShiroActionUsersGroupService;
import com.lw.weixin.users.entity.Users;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.time.DateUtils;
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

import static org.apache.commons.lang3.time.DateUtils.addDays;

@Controller("CrmStockInorOutLogItemAction")
@RequestMapping(value = "/manage/crmstockinoroutlogitem")
public class CrmStockInorOutLogItemAction extends BaseAction {
    @Autowired
    private ICrmStockInorOutLogItemService crmStockInorOutLogItemService;
    @Autowired
    private ICrmStockInorOutLogService crmStockInorOutLogService;
    @Autowired
    private ICrmNameService crmNameService;
    @Autowired
    private IDutyUsernameService dutyUsernameService;
    @Autowired
    private IShiroActionUsersGroupService shiroActionUsersGroupService;
    @Autowired
    private ICrmStockTypeService crmStockTypeService;
    @Autowired
    private ICrmStockService crmStockService;

    // 信息列表
    @RequestMapping(value = {"", "/crmstockinoroutlogitem_list"})
    public String list(HttpServletRequest request, HttpServletResponse response) {
        instantPage(20);
        List<CrmStockInorOutLogItem> list = crmStockInorOutLogItemService.getList();
        int total = crmStockInorOutLogItemService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);

        // 清除cookie为pid的值
        Cookie[] cookies = request.getCookies();
        if (null != cookies && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("pid")) {
                    cookie.setValue(null);
                    cookie.setMaxAge(0);// 销毁cookie
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        }
        return "/WEB-INF/crmstockinoroutlogitem/crmstockinoroutlogitem_list";

    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addcrmstockinoroutlogitem() {
        List<CrmName> crmNameList = crmNameService.getList();
        getRequest().setAttribute("crmNameList", crmNameList);
        return "/WEB-INF/crmstockinoroutlogitem/crmstockinoroutlogitem_add";
    }

    // 新增信息
    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addcrmstockinoroutlogitem(CrmStockInorOutLog crmStockInorOutLog) {

        Users user = ContextUtil.getContextLoginUser();//登录账号的信息
        if (null != String.valueOf(user.getId())) {
            crmStockInorOutLog.setUid(String.valueOf(user.getId()));
        }

        crmStockInorOutLogService.save(crmStockInorOutLog);
        return "redirect:crmstockinoroutlogitem_list";
    }

    // 新增明细
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addcrmstockinoroutlogitemtwo(HttpServletRequest request, HttpServletResponse response) {
        List<CrmName> crmNameList = crmNameService.getList();
        getRequest().setAttribute("crmNameList", crmNameList);

        List<CrmStockType> crmStockTypeList = crmStockTypeService.getList();
        getRequest().setAttribute("crmStockTypeList", crmStockTypeList);

        List<ShiroActionUsersGroup> shiroActionUsersGroupList = shiroActionUsersGroupService.getList();
        getRequest().setAttribute("shiroActionUsersGroupList", shiroActionUsersGroupList);

        // 判断cookie有没有值,没有则生成number
        String number = "";
        Cookie[] cookies = request.getCookies();
        if (null != cookies && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("pid")) {
                    number = cookie.getValue();
                }
            }
        }
        if (number == "") {
            // 生成number
            SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddhhmm");
            Date now = new Date();
            int random = (int) (Math.random() * 10000 + 1);
            number = sdf.format(now) + random;

            // 生成cookie
            Cookie cookie = new Cookie("pid", number.trim());
            cookie.setMaxAge(30 * 60);// 设置为30min
            cookie.setPath("/");
            response.addCookie(cookie);
        }


        getRequest().setAttribute("number", number);

        return "/WEB-INF/crmstockinoroutlogitem/crmstockinoroutlogitem_addtwo";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addTwo(CrmStockInorOutLog obj, String number, HttpServletRequest request, HttpServletResponse response) {
		
		  /*Users user=ContextUtil.getContextLoginUser();//登录账号的信息
		  if(null!=String.valueOf(user.getId())) {
		  obj.setUid(String.valueOf(user.getId())); }
		 */

        obj.setNumber(number);
        System.err.println("number为：" + number);
        crmStockInorOutLogService.save(obj);
        // 清除cookie为pid的值
        Cookie[] cookies = request.getCookies();
        if (null != cookies && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("pid")) {
                    cookie.setValue(null);
                    cookie.setMaxAge(0);// 销毁cookie
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        }
        return "redirect:../crmstockinoroutlog/crmstockinoroutlog_list";
    }

    // 删除信息
    @RequestMapping(value = "/del/{id}")
    public String deletecrmstockinoroutlogitem(@PathVariable("id") int id, HttpServletResponse response) {
        crmStockInorOutLogItemService.del(id);
        return "redirect:../crmstockinoroutlogitem_list";
    }

    // 修改信息
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updatecrmstockinoroutlogitem(CrmStockInorOutLogItem crmStockInorOutLogItem,
                                               HttpServletResponse response, String id) {
        System.err.println("id++++++++++====" + id);
        crmStockInorOutLogItem.setId(id);

        // crmStockInorOutLogItemService.edit(crmStockInorOutLogItem);
        return "redirect:crmstockinoroutlogitem_list";
    }

    // 修改信息
    @RequestMapping(value = "/edit/id", method = RequestMethod.POST)
    public String edit(CrmStockInorOutLogItem crmStockInorOutLogItem, HttpServletResponse response) {
        crmStockInorOutLogItemService.edit(crmStockInorOutLogItem);
        return "redirect:crmstockinoroutlogitem_list";
    }

    // 编辑前根据id获取信息
    @RequestMapping(value = "/{id}")
    public String viewcrmstockinoroutlogitem(@PathVariable("id") int id) {
        CrmStockInorOutLogItem crmStockInorOutLogItem = crmStockInorOutLogItemService.get(id);
        getRequest().setAttribute("crmStockInorOutLogItem", crmStockInorOutLogItem);

        List<CrmName> crmNameList = crmNameService.getList();
        getRequest().setAttribute("crmNameList", crmNameList);
        return "/WEB-INF/crmstockinoroutlogitem/crmstockinoroutlogitem_detail";
    }

    /*
     * JSON
     *
     */

    // 新增明细3
    @RequestMapping(value = "/saveitem")
    @ResponseBody
    public Json saveitem(CrmStockInorOutLogItem crmStockInorOutLogItem, String number) {
		
		  /*Users user=ContextUtil.getContextLoginUser();//登录账号的信息
		  if(null!=String.valueOf(user.getId())) {
		  crmStockInorOutLogItem.setUid(String.valueOf(user.getId())); }*/

        //即将过期设置的天数
        final int overdue = 7;
        int shelfLife = crmStockInorOutLogItem.getShelfLife();
        Date overdueDate = addDays(crmStockInorOutLogItem.getProductTime(), shelfLife);
        Date freshDate = DateUtils.addDays(new Date(), overdue);

        if (System.currentTimeMillis() < overdueDate.getTime() && overdueDate.getTime() > freshDate.getTime()) {
            crmStockInorOutLogItem.setStatus(0);
        }else if(System.currentTimeMillis() < overdueDate.getTime() && overdueDate.getTime() <= freshDate.getTime()){
            crmStockInorOutLogItem.setStatus(1);
        }else if(System.currentTimeMillis() > overdueDate.getTime()){
            crmStockInorOutLogItem.setStatus(2);
        }else {
            crmStockInorOutLogItem.setStatus(-1);
        }

        int i = crmStockInorOutLogItemService.save(crmStockInorOutLogItem);
        if (i > 0) {
            return new Json(true, "success", null);

        } else {
            return new Json(false, "fail", null);
        }
    }

    // 根据number查询list
    @RequestMapping(value = "/getlistbynumber")
    @ResponseBody
    public Json getlistbynumber(String number, HttpServletResponse response) {
        Map param = new HashMap();
        param.put("number", number);
        List<CrmStockInorOutLogItem> list = crmStockInorOutLogItemService.getList(param);
        int total = crmStockInorOutLogItemService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("number", number);
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

    // 根据id查询一条记录
    @RequestMapping(value = "/getbyid")
    @ResponseBody
    public Json getById(int id, HttpServletResponse response) {
        CrmStockInorOutLogItem obj = crmStockInorOutLogItemService.get(id);

        JSONObject json = new JSONObject();

        if (obj != null) {
            json.put("code", 200);
            json.put("msg", obj);
            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "没有数据");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;
    }

    // 根据id编辑
    @RequestMapping(value = "/edititem")
    @ResponseBody
    public Json editById(CrmStockInorOutLogItem crmStockInorOutLogItem, HttpServletResponse response, String id) {
        System.err.println("id++++++++++====" + id);
        crmStockInorOutLogItem.setId(id);

        int i = crmStockInorOutLogItemService.edit(crmStockInorOutLogItem);

        JSONObject json = new JSONObject();

        if (i > 0) {
            json.put("code", 200);
            json.put("msg", "success");
            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "没有数据");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;
    }

    // 根据id删除
    @RequestMapping(value = "/del")
    @ResponseBody
    public Json delById(int id, HttpServletResponse response) {
        int i = crmStockInorOutLogItemService.del(id);

        JSONObject json = new JSONObject();

        if (i > 0) {
            json.put("code", 200);
            json.put("msg", "success");
            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "没有数据");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;
    }

    // 根据user查询用户
    @RequestMapping(value = "/getuser")
    @ResponseBody
    public Json getUser(String user, HttpServletResponse response) {

        // 一对多，返回list
        List<DutyUsername> obj = dutyUsernameService.getByUser(user);

        JSONObject json = new JSONObject();
        if (!obj.isEmpty()) {
            json.put("code", 200);
            json.put("msg", obj);
            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "没有数据");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;
    }

    // 根据title查询库存表内容
    @RequestMapping(value = "/getStockByTitle")
    @ResponseBody
    public Json getStockByTitle(String title, HttpServletResponse response) {
        JSONObject json = new JSONObject();

        System.err.println("title=" + title);
        // 查询crm_stock表，返回list
        Map<String, Object> param = new HashMap<String, Object>();

        if (null != title) {
            param.put("title", title);
        }
        List<CrmStock> obj = crmStockService.getList(param);
        if (!obj.isEmpty()) {
            json.put("code", 200);
            json.put("msg", obj);
            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "没有数据");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;
    }

    @RequestMapping("/crmstockinoroutlogitem_statistics")
    public String statistics() {
        return "/WEB-INF/crmstockinoroutlogitem/crmstockinoroutlogitem_statistics";
    }


    /*
     * create by: CZP
     * description:进出货明细统计
     * create time: 10:35 2018/11/30
     * @return
     */
    @RequestMapping(value = "/crmstockinoroutlogitem_getstatistics", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsgStatusEntity getStatistics(@RequestParam(value = "type", required = false) String[] type, HttpServletResponse response,
                                             @RequestParam(value = "sDate", required = false) String sDate,
                                             @RequestParam(value = "eDate", required = false) String eDate) {
        Map<String, Object> map = new HashMap<>(3);
        if (ArrayUtils.isNotEmpty(type)) {
            map.put("type", type);
        }
        if (sDate != null) {
            map.put("sDate", sDate);
        }
        if (eDate != null) {
            map.put("eDate", eDate);
        }
        List<CrmStockInorOutLogItem> list = crmStockInorOutLogItemService.getStatisticsByType(map);
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
        List<CrmStockInorOutLogItem> dataList = crmStockInorOutLogItemService.getList(map);
        String sheetName = "进出货明细详情";
        String prefix = DateUtil.formatterDateTime(new Date(), "yyyyMMddHHmmss");
        String fileName = prefix + sheetName;
        ExportExcelUtil.exportExcel(response, dataList, sheetName, fileName);
    }

}