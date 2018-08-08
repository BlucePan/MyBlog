package com.blog.util;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.alibaba.fastjson.JSONArray;
/**
 * JSON工具分装类
 * @author  panzhi
 * @date    2018年8月7日
 * @version 1.0.0
 */
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL) 
public class JsonBeang {
	private String message;  //消息
	private String status;  //状态
	private Object object;   
	private List list;
	private Map map;
	
	
	public JsonBeang() {
		super();
		this.map = null;
		this.list = null;
		this.object = null;
		this.message = null;
		status = "";
	}

	public JsonBeang(String message, Object object, List list,
			Map map, String status) {
		super();
		this.message = message;
		this.status = status;
		this.object = object;
		this.list = list;
		this.map = map;
		
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
