package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.model.BlogArticle;
import com.blog.model.BlogArticleType;
import com.blog.model.BlogMenu;
import com.blog.util.PageView;

public interface BlogArticleService {
	List<BlogArticleType> getAllArticleType();
	PageView findByPage(PageView page,Map map);
	void addArticle(BlogArticle bArticle);
	BlogArticle queryBlogArticleById(String id);
	  void updateBlogArticle(BlogArticle article);
	  void deleteBlogArticle(String id);
	  void delTopArticle(BlogArticle article);

}
