package com.lw.wxkf.action;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.wxkf.entity.Wxkf;
import com.lw.wxkf.service.IWxkfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 
 * @author WH
 * @Date 2018年11月2日 下午1:07:05
 */
@Controller("WxkfAction")
@RequestMapping(value="/manage/wxkf")
public class WxkfAction extends BaseAction {
	@Autowired
	private IWxkfService WxkfService ;
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<Wxkf> list=WxkfService.getList();
		int total=WxkfService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/wxkf/wxkf_list";
	}

    @RequestMapping(value="/post",method=RequestMethod.GET)
	public String addKitchenCar(){
		return "/WEB-INF/wxkf/wxkf_add";
	}
	//增加
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addKitchenCar(Wxkf wxkf){
		WxkfService.save(wxkf);
		return "redirect:/manage/wxkf.html";
	}
	//删除
	@RequestMapping(value="/del/{id}")
	public String deleteKitchenCar(@PathVariable("id")int id,HttpServletResponse response){
		WxkfService.del(id);
		return "redirect:/manage/wxkf.html";
	}
	//修改
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updateKitchenCar(com.lw.wxkf.entity.Wxkf wxkf){
		WxkfService.edit(wxkf);
		return "redirect:/manage/wxkf.html";
	}
	@RequestMapping(value="/{id}")
	public String viewKitchenCar(@PathVariable("id")int id)
	{
		com.lw.wxkf.entity.Wxkf wxkf=WxkfService.get(id);
		getRequest().setAttribute("wxkf", wxkf);
		return "/WEB-INF/wxkf/wxkf_detail";
	}
}
