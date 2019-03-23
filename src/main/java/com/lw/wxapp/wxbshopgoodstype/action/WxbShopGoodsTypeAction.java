package com.lw.wxapp.wxbshopgoodstype.action;

import com.lw.wxapp.wxbshopgoodstype.entity.WxbShopGoodsType;
import com.lw.wxapp.wxbshopgoodstype.service.IWxbShopGoodsTypeService;
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
@RequestMapping(value = "/manage/wxbshopgoodstype")
public class WxbShopGoodsTypeAction extends BaseAction {
    @Autowired
    private IWxbShopGoodsTypeService wxbShopGoodsTypeService;

    @RequestMapping("")
    public String list() {
        instantPage(20);
        List<WxbShopGoodsType> list = wxbShopGoodsTypeService.getList();
        int total = wxbShopGoodsTypeService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);
        return "/WEB-INF/wxbshopgoodstype/wxbshopgoodstype_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addWxbShopGoodsType() {
        return "/WEB-INF/wxbshopgoodstype/wxbshopgoodstype_add";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addWxbShopGoodsType(WxbShopGoodsType wxbshopgoodstype) {
        wxbShopGoodsTypeService.save(wxbshopgoodstype);
        return "redirect:/manage/wxbshopgoodstype";
    }

    @RequestMapping(value = "/del/{id}")
    public String deleteWxbShopGoodsType(@PathVariable("id") int id) {
        wxbShopGoodsTypeService.del(id);
        return "redirect:/manage/wxbshopgoodstype";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateWxbShopGoodsType(WxbShopGoodsType wxbShopGoodsType) {
        wxbShopGoodsTypeService.edit(wxbShopGoodsType);
        return "redirect:/manage/wxbshopgoodstype";
    }

    @RequestMapping(value = "/{id}")
    public String viewWxbShopGoodsType(@PathVariable("id") int id) {
        WxbShopGoodsType wxbShopGoodsType = wxbShopGoodsTypeService.get(id);
        getRequest().setAttribute("wxbShopGoodsType", wxbShopGoodsType);
        return "/WEB-INF/wxbshopgoodstype/wxbshopgoodstype_detail";
    }
}

