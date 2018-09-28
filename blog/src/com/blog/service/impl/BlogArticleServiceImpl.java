package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.BlogArticleDao;
import com.blog.model.BlogArticle;
import com.blog.model.BlogArticleType;
import com.blog.model.BlogMenu;
import com.blog.service.BlogArticleService;
import com.blog.util.PageData;
import com.blog.util.PageView;
@Service("bArticleService")
public class BlogArticleServiceImpl implements BlogArticleService {

	@Resource
	private BlogArticleDao bArticleDao;
	
	public List<BlogArticleType> getAllArticleType() {
		return bArticleDao.getAllArticleType();
	}

	public PageView findByPage(PageView page, Map map) {
		page.setTotalCount(bArticleDao.getCount(map));
		map.put("start", page.getStart());
		map.put("max", page.getPageSize());
		List<BlogArticle> list=bArticleDao.findByPage(map);
		page.setItems(list);
		return page;
	}

	public void addArticle(BlogArticle bArticle) {
		bArticleDao.addEntity(bArticle);
		
	}

	public BlogArticle queryBlogArticleById(String id) {
		
		return bArticleDao.queryBlogArticleById(id);
	}

	public void deleteBlogArticle(String id) {
		bArticleDao.deleteEntity(id);
		
	}

	public void updateBlogArticle(BlogArticle article) {
		bArticleDao.editEntity(article);
		
	}

	public void delTopArticle(BlogArticle article) {
		bArticleDao.delTopArticle(article);
		
	}

	@Override
	public List<BlogArticle> getRecommendArticle() {
		return bArticleDao.getRecommendArticle();
		
	}

	@Override
	public List<BlogArticle> getNewArticle(PageData pageData) {
		return bArticleDao.getNewArticle(pageData);
	}

	@Override
	public List<BlogArticle> getSeniorityArticle(PageData pageData) {
		return bArticleDao.getSeniorityArticle(pageData);
	}

	@Override
	public BlogArticle getNextArticle(BlogArticle article) {
		return bArticleDao.getNextArticle(article);
	}

	@Override
	public List<BlogArticle> getLikeArticle(Map map) {
		return bArticleDao.getLikeArticle(map);
	}

	@Override
	public void likeArticle(PageData pageData) {
		 bArticleDao.likeArticle(pageData);
		
	}

}
