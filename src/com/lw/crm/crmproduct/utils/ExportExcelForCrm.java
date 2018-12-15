package com.lw.crm.crmproduct.utils;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.lw.crm.crmproduct.entity.CrmProduct;


public class ExportExcelForCrm {
	
	public void ExportWithResponse(String sheetName, String[] columnName, List<CrmProduct> dataList,
			HttpServletResponse response) throws Exception {
		// 第一步，创建一个webbook，对应一个Excel文件
		@SuppressWarnings("resource")
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet(sheetName);
		sheet.setDefaultColumnWidth(15); // 统一设置列宽
		// 第三步，创建第1行 也就是表头
		HSSFRow row = sheet.createRow((int) 0); // 创建第1行 也就是表头

		// 第四步，创建表头的列
		for (int i = 0; i < columnName.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(columnName[i]);
		}
		HSSFCellStyle zidonghuanhang = wb.createCellStyle();
		zidonghuanhang.setWrapText(true);// 设置自动换行
		zidonghuanhang.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 创建一个上下居中格式
		zidonghuanhang.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中

		// 第五步，创建单元格，并设置值
		//时间格式化
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
		
		for (int i = 0; i < dataList.size(); i++) {
			row = sheet.createRow((int) i + 1);
			HSSFCell datacell = null;
			//id
			datacell = row.createCell(0);
			datacell.setCellValue(dataList.get(i).getId());
            
			//产品编号
			datacell = row.createCell(1);
			datacell.setCellValue(dataList.get(i).getNumber());

			//产品名称
			datacell = row.createCell(2);
			datacell.setCellValue(dataList.get(i).getTitle());

			//产品价格
			datacell = row.createCell(3);
			datacell.setCellValue(dataList.get(i).getPrice());
			
			//产品类型
			datacell = row.createCell(4);
			datacell.setCellValue(dataList.get(i).getType() + "");
			
			//日期
			datacell = row.createCell(5);
			datacell.setCellValue(sdf.format(dataList.get(i).getDate()) + "");
			datacell.setCellStyle(zidonghuanhang);
			
			//uid
			datacell = row.createCell(6);
			datacell.setCellValue(dataList.get(i).getUid() + "");

		}

		// 第六步，将文件存到浏览器设置的下载位置
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("数据表yyyyMMddHHmmss");
		String filename = df.format(day) + ".xls";
		response.setContentType("application/ms-excel;charset=UTF-8");
		response.setHeader("Content-Disposition",
				"attachment;filename=".concat(String.valueOf(URLEncoder.encode(filename, "UTF-8"))));
		OutputStream out = response.getOutputStream();
		try {
			wb.write(out);// 将数据写出去
			String str = "导出成功！";
			System.out.println(str);
		} catch (Exception e) {
			e.printStackTrace();
			String str1 = "导出失败！";
			System.out.println(str1);
		} finally {
			out.close();
		}
	}
}