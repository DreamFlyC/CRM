/**
 * 
 */
package com.lw.crm.crmuserscertificate.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmuserscertificate.entity.CrmUserScertificate;
import com.lw.crm.crmuserscertificate.service.ICrmUserScertificateService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("CrmUserScertificateAction")
@RequestMapping(value="/manage/crmuserscertificate")
public class CrmUserScertificateAction extends BaseAction{
	@Autowired
	private ICrmUserScertificateService crmUserScertificateService;
	
	/**
	 * 
	 * @Desc 信息列表
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:43:25
	 */
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<CrmUserScertificate> list=crmUserScertificateService.getList();
		int total=crmUserScertificateService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/crmuserscertificate/crmuserscertificate_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addcrmuserscertificate(){
		
		return "/WEB-INF/crmuserscertificate/crmuserscertificate_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param crmUserScertificate
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute CrmUserScertificate crmUserScertificate) throws Exception{
		crmUserScertificateService.save(crmUserScertificate);
		return "redirect:/manage/crmuserscertificate.html";
	}
	
	/**
	 * 
	 * @Desc 删除信息
	 * @param id
	 * @param response
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:09
	 */
	@RequestMapping(value="/del/{id}")
	public String deletecrmuserscertificate(@PathVariable("id")int id,HttpServletResponse response){
		crmUserScertificateService.del(id);
		return "redirect:/manage/crmuserscertificate.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param crmUserScertificate
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatecrmuserscertificate(CrmUserScertificate crmUserScertificate)throws Exception{
		crmUserScertificateService.edit(crmUserScertificate);
		return "redirect:/manage/crmuserscertificate.html";
	}
	
	/**
	 * 
	 * @Desc 编辑前根据id获取信息
	 * @param id
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:43:43
	 */
	@RequestMapping(value="/{id}")
	public String viewcrmuserscertificate(@PathVariable("id")int id)
	{
		CrmUserScertificate crmUserScertificate=crmUserScertificateService.get(id);
		getRequest().setAttribute("crmUserScertificate",crmUserScertificate);
		return "/WEB-INF/crmuserscertificate/crmuserscertificate_detail";
	}
}
