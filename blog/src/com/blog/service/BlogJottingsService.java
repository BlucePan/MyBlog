package com.blog.service;

import java.util.List;
import java.util.Map;


import com.blog.model.BlogJottings;
import com.blog.model.BlogMenu;
import com.blog.util.PageView;

public interface BlogJottingsService {
	 List<BlogJottings> getAllBlogjottings(BlogJottings bJottings);
	  PageView findByPage(PageView page,Map map);
	  void addBlogJottings(BlogJottings bJottings);
	  BlogJottings queryBlogJottingsById(String id);
	  void updateBlogJottings(BlogJottings bJottings);
	  void deleteBlogJottings(String id);
	  List<BlogJottings> findPageByRoll(Map map);  //滚动分页加载
}
