package com.lw.crm.crmsupplierprice.utils;

import com.lw.crm.crmsupplierprice.entity.CrmSupplierPrice;
import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
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

    public static void exportExcel(HttpServletResponse response, List<CrmSupplierPrice> list, String sheetName,
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
            sheet.addCell(new jxl.write.Label(1, 0, "商品编码"));
            sheet.addCell(new jxl.write.Label(2, 0, "品名及规格"));
            sheet.addCell(new jxl.write.Label(3, 0, "单位"));
            sheet.addCell(new jxl.write.Label(4, 0, "单价"));
            sheet.addCell(new jxl.write.Label(5, 0, "平台ID"));
            // 将数据追加
            for (int i = 1; i < list.size() + 1; i++) {
                // 序号从1开始
                sheet.addCell(new jxl.write.Label(0, i, String.valueOf(i)));
                sheet.addCell(new jxl.write.Label(1, i, list.get(i - 1).getSnumber()));
                sheet.addCell(new jxl.write.Label(2, i, list.get(i - 1).getName()));
                sheet.addCell(new jxl.write.Label(3, i, list.get(i - 1).getUnit()));
                sheet.addCell(new jxl.write.Label(4, i, String.valueOf(list.get(i - 1).getPrice())));
                sheet.addCell(new jxl.write.Label(5, i, String.valueOf(list.get(i - 1).getId())));
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
