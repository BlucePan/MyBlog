package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.BaseDao;
import com.blog.model.BlogVideo;

public interface BlogVideoDao extends BaseDao {
	BlogVideo queryBlogVideoById(String id); //根据id查当前视频
	List<BlogVideo>  getRecommendVideo(); //获取首页推荐视频
	List<BlogVideo>  getLikeVideo(Map map);//获取相关视频

}
