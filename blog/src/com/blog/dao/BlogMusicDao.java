package com.blog.dao;

import com.blog.BaseDao;
import com.blog.model.BlogMusic;

public interface BlogMusicDao extends BaseDao {
	BlogMusic queryBlogMusicById(String id); //根据id查当前音乐

}
