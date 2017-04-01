package com.blog.dao;

import com.blog.BaseDao;
import com.blog.model.Role;
import com.blog.model.RolePermission;
import com.blog.model.UserRole;
public interface RoleDao extends BaseDao {
	
	Role queryRoleById(String id); //根据id获取角色
	
	void delUserRoleByUserId(String userId); //根据用户id删除用户所拥有的角色
	
	void addUserRole(UserRole uRole); //增加用户角色表
	
	
	void delRolePermissionByRoleId(String roleId); //根据角色id删除角色所拥有的权限
	
	void addRolePermission(RolePermission rPermission); //增加角色权限表

}
