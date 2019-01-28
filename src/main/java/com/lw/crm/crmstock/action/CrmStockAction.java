package com.lw.crm.crmstock.action;

import com.alibaba.fastjson.JSONObject;
import com.lw.acommon.util.JsonMsgStatusEntity;
import com.lw.acommon.util.Upload;
import com.lw.common.page.Pager;
import com.lw.common.util.ResponseUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmhistory.service.ICrmHistoryService;
import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmname.service.ICrmNameService;
import com.lw.crm.crmpurchacse.service.ICrmPurchacseService;
import com.lw.crm.crmstock.entity.CrmStock;
import com.lw.crm.crmstock.service.ICrmStockService;
import com.lw.crm.crmstock.utils.ExportExcelUtil;
import com.lw.crm.crmstock.utils.ImportExcelUtil;
import com.lw.crm.crmstock.vo.CrmStockVo;
import com.lw.crm.crmsupplier.entity.CrmSupplier;
import com.lw.crm.crmsupplier.service.ICrmSupplierService;
import com.lw.crm.crmunit.entity.CrmUnit;
import com.lw.crm.crmunit.service.ICrmUnitService;
import com.lw.crm.crmuser.service.ICrmUserService;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
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

@Controller("CrmStockAction")
@RequestMapping(value = "/manage/crmstock")
@SuppressWarnings("all")
public class CrmStockAction extends BaseAction {

    private static Logger log=Logger.getLogger(CrmStockAction.class);

    @Autowired
    private ICrmStockService crmStockService;
    @Autowired
    private ICrmNameService crmNameService;
    @Autowired
    private ICrmPurchacseService crmPurchacseService;
    @Autowired
    private ICrmUserService crmUserService;
    @Autowired
    private ICrmSupplierService crmSupplierService;
    @Autowired
    private ICrmHistoryService crmHistoryService;
    @Autowired
    private ICrmUnitService crmUnitService;

    // 信息列表
    @RequestMapping({"","/crmstock_list"})
    public String index(@RequestParam(value = "keyword", required = false) String keyword,
                        @RequestParam(value = "supplier", required = false) String supplier) {
        instantPage(20); // 每页几条记录
        Map map = new HashMap<>();
        if (StringUtils.isNotBlank(keyword)) {
            map.put("keyword", keyword.trim());
        }
        if (StringUtils.isNotBlank(supplier)) {
            //根据supplier找到sid;
            List<CrmSupplier> obj = crmSupplierService.getIdBySupplier(supplier);
            if(obj.size()==0){
                return null;
            }
            int[] sidArr = new int[obj.size()];
            for (int i = 0; i < obj.size(); i++) {
                sidArr[i] = obj.get(i).getId();
            }
            map.put("sids", sidArr);
        }
        List<CrmStockVo> crmList = crmStockService.getVoList(map);
        int total = crmStockService.getCount(map);
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(crmList);
        getRequest().setAttribute("pager", pager);
        getRequest().setAttribute("keyword", keyword);
        getRequest().setAttribute("supplier", supplier);
        return "/WEB-INF/crmstock/crmstock_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addcrmstock() {
        List<CrmName> crmNameList = crmNameService.getList();
        getRequest().setAttribute("crmNameList", crmNameList);

        List<CrmUnit> crmUnitList = crmUnitService.getList();
        getRequest().setAttribute("crmUnitList", crmUnitList);

        List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
        getRequest().setAttribute("crmSupplierList", crmSupplierList);

        return "/WEB-INF/crmstock/crmstock_add";
    }

    // 新增信息
    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addcrmstock(CrmStock crmStock) {
        //Users user=ContextUtil.getContextLoginUser();//登录账号的信息
        //	if(null!=String.valueOf(user.getId())) {
        //	obj.setUid(user.getId());
        //	}
        crmStockService.save(crmStock);
        return "redirect:/manage/crmstock/crmstock_list";
    }

    // 3.清理数据
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public int Update(int[] ids) {
        return crmStockService.delete(ids);
    }

    // 删除信息
    @RequestMapping(value = "/del/{id}")
    public String deletecrmstock(@PathVariable("id") int id, HttpServletResponse response) {
        crmStockService.del(id);
        return "redirect:/manage/crmstock/crmstock_list";
    }

    // 修改信息
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updatecrmstock(CrmStock crmStock) {
        crmStockService.edit(crmStock);
        return "redirect:/manage/crmstock/crmstock_list";
    }

    // 编辑前根据id获取信息
    @RequestMapping(value = "/{id}")
    public String update(@PathVariable("id") int id) {
        CrmStock obj = crmStockService.get(id);
        getRequest().setAttribute("crm", obj);
        // 向crm_name表查询type
        List<CrmName> crmNameList = crmNameService.getList();
        getRequest().setAttribute("crmNameList", crmNameList);

        List<CrmUnit> crmUnitList = crmUnitService.getList();
        getRequest().setAttribute("crmUnitList", crmUnitList);

        List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
        getRequest().setAttribute("crmSupplierList", crmSupplierList);

        return "/WEB-INF/crmstock/crmstock_detail";
    }

    @RequestMapping(value = {"/crmstock_fruit"})
    public String uploadCrmStock() {
        return "/WEB-INF/crmstock/crmstock_fruit";
    }

    @RequestMapping(value = "/saveupload")
    @ResponseBody
    public JsonMsgStatusEntity saveupload(MultipartFile file, HttpServletRequest request) throws Exception {
        String path = "D:\\uploadexcel";
        String fileName = Upload.upload(request, file, path);
        HttpSession session = request.getSession();
        session.setAttribute("fileName", fileName);
        String sessionId = session.getId();
        System.err.println("sessionId:" + sessionId);
        return new JsonMsgStatusEntity(true, "success", fileName);
    }

    @RequestMapping(value = "/crmstock_show")
    public String show(HttpSession session) {
        String fileName = (String) session.getAttribute("fileName");
        String path = "D:\\uploadexcel";
        File file = new File(path + File.separator + fileName);
        Map map = ImportExcelUtil.importExcel(file);
        List<CrmStock> list = (List<CrmStock>) map.get("list");
        String title = (String) map.get("title");

        //查询供应商列表
        List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
        getRequest().setAttribute("crmSupplierList", crmSupplierList);
        getRequest().setAttribute("list", list);
        getRequest().setAttribute("fileName", fileName);
        getRequest().setAttribute("title", title);
        return "/WEB-INF/crmstock/crmstock_show";
    }

    //导入
    @RequestMapping(value = "/importexcel")
    @ResponseBody
    public JsonMsgStatusEntity saveExcel(HttpSession session, int sid, HttpServletResponse response) {
        String fileName = (String) session.getAttribute("fileName");
        String path = "D:\\uploadexcel";
        int resultCount = 0;
        File file = new File(path + File.separator + fileName);
        Map map = ImportExcelUtil.importExcel(file);
        List<CrmStock> list = (List<CrmStock>) map.get("list");
        getRequest().setAttribute("list", list);
        for (CrmStock crmStock : list) {
            crmStock.setSid(sid);
            Map param = new HashMap();
            param.put("sid", crmStock.getSid());
            param.put("snumber", crmStock.getSnumber());
            int count = crmStockService.getCount(param);
            if (count > 0) {
                crmStockService.edit(crmStock);
            } else {
                resultCount += crmStockService.save(crmStock);
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


    // 5.导出excel
    @RequestMapping(value = "/export")
    @ResponseBody
    public void Export(@RequestParam(value = "ids", defaultValue = "") Integer[] ids, HttpServletResponse response) throws Exception {
        Map map = new HashMap();
        if (ids.length > 0) {
            map.put("ids", ids);
        }
        List<CrmStock> dataList = crmStockService.getList(map);
        String sheetName = "库存详情";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String prefix = sdf.format(new Date());
        String fileName = prefix + sheetName;
        ExportExcelUtil.exportExcel(response, dataList, sheetName, fileName);
    }

    @RequestMapping("/crmstock_statistics")
    public String statistics(){
        return  "/WEB-INF/crmstock/crmstock_statistics";
    }

    /*
     * create by: CZP
     * description:库存统计功能
     * create time: 9:02 2018/11/22
     * @Param: null
     * @return
     */
    @RequestMapping(value = "/crmstock_getstatistics",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsgStatusEntity getStatistics(@RequestParam(value = "type",required = false) String[] type, HttpServletResponse response,
                                             @RequestParam(value = "sDate",required = false)String sDate,
                                             @RequestParam(value = "eDate",required = false)String eDate){
        Map<String,Object> map=new HashMap<>(3);
        if(ArrayUtils.isNotEmpty(type)){
            map.put("type",type);
        }
        if(sDate!=null){
            map.put("sDate",sDate);
        }
        if(eDate!=null){
            map.put("eDate",eDate);
        }
        List<CrmStock> crmStockList= crmStockService.getStatisticsByType(map);
        JSONObject json = new JSONObject();
        if (!crmStockList.isEmpty()) {
            json.put("code", 200);
            json.put("msg", crmStockList);
            ResponseUtil.writeJson(response, json.toJSONString());
        } else {
            json.put("code", 404);
            json.put("msg", "没有数据");
            ResponseUtil.writeJson(response, json.toJSONString());
        }
        return null;

    }

}