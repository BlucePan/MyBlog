package com.blog.model;

import java.io.Serializable;
/**
 * 视频表
 * @author panzhi
 * @date 2017-3-21  
 * @version 1.0.0
 */
public class BlogVideo implements Serializable {
	private static final long serialVersionUID = -4589705597845926056L;
	private String id;  //视频id
	private String title; //视频标题
	private String image; //视频预览图片
	private String videoUrl;  //视频路径
	private String createUserId; //创建者id
	private String createTime; //创建时间
	private String updateTime; //更新时间
	private String isPublish; //是否发布
	private String createUser; //创建者
	private Integer browse; //浏览量
	private String keyWord; //关键词
			
	public String getKeyWord() {
		return keyWord;
	}public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	public Integer getBrowse() {
		return browse;
	}public void setBrowse(Integer browse) {
		this.browse = browse;
	}
	
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
	
	public String getImage() {
		return image;
	}public void setImage(String image) {
		this.image = image;
	}
	
	public String getVideoUrl() {
		return videoUrl;
	}public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
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
