package com.blog.service;

import java.util.List;
import java.util.Map;
import com.blog.model.BlogVideo;
import com.blog.util.PageView;

public interface BlogVideoService {
	 List<BlogVideo> getAllBlogVideo(BlogVideo bVideo);
	  PageView findByPage(PageView page,Map map);
	  void addBlogVideo(BlogVideo bVideo);
	  BlogVideo queryBlogVideoById(String id);
	  void updateBlogVideo(BlogVideo bVideo);
	  void deleteBlogVideo(String id);
	  List<BlogVideo>  getRecommendVideo(); //获取首页推荐视频
	  List<BlogVideo>  getLikeVideo(Map map);//获取相关视频
}
