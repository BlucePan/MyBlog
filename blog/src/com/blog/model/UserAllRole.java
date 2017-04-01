package com.blog.model;

/**
 * 用户角色分配查询表
 * @author panzhi
 * @date 2017-3-30  
 * @version 1.0.0
 */
public class UserAllRole extends User {
	private static final long serialVersionUID = 810553225788899358L;
	    //Role Name列转行，以,分割
		private String roleNames;
		//Role Id列转行，以‘,’分割
		private String roleIds;
		public String getRoleNames() {
			return roleNames;
		}
		public void setRoleNames(String roleNames) {
			this.roleNames = roleNames;
		}
		public String getRoleIds() {
			return roleIds;
		}
		public void setRoleIds(String roleIds) {
			this.roleIds = roleIds;
		}
		
	
	
}
