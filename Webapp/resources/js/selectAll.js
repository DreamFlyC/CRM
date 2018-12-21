function selectAll(){   //选择全部
  var all=document.getElementById('all');
  var f =all.checked;
  var box=document.getElementsByName('box');
  for(var i=0;i<box.length;i++){
	  box[i].checked=f;
  }
}
function selectOne(){   //当全选之后，取消选择其中一个，全选框也取消
   var f=true;      
   var box=document.getElementsByName('box');
   var all=document.getElementById('all');
     for(var i=0;i<box.length;i++){
   if(box[i].checked!=f){
	   all.checked=false;
  break;
}
   all.checked=f;
}
}
