package com.lw.foodsetmealitemstock.action;

import com.lw.foodsetmealitemstock.entity.FoodSetMealItemStock;
import com.lw.foodsetmealitemstock.service.IFoodSetMealItemStockService;
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
@RequestMapping(value = "/manage/foodsetmealitemstock")
public class FoodSetMealItemStockAction extends BaseAction {
    @Autowired
    private IFoodSetMealItemStockService foodSetMealItemStockService;

    @RequestMapping("")
    public String list() {
        instantPage(20);
        List<FoodSetMealItemStock> list = foodSetMealItemStockService.getList();
        int total = foodSetMealItemStockService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);
        return "/WEB-INF/foodsetmealitemstock/foodsetmealitemstock_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addFoodSetMealItemStock() {
        return "/WEB-INF/foodsetmealitemstock/foodsetmealitemstock_add";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addFoodSetMealItemStock(FoodSetMealItemStock foodsetmealitemstock) {
        foodSetMealItemStockService.save(foodsetmealitemstock);
        return "redirect:/manage/foodsetmealitemstock";
    }

    @RequestMapping(value = "/del/{id}")
    public String deleteFoodSetMealItemStock(@PathVariable("id") int id) {
        foodSetMealItemStockService.del(id);
        return "redirect:/manage/foodsetmealitemstock";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateFoodSetMealItemStock(FoodSetMealItemStock foodSetMealItemStock) {
        foodSetMealItemStockService.edit(foodSetMealItemStock);
        return "redirect:/manage/foodsetmealitemstock";
    }

    @RequestMapping(value = "/{id}")
    public String viewFoodSetMealItemStock(@PathVariable("id") int id) {
        FoodSetMealItemStock foodSetMealItemStock = foodSetMealItemStockService.get(id);
        getRequest().setAttribute("foodSetMealItemStock", foodSetMealItemStock);
        return "/WEB-INF/foodsetmealitemstock/foodsetmealitemstock_detail";
    }
}

