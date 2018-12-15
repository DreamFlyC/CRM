package com.lw.crm.crmsupplier.action;
import com.alibaba.fastjson.JSONObject;
import com.lw.acommon.util.JsonMsgStatusEntity;
import com.lw.common.page.Pager;
import com.lw.common.util.ResponseUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmsupplier.entity.CrmSupplier;
import com.lw.crm.crmsupplier.service.ICrmSupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
@Controller("CrmSupplierAction")
@RequestMapping(value = "/manage/crmsupplier")
@SuppressWarnings("all")
public class CrmSupplierAction extends BaseAction {
	@Autowired
	private ICrmSupplierService crmSupplierService;
	
    //信息列表
    @RequestMapping("/crmsupplier_list")
    public String list(){
        instantPage(20);
        List<CrmSupplier> list=crmSupplierService.getList();
        int total=crmSupplierService.getCount();
        Pager pager=new Pager(super.getPage(),super.getRows(),total);
        pager.setDatas(list);
        getRequest().setAttribute("pager",pager);
        return  "/WEB-INF/crmsupplier/crmsupplier_list";
    }

    @RequestMapping(value="/post",method=RequestMethod.GET)
    public String addcrmsupplier(){

        return "/WEB-INF/crmsupplier/crmsupplier_add";
    }

    //新增信息
    @RequestMapping(value="/post",method=RequestMethod.POST)
    public String addcrmsupplier(CrmSupplier crmSupplier){
        crmSupplierService.save(crmSupplier);
        return "redirect:crmsupplier_list";
    }

    //删除信息
    @RequestMapping(value="/del/{id}")
    public String deletecrmsupplier(@PathVariable("id")int id,HttpServletResponse response){
        crmSupplierService.del(id);
        return "redirect:../crmsupplier_list";
    }

    //修改信息
    @RequestMapping(value="/edit",method=RequestMethod.POST)
    public String updatecrmsupplier(CrmSupplier crmSupplier,HttpServletResponse response){
        crmSupplierService.edit(crmSupplier);
        return "redirect:crmsupplier_list";
    }

    //编辑前根据id获取信息
    @RequestMapping(value="/{id}")
    public String viewcrmsupplier(@PathVariable("id")int id)
    {
        CrmSupplier crmSupplier=crmSupplierService.get(id);
        getRequest().setAttribute("crmSupplier",crmSupplier);
        return "/WEB-INF/crmsupplier/crmsupplier_detail";
    }

    
    /*
     * create by: CZP
     * description:查询供应商列表
     * create time: 9:35 2018/11/26
     * @Param: null
     * @return 
     */
    @RequestMapping(value = "/getListBySupplier")
    @ResponseBody
    public JsonMsgStatusEntity getListBySupplier(HttpServletResponse response) {
        // 一对多，返回list
        List<CrmSupplier> obj = crmSupplierService.getList();

        JSONObject json = new JSONObject();
        if (!obj.isEmpty()) {
            json.put("code", 200);
            json.put("msg", obj);
            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "没有数据");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;
    }

}
