package com.blog.dao;

import com.blog.BaseDao;
import com.blog.model.Role;
public interface RoleDao extends BaseDao {
	
	Role queryRoleById(String id); //根据id获取角色

}
