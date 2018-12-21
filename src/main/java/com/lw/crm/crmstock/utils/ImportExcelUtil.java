/**
 * 
 */
package com.lw.crm.crmstock.utils;

import com.lw.crm.crmstock.entity.CrmStock;
import jxl.Cell;
import jxl.Range;
import jxl.Sheet;
import jxl.Workbook;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年11月14日 下午2:35:11
 */
public class ImportExcelUtil {
	
	
	 public static Map<String, Object> importExcel(File file) {
	        Workbook book = null;
	        String title = null;
	        List<CrmStock> list=new ArrayList<CrmStock>();
	        try {
	            book = Workbook.getWorkbook(file);
	            // 获得第一个工作表对象
	            Sheet sheet = book.getSheet(0);
	            int rows=sheet.getRows();
	            int columns=sheet.getColumns();
	            //返回sheet中合并的单元格
	            int endRow=0;
	            int endColumn=0;
	            Range[] rangecells=sheet.getMergedCells();
	            for (Range range : rangecells) {
					 Cell cellBottom=range.getBottomRight();//获取某个合并的单元格的右下角的单元格
					 endRow=cellBottom.getRow()+1;//获取右下角单元格所在行
					 endColumn=cellBottom.getColumn()+1;//获取右下角单元格所在列 
				}
	            if(endRow>0) {
		            System.out.println("========");
		            // 得到第一列第一行的单元格
		            Cell cell1 = sheet.getCell(0, 0);
		            title = cell1.getContents();
		            System.out.println(title);
		            System.out.println("========");
	            } 
	            //遍历表头的单元格的数据
	         //   String titleArr[]= new String[columns];
	            
	            for(int j=0;j<columns;j++) {
	            	Cell cellTitle=sheet.getCell(j,endRow);
	            	String titleCloumn=cellTitle.getContents();
	            	//titleArr[j]=titleCloumn;
	            }
	            // 遍历每行每列的单元格（不包括表头--title）
	            System.err.println("rows:"+rows);
	            
	            for(int i=endRow+1;i<rows;i++){
	            	CrmStock obj=new CrmStock();
	                for(int j=0;j<columns;j++){
	                    Cell cell = sheet.getCell(j, i);
	                    String result = cell.getContents();
	                    switch (j) {
						case 0:
							obj.setSeq(Integer.parseInt(result));
							break;
						case 1:
							obj.setSnumber(result);
							break;
						case 2:
							obj.setTitle(result);
							break;
						case 3:
							obj.setUnit(result);
							break;
						case 4:
							obj.setPrice(Double.parseDouble(result));
							break;
						default:
							break;
						}
	                    if((j+1)%4==0){ 
	                        System.out.println();
	                    }
	                }
	                list.add(obj);
	            }
	        } catch (Exception e) {
	            System.out.println(e);
	        }finally{
	            if(book!=null){
	                book.close();
	            }
	        }
	        
	        Map<String,Object> map=new HashMap<String,Object>();
	        map.put("list",list);
	        map.put("title", title);
			return map;
	    }

}
