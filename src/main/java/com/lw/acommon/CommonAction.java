/**
 * 
 */
package com.lw.acommon;

import com.lw.acommon.util.JsonMsgStatusEntity;
import com.swetake.util.Qrcode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午8:53:20
 */
@Controller("CommonAction")
public class CommonAction {

	private static int type=0;
	
	@RequestMapping(value="/ablums")
	public String view() {
		return "/ablums";
	}
	
	/**
	 * 生成二维码
	 * @return
	 * @author CZP
	 * @throws IOException 
	 */
	@RequestMapping(value="/createloginqrcode")
	//public static void main(String[] args) throws IOException{
		public void createLoginQRCode(HttpServletResponse response) throws IOException{
		
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		//计算二维码图片的高宽比
        // API文档规定计算图片宽高的方式 ，v是本次测试的版本号
		int v=6;
		int width=67+12*(v-1);
		int height=67+12*(v-1);
		
		Qrcode x=new Qrcode();
		 /**
         * 纠错等级分为
         * level L : 最大 7% 的错误能够被纠正；
         * level M : 最大 15% 的错误能够被纠正；
         * level Q : 最大 25% 的错误能够被纠正；
         * level H : 最大 30% 的错误能够被纠正；
         */
		x.setQrcodeErrorCorrect('L');
		//注意版本信息 N代表数字 、A代表 a-z,A-Z、B代表 其他)
		x.setQrcodeEncodeMode('B');
        //版本号  1-40
		x.setQrcodeVersion(v);

		//内容信息
		String qrData="http://192.168.1.144:8848/Introduction_of_dishes/access_login.html";

		//汉字转格式抛出异常
		byte[] d=qrData.getBytes("utf-8");
		
		//缓冲区
		BufferedImage bufferedImage=new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
		
		//绘图
		Graphics2D qs=bufferedImage.createGraphics();
		
		qs.setBackground(Color.WHITE);
		qs.setColor(Color.BLACK);
		qs.clearRect(0, 0, width, height);
		
		//偏移量
		int pixoff=2;
		/*
         * 容易踩坑的地方
         * 1.注意for循环里面的i，j的顺序，
         *   s[j][i]二维数组的j，i的顺序要与这个方法中的 gs.fillRect(j*3+pixoff,i*3+pixoff, 3, 3);
         *   顺序匹配，否则会出现解析图片是一串数字
         * 2.注意此判断if (d.length > 0 && d.length < 120)
         *   是否会引起字符串长度大于120导致生成代码不执行，二维码空白
         *   根据自己的字符串大小来设置此配置
         */
        if (d.length > 0 && d.length < 120) {
            boolean[][] s = x.calQrcode(d);

            for (int i = 0; i < s.length; i++) {
                for (int j = 0; j < s.length; j++) {
                    if (s[j][i]) {
                        qs.fillRect(j * 3 + pixoff, i * 3 + pixoff, 3, 3);
                    }
                }
            }
        }
        qs.dispose();
        bufferedImage.flush();
        //设置图片格式，与输出的路径
        ImageIO.write(bufferedImage, "png",  new File("D:\\java\\Introduction_of_dishes\\img\\login\\loginqrcode.png"));
        System.err.println("二维码生成完毕！");
	}
	
	@RequestMapping(value="dologin")
	@ResponseBody
	public void doLogin(HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Origin", "*");
		System.err.println("登录成功！");
	}
	
	@RequestMapping(value="login_success")
	@ResponseBody
	public JsonMsgStatusEntity loginSuccess(HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Origin", "*");
		if(type==1) {
			type=0;
			return new JsonMsgStatusEntity(true,"success",type);
		}else {
			type=0;
			return new JsonMsgStatusEntity(false,"fail",type);
		}
	}
	
}
