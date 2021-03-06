package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.DaoSupport;
import com.blog.service.BlogSlideService;
import com.blog.util.PageData;
import com.blog.util.PageView;
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

	@Override
	public void addSlide(PageData pageData) {
		try {
			dao.save("BlogSlideMapping.addSlide", pageData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateSlide(PageData pageData) {
		// TODO Auto-generated method stub
		try {
			dao.update("BlogSlideMapping.updateSlide", pageData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void delSlide(String id) {
		// TODO Auto-generated method stub
		try {
			dao.delete("BlogSlideMapping.delSlide", id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public PageView findByPage(Map map, PageView page) {
		try {
			page.setTotalCount((Integer)dao.findForObject("BlogSlideMapping.getCount", map));
			map.put("start", page.getStart());
			map.put("max", page.getPageSize());
			List<PageData> list = (List<PageData>)dao.findForList("BlogSlideMapping.findByPage", map);
			page.setItems(list);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}

	@Override
	public PageData queryBlogSlideById(String id) {
		// TODO Auto-generated method stub
		try {
			return (PageData) dao.findForObject("BlogSlideMapping.findById", id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<PageData> ariticleLabelGroup(PageData pageData) {
		// TODO Auto-generated method stub
		try {
			return (List<PageData>) dao.findForList("BlogSlideMapping.ariticleLabelGroup", pageData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public PageView findLabelByPage(Map map, PageView page) {
		try {
			page.setTotalCount((Integer)dao.findForObject("BlogSlideMapping.findLabelByPageCount", map));
			map.put("start", page.getStart());
			map.put("max", page.getPageSize());
			List<PageData> list = (List<PageData>)dao.findForList("BlogSlideMapping.findLabelByPage", map);
			page.setItems(list);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}

	@Override
	public void addLabel(PageData pageData) {
		try {
			dao.save("BlogSlideMapping.addLabel", pageData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateLabel(PageData pageData) {
		try {
			dao.update("BlogSlideMapping.updateLabel", pageData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void delLabel(String id) {
		try {
			dao.delete("BlogSlideMapping.delLabel", id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<PageData> queryAllLabel() {
		try {
			return (List<PageData>) dao.findForList("BlogSlideMapping.queryAllLabel", null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public PageView findTypeByPage(Map map, PageView page) {
		try {
			page.setTotalCount((Integer)dao.findForObject("BlogSlideMapping.findTypeByPageCount", map));
			map.put("start", page.getStart());
			map.put("max", page.getPageSize());
			List<PageData> list = (List<PageData>)dao.findForList("BlogSlideMapping.findTypeByPage", map);
			page.setItems(list);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}
	
	@Override
	public void addType(PageData pageData) {
		try {
			dao.save("BlogSlideMapping.addType", pageData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateType(PageData pageData) {
		try {
			dao.update("BlogSlideMapping.updateType", pageData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void delType(String id) {
		try {
			dao.delete("BlogSlideMapping.delType", id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<PageData> selectType(PageData pageData) {
		try {
			return (List<PageData>) dao.findForList("BlogSlideMapping.selectType", pageData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public PageData queryTypeByCatCode(String catCode) {
		try {
			return (PageData) dao.findForObject("BlogSlideMapping.queryTypeByCatCode", catCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public PageData queryLabelByLabel(String label) {
		try {
			return (PageData) dao.findForObject("BlogSlideMapping.queryLabelByLabel", label);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
