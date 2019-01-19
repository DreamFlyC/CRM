package com.lw.traceabilityunit.action;

import com.lw.traceabilityunit.entity.TraceabilityUnit;
import com.lw.traceabilityunit.service.ITraceabilityUnitService;
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
 * @ Date       ：2019-01-19 15:38:55
 * @ Description：溯源单位管理
 * @ Modified By：
 * @ Version    : 
 */
@Controller
@RequestMapping(value = "/manage/traceabilityunit")
public class TraceabilityUnitAction extends BaseAction {
    @Autowired
    private ITraceabilityUnitService traceabilityUnitService;

    @RequestMapping("")
    public String list() {
        instantPage(20);
        List<TraceabilityUnit> list = traceabilityUnitService.getList();
        int total = traceabilityUnitService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);
        return "/WEB-INF/traceabilityunit/traceabilityunit_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addTraceabilityUnit() {
        return "/WEB-INF/traceabilityunit/traceabilityunit_add";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addTraceabilityUnit(TraceabilityUnit traceabilityunit) {
        traceabilityUnitService.save(traceabilityunit);
        return "redirect:/manage/traceabilityunit";
    }

    @RequestMapping(value = "/del/{id}")
    public String deleteTraceabilityUnit(@PathVariable("id") int id) {
        traceabilityUnitService.del(id);
        return "redirect:/manage/traceabilityunit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateTraceabilityUnit(TraceabilityUnit traceabilityUnit) {
        traceabilityUnitService.edit(traceabilityUnit);
        return "redirect:/manage/traceabilityunit";
    }

    @RequestMapping(value = "/{id}")
    public String viewTraceabilityUnit(@PathVariable("id") int id) {
        TraceabilityUnit traceabilityUnit = traceabilityUnitService.get(id);
        getRequest().setAttribute("traceabilityUnit", traceabilityUnit);
        return "/WEB-INF/traceabilityunit/traceabilityunit_detail";
    }
}

