package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.BaseDao;
import com.blog.model.BlogJottings;

public interface BlogJottingsDao extends BaseDao {
	BlogJottings queryBlogJottingsById(String id); //根据id查当前随笔
	List<BlogJottings> findPageByRoll(Map map);  //滚动分页加载

}
