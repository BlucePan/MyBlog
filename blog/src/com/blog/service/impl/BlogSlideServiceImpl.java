package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.DaoSupport;
import com.blog.service.BlogSlideService;
import com.blog.util.PageData;
@Service("blogSlideService")
public class BlogSlideServiceImpl implements BlogSlideService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<PageData> queryAllSlide(PageData pageData) {
		try {
			return (List<PageData>) dao.findForList("BlogSlideMapping.queryAllSlide", pageData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
