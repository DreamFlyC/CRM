<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <% 
	String path = request.getContextPath();     
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> --%>

<style>
	span .aa{
	    position: relative;
	    left: -15px;
	    top: -9px;
	}
</style>
<div class="leftContainer">
	<div class="lefttop"><span class="aa"></span>管理中心</div>
    	<dl class="leftmenu">
		  	<div class="panel-group" id="accordion" style="margin-bottom: 0px;">
				<div class="panel panel-default">
					<div class="panel-heading" style="background-color: #d3e6ef">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" 
							   href="#collapse1" style="font-weight: bold;">
								<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;欢迎页
							</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse">
						<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
							<ul class="menuson">
					        	<li><cite></cite><a href="<%=basePath%>manage/index.html" id="page_index">首页</a><i></i></li>
								<li><cite></cite><a href="<%=basePath%>manage/user/editpwd.html" id="page_editpwd">修改密码</a><i></i></li>
					        </ul> 
						</div>
					</div>
				</div>
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse2" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;小程序用户信息管理
						</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						 <ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>miniprogram/memberinfo.html" id="page_pointsset">小程序用户信息</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse3" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;权限管理
						</a>
					</h4>
				</div>
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						 <ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>shiroaction/model.html" id="page_pointsset">模块管理</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>shiroaction/rolevalue.html" id="page_pointslog">权限管理</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>shiroaction/usersgroup.html" id="page_leveset">角色管理</a><i></i></li>
						</ul>
					</div>
				</div>
			</div>
		
		 	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse4" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;官网新闻管理
						</a>
					</h4>
				</div>
				<div id="collapse4" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						<ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>yiminews.html" id="page_yiminews">官网新闻</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
		
		
		 	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse5" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;视频直播管理
						</a>
					</h4>
				</div>
				<div id="collapse5" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						<ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>livevideo/list.html" id="page_livevideolist">视频直播列表</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>livevideo/account.html" id="page_livevideoaccount">视频监控账户</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
		
		
		 	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse6" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;配送跟踪线路图
						</a>
					</h4>
				</div>
				<div id="collapse6" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						<ul class="menuson">
					    </ul>
					</div>
				</div>
			</div>
		
		
		 	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse7" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;朔源系统
						</a>
					</h4>
				</div>
				<div id="collapse7" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						<ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>traceabilitytype.html" id="page_traceabilitytype">朔源系统类型</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>traceabilitypoint.html" id="page_traceabilitypoint">朔源系统网点</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
		
  		
  		 	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse8" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;CRM系统
						</a>
					</h4>
				</div>
				<div id="collapse8" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						 <ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>manage/crmstock/crmstock_list.html" id="page_crm_list">库存列表</a><i></i></li>
					 		<li><cite></cite><a href="<%=basePath%>manage/crmproduct/crmproduct_list.html" id="page_crmproduct_list">产品列表</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>manage/crmsupplier/crmsupplier_list.html" id="page_crmsupplier_list">供应商列表</a><i></i></li>
						 	<li><cite></cite><a href="<%=basePath%>manage/crmsupplierprice/crmsupplierprice_list.html" id="page_crmsupplierprice_list">供应商商品报价列表</a><i></i></li>
						 	<li><cite></cite><a href="<%=basePath%>manage/crmuser/crmuser_list.html" id="page_crmuser_list">用户列表</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>manage/crmname/crmname_list.html" id="page_crmname_list">分类列表</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>manage/crmstocktype/crmstocktype_list.html" id="page_crmstocktype_list">进出货分类列表</a><i></i></li>
					    	<li><cite></cite><a href="<%=basePath%>manage/crmuserscertificate.html" id="page_crmuserscertificate_list">证件列表</a><i></i></li>
							 <li><cite></cite><a href="<%=basePath%>manage/crmcomplaints/crmcomplaints_list.html" id="page_complaints_list">投诉统计列表</a><i></i></li>

					    </ul>
					</div>
				</div>
			</div>
		
		
	     	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse9" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;进出货记录管理
						</a>
					</h4>
				</div>
				<div id="collapse9" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						   <ul class="menuson">
								<li><cite></cite><a href="<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_list.html" id="page_crmstockinoroutlog_list">进出货记录列表</a><i></i></li>
					  			<li><cite></cite><a href="<%=basePath%>manage/crmstockinoroutlogitem/crmstockinoroutlogitem_list.html" id="page_crmstockinoroutlogitem_list">进出货记录明细</a><i></i></li>
						    </ul>
					</div>
				</div>
			</div>
		
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse21" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;CMS系统
						</a>
					</h4>
				</div>
				<div id="collapse21" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						   <ul class="menuson">
								<li><cite></cite><a href="<%=basePath%>manage/bnarticlealbums.html" id="page_bnarticlealbums_list">相册图片列表</a><i></i></li>
								<li><cite></cite><a href="<%=basePath%>manage/bnarticledownload.html" id="page_bnarticledownload_list">下载列表</a><i></i></li>
								<li><cite></cite><a href="<%=basePath%>manage/bnarticlediggs.html" id="page_bnarticlediggs_list">点赞列表</a><i></i></li>
						   		<li><cite></cite><a href="<%=basePath%>manage/bnattributes.html" id="page_bnattributes_list">属性列表</a><i></i></li>
						    	<li><cite></cite><a href="<%=basePath%>manage/bnusercode.html" id="page_bnusercode_list">用户登录记录管理</a><i></i></li>
								<li><cite></cite><a href="<%=basePath%>manage/bnuserloginlog.html" id="page_bnuserloginlog_list">用户编号管理</a><i></i></li>
						   		<li><cite></cite><a href="<%=basePath%>manage/bnusermessage.html" id="page_bnusermessage_list">用户消息管理</a><i></i></li>
						    	<li><cite></cite><a href="<%=basePath%>manage/bnmanager.html" id="page_bnmanager_list">后台管理</a><i></i></li>
						   		<li><cite></cite><a href="<%=basePath%>manage/bnmanagerlog.html" id="page_bnmanagerlog_list">后台登录记录管理</a><i></i></li>
						    	<li><cite></cite><a href="<%=basePath%>manage/bnfeedback.html" id="page_bnfeedback_list">留言通知管理</a><i></i></li>
						    	<li><cite></cite><a href="<%=basePath%>manage/bndistribution.html" id="page_bndistribution_list">配送分类管理</a><i></i></li>
						    	<li><cite></cite><a href="<%=basePath%>manage/bndownloadattach.html" id="page_bndownloadattach_list">资料文件下载管理</a><i></i></li>
						    	<li><cite></cite><a href="<%=basePath%>manage/bnlink.html" id="page_bnlink_list">链接管理</a><i></i></li>
						   	 	<li><cite></cite><a href="<%=basePath%>manage/bnmanagerrolevalue.html" id="page_bnmanagerrolevalue_list">规则管理</a><i></i></li>
						    
						    </ul>
					</div>
				</div>
			</div>
		  	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse10" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;客户管理
						</a>
					</h4>
				</div>
				<div id="collapse10" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
					  	<ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>manage/crmcompany/crmcompany_list.html" id="page_crmcompany_list">企业信息管理</a><i></i></li>
					    	<li><cite></cite><a href="<%=basePath%>manage/crmcontact/crmcontact_list.html" id="page_crmcontact_list">客户联系人管理</a><i></i></li>
					    	<li><cite></cite><a href="<%=basePath%>manage/crmsercustomer/crmsercustomer_list.html" id="page_crmsercustomer_list">客户回访管理</a><i></i></li>
					    	<li><cite></cite><a href="<%=basePath%>manage/crmbusiness/crmbusiness_list.html" id="page_crmbusiness_list">代理商管理</a><i></i></li>
				    		<li><cite></cite><a href="<%=basePath%>manage/crmleavingmessage/crmleavingmessage_list.html" id="page_crmleavingmessage_list">官网留言管理</a><i></i></li>
				    	</ul>
					</div>
				</div>
			</div>
		
	    
	      	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse12" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;采购系统管理
						</a>
					</h4>
				</div>
				<div id="collapse12" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
					  	<ul class="menuson">
					  		<li><cite></cite><a href="<%=basePath%>manage/crmpurchacse/crmpurchacse_list.html" id="page_crmpurchacse_list">采购信息列表</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>manage/crmpurchacseitem.html" id="page_crmpurchacseitem_list">采购明细信息列表</a><i></i></li>
						</ul>
					</div>
				</div>
			</div>
		
		
		  	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse13" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;收付款管理
						</a>
					</h4>
				</div>
				<div id="collapse13" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
					  	<ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>manage/crmpayment.html" id="page_crmpayment">付款管理</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>manage/crmprice.html" id="page_crmprice">收款单管理</a><i></i></li>
				    	</ul>
					</div>
				</div>
			</div>
		
		
		  	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse14" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;工单系统管理
						</a>
					</h4>
				</div>
				<div id="collapse14" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
					  	 <ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>duty/duty_list.html" id="page_duty_list">工单列表</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>duty/feedback.html" id="page_feedback">投诉统计</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>duty/case.html" id="page_case">受理工单</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse20" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;社区论坛管理
						</a>
					</h4>
				</div>
				<div id="collapse20" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
					  	 <ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>manage/toabbslog/toabbslog_list.html" id="page_toabbslog_list">社区论坛明细列表</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
		
	    
	     	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse15" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;广告图片管理
						</a>
					</h4>
				</div>
				<div id="collapse15" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
					  	 <ul class="menuson">
					  	 	<li><cite></cite><a href="<%=basePath%>manage/adpic.html" id="page_adpic">图片列表</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
		
		
		 	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse16" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;钉钉管理
						</a>
					</h4>
				</div>
				<div id="collapse16" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
					  	 <ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>dingtalkmsg.html" id="page_dingtalkmsg">消息列表</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>dingtalkrecord.html" id="page_dingtalkrecord">考勤列表</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
		
		
		 	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse17" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;预设监控管理
						</a>
					</h4>
				</div>
				<div id="collapse17" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
					  	 <ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>aliyunmonitordsinfo.html" id="page_aliyunmonitordsinfo">Aliyun_Monito_Rdsinfo</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>aliyunmonitoossinfo.html" id="page_aliyunmonitoossinfo">Aliyun_Monito_Ossinfo</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
		
		
		 	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse18" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;物联卡流量管理
						</a>
					</h4>
				</div>
				<div id="collapse18" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
					  	 <ul class="menuson">
				  	 		<li><cite></cite><a href="<%=basePath%>mobilemsisdninfo.html" id="page_mobilemsisdninfo">物联卡流量列表</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
		
		
		 	
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse19" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;软件信息日志管理
						</a>
					</h4>
				</div>
				<div id="collapse19" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
					  	 <ul class="menuson">
					  	 	<li><cite></cite><a href="<%=basePath%>manage/restaurantsoftinfo.html" id="page_restaurantsoftinfo">软件信息日志列表</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse22" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;菜谱分类管理
						</a>
					</h4>
				</div>
				<div id="collapse22" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						<ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>manage/foodinfotype.html" id="page_foodinfotype_list">菜谱分类列表</a><i></i></li>
					   		<li><cite></cite><a href="<%=basePath%>manage/foodsetmealitemtype.html" id="page_foodsetmealitemtype_list">套餐明细分类列表</a><i></i></li>
					   		<li><cite></cite><a href="<%=basePath%>manage/foodsetmealitem.html" id="page_foodsetmealitem_list">套餐明细分类列表</a><i></i></li>
					    
					    </ul>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse23" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;手机账号管理
						</a>
					</h4>
				</div>
				<div id="collapse23" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						<ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>manage/sysmobmsnaccount.html" id="page_sysmobmsnaccount_list">手机账号列表</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse24" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;厨房管理
						</a>
					</h4>
				</div>
				<div id="collapse24" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						<ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>manage/kitcheninfo.html" id="page_kitcheninfo_list">厨房管理</a><i></i></li>
							<li><cite></cite><a href="<%=basePath%>manage/kitchendevice.html" id="page_kitchendevice_list">厨房设备管理</a><i></i></li>

					    </ul>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse25" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;问题调查问题管理
						</a>
					</h4>
				</div>
				<div id="collapse25" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						<ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>manage/qaquestion.html" id="page_qaquestion_list">问题调查问题管理</a><i></i></li>

					    </ul>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d3e6ef">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapse26" style="font-weight: bold;">
							<span class="aa" ><img src="<%=basePath%>resources/images/leftico01.png" /></span>&nbsp;运营商基本信息管理
						</a>
					</h4>
				</div>
				<div id="collapse26" class="panel-collapse collapse">
					<div class="panel-body" style="padding:0px;background-color: #eff8fc;">
						<ul class="menuson">
							<li><cite></cite><a href="<%=basePath%>manage/tpartnerbasicinfo.html" id="page_tpartnerbasicinfo_list">运营商基本信息列表</a><i></i></li>
					    </ul>
					</div>
				</div>
			</div>
       </dl>
       
        <script>
       		$(function(){
       			var localurl=window.location.href;
				var index = localurl .lastIndexOf("\/");  
				localurl  = localurl.substring(index + 1, localurl .length).replace(".html","");
       			$(".leftmenu a").each(function(){
       				var $this=$(this);
       				if($this.attr("id")!=undefined && $this.attr("id")=="page_"+localurl)
       				{
						$("#"+$this.attr("id")).parent().parent().parent().parent().addClass("in");
					}
       			});
       				
       		});
       </script>
</div>