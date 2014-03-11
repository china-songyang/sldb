package com.saturn.app.utils;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class PicBase64 {
	public static void main(String[] args)
    {
        String strImg = GetImageStr("e:\\1.jpg");
        System.out.println(strImg);
        GenerateImage(strImg, "e:\\2.jpg");
    }
    public static String GetImageStr(String imgFilePath)
    {//将图片文件转化为字节数组字符串，并对其进行Base64编码处理
        //String imgFile = "e:\\1.jpg";//待处理的图片
        InputStream in = null;
        byte[] data = null;
        //读取图片字节数组
        try 
        {
            in = new FileInputStream(imgFilePath);    
            if(in!=null){
            	data = new byte[in.available()];
                in.read(data);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        	if(in!=null){
                try {
					in.close();
				} catch (IOException e) {
				}
            }
        }
        //对字节数组Base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(data);//返回Base64编码过的字节数组字符串
    }
    public static boolean GenerateImage(String imgStr, String imgFilePath)
    {//对字节数组字符串进行Base64解码并生成图片
        if (imgStr == null) //图像数据为空
            return false;
        BASE64Decoder decoder = new BASE64Decoder();
        OutputStream out = null;
        try 
        {
            //Base64解码
            byte[] b = decoder.decodeBuffer(imgStr);
            for(int i=0;i<b.length;++i)
            {
                if(b[i]<0)
                {//调整异常数据
                    b[i]+=256;
                }
            }
            //生成jpeg图片
            //String imgFilePath = "e:\\2.jpg";//新生成的图片
           out = new FileOutputStream(imgFilePath);    
           out.write(b);
            return true;
        } catch (Exception e) {
            return false;
        } finally {
        	if(out!=null){
                try {
                	out.flush();
                	out.close();
				} catch (IOException e) {
				}
            }
        }
    }
}
