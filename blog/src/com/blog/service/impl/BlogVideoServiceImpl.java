package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.BlogVideoDao;
import com.blog.model.BlogVideo;
import com.blog.service.BlogVideoService;
import com.blog.util.PageView;
@Service("bVideoService")
public class BlogVideoServiceImpl implements BlogVideoService {
	@Resource
	private BlogVideoDao bVideoDao;
	
	@Override
	public List<BlogVideo> getAllBlogVideo(BlogVideo bVideo) {

		return bVideoDao.queryAll(bVideo);
	}

	@Override
	public PageView findByPage(PageView page, Map map) {
		page.setTotalCount(bVideoDao.getCount(map));
		map.put("start", page.getStart());
		map.put("max", page.getPageSize());
		List<BlogVideo> videoList=bVideoDao.findByPage(map);
		page.setItems(videoList);
		return page;
	}

	@Override
	public void addBlogVideo(BlogVideo bVideo) {
		bVideoDao.addEntity(bVideo);
	}

	@Override
	public BlogVideo queryBlogVideoById(String id) {
		return bVideoDao.queryBlogVideoById(id);
	}

	@Override
	public void updateBlogVideo(BlogVideo bVideo) {
		bVideoDao.editEntity(bVideo);
	}

	@Override
	public void deleteBlogVideo(String id) {
		bVideoDao.deleteEntity(id);
	}

	@Override
	public List<BlogVideo> getRecommendVideo() {
		return bVideoDao.getRecommendVideo();
	}

	@Override
	public List<BlogVideo> getLikeVideo(Map map) {
		return bVideoDao.getLikeVideo(map);
	}

}
