package com.blog.model;

import java.io.Serializable;

public class BlogArticleType implements Serializable {
	
	private Integer id;
	private String articleName;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getArticleName() {
		return articleName;
	}
	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}
	@Override
	public String toString() {
		return "BlogArticleName [articleName=" + articleName + ", id=" + id
				+ "]";
	}
	

}
