/**
 * 
 */
package com.lw.duty.utils;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月18日 下午2:25:16
 */
public class NumberConvertNameUtils{
	//数字转换为部门
	public static String NumberCovertGroup(String number) {
		//1.管理员 2.技术部 3.运营部 4.拓展部 5.财务部 6.总经办 7.供应链
		//8.品牌部 9.战略部 10.公共事业部 11.人力资源部
		String group="";
		for(int i=0;i<number.split(",").length;i++) {
			switch (Integer.parseInt(number.split(",")[i])) {
			case 1:
				group="管理员";
				break;
			case 2:
				group="技术部 ";
				break;
			case 3:
				group="运营部";
				break;
			case 4:
				group="拓展部";
				break;
			case 5:
				group="财务部";
				break;
			case 6:
				group="总经办";
				break;
			case 7:
				group="供应链";
				break;
			case 8:
				group="品牌部";
				break;
			case 9:
				group="战略部";
				break;
			case 10:
				group="公共事业部";
				break;
			case 11:
				group="人力资源部";
				break;	
			default:
				break;
			}
		}
		return group;
	}
	
	//工单类型 1.普通 2.紧急
	public static String NumberCovertLevel(int number) {
		String level="";
		switch (number) {
		case 1:
			level="普通";
			break;
		case 2:
			level="紧急";
			break;
		default:
			break;
		}
		return level;
	}
	
	//工单状态 1.已完成 2.进行中 3.未接受
	public static String NumberCovertDkey(int number) {
		String Dkey="";
		switch (number) {
		case 1:
			Dkey="已完成";
			break;
		case 2:
			Dkey="进行中";
			break;
		case 3:
			Dkey="未接受";
			break;
		default:
			break;
		}
		return Dkey;
	}
}
