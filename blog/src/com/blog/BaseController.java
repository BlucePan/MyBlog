package com.blog;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.blog.dao.BlogVideoDao;
import com.blog.model.User;
import com.blog.service.BlogArticleService;
import com.blog.service.BlogJottingsService;
import com.blog.service.BlogMenuService;
import com.blog.service.BlogMusicService;
import com.blog.service.BlogSlideService;
import com.blog.service.BlogVideoService;
import com.blog.service.RoleService;
import com.blog.service.UserService;
/**
 * 公用接口
 * 所有controller都继承这个Controller
 * @author  panzhi
 * @date    2018年8月2日
 * @version 1.0.0
 */
public class BaseController {	
	@Resource
	protected BlogArticleService bArticleService;
	@Resource
	protected BlogJottingsService bJottingsService;
	@Resource
	protected BlogMenuService blogMenuService;
	@Resource
	protected BlogSlideService blogSlideService;
	@Resource
	protected RoleService roleService;
	@Resource
	protected UserService userService;	
	@Resource
	protected BlogVideoDao bVideoDao;
	@Resource
	protected BlogVideoService bVideoService;
	@Resource
	protected BlogMusicService bMusicService;
	@Resource
	protected BlogSlideService bSlideService;

	//判断是否登录
	public boolean isLoginUser(HttpServletRequest request) {
		return getLoginUser(request) != null;
	}
	//得到登录用户
	public User getLoginUser(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("blog_user_info");
		return user;
	}
	

}
