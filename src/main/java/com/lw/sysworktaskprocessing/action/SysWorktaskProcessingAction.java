package com.lw.sysworktaskprocessing.action;

import com.alibaba.fastjson.JSONObject;
import com.lw.common.page.Pager;
import com.lw.common.util.ResponseUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.sysworktaskprocessing.entity.SysWorktaskProcessing;
import com.lw.sysworktaskprocessing.service.ISysWorktaskProcessingService;
import com.lw.sysworktaskprocessing.vo.SysWorktaskProcessingVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ author     ：
 * @ Date       ：
 * @ Description：
 * @ Modified By：
 * @ Version    :
 */
@Controller
@RequestMapping(value = "/manage/sysworktaskprocessing")
public class SysWorktaskProcessingAction extends BaseAction {
    @Autowired
    private ISysWorktaskProcessingService sysWorktaskProcessingService;



    @RequestMapping("")
    public String list() {
        instantPage(20);
        List<SysWorktaskProcessing> list = sysWorktaskProcessingService.getList();
        int total = sysWorktaskProcessingService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);
        return "/WEB-INF/sysworktaskprocessing/sysworktaskprocessing_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addSysWorktaskProcessing() {
        return "/WEB-INF/sysworktaskprocessing/sysworktaskprocessing_add";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addSysWorktaskProcessing(SysWorktaskProcessing sysworktaskprocessing) {
        sysWorktaskProcessingService.save(sysworktaskprocessing);
        return "redirect:/manage/sysworktaskprocessing";
    }

    @RequestMapping(value = "/del/{id}")
    public String deleteSysWorktaskProcessing(@PathVariable("id") int id) {
        sysWorktaskProcessingService.del(id);
        return "redirect:/manage/sysworktaskprocessing";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateSysWorktaskProcessing(SysWorktaskProcessing sysWorktaskProcessing) {
        sysWorktaskProcessingService.edit(sysWorktaskProcessing);
        return "redirect:/manage/sysworktaskprocessing";
    }

    @RequestMapping(value = "/{id}")
    public String viewSysWorktaskProcessing(@PathVariable("id") int id) {
        SysWorktaskProcessing sysWorktaskProcessing = sysWorktaskProcessingService.get(id);
        getRequest().setAttribute("sysWorktaskProcessing", sysWorktaskProcessing);
        return "/WEB-INF/sysworktaskprocessing/sysworktaskprocessing_detail";
    }

    @RequestMapping(value = "/tongji", method = RequestMethod.GET)
    public String tongjiView(){
        return "/WEB-INF/sysworktaskprocessing/sysworktaskprocessing_tongji";
    }

    /*
     * create by: CZP
     * description: 统计功能（根据状态统计  0未处理   1处理中  3已处理成功  4已处理失败）
     * create time: 14:31 2019/2/23
     * @return
     */
    @RequestMapping(value = "/tongji", method = RequestMethod.POST)
    @ResponseBody
    public String tongji(@RequestParam(value = "startTime", required = false) String startTime,
                         @RequestParam(value = "endTime", required = false) String endTime,
                         HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        if(startTime!=null){
            map.put("startTime",startTime);
        }
        if(endTime!=null){
            map.put("endTime",endTime);
        }
        List<SysWorktaskProcessingVo> list = sysWorktaskProcessingService.getTongji(map);
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

}

