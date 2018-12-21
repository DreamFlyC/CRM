package com.lw.crm.crmsupplierprice.action;

import com.alibaba.fastjson.JSONObject;
import com.lw.acommon.util.JsonMsgStatusEntity;
import com.lw.acommon.util.Upload;
import com.lw.common.page.Pager;
import com.lw.common.util.ResponseUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmname.service.ICrmNameService;
import com.lw.crm.crmsupplier.entity.CrmSupplier;
import com.lw.crm.crmsupplier.service.ICrmSupplierService;
import com.lw.crm.crmsupplierprice.entity.CrmSupplierPrice;
import com.lw.crm.crmsupplierprice.service.ICrmSupplierPriceService;
import com.lw.crm.crmsupplierprice.utils.ExportExcelUtil;
import com.lw.crm.crmsupplierprice.utils.ImportExcelUtil;
import com.lw.crm.crmunit.entity.CrmUnit;
import com.lw.crm.crmunit.service.ICrmUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * create by: CZP
 * description:供应商商品报价表管理
 * create time: 14:29 2018/11/26
 * @Param: null
 * @return 
 */
@Controller("CrmSupplierPriceAction")
@RequestMapping(value = "/manage/crmsupplierprice")
@SuppressWarnings("all")
public class CrmSupplierPriceAction extends BaseAction {
    @Autowired
    private ICrmSupplierPriceService crmSupplierPriceService;
    @Autowired
    private ICrmNameService crmNameService;
    @Autowired
    private ICrmSupplierService crmSupplierService;
    @Autowired
    private ICrmUnitService crmUnitService;


    //信息列表
    @RequestMapping("/crmsupplierprice_list")
    public String list(){
        instantPage(20);
        List<CrmSupplierPrice> list=crmSupplierPriceService.getList();
        int total=crmSupplierPriceService.getCount();
        Pager pager=new Pager(super.getPage(),super.getRows(),total);
        pager.setDatas(list);
        getRequest().setAttribute("pager",pager);
        return  "/WEB-INF/crmsupplierprice/crmsupplierprice_list";
    }

    @RequestMapping(value="/post",method=RequestMethod.GET)
    public String addcrmsupplierprice(){

        List<CrmName> crmNameList = crmNameService.getList();
        getRequest().setAttribute("crmNameList", crmNameList);

        List<CrmUnit> crmUnitList = crmUnitService.getList();
        getRequest().setAttribute("crmUnitList", crmUnitList);

        List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
        getRequest().setAttribute("crmSupplierList", crmSupplierList);
        return "/WEB-INF/crmsupplierprice/crmsupplierprice_add";
    }

    //新增信息
    @RequestMapping(value="/post",method=RequestMethod.POST)
    public String addcrmsupplierprice(CrmSupplierPrice crmSupplierPrice){
        //Users user=ContextUtil.getContextLoginUser();//登录账号的信息
        //	if(null!=String.valueOf(user.getId())) {
        //	crmSupplierPrice.setUid(user.getId());
        //	}
        crmSupplierPriceService.save(crmSupplierPrice);
        return "redirect:crmsupplierprice_list";
    }

    //删除信息
    @RequestMapping(value="/del/{id}")
    public String deletecrmsupplierprice(@PathVariable("id")int id,HttpServletResponse response){
        crmSupplierPriceService.del(id);
        return "redirect:/manage/crmsupplierprice/crmsupplierprice_list";
    }

    //修改信息
    @RequestMapping(value="/edit",method=RequestMethod.POST)
    public String updatecrmsupplierprice(CrmSupplierPrice crmSupplierPrice,HttpServletResponse response){
        crmSupplierPriceService.edit(crmSupplierPrice);
        return "redirect:crmsupplierprice_list";
    }

    //编辑前根据id获取信息
    @RequestMapping(value="/{id}")
    public String viewcrmsupplierprice(@PathVariable("id")int id)
    {
        // 向crm_name表查询type
        List<CrmName> crmNameList = crmNameService.getList();
        getRequest().setAttribute("crmNameList", crmNameList);

        List<CrmUnit> crmUnitList = crmUnitService.getList();
        getRequest().setAttribute("crmUnitList", crmUnitList);

        List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
        getRequest().setAttribute("crmSupplierList", crmSupplierList);

        CrmSupplierPrice crmSupplierPrice=crmSupplierPriceService.get(id);
        getRequest().setAttribute("crmSupplierPrice",crmSupplierPrice);
        return "/WEB-INF/crmsupplierprice/crmsupplierprice_detail";
    }

    // 5.导出excel
    @RequestMapping(value = "/export")

    @ResponseBody
    public void Export(@RequestParam(value = "ids", defaultValue = "") Integer[] ids, HttpServletResponse response) throws Exception {
        Map map = new HashMap();
        if (ids.length > 0) {
            map.put("ids", ids);
        }
        List<CrmSupplierPrice> dataList = crmSupplierPriceService.getList(map);
        String sheetName = "库存详情";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String prefix = sdf.format(new Date());
        String fileName = prefix + sheetName;
        ExportExcelUtil.exportExcel(response, dataList, sheetName, fileName);
    }

    @RequestMapping(value = {"/crmsupplierprice_fruit"})
    public String uploadCrmStock() {
        return "/WEB-INF/crmsupplierprice/crmsupplierprice_fruit";
    }

    @RequestMapping(value = "/saveupload")
    @ResponseBody
    public JsonMsgStatusEntity saveupload(MultipartFile file, HttpServletRequest request) throws Exception {
        String path = "D:\\uploadexcel";
        String fileName = Upload.upload(request, file, path);
        HttpSession session = request.getSession();
        session.setAttribute("fileName", fileName);
        return new JsonMsgStatusEntity(true, "success", fileName);
    }

    @RequestMapping(value = "/crmsupplierprice_show")
    public String Show(HttpSession session) {
        String fileName = (String) session.getAttribute("fileName");
        String path = "D:\\uploadexcel";
        File file = new File(path + File.separator + fileName);
        Map map = ImportExcelUtil.importExcel(file);
        List<CrmSupplierPrice> list = (List<CrmSupplierPrice>) map.get("list");
        String title = (String) map.get("title");

        //查询供应商列表
        List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
        getRequest().setAttribute("crmSupplierList", crmSupplierList);
        getRequest().setAttribute("list", list);
        getRequest().setAttribute("fileName", fileName);
        getRequest().setAttribute("title", title);
        return "/WEB-INF/crmsupplierprice/crmsupplierprice_show";
    }

    @RequestMapping(value = "/importexcel")
    @ResponseBody
    public JsonMsgStatusEntity saveExcel(HttpSession session, int sid, HttpServletResponse response) {
        String fileName = (String) session.getAttribute("fileName");
        String path = "D:\\uploadexcel";
        int resultCount = 0;
        File file = new File(path + File.separator + fileName);
        Map map = ImportExcelUtil.importExcel(file);
        List<CrmSupplierPrice> list = (List<CrmSupplierPrice>) map.get("list");
        getRequest().setAttribute("list", list);
        for (CrmSupplierPrice crmSupplierPrice : list) {
            crmSupplierPrice.setSid(sid);
            Map param = new HashMap();
            param.put("sid", crmSupplierPrice.getSid());
            param.put("snumber", crmSupplierPrice.getSnumber());
            int count = crmSupplierPriceService.getCount(param);
            if (count > 0) {
                crmSupplierPriceService.edit(crmSupplierPrice);
            } else {
                resultCount += crmSupplierPriceService.save(crmSupplierPrice);
            }
        }
        JSONObject json = new JSONObject();
        if (resultCount >0) {
            json.put("code", 200);
            //json.put("msg", list);
            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "没有数据");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;
    }

    @RequestMapping(value = "/quxiao")
    public JsonMsgStatusEntity quxiao(String fileName, HttpServletResponse response) {
        String path = "D:\\uploadexcel";
        Boolean boo = false;
        File file = new File(path + File.separator + fileName);
        if (file.exists() && file.isFile()) {
            boo = file.delete();
        }
        JSONObject json = new JSONObject();
        if (boo) {
            json.put("code", 200);
            json.put("msg", "删除文件成功");
            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "删除文件失败");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;
    }

    /*
     * create by: CZP
     * description:获取供应商报价列表接口
     * create time: 9:16 2018/12/12
     * @return 
     */
    @RequestMapping(value = "/getsupplierpricelist")
    @ResponseBody
    public JsonMsgStatusEntity getList(HttpServletResponse response){
        JSONObject json = new JSONObject();
        List<CrmSupplierPrice> obj = crmSupplierPriceService.getList();
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
