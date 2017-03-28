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

}
