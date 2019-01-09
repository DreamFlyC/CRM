package com.lw.duty.utils;

import com.lw.duty.entity.Duty;
import org.apache.poi.hssf.usermodel.*;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ExportExcelUtil {
    public static void ExportWithResponse(String sheetName, String[] columnName, List<Duty> dataList,
                                          HttpServletResponse response) throws Exception {
        // 第一步，创建一个webbook，对应一个Excel文件
        @SuppressWarnings("resource")
        HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);
        sheet.setDefaultColumnWidth(15); // 统一设置列宽
        // 第三步，创建第1行 也就是表头
        HSSFRow row = sheet.createRow((int) 0); // 创建第1行 也就是表头

        HSSFCellStyle zidonghuanhang = wb.createCellStyle();
        zidonghuanhang.setWrapText(true);// 设置自动换行
        zidonghuanhang.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 创建一个上下居中格式
        zidonghuanhang.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中

        // 第四步，创建表头的列
        for (int i = 0; i < columnName.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(columnName[i]);
            cell.setCellStyle(zidonghuanhang);
        }
        // 第五步，创建单元格，并设置值
        // 时间格式化
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");

        for (int i = 0; i < dataList.size(); i++) {
            row = sheet.createRow((int) i + 1);
            HSSFCell datacell = null;
            // id
            datacell = row.createCell(0);
            datacell.setCellValue(dataList.get(i).getId());
            datacell.setCellStyle(zidonghuanhang);

            // 工单编号
            datacell = row.createCell(1);
            datacell.setCellValue(dataList.get(i).getNumber());
            datacell.setCellStyle(zidonghuanhang);

            // 工单名称
            datacell = row.createCell(2);
            datacell.setCellValue(dataList.get(i).getTitle());
            datacell.setCellStyle(zidonghuanhang);

            // 类型
            datacell = row.createCell(3);
            datacell.setCellValue(NumberConvertNameUtils.NumberCovertLevel(dataList.get(i).getLevel()));
            datacell.setCellStyle(zidonghuanhang);

            // 执行部门
            datacell = row.createCell(4);
            datacell.setCellValue(NumberConvertNameUtils.NumberCovertGroup(dataList.get(i).getUsersgroupid()));
            datacell.setCellStyle(zidonghuanhang);

            // 执行人
            datacell = row.createCell(5);
            datacell.setCellValue(dataList.get(i).getUser());
            datacell.setCellStyle(zidonghuanhang);

            // 开始日期
            datacell = row.createCell(6);
            if (dataList.get(i).getStartdate() != null) {
                datacell.setCellValue(sdf.format(dataList.get(i).getStartdate()) + "");
                datacell.setCellStyle(zidonghuanhang);
            } else {
                datacell.setCellValue("无");
                datacell.setCellStyle(zidonghuanhang);
            }

            // 结束日期
            datacell = row.createCell(7);
            if (dataList.get(i).getEnddate() != null) {
                datacell.setCellValue(sdf.format(dataList.get(i).getEnddate()) + "");
                datacell.setCellStyle(zidonghuanhang);
            } else {
                datacell.setCellValue("无");
                datacell.setCellStyle(zidonghuanhang);
            }

            //工单进度
            datacell = row.createCell(8);
            if (dataList.get(i).getDutyLog() != null && dataList.get(i).getDutyLog().getProgress() != 0 && dataList.get(i).getDutyLog().getProgress() != null) {
                datacell.setCellValue(dataList.get(i).getDutyLog().getProgress() + "");
                datacell.setCellStyle(zidonghuanhang);
            } else {
                datacell.setCellValue(0 + "%");
                datacell.setCellStyle(zidonghuanhang);
            }

            // 工单描述
            datacell = row.createCell(9);
            if (dataList.get(i).getContent() != null) {
                datacell.setCellValue(dataList.get(i).getContent() + "");
                datacell.setCellStyle(zidonghuanhang);
            } else {
                datacell.setCellValue("无");
                datacell.setCellStyle(zidonghuanhang);
            }

            // 附件
            datacell = row.createCell(10);
            if (dataList.get(i).getAppendix() != null) {
                datacell.setCellValue(dataList.get(i).getAppendix() + "");
                datacell.setCellStyle(zidonghuanhang);
            } else {
                datacell.setCellValue("无");
                datacell.setCellStyle(zidonghuanhang);
            }

            // 工单状态
            datacell = row.createCell(11);
            if (dataList.get(i).getDkey() + "" != null) {
                datacell.setCellValue(NumberConvertNameUtils.NumberCovertDkey(dataList.get(i).getDkey()));
                datacell.setCellStyle(zidonghuanhang);
            }

            // 发起时间
            datacell = row.createCell(12);
            datacell.setCellValue(sdf.format(dataList.get(i).getDate()) + "");
            datacell.setCellStyle(zidonghuanhang);

            // uid
            datacell = row.createCell(13);
            datacell.setCellValue(dataList.get(i).getUid() + "");
            datacell.setCellStyle(zidonghuanhang);
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
