package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.model.BlogMusic;
import com.blog.util.PageView;

public interface BlogMusicService {
	  List<BlogMusic> getAllBlogMusic(BlogMusic bMusic);
	  PageView findByPage(PageView page,Map map);
	  void addBlogMusic(BlogMusic bMusic);
	  BlogMusic queryBlogMusicById(String id);
	  void updateBlogMusic(BlogMusic bMusic);
	  void deleteBlogMusic(String id);
}
