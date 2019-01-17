package com.lw.traceabilitysurveyreport.action;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.traceabilitysurveyreport.entity.TraceabilitySurveyReport;
import com.lw.traceabilitysurveyreport.service.ITraceabilitySurveyReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @ author     ：
 * @ Date       ：
 * @ Description：
 * @ Modified By：
 * @ Version    : 
 */
@Controller
@RequestMapping(value = "/manage/traceabilitysurveyreport")
public class TraceabilitySurveyReportAction extends BaseAction {
    @Autowired
    private ITraceabilitySurveyReportService traceabilitySurveyReportService;

    @RequestMapping("")
    public String list() {
        instantPage(20);
        List<TraceabilitySurveyReport> list = traceabilitySurveyReportService.getList();
        int total = traceabilitySurveyReportService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);
        return "/WEB-INF/traceabilitysurveyreport/traceabilitysurveyreport_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addTraceabilitySurveyReport() {
        return "/WEB-INF/traceabilitysurveyreport/traceabilitysurveyreport_add";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addTraceabilitySurveyReport(TraceabilitySurveyReport traceabilitysurveyreport) {
        traceabilitySurveyReportService.save(traceabilitysurveyreport);
        return "redirect:/manage/traceabilitysurveyreport";
    }

    @RequestMapping(value = "/del/{id}")
    public String deleteTraceabilitySurveyReport(@PathVariable("id") int id) {
        traceabilitySurveyReportService.del(id);
        return "redirect:/manage/traceabilitysurveyreport";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateTraceabilitySurveyReport(TraceabilitySurveyReport traceabilitySurveyReport) {
        traceabilitySurveyReportService.edit(traceabilitySurveyReport);
        return "redirect:/manage/traceabilitysurveyreport";
    }

    @RequestMapping(value = "/{id}")
    public String viewTraceabilitySurveyReport(@PathVariable("id") int id) {
        TraceabilitySurveyReport traceabilitySurveyReport = traceabilitySurveyReportService.get(id);
        getRequest().setAttribute("traceabilitySurveyReport", traceabilitySurveyReport);
        return "/WEB-INF/traceabilitysurveyreport/traceabilitysurveyreport_detail";
    }
}

