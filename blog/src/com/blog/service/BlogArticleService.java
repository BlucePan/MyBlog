package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.model.BlogArticle;
import com.blog.model.BlogArticleType;
import com.blog.model.BlogMenu;
import com.blog.util.PageData;
import com.blog.util.PageView;

public interface BlogArticleService {
	List<BlogArticleType> getAllArticleType();
	PageView findByPage(PageView page,Map map);
	void addArticle(BlogArticle bArticle);
	BlogArticle queryBlogArticleById(String id);
	  void updateBlogArticle(BlogArticle article);
	  void deleteBlogArticle(String id);
	  void delTopArticle(BlogArticle article);
	  List<BlogArticle> getRecommendArticle();  //得到推荐文章
	  List<BlogArticle> getNewArticle(PageData pageData);  //得到最新文章	
	  List<BlogArticle> getSeniorityArticle(PageData pageData);//根据人气排行
	  BlogArticle getNextArticle(BlogArticle article); //上一篇下一篇
	  List<BlogArticle> getLikeArticle(Map map);//获取相关文章
	  void likeArticle(PageData pageData); //增加浏览量

}
