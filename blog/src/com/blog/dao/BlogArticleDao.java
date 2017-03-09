package com.blog.dao;

import java.util.List;

import com.blog.BaseDao;
import com.blog.model.BlogArticle;
import com.blog.model.BlogArticleType;

public interface BlogArticleDao extends BaseDao {
	List<BlogArticleType>  getAllArticleType();//得到文章类型列表
	BlogArticle queryBlogArticleById(String id);
	 void    delTopArticle(BlogArticle article);
			
}
