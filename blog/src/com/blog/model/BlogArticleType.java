package com.blog.model;

import java.io.Serializable;
/**
 * 博客类型表
 * @author panzhi
 * @date 2017-3-15  
 * @version 1.0.0
 */
public class BlogArticleType implements Serializable {
	private static final long serialVersionUID = -1889117758708071287L;
	private String id; 
	private String articleName;
	private String catCode;
	private String parentCode;
	private String depth;
	private String isShow;
	
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getArticleName() {
		return articleName;
	}


	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}


	public String getCatCode() {
		return catCode;
	}


	public void setCatCode(String catCode) {
		this.catCode = catCode;
	}


	public String getParentCode() {
		return parentCode;
	}


	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}


	public String getDepth() {
		return depth;
	}


	public void setDepth(String depth) {
		this.depth = depth;
	}


	public String getIsShow() {
		return isShow;
	}


	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}


	@Override
	public String toString() {
		return "BlogArticleName [articleName=" + articleName + ", id=" + id
				+ "]";
	}
	
}
