package com.lw.crm.crmstockinoroutlogitem.utils;

import com.lw.crm.crmstockinoroutlogitem.entity.CrmStockInorOutLogItem;
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

/**
 * @ Author     ：CZP.
 * @ Date       ：Created in 12:16 2018/12/7
 * @ Description：进出货明细导出工具类
 * @ Modified By：
 * @Version: 1.0$
 */
public class ExportExcelUtil {
    private static Logger logger = Logger.getLogger(ExportExcelUtil.class);

    public static void exportExcel(HttpServletResponse response, List<CrmStockInorOutLogItem> list, String sheetName,
                                   String fileName) {
        // 创建工作表
        WritableWorkbook book = null;
        response.reset();
        // 设置字符集
        response.setCharacterEncoding("UTF-8");
        // 创建工作流
        OutputStream os = null;
        try {
            // 点击导出excel按钮时候页面显示的默认名称
            fileName = new String(fileName.getBytes(), "ISO-8859-1");
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
            logger.error("初始化IO异常", e1);
        }
        try {

            // 以下为excel表格内容
            WritableSheet sheet = book.createSheet(sheetName, 0);
            // 表字段名
           // 单号	名称	单价	类别	日期	录入人	pid	数量	备注
            sheet.addCell(new jxl.write.Label(0, 0, "序号"));
            sheet.addCell(new jxl.write.Label(1, 0, "ID"));
            sheet.addCell(new jxl.write.Label(2, 0, "单号"));
            sheet.addCell(new jxl.write.Label(3, 0, "名称"));
            sheet.addCell(new jxl.write.Label(4, 0, "单价"));
            sheet.addCell(new jxl.write.Label(5, 0, "类型"));
            sheet.addCell(new jxl.write.Label(6, 0, "录入人"));
            sheet.addCell(new jxl.write.Label(7, 0, "pid"));
            sheet.addCell(new jxl.write.Label(8, 0, "数量"));
            sheet.addCell(new jxl.write.Label(9, 0, "备注"));
            sheet.addCell(new jxl.write.Label(10, 0, "日期"));
            // 将数据追加
            for (int i = 1; i < list.size() + 1; i++) {
                // 序号从1开始
                sheet.addCell(new jxl.write.Label(0, i, String.valueOf(i)));
                sheet.addCell(new jxl.write.Label(1, i, String.valueOf(list.get(i - 1).getId())));
                sheet.addCell(new jxl.write.Label(2, i, list.get(i - 1).getNumber()));
                sheet.addCell(new jxl.write.Label(3, i, list.get(i - 1).getTitle()));
                sheet.addCell(new jxl.write.Label(4, i, String.valueOf(list.get(i - 1).getPrice())));
                sheet.addCell(new jxl.write.Label(5, i, list.get(i - 1).getCrmName().getName()));
                sheet.addCell(new jxl.write.Label(6, i, list.get(i - 1).getUid()));
                sheet.addCell(new jxl.write.Label(7, i, list.get(i - 1).getPid()));
                sheet.addCell(new jxl.write.Label(8, i, String.valueOf(list.get(i - 1).getNum())));
                sheet.addCell(new jxl.write.Label(9, i, String.valueOf(list.get(i - 1).getNote())));
                // 设置日期格式
                if(list.get(i - 1).getDate()!=null){
                    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    Date appDate = (Date) list.get(i - 1).getDate();
                    String appDateStr = sf.format(appDate);
                    // 日期
                    sheet.addCell(new jxl.write.Label(10, i, appDateStr));
                }else {
                    sheet.addCell(new jxl.write.Label(10, i, ""));
                }
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
