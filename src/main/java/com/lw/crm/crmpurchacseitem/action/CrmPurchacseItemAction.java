package com.lw.crm.crmpurchacseitem.action;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmpurchacse.entity.CrmPurchacse;
import com.lw.crm.crmpurchacse.service.ICrmPurchacseService;
import com.lw.crm.crmpurchacseitem.entity.CrmPurchacseItem;
import com.lw.crm.crmpurchacseitem.service.ICrmPurchacseItemService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @ author 作者:qw
 * @ createDate 创建时间：2018年12月6日 上午10:34:04
 * @ modified by CZP
 * @ modified date 2018/12/11 15:13:09
 */
@Controller("CrmPurchacseItemAction")
@RequestMapping(value = "manage/crmpurchacseitem")
public class CrmPurchacseItemAction extends BaseAction {

    @Autowired
    private ICrmPurchacseItemService crmPurchacseItemService;

    @Autowired
    private ICrmPurchacseService crmPurchacseService;

    @RequestMapping("")
    public String list(String number) {
        instantPage(20);
        Map<String, Object> param = new HashMap<>(1);
        param.put("number", number);
        List<CrmPurchacseItem> list = crmPurchacseItemService.getList(param);
        int total = crmPurchacseItemService.getCount(param);
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);
        return "/WEB-INF/crmpurchacseitem/crmpurchacseitem_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addCrmPurchacseItem() {

        return "/WEB-INF/crmpurchacseitem/crmpurchacseitem_add";
    }


    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addCrmPurchacseItem(CrmPurchacseItem crmPurchacseItem) {
        crmPurchacseItemService.save(crmPurchacseItem);
        return "redirect:/manage/crmpurchacseitem.html";
    }


    @RequestMapping(value = "/del/{id}")
    public String deleteCrmPurchacseItem(@PathVariable("id") int id, HttpServletResponse response) {
        crmPurchacseItemService.del(id);
        return "redirect:/manage/crmpurchacseitem.html";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateCrmPurchacseItem(CrmPurchacseItem crmPurchacseItem, HttpServletResponse response) {
        crmPurchacseItemService.edit(crmPurchacseItem);
        return "redirect:/manage/crmpurchacseitem.html";
    }

    @RequestMapping(value = "/{id}")
    public String viewCrmPurchacseItem(@PathVariable("id") int id) {
        CrmPurchacseItem crmPurchacseItem = crmPurchacseItemService.get(id);
        getRequest().setAttribute("crmPurchacseItem", crmPurchacseItem);
        return "/WEB-INF/crmpurchacseitem/crmpurchacseitem_detail";
    }

    /*
     * create by: CZP
     * description:提交明细记录
     * create time: 15:58 2018/12/11
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String saveAdd(@RequestParam("data") String data, @RequestParam("crmPurchacse") String crmPurchacse, HttpServletResponse response) {
        if (StringUtils.isNoneEmpty(data)) {
            return crmPurchacseItemService.saveAll(data, crmPurchacse, response);
        }
        return null;
    }

    /*
     * create by: CZP
     * description:送货单
     * create time: 15:14 2018/12/26
     * @return
     */
    @RequestMapping(value = "/delivery/{id}", method = RequestMethod.GET)
    public String delivery(@PathVariable("id") Integer id) {
        CrmPurchacse crmPurchacse = crmPurchacseService.get(id);
        Map<String, Object> param = new HashMap<>();
        if (crmPurchacse != null) {
            param.put("number", crmPurchacse.getNumber());
        }
        List<CrmPurchacseItem> crmPurchacseItemList = crmPurchacseItemService.getList(param);
        getRequest().setAttribute("crmPurchacseItemList", crmPurchacseItemList);
        getRequest().setAttribute("crmPurchacse", crmPurchacse);
        return "/WEB-INF/crmpurchacseitem/crmpurchacseitem_delivery";
    }
}
