package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.BaseDao;
import com.blog.model.BlogArticle;
import com.blog.model.BlogArticleType;

public interface BlogArticleDao extends BaseDao {
	 List<BlogArticleType>  getAllArticleType();//得到文章类型列表
	 BlogArticle queryBlogArticleById(String id);//根据id获得当前文章
	 void    delTopArticle(BlogArticle article);//置顶
	 List<BlogArticle> getRecommendArticle();  //得到推荐文章
	 List<BlogArticle> getNewArticle();  //得到最新文章		 
	 List<BlogArticle> getSeniorityArticle();//根据人气排行
	 BlogArticle getNextArticle(BlogArticle article); //上一篇下一篇
	 List<BlogArticle> getLikeArticle(Map map);//获取相关文章
}
