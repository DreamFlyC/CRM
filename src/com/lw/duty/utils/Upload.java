/**
 * 
 */
package com.lw.duty.utils;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author CZP
 *
 * 2018年7月6日
 */
public class Upload {
	public @ResponseBody String upload(HttpServletRequest request, MultipartFile file) throws Exception {
			SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddhhmm");
			Date now = new Date();
			int random = (int) (Math.random() * 10000 + 1);
			String number = sdf.format(now) + random;
		   //如果文件不为空，写入上传路径
	       if(!file.isEmpty()) {
	           //上传文件路径
	           String path = request.getServletContext().getRealPath("/WEB-INF/upload");
	          // String path="D:\\JAVAA65\\traceability\\WebContent\\WEB-INF\\upload";
	           //上传文件名
	           String filename = number+"_"+file.getOriginalFilename();
	           String appendix=path + File.separator + filename; //文件的路径
	           System.out.println(appendix);
	           File filepath = new File(path,filename);
	           //判断路径是否存在，如果不存在就创建一个
	           if (!filepath.getParentFile().exists()) { 
	              if(filepath.getParentFile().mkdirs()){
					  file.transferTo(new File(path + File.separator + filename));
				  }
	           }
	          return filename;
		       } else {
		           return "";
		       }
	}

}
