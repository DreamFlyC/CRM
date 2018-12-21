package com.lw.crm.crmstock.utils;

import com.lw.crm.crmstock.entity.CrmStock;
import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/*
 * create by: CZP
 * description:
 * create time: 17:35 2018/11/20
 * @Param: null
 * @return 
 */
public class ExportExcelUtil {
    private static Logger logger=Logger.getLogger(ExportExcelUtil.class);

    public static void exportExcel(HttpServletResponse response, List<CrmStock> list, String sheetName,
                                   String fileName){
        // 创建工作表
        WritableWorkbook book = null;
        response.reset();
        // 设置字符集
        response.setCharacterEncoding("UTF-8");
        // 创建工作流
        OutputStream os = null;
        try {
            // 点击导出excel按钮时候页面显示的默认名称
            fileName = new String(fileName.getBytes(),"ISO-8859-1");
            response.setCharacterEncoding("gb2312");
            response.reset();
            response.setContentType("application/OCTET-STREAM;charset=gb2312");
            response.setHeader("pragma", "no-cache");
            response.addHeader("Content-Disposition", "attachment;filename=\""
                    + fileName + ".xls\"");
            os = response.getOutputStream();

            // 初始化工作表
            book = Workbook.createWorkbook(os);

        } catch (IOException e1) {
            logger.error("导出excel出现IO异常", e1);
        }
        try {

            // 以下为excel表格内容
            WritableSheet sheet = book.createSheet(sheetName, 0);
            // 表字段名
            sheet.addCell(new jxl.write.Label(0, 0, "序号"));
            sheet.addCell(new jxl.write.Label(1, 0, "ID"));
            sheet.addCell(new jxl.write.Label(2, 0, "商品编号"));
            sheet.addCell(new jxl.write.Label(3, 0, "商品名称"));
            sheet.addCell(new jxl.write.Label(4, 0, "商品价格"));
            sheet.addCell(new jxl.write.Label(5, 0, "商品总量"));
            sheet.addCell(new jxl.write.Label(6, 0, "供应商名称"));
            sheet.addCell(new jxl.write.Label(7, 0, "供应商商品编号"));
            sheet.addCell(new jxl.write.Label(8, 0, "发布人"));
            sheet.addCell(new jxl.write.Label(9, 0, "PID"));
            sheet.addCell(new jxl.write.Label(10, 0, "类型"));
            sheet.addCell(new jxl.write.Label(11, 0, "单位"));
            sheet.addCell(new jxl.write.Label(12, 0, "发布时间"));
            // 将数据追加
            for (int i = 1; i < list.size() + 1; i++) {
                // 序号从1开始
                sheet.addCell(new jxl.write.Label(0, i, String.valueOf(i)));
                sheet.addCell(new jxl.write.Label(1, i, String.valueOf(list.get(i - 1).getId())));
                sheet.addCell(new jxl.write.Label(2, i, list.get(i - 1).getNumber()));
                sheet.addCell(new jxl.write.Label(3, i, list.get(i - 1).getTitle()));
                sheet.addCell(new jxl.write.Label(4, i, String.valueOf(list.get(i - 1).getPrice())));
                sheet.addCell(new jxl.write.Label(5, i, list.get(i - 1).getStocknum()));
                sheet.addCell(new jxl.write.Label(6, i, list.get(i - 1).getCrmSupplier().getSupplier()));
                sheet.addCell(new jxl.write.Label(7, i, list.get(i - 1).getSnumber()));
                sheet.addCell(new jxl.write.Label(8, i, String.valueOf(list.get(i - 1).getUid())));
                sheet.addCell(new jxl.write.Label(9, i, String.valueOf(list.get(i - 1).getPid())));
                sheet.addCell(new jxl.write.Label(10, i,String.valueOf(list.get(i - 1).getType())));
                sheet.addCell(new jxl.write.Label(11, i, list.get(i - 1).getUnit()));
                // 设置日期格式
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date appDate = (Date) list.get(i - 1).getDate();
                String appDateStr = sf.format(appDate);


                // 日期
                sheet.addCell(new jxl.write.Label(12, i, appDateStr));
            }
            book.write();
            book.close();
        } catch (Exception e) {
            logger.error("导出excel出现异常", e);
        } finally {
            if (null != os) {
                try {
                    os.close();
                } catch (IOException e) {
                    logger.error("关流出现异常", e);
                    e.printStackTrace();
                }
            }
        }
    }
}
