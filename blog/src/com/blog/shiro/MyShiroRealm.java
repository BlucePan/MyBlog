package com.blog.shiro;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Service;

import com.blog.model.BlogMenu;
import com.blog.model.User;
import com.blog.service.RoleService;
import com.blog.service.UserService;
import com.blog.util.BlogUtil;
import com.blog.util.PageData;

/**
 * 自定义shiro拦截器，对url进行拦截，如果没有验证成功的需要验证，然后额外给用户赋予角色和权限
 * @author  panzhi
 * @date    2018年8月1日
 * @version 1.0.0
 */
public class MyShiroRealm extends AuthorizingRealm {
	private static final Logger log=Logger.getLogger(MyShiroRealm.class);
	
	@Resource
	private RoleService roleService;
	@Resource
    private UserService userService;
    /* 为当前登录的Subject授予角色和权限 
    * @see 经测试:本例中该方法的调用时机为需授权资源被访问时 
    * @see 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例中默认并未启用AuthorizationCache 
    * @see 个人感觉若使用了Spring3.1开始提供的ConcurrentMapCache支持,则可灵活决定是否启用AuthorizationCache 
    * @see 比如说这里从数据库获取权限信息时,先去访问Spring3.1提供的缓存,而不使用Shior提供的AuthorizationCache 
    */  
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		log.info(">>>>>>>>>>>授予用户角色与权限");
		User user= (User) SecurityUtils.getSubject().getPrincipal();
		//获取用户的角色
		Set<String> roleNames=roleService.queryUserRole(user.getId());
		//获取用户所有的权限
		Map map=new HashMap();
		map.put("userId", user.getId());
		Set<String> permissions=new HashSet<String>();
		List<BlogMenu>  blogList=roleService.loadUserResources(map);
		for (BlogMenu blogMenu : blogList) {
			if(BlogUtil.isNotBlank(blogMenu.getUrl())){
				permissions.add(blogMenu.getUrl());
			}
		}
		log.info("该用户拥有的权限个数为："+permissions.size());
		// 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(); 
		info.addRoles(roleNames); //添加角色
		info.setStringPermissions(permissions); //添加权限
		return info;
	}
	 /** 
     * 验证当前登录的Subject 
     * @see 经测试:本例中该方法的调用时机为LoginController.login()方法中执行Subject.login()时 
     */  
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {	
		 //获取基于用户名和密码的令牌  
	     //实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的  
	     //两个token的引用都是一样的,本例中是org.apache.shiro.authc.UsernamePasswordToken@33799a1e 
		 String username = (String)authcToken.getPrincipal(); //获取用户名
		    User user =  userService.getUserByName(username);
			 log.info(">>>>>>>>>>>验证登录用户:"+user.getAccount()+"/t"+user.getName());
		      if(user==null) throw new UnknownAccountException();
		        if ("0".equals(user.getStatus())) {
		            throw new LockedAccountException(); // 帐号锁定
		        }
		        AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
		                user, //用户
		                user.getPassword(), //密码
		                ByteSource.Util.bytes(username),//用户名
		                getName()  //realm name
		        );
		     // 当验证都通过后，把用户信息放在session里
		        Session session = SecurityUtils.getSubject().getSession();
		        session.setAttribute("userSession", user);
		        session.setAttribute("userSessionId", user.getId());
		        return authenticationInfo;
	}



}
