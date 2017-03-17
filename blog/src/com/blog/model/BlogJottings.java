package com.blog.model;

import java.io.Serializable;

/**
 * 
 * @author panzhi
 * @date 2017-3-16  
 * @version 1.0.0
 */
public class BlogJottings implements Serializable{
	private static final long serialVersionUID = -4848594812356439420L;
	private String id; //随笔id
	private String keyWord; //关键字
	private String context; //随笔内容
	private String createUserId;//创建者id
	private String createUser;//创建者
	private String createTime;//创建时间
	private String updateTime;//修改时间
	
	public String getId() {
		return id;
	}public void setId(String id) {
		this.id = id;
	}
		
	public String getKeyWord() {
		return keyWord;
	}public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	public String getContext() {
		return context;
	}public void setContext(String context) {
		this.context = context;
	}
	
	public String getCreateUserId() {
		return createUserId;
	}public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	
	public String getCreateUser() {
		return createUser;
	}public void setCreateUser(String createUser) {
		this.createUser = createUser;
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
	
	
	
}
