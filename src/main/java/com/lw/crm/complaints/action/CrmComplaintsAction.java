package com.lw.crm.complaints.action;

import com.alibaba.fastjson.JSONObject;
import com.lw.acommon.util.JsonMsgStatusEntity;
import com.lw.common.page.Pager;
import com.lw.common.util.DateUtil;
import com.lw.common.util.ResponseUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.complaints.entity.CrmComplaints;
import com.lw.crm.complaints.service.ICrmComplaintsService;
import com.lw.crm.complaintstype.entity.CrmComplaintsType;
import com.lw.crm.complaintstype.service.ICrmComplaintsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller("CrmComplaintsAction")
@RequestMapping(value = "/manage/crmcomplaints")
public class CrmComplaintsAction extends BaseAction {

    private static final int STATUS_DEFAULT = 0;
    private static final int STATUS_DAY = 1;
    private static final int STATUS_MONTH = 2;
    private static final int STATUS_YEAR = 3;

    @Autowired
    private ICrmComplaintsService crmComplaintsService;
    @Autowired
    private ICrmComplaintsTypeService crmComplaintsTypeService;

    @RequestMapping("")
    public String list() {
        instantPage(20);
        List<CrmComplaints> list = crmComplaintsService.getList();
        int total = crmComplaintsService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);
        return "/WEB-INF/crmcomplaints/crmcomplaints_list";
    }

    @RequestMapping("/crmcomplaints_list")
    public String tongJi() {
        return "/WEB-INF/crmcomplaints/crmcomplaints_tongji";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addCrmComplaints() {
        return "/WEB-INF/crmcomplaints/crmcomplaints_add";
    }

    //增加
    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addCrmComplaints(CrmComplaints crmcomplaints) {
        crmComplaintsService.save(crmcomplaints);
        return "redirect:/manage/crmcomplaints.html";
    }

    //删除
    @RequestMapping(value = "/del/{id}")
    public String deleteCrmComplaints(@PathVariable("id") int id, HttpServletResponse response) {
        System.out.println("id=" + id + "---------");
        crmComplaintsService.del(id);
        return "redirect:/manage/crmcomplaints.html";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateCrmComplaints(CrmComplaints crmcomplaints, HttpServletResponse response) {
        crmComplaintsService.edit(crmcomplaints);
        return "redirect:/manage/crmcomplaints.html";
    }

    @RequestMapping(value = "/{id}")
    public String viewCrmComplaints(@PathVariable("id") int id) {
        CrmComplaints crmcomplaints = crmComplaintsService.get(id);
        getRequest().setAttribute("crmcomplaints", crmcomplaints);
        return "/WEB-INF/crmcomplaints/crmcomplaints_detail";
    }

    /*
     * create by:  CZP
     * description: 投诉统计  type:0--默认 1--天  2--月 3--年
     * create time: 16:58 2018/11/28
     * @Param: null
     * @return
     */
    @RequestMapping(value = "/Listtongji", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsgStatusEntity getListTongJi(HttpServletResponse response, @RequestParam(value = "sDate", required = false) String sDate,
                                             @RequestParam(value = "status", defaultValue = "0") Integer status,
                                             @RequestParam(value = "eDate", required = false) String eDate) {
        Map<String, Object> map = new HashMap<>();
        if (sDate != null) {
            map.put("sDate", sDate);
        }
        if (eDate != null) {
            map.put("eDate", eDate);
        }
        if (status != null) {
            map.put("status", status);
        }

        String visdate = null;
        String viedate = null;

        if (status != null && status == 0) {
            sDate = sDate + "-01";
            DateUtil dateUtil = new DateUtil();
            Date date = DateUtil.parseStrDate(sDate);
            String month = dateUtil.getThisMonthDate(date);
            visdate = month.split(",")[0];
            viedate = month.split(",")[1];
        }
        // 查询type类型的总数
        int typeCount = crmComplaintsTypeService.getCount();
        List<CrmComplaintsType> typeList = crmComplaintsTypeService.getList();
        String[] name = new String[typeList.size()];
        for (int i = 0; i < typeList.size(); i++) {
            name[i] = typeList.get(i).getName();
        }
        List<CrmComplaints> list = crmComplaintsService.getDateAndTypeList(map);
        List formatList = new ArrayList<>();
        if (status != null) {
            if (status.equals(STATUS_DEFAULT)) {
                formatList = list;
            } else if (status.equals(STATUS_DAY)) {
                formatList = list;
            } else if (status.equals(STATUS_MONTH)) {
                for (int i = 0; i < list.size(); i++) {
                    CrmComplaints crmComplaints = new CrmComplaints();
                    String date = DateUtil.formatterDate(list.get(i).getDate()).substring(0, 7);
                    crmComplaints.setDate(parseStrMonth(date));
                    crmComplaints.setNum(list.get(i).getNum());
                    crmComplaints.setType(list.get(i).getType());
                    formatList.add(crmComplaints);
                }
            } else if (status.equals(STATUS_YEAR)) {
                for (int i = 0; i < list.size(); i++) {
                    CrmComplaints crmComplaints = new CrmComplaints();
                    String date = DateUtil.formatterDate(list.get(i).getDate()).substring(0, 4);
                    crmComplaints.setDate(parseStrYear(date));
                    crmComplaints.setNum(list.get(i).getNum());
                    crmComplaints.setType(list.get(i).getType());
                    formatList.add(crmComplaints);
                }
            }
        }
        JSONObject json = new JSONObject();
        if (formatList.size() > 0) {
            json.put("code", 200);
            json.put("msg", formatList);
            json.put("typeCount", typeCount);
            json.put("name", name);
            if (status == 0) {
                json.put("visdate", visdate);
                json.put("viedate", viedate);
            }
            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "没有数据");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;
    }

    public static Date parseStrMonth(String dateStr) {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM");
        Date date = null;

        try {
            date = sf.parse(dateStr);
        } catch (Exception var4) {
        }

        return date;
    }

    public static Date parseStrYear(String dateStr) {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy");
        Date date = null;

        try {
            date = sf.parse(dateStr);
        } catch (Exception var4) {
        }

        return date;
    }
}
