package com.blog;

import javax.servlet.http.HttpServletRequest;

import com.blog.model.User;
/**
 * 公用接口
 * 所有controller都继承这个Controller
 * @author  panzhi
 * @date    2018年8月2日
 * @version 1.0.0
 */
public class BaseController {

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
