package com.lw.crm.crmpurchacse.action;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmname.service.ICrmNameService;
import com.lw.crm.crmpurchacse.entity.CrmPurchacse;
import com.lw.crm.crmpurchacse.service.ICrmPurchacseService;
import com.lw.crm.crmsupplier.entity.CrmSupplier;
import com.lw.crm.crmsupplier.service.ICrmSupplierService;
import com.lw.crm.crmsupplierprice.entity.CrmSupplierPrice;
import com.lw.crm.crmsupplierprice.service.ICrmSupplierPriceService;
import com.lw.crm.crmuser.entity.CrmUser;
import com.lw.crm.crmuser.service.ICrmUserService;
import com.lw.shiroaction.usersgroup.service.IShiroActionUsersGroupService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/*
 * create by: CZP
 * description:采购管理
 * create time: 10:17 2018/11/27
 * @Param: null
 * @return 
 */
@Controller("CrmPurchacseAction")
@RequestMapping(value="manage/crmpurchacse")
public class CrmPurchacseAction extends BaseAction{
	@Autowired
	private ICrmPurchacseService crmPurchacseService;
	@Autowired
	private ICrmUserService crmUserService;
	@Autowired
	private ICrmSupplierService crmSupplierService;
	@Autowired
	private IShiroActionUsersGroupService shiroActionUsersGroupService;
	@Autowired
	private ICrmSupplierPriceService crmSupplierPriceService;
	@Autowired
	private ICrmNameService crmNameService;
	
	@RequestMapping(value = "")
	public String list(HttpServletRequest request,HttpServletResponse response){
		instantPage(20);
		List<CrmPurchacse> list=crmPurchacseService.getList();
		int total=crmPurchacseService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		// 清除cookie为pid的值
		Cookie[] cookies = request.getCookies();
		if (null!=cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("pid".equals(cookie.getName())) {
					cookie.setValue(null);
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}
		}
		return  "/WEB-INF/crmpurchacse/crmpurchacse_list";
	}	
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addCrmPurchacse(){
		
		List<CrmUser> crmUserList = crmUserService.getList();
		getRequest().setAttribute("crmUserList", crmUserList);

		return "/WEB-INF/crmpurchacse/crmpurchacse_add";
	}
	
	//增加
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addCrmPurchacse(CrmPurchacse crmPurchacse){
		crmPurchacseService.save(crmPurchacse);
		return "redirect:/manage/crmpurchacse.html";
	}
	
	//删除
	@RequestMapping(value="/del/{id}")
	public String deleteCrmPurchacse(@PathVariable("id")int id){
		 
		crmPurchacseService.del(id);
		return "redirect:/manage/crmpurchacse.html";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updateCrmPurchacse(CrmPurchacse crmPurchacse){
		crmPurchacseService.edit(crmPurchacse);
			return "redirect:/manage/crmpurchacse.html";
	}
	@RequestMapping(value="/{id}")
	public String viewCrmPurchacse(@PathVariable("id")int id)
	{
		CrmPurchacse crmPurchacse=crmPurchacseService.get(id);
		getRequest().setAttribute("crmPurchacse",crmPurchacse);
		
		List<CrmUser> crmUserList = crmUserService.getList();
		getRequest().setAttribute("crmUserList", crmUserList);
		
		List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
		getRequest().setAttribute("crmSupplierList", crmSupplierList);
		
		return "/WEB-INF/crmpurchacse/crmpurchacse_detail";
	}	
	
	/*
	 * create by: CZP
	 * description:生成采购订单
	 * create time: 9:52 2018/11/28
	 * @Param: null
	 * @return
	 */
	@RequestMapping(value = "/create_order")
	public String createOrder(@RequestParam("ids") int[] ids){
		if(ids.length<=0){
			return null;
		}
		List<CrmSupplierPrice> list=new ArrayList<>();
		for(int i=0;i<ids.length;i++){
			CrmSupplierPrice crmSupplierPrice = crmSupplierPriceService.get(ids[i]);
			list.add(crmSupplierPrice);
		}
		getRequest().setAttribute("list",list);
		return "/WEB-INF/crmpurchacse/crmpurchacse_order";
	}
	
	/*
	 * create by: CZP
	 * description:处理采购订单
	 * create time: 9:55 2018/11/28
	 * @return 
	 */
	@RequestMapping(value = "/do_order",method = RequestMethod.POST)
	@ResponseBody
	public boolean doOrder(@RequestParam(value = "ids")int[] ids,@RequestParam(value = "nums")int[] nums,
		@RequestParam(value = "notes",required = false)String[] notes,@RequestParam(value = "title")String title,
						   @RequestParam(value = "number")String number,@RequestParam(value = "address")String address){
		if(ids.length<=0 || nums.length<=0 || StringUtils.isEmpty(title) || StringUtils.isEmpty(number)){
			return false;
		}

		return crmPurchacseService.saveOrder(ids,nums,notes,title,number,address);
	}
	
	/*
	 * create by: CZP
	 * description:跳转采购明细
	 * create time: 10:18 2018/12/11
	 * @return 
	 */
	// 新增明细
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addTwo(HttpServletRequest request, HttpServletResponse response) {

		List<CrmUser> crmUserList = crmUserService.getList();
		getRequest().setAttribute("crmUserList", crmUserList);

		List<CrmName> crmNameList = crmNameService.getList();
		getRequest().setAttribute("crmNameList", crmNameList);

		List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
		getRequest().setAttribute("crmSupplierList", crmSupplierList);

		// 判断cookie有没有值,没有则生成number
		String number = "";
		Cookie[] cookies = request.getCookies();
		if (null!=cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("pid".equals(cookie.getName())) {
					number = cookie.getValue();
				}
			}
		}
		if ("".equals(number)) {
			// 生成number
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
			Date now = new Date();
			int random = (int) (Math.random() * 10000 + 1);
			number = sdf.format(now) + random;

			// 生成cookie
			Cookie cookie = new Cookie("pid", number.trim());
			cookie.setMaxAge(30 * 60);
			cookie.setPath("/");
			response.addCookie(cookie);
		}

		getRequest().setAttribute("number", number);

		return "/WEB-INF/crmpurchacseitem/crmpurchacseitem_addtwo";
	}

	/*
	 * create by: CZP
	 * description:查看明细
	 * create time: 11:54 2018/12/13
	 * @return
	 */
	@RequestMapping(value = "/showitem")
	public String showItem(String number){
		return "redirect:/manage/crmpurchacseitem.html?number="+number;
	}




}