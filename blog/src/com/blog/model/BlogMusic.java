package com.blog.model;

import java.io.Serializable;
/**
 * 音乐表
 * @author panzhi
 * @date 2017-3-21  
 * @version 1.0.0
 */
public class BlogMusic implements Serializable {
	private static final long serialVersionUID = 5168530046772273760L;
	private String id;     //音乐id
	private String title; //音乐标题
	private String musicUrl; //音乐路径
	private String createUserId; //创建者id
	private String createTime;  //创建时间
	private String updateTime; //更新时间
	private String isPublish; //是否发布
	private String createUser; //创建者
		
	public String getCreateUser() {
		return createUser;
	}public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	
	public String getId() {
		return id;
	}public void setId(String id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}public void setTitle(String title) {
		this.title = title;
	}
	
	public String getMusicUrl() {
		return musicUrl;
	}public void setMusicUrl(String musicUrl) {
		this.musicUrl = musicUrl;
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
	
	public String getIsPublish() {
		return isPublish;
	}public void setIsPublish(String isPublish) {
		this.isPublish = isPublish;
	}
	
	
}
