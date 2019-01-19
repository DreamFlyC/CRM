package com.lw.memberdoorauthoritylog.action;

import com.lw.memberdoorauthoritylog.entity.MemberDoorAuthorityLog;
import com.lw.memberdoorauthoritylog.service.IMemberDoorAuthorityLogService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @ author     ：CZP
 * @ Date       ：2019-01-19 9:56:50
 * @ Description：开门权限日记管理
 * @ Modified By：
 * @ Version    : 
 */
@Controller
@RequestMapping(value = "/manage/memberdoorauthoritylog")
public class MemberDoorAuthorityLogAction extends BaseAction {
    @Autowired
    private IMemberDoorAuthorityLogService memberDoorAuthorityLogService;

    @RequestMapping("")
    public String list() {
        instantPage(20);
        List<MemberDoorAuthorityLog> list = memberDoorAuthorityLogService.getList();
        int total = memberDoorAuthorityLogService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);
        return "/WEB-INF/memberdoorauthoritylog/memberdoorauthoritylog_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addMemberDoorAuthorityLog() {
        return "/WEB-INF/memberdoorauthoritylog/memberdoorauthoritylog_add";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addMemberDoorAuthorityLog(MemberDoorAuthorityLog memberdoorauthoritylog) {
        memberDoorAuthorityLogService.save(memberdoorauthoritylog);
        return "redirect:/manage/memberdoorauthoritylog";
    }

    @RequestMapping(value = "/del/{id}")
    public String deleteMemberDoorAuthorityLog(@PathVariable("id") int id) {
        memberDoorAuthorityLogService.del(id);
        return "redirect:/manage/memberdoorauthoritylog";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateMemberDoorAuthorityLog(MemberDoorAuthorityLog memberDoorAuthorityLog) {
        memberDoorAuthorityLogService.edit(memberDoorAuthorityLog);
        return "redirect:/manage/memberdoorauthoritylog";
    }

    @RequestMapping(value = "/{id}")
    public String viewMemberDoorAuthorityLog(@PathVariable("id") int id) {
        MemberDoorAuthorityLog memberDoorAuthorityLog = memberDoorAuthorityLogService.get(id);
        getRequest().setAttribute("memberDoorAuthorityLog", memberDoorAuthorityLog);
        return "/WEB-INF/memberdoorauthoritylog/memberdoorauthoritylog_detail";
    }
}

