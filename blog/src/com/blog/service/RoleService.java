package com.blog.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.blog.model.Role;
import com.blog.model.UserRole;
import com.blog.util.PageView;

public interface RoleService {
	  PageView findByPage(PageView page,Map map);
	  void addRole(Role role);
	  Role queryRoleById(String id);
	  void updateRole(Role role);
	  void deleteRole(String id);
	  List<Role> queryAllRole(Role role);
	  
	  void delUserRoleByUserId(String userId); //根据用户id删除用户所拥有的角色		
	  void addUserRole(UserRole uRole); //增加用户角色表
	  void saveUserRole(String roleId,List<String> list);
	  Set<String> queryUserRole(String userid); //获取当前用户的所有角色
	  Set<String> loadUserResources(Map map); //获取用户所有的权限
				
}
