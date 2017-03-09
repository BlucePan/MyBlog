package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.BlogMenuDao;
import com.blog.model.BlogMenu;
import com.blog.service.BlogMenuService;
import com.blog.util.PageView;

@Service("blogMenuService")
public class BlogMenuServiceImpl implements BlogMenuService {

	@Resource
	private BlogMenuDao bMenuDao;
	
	public List<BlogMenu> getAllMenuList(BlogMenu bMenu) {		
		return bMenuDao.queryAll(bMenu);
	}

	public PageView findByPage(PageView page, Map map) {
		page.setTotalCount(bMenuDao.getCount(map));
		map.put("start", page.getStart());
		map.put("max", page.getPageSize());
		List<BlogMenu> list=bMenuDao.findByPage(map);
		page.setItems(list);
		return page;

	}

	public void addBlogMenu(BlogMenu bmenu) {
		bMenuDao.addEntity(bmenu);
		
	}

	public BlogMenu queryBlogMenuById(String id) {
		
		return bMenuDao.queryBlogMenuById(id);
	}

	public void updateBlogMenu(BlogMenu menu) {
		bMenuDao.editEntity(menu);
		
	}

	public void deleteBlogMenu(String id) {
		bMenuDao.deleteEntity(id);
		
	}

}
