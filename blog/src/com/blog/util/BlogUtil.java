package com.blog.util;


import java.io.PrintWriter;
import java.math.BigDecimal;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSONArray;


/** 
 * @version 2016-1-28 上午11:04:08
 */
/**
 * @author zhc
 * @Description:TODO<p></p>
 * @date  2016-1-28	上午11:04:08
 * @version V1.0
 */
public class BlogUtil{

	//获取当前客户端的IP 
	public static String getIpAddr(HttpServletRequest request) { 
	       String ip = request.getHeader("x-forwarded-for"); 
	       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	           ip = request.getHeader("Proxy-Client-IP"); 
	       } 
	       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	           ip = request.getHeader("WL-Proxy-Client-IP"); 
	       } 
	       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
	           ip = request.getRemoteAddr(); 
	       } 
	       return ip; 
	}
	

	 public static String getKey(){
/*		Long time = System.currentTimeMillis();   
	    int d = (int)(Math.random()*100);
		String key = "";
		key += d;
		key += time;*/
		UUID uuid  =  UUID.randomUUID(); 
		return uuid.toString().replaceAll("\\-", "");
	}
	public static void fromPrintJson(Object obj,HttpServletResponse response) {
		PrintWriter out = null;
		try {
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			out.println(JSONArray.toJSONString(obj));
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
			out.println(400);
		} finally {
			if (out != null) {
				out = null;
			}
		}
	}
	/* 
	  * 判断是字符串是否为空串或NULL  
	  * @param str 传入的字符串  
	  * @return 不是空串或不为NULL就返回true,否则返回false  
	*/  
	  public static boolean isNotBlank(String str) {    
	    if(str != null && !str.equals("")){
	    	return true;
	    }else{
	    	return false;
	    }
	  }  

	/* 
	  * 判断是否为整数  
	  * @param str 传入的字符串  
	  * @return 是整数返回true,否则返回false  
	*/  
	  public static boolean isInteger(String str) {    
	    Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");    
	    return pattern.matcher(str).matches();    
	  }  
	  /**
		 * String转换double
		 * 
		 * @param string
		 * @return double
		 */
		public static double convertSourData(String dataStr) throws Exception {
			if (dataStr != null && !"".equals(dataStr)) {
				return Double.valueOf(dataStr);
			}
			throw new NumberFormatException("convert error!");
		}

		/**
		 * 判断变量是否为空
		 * 
		 * @param s
		 * @return
		 */
		public static boolean isEmpty(String s) {
			if (null == s || "".equals(s) || "".equals(s.trim())
					|| "null".equalsIgnoreCase(s)) {
				return true;
			} else {
				return false;
			}
		}

		/**
		 * 判断变量是否为空
		 * 
		 * @param s
		 * @return
		 */
		public static boolean isNotEmpty(String s) {
			if (null == s || "".equals(s) || "".equals(s.trim())
					|| "null".equalsIgnoreCase(s)) {
				return false;
			} else {
				return true;
			}
		}

		/**
		 * 使用率计算
		 * 
		 * @return
		 */
		public static String fromUsage(long free, long total) {
			Double d = new BigDecimal(free * 100 / total).setScale(1,
					BigDecimal.ROUND_HALF_UP).doubleValue();
			return String.valueOf(d);
		}

		/**
		 * 保留两个小数
		 * 
		 * @return
		 */
		public static String formatDouble(Double b) {
			BigDecimal bg = new BigDecimal(b);
			return bg.setScale(2, BigDecimal.ROUND_HALF_UP).toString();
		}

		/**
		 * 返回当前时间　格式：yyyy-MM-dd HH:mm:ss
		 * 
		 * @return String
		 */
		public static String fromDateH() {
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return format1.format(new Date());
		}

		/**
		 * 返回当前时间　格式：yyyy-MM-dd
		 * 
		 * @return String
		 */
		public static String fromDateY() {
			DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			return format1.format(new Date());
		}

		  public static Date getDateTime() {
			    return getDateTime(null, null);
			  }

			  public static Date getDateTime(String format) {
			    return getDateTime(format, null);
			  }
		 public static Date getDateTime(String format, Object date) {
			    format = (format == null) || ("".equals(format)) ? "yyyy-MM-dd HH:mm:ss" : format;
			    SimpleDateFormat frm = new SimpleDateFormat(format);
			    try {
			      if (date == null) return frm.parse(frm.format(Calendar.getInstance().getTime()));
			      if ((date instanceof Date)) return frm.parse(frm.format((Date)date));
			      if ((date instanceof String)) return frm.parse(date.toString());
			      return null; } catch (ParseException ex) {
			    }
			    return null;
		}
		/**
		 * 返回用户的IP地址
		 * 
		 * @param request
		 * @return
		 */
		public static String toIpAddr(HttpServletRequest request) {
			String ip = request.getHeader("X-Forwarded-For");
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("Proxy-Client-IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("WL-Proxy-Client-IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("HTTP_CLIENT_IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getRemoteAddr();
			}
			return ip;
		}

		/**
		 * 传入原图名称，，获得一个以时间格式的新名称
		 * 
		 * @param fileName
		 *            　原图名称
		 * @return
		 */
		public static String generateFileName(String fileName) {
			DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			String formatDate = format.format(new Date());
			int random = new Random().nextInt(10000);
			int position = fileName.lastIndexOf(".");
			String extension = fileName.substring(position);
			return formatDate + random + extension;
		}
		
		/**
		 * 用来去掉List中空值和相同项的。
		 * 
		 * @param list
		 * @return
		 */
		public static List<String> removeSameItem(List<String> list) {
			List<String> difList = new ArrayList<String>();
			for (String t : list) {
				if (t != null && !difList.contains(t)) {
					difList.add(t);
				}
			}
			return difList;
		}
		
		/**
		 * 组装定义默认菜单ID
		 */
		public static String rescId() {
			String a1 ="1b50392b3efa4fc08fd770b31ee4f4c9";//电脑端——系统管理
			String a2 ="d6b8398e1e8f43eb9aac5164d3230726";//电脑端——公告管理
			String a3 ="1b50392b3efa4fc08fd770b31ee4f4c8";//电脑端——轮播图管理
			String a4 ="63156e3371ec4c3b9391bdcdeb253e2e";//电脑端——轮播删除
			String a5 ="1b50392b3efa4fc08fd770b31ee4f4c6";//电脑端——公司管理
			String a6 ="ab68dd7ff7484d3c98a79bf2310efd3e";//电脑端——客户管理
			String a7 ="28e0fdbf2a9a4995874ed1a9e50ca92a";//电脑端——员工管理
			String a8 ="1b50392b3efa4fc08fd770b31ee4f4c5";//电脑端——组织架构管理
			String a9 ="1b50392b3efa4fc08fd770b31ee4f4c4";//电脑端——行政级别管理
			String a10 ="3d2bd5d457654df0ad442d4f7e0a227c";//电脑端——分配权限
			String a11 ="3fff813e4b114a7697f3e9415faa2831";//电脑端——统计分析
			String a12 ="bdd789c9bb664e8a88823d38f8771c09";//电脑端——年度统计
			String a13 ="af835b13d91a45a1a5ce4f406ef2a762";//电脑端——月度统计
			String a14 ="10f7687d21304186b28f82532ec768e1";//电脑端——资源录入
			String a15 ="49464e6cab7c485291d8db28eb86b958";//电脑端——设计师
			String a16 ="db0fe7ca464c46619de17ebf1e384c46";//电脑端——家装公司
			String a17 ="639bd176ee024ca8add4ad53d1c047cd";//电脑端——物业
			String a18 ="c11c9cf4a74c4991a3d8cc8b34d6f851";//电脑端——异业联盟
			String a19 ="098ed3043fb64a0f9b3fdeea51ddsfa0";//手机端——在线监理
			String a20 ="c89b88587c3f4e5aa6206bc61c44f01c";//手机端——外勤签到
			String a21 ="244372ac36c84928a34a505474bdc142";//手机端——客户管理
			String a22 ="f4913d4a369c4e07887777ac81fd5522";//手机端——全面经纪人
			String a23 ="01e8bde12a664d2396fd84f659902060";//手机端——家装设计师
			String a24 ="105aac7766ee4315a9c94d6797f3366d";//手机端——客户分析
			String a25 ="db3c2243be6e47f5b439acaa0eb14e0c";//手机端——审批
			String a26 ="f61ea15a9c6744039d81ea46168f5489";//手机端——行业头条
			String a27 ="0cbe9f317dc147c7a8bc43df762b48ed";//手机端——我的日历
			String a28 ="deb71a8af35246069e224adc3cfc555d";//手机端——工作日志
			String a29 ="01e8bde12a664d2396fd84f659902068";//手机端——公告
			String a30 ="6a5cf971dd754f28a4ac894bf4d58e38";//手机端——资源录入
			String a31 ="01e8bde12a664d2396fd84f52412102";//手机端——自我测试
			String a32 ="01e8bde12a664d2396fd84f52412103";//手机端——我要赚钱
			String a33 ="01e8bde12a664d2396fd84f52412104";//手机端——自我提升
			String rescId =a1+","+a2+","+a3+","+a4+","+a5+","+a6+","+a7+","+a8+","+a9+","+a10+","+a11+","+
			a12+","+a13+","+a14+","+a15+","+a16+","+a17+","+a18+","+a19+","+a20+","+a21+","+a22+","+a23+","+
			a24+","+a25+","+a26+","+a27+","+a28+","+a29+","+a30+","+a31+","+a32+","+a33+",";
			
			return rescId;
		}
}
