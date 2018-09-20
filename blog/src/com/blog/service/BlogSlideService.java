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
	List<PageData> ariticleLabelGroup(PageData pageData);
	void addLabel(PageData pageData);
	void updateLabel(PageData pageData);
	void delLabel(String id);
	List<PageData> queryAllLabel();
	public PageView findTypeByPage(Map map,PageView page);
	void addType(PageData pageData);
	void updateType(PageData pageData);
	void delType(String id);
	List<PageData> selectType(PageData pageData);
	PageData queryTypeByCatCode(String catCode);
	PageData queryLabelByLabel(String label);
}
