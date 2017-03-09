package com.blog.model;

import java.io.Serializable;

public class User implements Serializable {
	
	private String id; //用户id
	private String name; //用户姓名
	private String qq; //用户qq
	private String job; //用户职业

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return  id+"\t"+name+"\t"+qq+"\t"+job;
	}
	

}
