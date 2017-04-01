package com.blog.model;

import java.io.Serializable;
/**
 * 角色权限表
 * @author panzhi
 * @date 2017-3-31  
 * @version 1.0.0
 */
public class RolePermission implements Serializable {
	private static final long serialVersionUID = 4867382431663172304L;
	private String id; 
	private String rid; //角色id
	private String pid; //权限表id
	
	public String getId() {
		return id;
	}public void setId(String id) {
		this.id = id;
	}
	
	public String getRid() {
		return rid;
	}public void setRid(String rid) {
		this.rid = rid;
	}
	
	public String getPid() {
		return pid;
	}public void setPid(String pid) {
		this.pid = pid;
	}
	
		
}
