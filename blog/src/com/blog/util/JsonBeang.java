package com.blog.util;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
/** 
 * @version 2016-3-11 上午10:00:50
 */
/**
 * @author zhc
 * @Description:TODO<p></p>
 * @date  2016-3-11	上午10:00:50
 * @version V1.0
 */
public class JsonBeang {
	private String message;  //消息
	private Object object;   
	private List list;
	private Map map;
	private String status;  //状态
	
	public JsonBeang() {
		super();
		this.map = null;
		this.list = null;
		this.object = null;
		this.message = null;
		status = "";
		// TODO Auto-generated constructor stub
	}

	public JsonBeang(String message, Object object, List list,
			Map map, String status) {
		super();
		this.message = message;
		this.object = object;
		this.list = list;
		this.map = map;
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	

}
