package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.BlogMusicDao;
import com.blog.model.BlogMusic;
import com.blog.service.BlogMusicService;
import com.blog.util.PageView;
@Service("bMusicService")
public class BlogMusicServiceImpl implements BlogMusicService {
	@Resource
	private BlogMusicDao bMusicDao;
	
	@Override
	public List<BlogMusic> getAllBlogMusic(BlogMusic bMusic) {
		return bMusicDao.queryAll(bMusic);
	}

	@Override
	public PageView findByPage(PageView page, Map map) {
		page.setTotalCount(bMusicDao.getCount(map));
		map.put("start",page.getStart());
		map.put("max",page.getPageSize());
		List<BlogMusic> musicList=bMusicDao.findByPage(map);
		page.setItems(musicList);
		return page;
	}

	@Override
	public void addBlogMusic(BlogMusic bMusic) {
		bMusicDao.addEntity(bMusic);

	}

	@Override
	public BlogMusic queryBlogMusicById(String id) {
		return bMusicDao.queryBlogMusicById(id);
	}

	@Override
	public void updateBlogMusic(BlogMusic bMusic) {
		bMusicDao.editEntity(bMusic);

	}

	@Override
	public void deleteBlogMusic(String id) {
		bMusicDao.deleteEntity(id);

	}

}
