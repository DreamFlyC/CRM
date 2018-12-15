package com.lw.crm.crmproduct.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.common.util.ContextUtil;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmbuyinfo.service.ICrmBuyInfoService;
import com.lw.crm.crmname.entity.CrmName;
import com.lw.crm.crmname.service.ICrmNameService;
import com.lw.crm.crmproduct.entity.CrmProduct;
import com.lw.crm.crmproduct.service.ICrmProductService;
import com.lw.crm.crmstock.service.ICrmStockService;
import com.lw.weixin.users.entity.Users;

@Controller("CrmProductAction")
@RequestMapping(value = "/manage/crmproduct")
@SuppressWarnings("all")
public class CrmProductAction extends BaseAction {
	@Autowired
	private ICrmProductService crmProductService;	
	@Autowired
	private ICrmStockService crmStockService;
	@Autowired
	private ICrmBuyInfoService crmBuyInfoService;
	
	@Autowired
	private ICrmNameService crmNameService;
	
	
	//信息列表
			@RequestMapping("/crmproduct_list")
			public String list(){
				instantPage(20);
				List<CrmProduct> list=crmProductService.getList();
				int total=crmProductService.getCount();
				Pager pager=new Pager(super.getPage(),super.getRows(),total);
				pager.setDatas(list);
				getRequest().setAttribute("pager",pager);
				return  "/WEB-INF/crmproduct/crmproduct_list";
			}
			
			@RequestMapping(value="/post",method=RequestMethod.GET)
			public String addcrmproduct(){
				List<CrmName> crmNameList = crmNameService.getList();
				getRequest().setAttribute("crmNameList", crmNameList);
				return "/WEB-INF/crmproduct/crmproduct_add";
			}
			
			//新增信息
			/*@RequestMapping(value="/post",method=RequestMethod.POST)
			public String Save(CrmProduct obj, CrmStock obj2, CrmBuyInfo obj3, String stocknum) {
				
				Users user=ContextUtil.getContextLoginUser();//登录账号的信息
				if(null!=String.valueOf(user.getId())) {
				obj.setUid(user.getId());
				}
				crmProductService.save(obj);
				obj2.setPid(obj.getId());
				obj2.setUid(user.getId());
				obj2.setStocknum(stocknum);
				crmStockService.save(obj2);
				obj3.setPid(obj.getId());
				obj3.setUid(user.getId());
				crmBuyInfoService.save(obj3);
				return "redirect:crmproduct_list";
			}*/
			
			@RequestMapping(value="/post",method=RequestMethod.POST)
			public String Save(CrmProduct obj) {
				
				Users user=ContextUtil.getContextLoginUser();//登录账号的信息
				if(null!=String.valueOf(user.getId())) {
					obj.setUid(user.getId());
				}
				crmProductService.save(obj);
			
				return "redirect:crmproduct_list";
			}
			
			//删除信息
			@RequestMapping(value="/del/{id}")
			public String deletecrmproduct(@PathVariable("id")int id,HttpServletResponse response){
				crmProductService.del(id);
				return "redirect:../crmproduct_list";
			}
			
			//修改信息
			@RequestMapping(value="/edit",method=RequestMethod.POST)
			public String updatecrmproduct(CrmProduct crmProduct,HttpServletResponse response){
				crmProductService.edit(crmProduct);
				return "redirect:crmproduct_list";
			}
			
			//编辑前根据id获取信息
			@RequestMapping(value="/{id}")
			public String viewcrmproduct(@PathVariable("id")int id)
			{
				CrmProduct crmProduct=crmProductService.get(id);
				getRequest().setAttribute("crmProduct",crmProduct);
				
				List<CrmName> crmNameList = crmNameService.getList();
				getRequest().setAttribute("crmNameList", crmNameList);
				return "/WEB-INF/crmproduct/crmproduct_detail";
			}


}
