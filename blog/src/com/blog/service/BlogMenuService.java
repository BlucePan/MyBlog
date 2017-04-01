package com.blog.service;

import java.util.List;
import java.util.Map;


import com.blog.model.BlogMenu;
import com.blog.util.PageView;

public interface BlogMenuService {
	 List<BlogMenu> getAllMenuList(BlogMenu bMenu);
	  PageView findByPage(PageView page,Map map);
	  void addBlogMenu(BlogMenu bmenu);
	  BlogMenu queryBlogMenuById(String id);
	  void updateBlogMenu(BlogMenu menu);
	  void deleteBlogMenu(String id);
	  List<BlogMenu> queryBlogMenuByRoleId(String roleId); //获取当前角色所拥有的菜单权限
	  List<BlogMenu> queryBlogMenuByUserId(String userId); //根据用户查权限

}
