package com.lw.crm.crm.action;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crm.service.ICrmService;
import com.lw.crm.crmhistory.entity.CrmHistory;
import com.lw.crm.crmhistory.service.ICrmHistoryService;
import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmname.service.ICrmNameService;
import com.lw.crm.crmpurchacse.entity.CrmPurchacse;
import com.lw.crm.crmpurchacse.service.ICrmPurchacseService;
import com.lw.crm.crmstock.entity.CrmStock;
import com.lw.crm.crmstock.service.ICrmStockService;
import com.lw.crm.crmsupplier.entity.CrmSupplier;
import com.lw.crm.crmsupplier.service.ICrmSupplierService;
import com.lw.crm.crmunit.entity.CrmUnit;
import com.lw.crm.crmunit.service.ICrmUnitService;
import com.lw.crm.crmuser.entity.CrmUser;
import com.lw.crm.crmuser.service.ICrmUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("CrmAction")
@RequestMapping(value = "/manage/crm")
@SuppressWarnings("all")
public class CrmAction extends BaseAction {

	@Autowired
	private ICrmService crmService;
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
	private  ICrmUnitService crmUnitService;

	// 1产品管理
	@RequestMapping(value = "/crm_list")
	public String index(@RequestParam(value="keyword",defaultValue="")String keyword, 
			@RequestParam(value="supplier",defaultValue="")String supplier) {
		instantPage(20); // 每页几条记录
		Map map=new HashMap<>();
		if(StringUtils.isNotBlank(keyword)) {
			map.put("keyword", keyword.trim());
		}
		if(StringUtils.isNotBlank(supplier)) {
			//根据supplier找到sid;
			List<CrmSupplier> obj=crmSupplierService.getIdBySupplier(supplier);
			int [] sidArr=new int[obj.size()];
			for(int i=0;i<obj.size();i++) {
				sidArr[i]=obj.get(i).getId();
			}
			map.put("sids", sidArr);
		}
		List<CrmStock> crmList = crmStockService.getList(map);
		int total = crmStockService.getCount(map);
		Pager pager = new Pager(super.getPage(), super.getRows(), total);
		pager.setDatas(crmList);
		getRequest().setAttribute("pager", pager);
		getRequest().setAttribute("keyword", keyword);
		getRequest().setAttribute("supplier", supplier);
		return "/WEB-INF/crm/crm_list";
	}

	// 2 添加产品 ,同时向crm_stock表插入数据,查crm_name表的内容
	@RequestMapping(value = "/crm_add")
	public String add(Model model) {
		List<CrmName> crmNameList = crmNameService.getList();
		getRequest().setAttribute("crmNameList", crmNameList);
		
		List<CrmUnit> crmUnitList = crmUnitService.getList();
		getRequest().setAttribute("crmUnitList", crmUnitList);
		
		List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
		getRequest().setAttribute("crmSupplierList", crmSupplierList);
		return "/WEB-INF/crm/crm_add";
	}

	@RequestMapping(value = "/save")
	public String Save(CrmStock obj) {
		//Users user=ContextUtil.getContextLoginUser();//登录账号的信息
	//	if(null!=String.valueOf(user.getId())) {
	//	obj.setUid(user.getId());
	//	}
		crmStockService.save(obj);
		return "redirect:crm_list";
	}

	// 3.清理数据
	@RequestMapping(value = "/delete", method = RequestMethod.GET)

	public @ResponseBody String Update(int[] ids) {
		int i = 0;
	//	int j = 0;
	//	int k = 0;
		i = crmStockService.delete(ids);
	//	j = crmStockService.delete(ids);
	//	k = crmBuyInfoService.delete(ids);
	//	if (i != 0 && j != 0 && k != 0) {
		if(i!=0) {
			return "success"; // 返回success方法
		} else {

			return "error";
		}
	}

	// 删除信息
	@RequestMapping(value = "/del/{id}")
	public String deleteCrm(@PathVariable("id") int id, HttpServletResponse response) {
		crmStockService.del(id);
		return "redirect:../crm_list";
	}

	// 4.编辑
	@RequestMapping(value = "/crm_update/{id}")
	public String Update(@PathVariable("id") int id, Model model) {
		CrmStock obj = crmStockService.get(id);
		getRequest().setAttribute("crm", obj);
		// 向crm_name表查询type
		List<CrmName> crmNameList = crmNameService.getList();
		getRequest().setAttribute("crmNameList", crmNameList);
		
		List<CrmUnit> crmUnitList = crmUnitService.getList();
		getRequest().setAttribute("crmUnitList", crmUnitList);
		
		List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
		getRequest().setAttribute("crmSupplierList", crmSupplierList);
		
		return "/WEB-INF/crm/crm_detail";
	}

	@RequestMapping(value = "/saveUpdate")
	public String saveUpdate(CrmStock obj) {
		crmStockService.edit(obj);
		
		return "redirect:crm_list";
	}

	/*
	 * // 5.导出excel
	 * 
	 * @RequestMapping(value = "/export")
	 * 
	 * @ResponseBody public void Export(int[] ids, HttpServletResponse response)
	 * throws Exception { Crm obj = new Crm(); obj.setIds(ids);
	 * List<Crm> dataList = crmStockService.getListOut(obj); String
	 * sheetName = "产品详情"; String fileName = "产品详情1"; String[] columnName = { "ID",
	 * "产品编号", "产品名称", "产品价格", "产品类型", "发起日期", "uid" };
	 * eeu.ExportWithResponse(sheetName, columnName, dataList, response); }
	 */
	// 6.显示产品库存信息
	@RequestMapping(value = "/crm_stock/{id}")
	public String view(@PathVariable("id") int id, Model model) {
		instantPage(20); // 每页几条记录
		Map param = new HashMap();
		param.put("id", id);
		List<CrmStock> crmStockList = crmStockService.getList(param);
		int total = crmStockService.getCount(param);
		Pager pager = new Pager(super.getPage(), super.getRows(), total);
		pager.setDatas(crmStockList);
		getRequest().setAttribute("pager", pager);
		getRequest().setAttribute("id", id); // 绑定id到前台，用于分页
		return "/WEB-INF/crm/crm_stock";
	}

	// 7.购买产品确认信息页面
	@RequestMapping(value = "/crm_buy/{id}")
	public String Buy(@PathVariable("id") int id) {
		CrmStock obj = crmStockService.get(id);
		getRequest().setAttribute("crm", obj);
		return "/WEB-INF/crm/crm_buy";
	}

	/*// 8.处理出货信息，修改buyinfo表的leavstock，同时像history表插入此条记录
	@RequestMapping(value = "/doBuy")
	public String loghistory(int id, String stock, Model model, @ModelAttribute CrmHistory obj2,
			HttpServletRequest request) {
		//防止重复提交
		String flag = (String) request.getSession().getAttribute("flag");
		String f = request.getParameter("flag");
		
		// 生成唯一订单号
		String prefix = DateUtil.getCurrentDateTime();
		String suffix = StringUtil.getRandomNumber(6);
		String orderNo = prefix + suffix;
		Map param = new HashMap();
		param.put("id", id);
		param.put("number", orderNo);
		
		if (f.equals(flag)) {
			
			CrmBuyInfo obj = crmBuyInfoService.get(id);
			obj.setStock(stock);
			obj.setPid(id);
			int i = Integer.parseInt(obj.getLeavstock());
			int j = Integer.parseInt(obj.getStock());
			String leavstock = i - j + "";
			obj.setLeavstock(leavstock);
			crmBuyInfoService.edit(obj); // 修改leavstock
			// 向history插入记录
			int reutrn = 0;
			while (reutrn == 0) {
				CrmStock product = crmStockService.get(obj.getPid());
				obj2.setPid(obj.getPid());
				obj2.setTitle(obj.getTitle());
				obj2.setPrice(product.getPrice());
				obj2.setType(obj.getType());
				obj2.setUid(obj.getUid());
				obj2.setNumber(orderNo);
				reutrn = crmHistoryService.save(obj2);
				// 向dobuy页面展示此条记录
				
				List<CrmBuyInfo> crmBuyInfoList = crmBuyInfoService.getList(param);
				getRequest().setAttribute("crmBuyInfoList", crmBuyInfoList);
				getRequest().setAttribute("orderNo", orderNo);
			}

			request.getSession().removeAttribute("flag");
		} else {
			request.getSession().removeAttribute("flag");
			List<CrmBuyInfo> crmBuyInfoList = crmBuyInfoService.getList(param);
			getRequest().setAttribute("crmBuyInfoList", crmBuyInfoList);
			getRequest().setAttribute("orderNo", orderNo);
		}
		return "/WEB-INF/crm/crm_doBuy";
	}*/

	// 9.采购产品界面
	@RequestMapping(value = "/crm_purchacse")
	public String Purchacse(Model model) {
		List<CrmName> crmNameList = crmNameService.getList();
		getRequest().setAttribute("crmNameList", crmNameList);
		return "/WEB-INF/crm/crm_purchacse";
	}

	// 10.根据产品编号、产品名称、产品类别查找采购产品
	@RequestMapping(value = "/crm_find")
	public String Find(String number, String name, Integer type, Model model) {
		instantPage(20); // 每页几条记录
		Map<String,Object> map =new HashMap<String,Object>();
		if(StringUtils.isNotBlank(number)){
			map.put("number",number);
		}
		if(StringUtils.isNotBlank(name)){
			map.put("name",name);
		}
		if(type!=null){
			map.put("type",type);
		}
		List<CrmPurchacse> crmPurchacseList = crmPurchacseService.getList(map);
		int total = crmPurchacseService.getCount(map);
		Pager pager = new Pager(super.getPage(), super.getRows(), total);
		pager.setDatas(crmPurchacseList);
		getRequest().setAttribute("pager", pager);
			getRequest().setAttribute("number", number);
			getRequest().setAttribute("name", name);
			getRequest().setAttribute("type", type);
		// return "redirect:crm_purchacse";
		return "/WEB-INF/crm/crm_purchacse";
	}

	// 11.生成采购单
	@RequestMapping(value = "/crm_order")
	public String Order(Model model) {
		// CrmPurchacse obj=crmPurchacseService.get(id);
		// getRequest().setAttribute("crm", obj);
		List<CrmUser> crmUserList = crmUserService.getList();
		getRequest().setAttribute("crmUserList", crmUserList);
		List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
		getRequest().setAttribute("crmSupplierList", crmSupplierList);
		return "/WEB-INF/crm/crm_order";
	}

	// 12.保存订单
	@RequestMapping(value = "/crm_save")
	public String save(@ModelAttribute CrmPurchacse obj, Model model) {
		crmPurchacseService.save(obj);
		return "redirect:crm_find";
		/*
		 * //插入后根据id查询展示到新的页面 int id=obj.getId();
		 * //System.out.println(id+"dddddddddddddddddddddddddddddd"); CrmPurchacse
		 * crmPurchacse = crmPurchacseService.get(id);
		 * getRequest().setAttribute("crmPurchacse", crmPurchacse); return
		 * "/WEB-INF/crm/crm_doorder";
		 */
	}

	// 13.清理数据
	@RequestMapping(value = "/crm_delete", method = RequestMethod.GET)
	public @ResponseBody String del(int[] ids) {
		int i = 0;
		i = crmPurchacseService.delete(ids);
		if (i != 0) {
			return "success"; // 返回success方法
		} else {

			return "error";
		}
	}

	// 14.修改采购订单
	@RequestMapping(value = "/crm_pccupdate")
	public String pu(int id, Model model) {
		CrmPurchacse obj = crmPurchacseService.get(id);
		getRequest().setAttribute("crm", obj);
		return "/WEB-INF/crm/crm_pccupdate";
	}

	@RequestMapping(value = "/crm_saveUpdate")
	public String saveUpdate(@ModelAttribute CrmPurchacse obj) {
		crmPurchacseService.edit(obj);
		return "redirect:crm_find";
	}

    // 15.点击产品编号查看历史出货信息
	@RequestMapping(value = "/crm_history/{id}")
	public String history(Model model, @PathVariable("id") int id) {
		instantPage(20);
		Map param = new HashMap();
		param.put("pid", id);
		List<CrmHistory> crmHistoryList = crmHistoryService.getList(param);
		getRequest().setAttribute("crmHistoryList", crmHistoryList);
		int total = crmHistoryService.getCount(id);
		// System.out.println("id"+id+"---------------");
		Pager pager = new Pager(super.getPage(), super.getRows(), total);
		getRequest().setAttribute("pager", pager);
		getRequest().setAttribute("id", id); // 绑定id到前台，用于分页
		pager.setDatas(crmHistoryList);
		return "/WEB-INF/crm/crm_history";
	}
	
	/*
	 * create by: CZP
	 * description:测试事务
	 * create time: 15:16 2018/12/14
	 * @return 
	 */
	@RequestMapping(value = "/test.do")
	public int test(){
		return crmStockService.test();
	}
























}
