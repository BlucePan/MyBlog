package com.blog.model;

import java.io.Serializable;

public class BlogArticle implements Serializable {
	private String id ;
	private String title;
	private String image;
	private String remake;
	private String createTime;
	private String createUserId;
	private String updateUserId;
	private String updateTime;
	private Integer type;
	private Integer browse;
	private Integer popularity;
	private String context;
	private Integer top;
	private String articleName;
	private String createUser;
	
	
		
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getArticleName() {
		return articleName;
	}
	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRemake() {
		return remake;
	}
	public void setRemake(String remake) {
		this.remake = remake;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public String getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getBrowse() {
		return browse;
	}
	public void setBrowse(Integer browse) {
		this.browse = browse;
	}
	public Integer getPopularity() {
		return popularity;
	}
	public void setPopularity(Integer popularity) {
		this.popularity = popularity;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Integer getTop() {
		return top;
	}
	public void setTop(Integer top) {
		this.top = top;
	}
	@Override
	public String toString() {
		return "BlogArticle [browse=" + browse + ", context=" + context
				+ ", createTime=" + createTime + ", createUserId="
				+ createUserId + ", id=" + id + ", image=" + image
				+ ", popularity=" + popularity + ", remake=" + remake
				+ ", title=" + title + ", top=" + top + ", type=" + type
				+ ", updateTime=" + updateTime + ", updateUserId="
				+ updateUserId + "]";
	}
	
	
	
}
