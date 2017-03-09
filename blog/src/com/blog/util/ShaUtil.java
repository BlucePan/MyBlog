package com.blog.util;
import java.security.MessageDigest;
import org.apache.log4j.Logger;

/** 
 * 采用SHAA加密
 * @author zhc
 * @datetime 2016-01-06
 * @version 2016-1-6 上午11:24:25
 */
public class ShaUtil {
	private static Logger log = Logger.getLogger(ShaUtil.class);
    /*** 
     * SHA加密 生成40位SHA码
     * @param 待加密字符串
     * @return 返回40位SHA码
     */
	public static String shaEncode(String inStr) throws Exception{
		
		MessageDigest sha = null;
		try{
			sha = MessageDigest.getInstance("SHA");
			
		}catch(Exception e){
			log.info("获取加密失败....");
		  e.printStackTrace();	
		  
		}
		byte[] byteArray = inStr.getBytes("UTF-8");
		byte[] md5Bytes = sha.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
	        for (int i = 0; i < md5Bytes.length; i++) {
	            int val = ((int) md5Bytes[i]) & 0xff;
	            if (val < 16) { 
	                hexValue.append("0");
	            }
	            hexValue.append(Integer.toHexString(val));
	        }
	        
	        return hexValue.toString();
	
	}
	
}
