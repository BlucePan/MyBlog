package com.blog.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.BaseController;
import com.blog.model.BlogArticle;
import com.blog.model.BlogMenu;
import com.blog.model.User;
import com.blog.service.BlogArticleService;
import com.blog.service.BlogMenuService;
import com.blog.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{

	@Resource
	private UserService userService;
	@Resource
	private BlogMenuService blogMenuService;
	@Resource
	private BlogArticleService bArticleService;
	
	private String message;
	
	//跳往主页面
	@RequestMapping("/main.html")
	public String queryEntityById(HttpServletRequest request,Model model){
		//跳往主页
		  List<BlogArticle>  bArticleList=bArticleService.getRecommendArticle();
		  model.addAttribute("bArticleList", bArticleList);  //首页推荐文章
		  List<BlogArticle>  nArticleList=bArticleService.getNewArticle();
		  model.addAttribute("nArticleList", nArticleList);  //首页最新文章
		  List<BlogArticle>  sArticleList=bArticleService.getSeniorityArticle();
		  model.addAttribute("sArticleList", sArticleList);  //首页排行文章
		  
		return "face/home";
	}
	
	//我的详情
	@RequestMapping("/myself.html")
	public String getMyself(HttpServletRequest request){		
	   User user=(User) userService.queryUserById("666666");		
	
		request.setAttribute("user", user);
		return "face/myself";
	}
		
	
	//后台登录页面
	@RequestMapping("/admin.html")
	public String login(HttpServletRequest request){
		
		//User user=(User) userService.queryUserById("666666");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		if (account != null && !"".equals(account) && password != null
				&& !"".equals(password)) {	
			User u=new User();
			u.setAccount(account);
			u.setPassword(password);			
		   User user=userService.queryUser(u);
		   if(user!=null){
				request.getSession(true).setAttribute("blog_user_info", user);
				return "redirect:index.html";		  
		   }else{
			message = "帐号不存在";
		   }
		}else {
			message = "请输入帐号和密码";
		}
		request.setAttribute("message", message);
		return "background/login";
	}
	
	
	
	
	
	
	
//后台访问页面	
	@RequestMapping ("/index.html")
	public String index(Model model,HttpServletRequest request){
		User user = getLoginUser(request);
		if(user!=null){
			return "background/framework/main";
		}
		return "background/login";
	}
	
	//头部链接
	@RequestMapping ("/top.html")
	public String top(Model model)
	{
		return "background/framework/top";
	}
	
	//左边链接
	@RequestMapping ("/left.html")
	public String left(Model model,HttpServletRequest request){
		User user = getLoginUser(request);
		if(user!=null){
	
				BlogMenu bMenu = new BlogMenu();
				bMenu.setFlag("1");
				try {
				List<BlogMenu> list = blogMenuService.getAllMenuList(bMenu);
		
					model.addAttribute("list", list);
				} catch (Exception e) {
					//重新登录时销毁该用户的Session
				}
				return "background/framework/left";
			}
		
		return "background/login";
	}
	//消息提醒链接
	@RequestMapping ("/tab.html")
	public String tab(HttpServletRequest request,Model model){
		
	
		return "background/framework/tab/tab";
	}
	//中部链接
	@RequestMapping ("/center.html")
	public String center(Model model)
	{
		return "background/framework/center";
	}
	
	
	
	
	//右边公共文章展示
	@RequestMapping("/faceRightArticleList.html")
	public String faceRightArticleList(HttpServletRequest request,Model model){
		//跳往主页
		  List<BlogArticle>  nArticleList=bArticleService.getNewArticle();
		  model.addAttribute("nArticleList", nArticleList);  //首页最新文章
		  List<BlogArticle>  sArticleList=bArticleService.getSeniorityArticle();
		  model.addAttribute("sArticleList", sArticleList);  //首页排行文章
		  
		return "face/faceRight";
	}
	
	
}
