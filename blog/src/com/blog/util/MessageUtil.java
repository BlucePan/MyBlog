package com.blog.util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

import org.apache.log4j.Logger;


public class MessageUtil {

	private static Logger logger = Logger.getLogger(MessageUtil.class);
	
	  //private static String smsUrl="http://202.91.244.252/qd/GetSnMo";//服务器地址
	 private static String smsUrl="http://202.91.244.252/qd/SMSSendYD";//服务器地址
	  private static String userName= "6818";//短信平台账号
	  private static String passWord= "6818@aimaozj";//密码
	
 
	//发送短信
	public static boolean sendMessage(String content,String mobile){
		//号码不正确不发送
		if(!isMobile(mobile)){
			return false;
		}
		//内容为空不发送
		if(null=="content"||"".equals(content)){
			return false;
		}
		try {
			HttpClient client = new HttpClient();
			client.getParams().setParameter(
					HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
			PostMethod method = new PostMethod(smsUrl); // 测试环境
			method.addRequestHeader("Connection", "close");
			method.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded;charset=GBK");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String extdsrcid = "";

			//System.out.println("__12"+mobile+"222231111111111111111111111111_________________ = ");
			 NameValuePair[] param = { new NameValuePair("usr", userName),
			 new NameValuePair("pwd", passWord),
			 new NameValuePair("mobile", mobile),
			 new NameValuePair("sms", content),
			 new NameValuePair("extdsrcid", extdsrcid)};
			// 将表单的值放入postMethod中
			method.setRequestBody(param);
			// 执行postMethod
			int statusCode = 0;
			
			try {
				statusCode = client.executeMethod(method);
				logger.info("client.executeMethod(method)返回值:" + statusCode);
				System.out.println("__"+content+"client.executeMethod(method)返回值 "+statusCode);
			} catch (HttpException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// HttpClient对于要求接受后继服务的请求，像POST和PUT等不能自动处理转发
			if (statusCode != HttpStatus.SC_OK) {
//				logger.info("Tianjin,Method failed:" + method.getStatusLine());
			}
			// 读取内容
			InputStream resInputStream = null;
			try {
				resInputStream = method.getResponseBodyAsStream();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 处理内容
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					resInputStream));
			String tempBf = null;
			StringBuffer html = new StringBuffer();
			while ((tempBf = reader.readLine()) != null) {
				html.append(tempBf);
			}
			logger.info("result:" + html.toString());

		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	/**
	 * 验证号码是否是手机号码
	 * 
	 * @param str
	 * @return 是true 
	 */
	public static boolean isMobile(String str){
		str = str.trim();
		String regExp = "^((14[0-9])|(17[0-9])|(13[0-9])|(15[0-9])|(18[0-9]))\\d{8}$";
		Pattern p = Pattern.compile(regExp);
		Matcher m = p.matcher(str);
		return m.find();
	}
	
	/***
	  * 
	  * main 方法测试
	  * @param args
	  */
//	public static void main(String[] args) {
//		MessageUtil messutil= new MessageUtil();
//		boolean reSend=false;
//		try{
//			 reSend=messutil.sendMessage("t内容测试","13600532972");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//			  System.out.println(reSend);
//	}
	
}