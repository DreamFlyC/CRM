package com.lw.lgsdoorinfo.action;

import com.alibaba.fastjson.JSONObject;
import com.lw.acommon.util.JsonMsgStatusEntity;
import com.lw.common.page.Pager;
import com.lw.common.util.ResponseUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.lgsdoorinfo.entity.LgsDoorInfo;
import com.lw.lgsdoorinfo.service.ILgsDoorInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @ author     ：
 * @ Date       ：
 * @ Description：
 * @ Modified By：
 * @ Version    : 
 */
@Controller
@RequestMapping(value = "/manage/lgsdoorinfo")
public class LgsDoorInfoAction extends BaseAction {
    @Autowired
    private ILgsDoorInfoService lgsDoorInfoService;

    @RequestMapping("")
    public String list() {
        instantPage(20);
        List<LgsDoorInfo> list = lgsDoorInfoService.getList();
        int total = lgsDoorInfoService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);
        return "/WEB-INF/lgsdoorinfo/lgsdoorinfo_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addLgsDoorInfo() {
        return "/WEB-INF/lgsdoorinfo/lgsdoorinfo_add";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addLgsDoorInfo(LgsDoorInfo lgsdoorinfo) {
        lgsDoorInfoService.save(lgsdoorinfo);
        return "redirect:/manage/lgsdoorinfo";
    }

    @RequestMapping(value = "/del/{id}")
    public String deleteLgsDoorInfo(@PathVariable("id") int id) {
        lgsDoorInfoService.del(id);
        return "redirect:/manage/lgsdoorinfo";
    }

    // 屏蔽修改接口

   /* @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateLgsDoorInfo(LgsDoorInfo lgsDoorInfo) {
        lgsDoorInfoService.edit(lgsDoorInfo);
        return "redirect:/manage/lgsdoorinfo";
    }

    @RequestMapping(value = "/{id}")
    public String viewLgsDoorInfo(@PathVariable("id") int id) {
        LgsDoorInfo lgsDoorInfo = lgsDoorInfoService.get(id);
        getRequest().setAttribute("lgsDoorInfo", lgsDoorInfo);
        return "/WEB-INF/lgsdoorinfo/lgsdoorinfo_detail";
    }*/

   @RequestMapping(value = "/status")
   public String doorInfoStatus(){
       return "/WEB-INF/lgsdoorinfo/lgsdoorinfo_status";
   }

   @RequestMapping(value = "/info",method = RequestMethod.POST)
   @ResponseBody
    public JsonMsgStatusEntity doorInfo(HttpServletResponse response){
       List<LgsDoorInfo> lgsDoorInfoList=lgsDoorInfoService.getList();
       JSONObject json=new JSONObject();
       if (!lgsDoorInfoList.isEmpty()) {
           json.put("code", 200);
           json.put("msg", lgsDoorInfoList);
           ResponseUtil.writeJson(response, json.toJSONString());
       } else {
           json.put("code", 404);
           json.put("msg", "没有数据");
           ResponseUtil.writeJson(response, json.toJSONString());
       }
       return null;
   }

}

