package com.blog.model;

import java.io.Serializable;

/**
 * 用户表
 * @author panzhi
 * @date 2017-3-15
 * @version 1.0.0
 */
public class User implements Serializable {
	private static final long serialVersionUID = -6796883836957279437L;
	private String id; // 用户id
	private String name; // 用户姓名
	private String qq; // 用户qq
	private String job; // 用户职业
	private String account; // 账户
	private String password; // 密码
	private String createTime; // 创建时间
	private String updateTime; // 修改时间
	
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

	public String getAccount() {
		return account;
	}public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}public void setPassword(String password) {
		this.password = password;
	}

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

	public String getQq() {
		return qq;
	}public void setQq(String qq) {
		this.qq = qq;
	}

	public String getJob() {
		return job;
	}public void setJob(String job) {
		this.job = job;
	}

	@Override
	public String toString() {
		return id + "\t" + name + "\t" + qq + "\t" + job;
	}

}
