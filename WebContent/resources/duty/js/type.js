var datatypes = [{
	"options" : [ 
        {"id" : 0,"type" : "无"},
        {"id" : 1,"type" : "菜份量"},
		{"id" : 2,"type" : "菜口感"},
		{"id" : 3,"type" : "饭份量"},
		{"id" : 4,"type" : "饭口感"},
		{"id" : 5,"type" : "汤份量"}, 
		{"id" : 6,"type" : "汤品质"}, 
		{"id" : 7,"type" : "有严重异物(如虫子，金属丝等)"},
		{"id" : 8,"type" : "其他问题或建议"}, 
	    {"id" : 9,"type" : "好评" },
	]
}];
$(function () {
	 var tshtml = "";
	 for (var i = 0; i < datatypes[0].options.length; i++) {
		$("#tstype").append("<option value='"+datatypes[0].options[i].id+"'>"+datatypes[0].options[i].type+"</option>"); 
	 }
	$(".tstype").each(function(){
		$(this).html(InitTsType($(this).attr("attr-typeid")));
	});
	
});

function InitTsType(id)
{
    for (var i = 0; i < datatypes[0].options.length; i++) {
        if (datatypes[0].options[i].id == id) {
            return datatypes[0].options[i].type;
        }
    }
}