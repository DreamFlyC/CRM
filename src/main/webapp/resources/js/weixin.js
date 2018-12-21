var LW=new Object();

/**************地址栏 begin**************************/
LW.location=new Object();
LW.location.checkLocation=function(){if(window.location.href==window.parent.location.href){window.location.href="";}}
LW.location.forward=function(url){window.location.href=url;}
LW.location.reload=function(){window.location.reload();}

/**************地址栏 end**************************/

/**************消息提示 begin**************************/
LW.message=new Object();
LW.message.show=function(content)
{
	var dialog="<div class='modal fade' id='alertDialog' tabindex='-1' role='dialog' aria-labelledby='alertDialogModalLabel' aria-hidden='true'>";
	dialog+="<div class='modal-dialog modal-sm'><div class='modal-content'><div class='modal-header'>";
	dialog+="<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>";
	dialog+="<h4 class='modal-title' id='alertDialogModalLabel'>提示</h4></div>";
	dialog+="<div class='modal-body'>"+content+"</div>";
	dialog+="<div class='modal-footer'>";
	dialog+="<button type='button' class='btn btn-info' data-dismiss='modal' id='alertDialogOK'>确定</button>";
	dialog+="</div></div></div></div>";
	$(dialog).appendTo(document.body);
	$("#alertDialog").modal('show');
	$("#alertDialog").on('hide.bs.modal',function (){$("#alertDialog").remove();});
}
LW.lottery=new Object();

LW.message.confirm=function(dialogId,content,fn)
{
	var dialog="<div class='modal fade' id='"+dialogId+"' tabindex='-1' role='dialog' aria-labelledby='"+dialogId+"ModalLabel' aria-hidden='true'>";
	dialog+="<div class='modal-dialog modal-sm'><div class='modal-content'><div class='modal-header'>";
	dialog+="<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>";
	dialog+="<h4 class='modal-title' id='"+dialogId+"ModalLabel'>提示</h4></div>";
	dialog+="<div class='modal-body'style='text-align:center;' >"+content+"</div>";
	dialog+="<div class='modal-footer'>";
	dialog+="<button type='button' class='btn btn-default' data-dismiss='modal'>关闭</button>";
	dialog+="<button type='button' class='btn btn-info' id='"+dialogId+"OK'>确定</button>";
	dialog+="</div></div></div></div>";
	$(dialog).appendTo(document.body);
	$("#"+dialogId).modal('show');
	$("#"+dialogId).on('hide.bs.modal',function (){$("#"+dialogId).remove();if(fn){fn(false);return false;}});
	$("#"+dialogId+"OK").bind("click",function(){$("#"+dialogId).remove();if(fn){fn(true);return false;}});
}

/**************消息提示 end**************************/


/**************工具 begin******************/
LW.util=new Object();
LW.util.formatDate=function(longtime){var a=longtime.split(" ");var d=a[0].split("-");var t=a[1].split(":");var date = new Date(d[0],(d[1]-1),d[2],t[0],t[1],t[2]);return date;}
LW.util.formatLongToDate=function(longtime){if(longtime==null){return null;}var dd=new Date(LW.util.formatDate(longtime));return dd.getFullYear()+"-"+(dd.getMonth()+1)+"-"+dd.getDate()+" "+dd.getHours()+":"+dd.getMinutes()+":"+dd.getSeconds();}
LW.util.formatShortToDate=function(longtime){if(longtime==null){return null;}var dd=new Date(LW.util.formatDate(longtime));return dd.getFullYear()+"-"+(dd.getMonth()+1)+"-"+dd.getDate();}
LW.util.serilazibleId=function(){return (new Date()).getTime()+1;}
LW.util.textEmpty=function(data){return (data==null||data=="")?"''":data;}
LW.util.createDialogWin=function(title,width,height,url){var window=$("<div id='ibswindow' iconCls='icon-edit' closable='true'  collapsible='false' minimizable='false' maximizable='false'></div>").insertAfter(document.body);$("#ibswindow").window({title:title,cache:false,shadow:true,mask:true,height:height,width:width,modal:true,inline:true,href:url});}
LW.util.createYesNoImg=function(clickEvent,flag){var res=flag?"resources/images/yes.png":"resources/images/no.png";var view="<img style='cursor:pointer' onclick="+clickEvent+" src='"+res+"' width='15' height='20' />";return view;}
LW.util.createEditImg=function(clickEvent){var view="<img style='cursor:pointer' title='编辑' onclick="+clickEvent+" src='resources/images/edit.png' width='15' height='20' />";return view;}
LW.util.createLoading=function(){var loading="<div id='applicationLoading' align='center'><img src='resources/images/loading.gif'/> 正在加载 ...</div>";return loading;}
LW.util.createSimpleEditor=function(name){KindEditor.ready(function(K){K.create("#"+name,{uploadJson:"manage/file/upload/img",resizeType : 1,allowPreviewEmoticons : true,allowImageUpload : true,items : ['preview','source','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline','removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist','insertunorderedlist','link', '|', 'emoticons','image','baidumap','table'],autoHeightMode:true,afterBlur:function(){this.sync();}});});}
LW.util.checkImage=function(file){if(/.(gif|jpg|jpeg|png|JPG|PNG|GIF)$/.test(file)){return true;}return false;}
LW.util.uploadImg=function(obj){
	var id=$(obj).attr("id");var f=document.getElementById(id).value;
	if(!LW.util.checkImage(f)){LW.message.show("亲,您上传的文件非图片类型哦!");return;}
	$.ajaxFileUpload({url:"manage/file/upload/general.html",fileElementId:id,dataType:"json",async:false,success:function (data,status){$("#titlePicImg").attr("src",picServer+data.url);$("#titlePicPath").val(data.url);},error:function (data, status, e) {LW.message.show("上传失败了,请稍后再试!");}});
}
LW.util.uploadImgWC=function(obj){
	var id=$(obj).attr("id");var f=document.getElementById(id).value;
	if(!LW.util.checkImage(f)){LW.message.show("亲,您上传的文件非图片类型哦!");return;}
	$.ajaxFileUpload({url:"manage/file/upload/wcgeneral.html",fileElementId:id,dataType:"json",async:false,success:function (data,status){$("#titlePicImg").attr("src",picServer+data.url);$("#titlePicPath").val(data.url);},error:function (data, status, e) {LW.message.show("上传失败了,请稍后再试!");}});
}
/***************工具 end********************/


/**************表单 begin**************************/
LW.form=new Object();
LW.form.validate=function(formId){$.Tipmsg.r=null;$("#"+formId).Validform({tiptype:function(msg){LW.message.show(msg);},tipSweep:true});}
LW.form.reset=function(formId){document.getElementById(formId).reset();}
/**************表单 end**************************/
LW.miniprogrammemberinfo=new Object();
LW.miniprogrammemberinfo.del=function(id)
{
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("miniprogram/memberinfo/del/"+id+".html");}});
}

LW.livevideolist=new Object();
LW.livevideolist.del=function(id)
{
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("list/del/"+id+".html");}});
}

LW.livevideoaccount=new Object();
LW.livevideoaccount.del=function(id)
{
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("account/del/"+id+".html");}});
}

LW.mapgpsinfo=new Object();
LW.mapgpsinfo.del=function(id)
{
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("mapgpsinfo/del/"+id+".html");}});
}
LW.traceabilitypoint=new Object();
LW.traceabilitypoint.del=function(id)
{
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("traceabilitypoint/del/"+id+".html");}});
}
LW.adpic=new Object();
LW.adpic.del=function(id)
{
	//alert(id);
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("adpic/del/"+id+".html");}});
}

LW.yiminews=new Object();
LW.yiminews.del=function(id)
{
	//alert(id);
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("yiminews/del/"+id+".html");}});
}

LW.dingtalkmsg=new Object();
LW.dingtalkmsg.del=function(id)
{
	//alert(id);
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("dingtalkmsg/del/"+id+".html");}});
}

LW.dingtalkrecord=new Object();
LW.dingtalkrecord.del=function(id)
{
	//alert(id);
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("dingtalkrecord/del/"+id+".html");}});
}

LW.aliyunmonitordsinfo=new Object();
LW.aliyunmonitordsinfo.del=function(id)
{
	//alert(id);
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("aliyunmonitordsinfo/del/"+id+".html");}});
}

LW.aliyunmonitoossinfo=new Object();
LW.aliyunmonitoossinfo.del=function(id)
{
	//alert(id);
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("aliyunmonitoossinfo/del/"+id+".html");}});
}

LW.mobilemsisdninfo=new Object();
LW.mobilemsisdninfo.del=function(id)
{
	//alert(id);
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("mobilemsisdninfo/del/"+id+".html");}});
}


LW.crmuser=new Object();
LW.crmuser.del=function(id)
{
	//alert(id);
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("crmuser/del/"+id+".html");}});
}
LW.crmname=new Object();
LW.crmname.del=function(id)
{
	//alert(id);
	LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("crmname/del/"+id+".html");}});
}

LW.traceabilitytype=new Object();
LW.traceabilitytype.delete=function(id,parent_id)
{
	if(parent_id==0){
		LW.message.confirm("parent_id","顶级节点不可删除！！！",function(r){LW.location.reload()});
	}else{
		LW.message.confirm("id","此操作会删除该节点级以下的所有子节点，要确定吗？",function(r){if(r){LW.location.forward("traceabilitytype/del/"+id+".html");}});
	}
}
