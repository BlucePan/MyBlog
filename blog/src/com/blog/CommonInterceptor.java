package com.blog;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.blog.model.User;

public class CommonInterceptor implements HandlerInterceptor{
	private static final String BLOG_MANAGE_LOGIN_URL = "/jsp/background/login.jsp";   //后台login页面	
	//拦截前处理  
	public boolean preHandle(HttpServletRequest request,    
            HttpServletResponse response, Object handler) throws Exception {
		User user_manage = (User) request.getSession().getAttribute("blog_user_info"); //后台session user
		
		String url = request.getRequestURL().toString();
        
		boolean manage = url.contains("/manage/");
		if(manage==true){
			if(user_manage==null){
				request.setAttribute("message", "用户未登录");
				request.setAttribute("error", "error");
	            request.getRequestDispatcher(BLOG_MANAGE_LOGIN_URL).forward(request, response);
	            return false;  
			}
		}else{
			return true;
		}
		
		return true;   
	}

	//拦截后处理
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	//全部完成后处理 
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
