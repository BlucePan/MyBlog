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
	private Integer id; 
	private String articleName; //博客类型  1.网站建设  2.心得笔记 3.程序人生 4.web前端
	
	public Integer getId() {
		return id;
	}public void setId(Integer id) {
		this.id = id;
	}
	
	public String getArticleName() {
		return articleName;
	}public void setArticleName(String articleName) {
		this.articleName = articleName;
	}
	
	@Override
	public String toString() {
		return "BlogArticleName [articleName=" + articleName + ", id=" + id
				+ "]";
	}
	
}
