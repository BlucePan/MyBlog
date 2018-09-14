package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.util.PageData;
import com.blog.util.PageView;

public interface BlogSlideService {
	
	List<PageData> queryAllSlide(PageData pageData); //获取所有轮播图
	void addSlide(PageData pageData);
	void updateSlide(PageData pageData);
	void delSlide(String id);
	public PageView findByPage(Map map,PageView page);
	PageData queryBlogSlideById(String id);
	public PageView findLabelByPage(Map map,PageView page);
	List<PageData> ariticleLabelGroup(String type);
	void addLabel(PageData pageData);
	void updateLabel(PageData pageData);
	void delLabel(String id);
	List<PageData> queryAllLabel();
}
