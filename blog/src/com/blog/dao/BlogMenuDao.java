package com.blog.dao;

import java.util.List;

import com.blog.BaseDao;
import com.blog.model.BlogMenu;

public interface BlogMenuDao extends BaseDao {
	BlogMenu queryBlogMenuById(String id); //根据id查菜单
	
	List<BlogMenu> queryBlogMenuByRoleId(String roleId); //获取当前角色所拥有的菜单权限
	
	List<BlogMenu> queryBlogMenuByUserId(String userId); //根据用户查权限
	
	

}
