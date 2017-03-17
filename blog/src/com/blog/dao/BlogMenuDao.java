package com.blog.dao;

import com.blog.BaseDao;
import com.blog.model.BlogMenu;

public interface BlogMenuDao extends BaseDao {
	BlogMenu queryBlogMenuById(String id); //根据id查菜单
	
	

}
