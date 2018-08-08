package com.blog.shiro;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.config.Ini;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.web.config.IniFilterChainResolverFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.model.BlogMenu;
import com.blog.service.RoleService;
import com.blog.util.BlogUtil;

/**
 * 自定义权限过滤类
 * @author  panzhi
 * @date    2018年8月6日
 * @version 1.0.0
 */
public class MyShiroFilterFactoryBean extends ShiroFilterFactoryBean {
	//**配置中的过滤链*//*
	public static String definitions;
	@Autowired
	private RoleService roleService;
	/**
	 * 初始化设置过滤链 
	 */
	@Override
	public void setFilterChainDefinitions(String definitions) {
		System.out.println(">>自定义shiro拦截器");
		MyShiroFilterFactoryBean.definitions = definitions;
		Map map=new HashMap();
		List<BlogMenu>  blogList=roleService.queryAllResources(map); //获取所有需要访问的权限列表
		Map<String, String> filterChainDefinitionMap = new HashMap<String, String>();  
		for (BlogMenu blogMenu : blogList) {
			if(BlogUtil.isNotBlank(blogMenu.getUrl())){
				    String permission = "perms[" + blogMenu.getUrl()+ "]";
	                filterChainDefinitionMap.put(blogMenu.getUrl(),permission);
			}
		}
		//加载配置默认的过滤链
		Ini ini = new Ini();
        ini.load(definitions);
        System.out.println("初始化权限："+definitions.toString());
        Ini.Section section = ini.getSection(IniFilterChainResolverFactory.URLS);
        if (CollectionUtils.isEmpty(section)) {
            section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
        }
        //加上数据库的过滤链
        section.putAll(filterChainDefinitionMap);
        System.out.println("初始化权限2："+section.values());
        setFilterChainDefinitionMap(section);
    
	
	}
	
	

}
