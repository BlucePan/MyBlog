package com.blog.model;

import java.io.Serializable;
/**
 * 用户和角色中间表
 * @author panzhi
 * @date 2017-3-31  
 * @version 1.0.0
 */
public class UserRole implements Serializable {
	private static final long serialVersionUID = 3044108407940217491L;
	private String id; //中间表id
	private String uid; //用户
	private String rid; //角色id
	
	public String getId() {
		return id;
	}public void setId(String id) {
		this.id = id;
	}
	
	public String getUid() {
		return uid;
	}public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getRid() {
		return rid;
	}public void setRid(String rid) {
		this.rid = rid;
	}
		
}
