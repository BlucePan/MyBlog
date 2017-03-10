package com.blog.util;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * 接口拦截器
 * @author 1
 *
 */
public class AppFilter implements Filter {

	
	ServletContext context = null;
	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest requests, ServletResponse responses,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)requests;
	  	HttpServletResponse response = (HttpServletResponse)responses; 
	  	HttpSession session = ((HttpServletRequest) request).getSession(true);
	  	String url = request.getRequestURL().toString();
		boolean lean = url.contains("/app/");
	/*	if(lean){
	  	 String tk=request.getParameter("tk");

	  	 if(tk != null && !tk.equals("")){
	  		 Tokens tks=new Tokens();
	  		tks.setToken(tk);

			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(context);

			TokensService ts = (TokensService) ctx.getBean("tokensService");
	  		
	  		Tokens newtks=ts.queryTokens(tks);
	  		if(newtks == null){
	  		//未登录

	  			request.getSession().setAttribute("oa_user_info", null);
	  			response.sendRedirect(request.getContextPath()+"/small/login.html");
				return ;	
	  		}else{
	  			UserService userService = (UserService) ctx.getBean("userService");
	    		User cui = userService.queryEntityById(newtks.getUserId());
	  			if(cui!=null){ 		
	
	  				session.setAttribute("oa_user_info", cui);
	  				chain.doFilter(request, response);
	  			}else{

	  				request.getSession().setAttribute("oa_user_info", null);
	  				ts.deleteZxjlTokens(newtks.getId());
		  			response.sendRedirect(request.getContextPath()+"/small/login.html");
					return ;		
	  			}
	  		}	  		 
	  	 }else{
	 		//非法操作
	 
	  		    session.setAttribute("oa_user_info", null);
	  			request.getSession().setAttribute("oa_user_info", null);
				return ;	
	  	 }
		}	else{
			chain.doFilter(request, response);
		}  */
	}

	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
	 	context = config.getServletContext();
	}

}
