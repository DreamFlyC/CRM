package com.lw.apiproductpurch.action;

import com.lw.apiproductpurch.entity.ApiProductPurch;
import com.lw.apiproductpurch.service.IApiProductPurchService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
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
@RequestMapping(value = "/manage/apiproductpurch")
public class ApiProductPurchAction extends BaseAction {
    @Autowired
    private IApiProductPurchService apiProductPurchService;

    @RequestMapping("")
    public String list() {
        instantPage(20);
        List<ApiProductPurch> list = apiProductPurchService.getList();
        int total = apiProductPurchService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);
        return "/WEB-INF/apiproductpurch/apiproductpurch_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addApiProductPurch() {
        return "/WEB-INF/apiproductpurch/apiproductpurch_add";
    }

    //增加
    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addApiProductPurch(ApiProductPurch apiproductpurch) {
        apiProductPurchService.save(apiproductpurch);
        return "redirect:/manage/apiproductpurch";
    }

    //删除
    @RequestMapping(value = "/del/{id}")
    public String deleteApiProductPurch(@PathVariable("id") int id) {
        apiProductPurchService.del(id);
        return "redirect:/manage/apiproductpurch";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateApiProductPurch(ApiProductPurch apiProductPurch) {
        apiProductPurchService.edit(apiProductPurch);
        return "redirect:/manage/apiproductpurch";
    }

    @RequestMapping(value = "/{id}")
    public String viewApiProductPurch(@PathVariable("id") int id) {
        ApiProductPurch apiProductPurch = apiProductPurchService.get(id);
        getRequest().setAttribute("apiProductPurch", apiProductPurch);
        return "/WEB-INF/apiproductpurch/apiproductpurch_detail";
    }
}

