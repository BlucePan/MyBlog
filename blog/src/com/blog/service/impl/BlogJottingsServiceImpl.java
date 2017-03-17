package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.BlogJottingsDao;
import com.blog.model.BlogJottings;
import com.blog.service.BlogJottingsService;
import com.blog.util.PageView;

@Service("bJottingsService")
public class BlogJottingsServiceImpl implements BlogJottingsService {

	@Resource
	private BlogJottingsDao bJottingsDao;
	
	@Override
	public List<BlogJottings> getAllBlogjottings(BlogJottings bJottings) {
		return bJottingsDao.queryAll(bJottings);
	}

	@Override
	public PageView findByPage(PageView page, Map map) {
		page.setTotalCount(bJottingsDao.getCount(map));
		map.put("start", page.getStart());
		map.put("max", page.getPageSize());
		List<BlogJottings> bJottingsList=bJottingsDao.findByPage(map);
		page.setItems(bJottingsList);		
		return page;
	}

	@Override
	public void addBlogJottings(BlogJottings bJottings) {
		bJottingsDao.addEntity(bJottings);

	}

	@Override
	public BlogJottings queryBlogJottingsById(String id) {
		return	bJottingsDao.queryBlogJottingsById(id);		
	}

	@Override
	public void updateBlogJottings(BlogJottings bJottings) {
		bJottingsDao.editEntity(bJottings);

	}

	@Override
	public void deleteBlogJottings(String id) {
		bJottingsDao.deleteEntity(id);

	}

	@Override
	public List<BlogJottings> findPageByRoll(Map map) {
		return bJottingsDao.findPageByRoll(map);
	}

}
