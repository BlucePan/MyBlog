package com.blog.model;

import java.io.Serializable;
/**
 * 角色表
 * @author panzhi
 * @date 2017-3-28  
 * @version 1.0.0
 */
public class Role implements Serializable {
	private static final long serialVersionUID = -7268447341437887462L;	
	private String id;
	private String name;
	private String createUserId;
	private String createTime;
	private String updateTime;
	private String createUser;	
	
	public String getId() {
		return id;
	}public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}public void setName(String name) {
		this.name = name;
	}
	
	public String getCreateUserId() {
		return createUserId;
	}public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	
	public String getCreateTime() {
		return createTime;
	}public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public String getUpdateTime() {
		return updateTime;
	}public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
	public String getCreateUser() {
		return createUser;
	}public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	
	

}
