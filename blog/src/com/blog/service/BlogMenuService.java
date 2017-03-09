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
}
