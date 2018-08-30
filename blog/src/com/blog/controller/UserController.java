package com.blog.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.BaseController;
import com.blog.dao.BlogVideoDao;
import com.blog.model.BlogArticle;
import com.blog.model.BlogMenu;
import com.blog.model.BlogVideo;
import com.blog.model.User;
import com.blog.service.BlogArticleService;
import com.blog.service.BlogMenuService;
import com.blog.service.UserService;
import com.blog.util.BlogUtil;
import com.blog.util.DecriptCrmUtil;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
	private static final Logger log=Logger.getLogger(UserController.class);
	@Resource
	private UserService userService;
	@Resource
	private BlogMenuService blogMenuService;
	@Resource
	private BlogArticleService bArticleService;
	@Resource
	private BlogVideoDao bVideoDao;
	private String message;
	

	//后台登录页面
	@RequestMapping("/login.html")
	public String login(HttpServletRequest request,Model model,String account,String password){			
		if (BlogUtil.isNotBlank(account)) {	
		   User user=userService.queryUser(new User(account));
		   if(user!=null){
			 if(!user.getPassword().equals(DecriptCrmUtil.ShiroMD5(password,account))){
				message="密码输入错误，请重试";
			 }else{//登录成功以shiro来维护用户信息
				 String username=account;
				//创建用户名、密码身份验证token(即用户身份/凭证) 				 
				UsernamePasswordToken token=new UsernamePasswordToken(username, password); 
				token.setRememberMe(true); //记住我
				log.info("为了验证登录用户而封装的token为："+token);
				//得到Subject
				Subject subject = SecurityUtils.getSubject();
				try {
					 //在调用了login方法后,SecurityManager会收到AuthenticationToken,并将其发送给已配置的Realm执行必须的认证检查  
		             //每个Realm都能在必要时对提交的AuthenticationTokens作出反应  
		             //所以这一步在调用login(token)方法时,它会走到MyRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法  
					subject.login(token);
					request.getSession(true).setAttribute("blog_user_info", user);
					return "redirect:index.html";	
				} catch (AuthenticationException e) {
					log.info("对用户[" + username + "]进行登录验证..验证未通过,堆栈轨迹如下");
					token.clear();
					e.printStackTrace();	
					message = "shiro验证错误";
				}
			    	
			 }
		   }else{
			message = "帐号不存在";
		   }
		}else {
			message = "账号或密码不能为空";
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
	
	 //后台访问页面	
		@RequestMapping ("/error.html")
		public String error(Model model,HttpServletRequest request){
		
			return "background/error";
		}
	
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
		  List<BlogVideo> bVideoList=bVideoDao.getRecommendVideo();
		  model.addAttribute("bVideoList", bVideoList);  //首页推荐视频
		return "face/home";
	}
	
	//我的详情
	@RequestMapping("/myself.html")
	public String getMyself(HttpServletRequest request){		
	   User user=(User) userService.queryUserById("666666");		
	
		request.setAttribute("user", user);
		return "face/myself";
	}
		
	//我的详情
	@RequestMapping("/about.html")
	public String about(HttpServletRequest request){		
	   User user=(User) userService.queryUserById("666666");		
	
		request.setAttribute("user", user);
		return "face/about";
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
				try {
				List<BlogMenu> list = blogMenuService.queryBlogMenuByUserId(user.getId());
		
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
